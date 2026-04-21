import logging
import os

import httpx
from fastapi import APIRouter, Request, Response
from main import limiter

logger = logging.getLogger(__name__)

router = APIRouter()

VERIFY_TOKEN = os.environ.get("WHATSAPP_VERIFY_TOKEN")
WHATSAPP_TOKEN = os.environ.get("WHATSAPP_ACCESS_TOKEN")
PHONE_NUMBER_ID = os.environ.get("WHATSAPP_PHONE_NUMBER_ID")


# Webhook verification (GET)
@router.get("/webhook/whatsapp")
async def verify_webhook(request: Request):
    params = dict(request.query_params)
    if (params.get("hub.mode") == "subscribe" and
            params.get("hub.verify_token") == VERIFY_TOKEN):
        return Response(content=params["hub.challenge"])
    return Response(status_code=403)


# Receive messages (POST)
@router.post("/webhook/whatsapp")
@limiter.limit("30/minute")
async def receive_message(request: Request):
    from app.agent.graph import agent  # local import avoids circular dep at module load

    body = await request.json()
    try:
        entry = body["entry"][0]["changes"][0]["value"]
        message = entry["messages"][0]
        from_number = message["from"]
        text = message["text"]["body"]

        initial_state = {
            "message": text,
            "session_id": f"wa_{from_number}",
            "user_id": None,
            "channel": "whatsapp",
            "city": "Chennai",
            "intent": "",
            "extracted_params": {},
            "tool_used": "",
            "tool_results": [],
            "conversation_history": [],
            "final_response": "",
            "restaurants": [],
        }

        result = await agent.ainvoke(initial_state)

        response_text = result.get("final_response", "Sorry, I had trouble with that.")
        restaurants = result.get("restaurants", [])

        if restaurants:
            restaurant_list = "\n".join([
                f"• *{r.get('name', 'Restaurant')}* - {r.get('neighborhood', '')} "
                f"({'Veg' if r.get('is_pure_veg') else 'Non-veg'}) "
                f"⭐{r.get('avg_rating', '')} "
                for r in restaurants[:5]
            ])
            response_text += f"\n\n{restaurant_list}"

        async with httpx.AsyncClient() as client:
            await client.post(
                f"https://graph.facebook.com/v18.0/{PHONE_NUMBER_ID}/messages",
                headers={"Authorization": f"Bearer {WHATSAPP_TOKEN}"},
                json={
                    "messaging_product": "whatsapp",
                    "to": from_number,
                    "type": "text",
                    "text": {"body": response_text},
                },
            )
    except Exception as e:
        logger.exception("WhatsApp webhook processing failed: %s", type(e).__name__)

    return {"status": "ok"}
