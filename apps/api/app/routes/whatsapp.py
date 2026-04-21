from fastapi import APIRouter, Request, Response
import httpx
import os

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
async def receive_message(request: Request):
    body = await request.json()
    try:
        entry = body["entry"][0]["changes"][0]["value"]
        message = entry["messages"][0]
        from_number = message["from"]
        text = message["text"]["body"]
        
        # Call existing LangGraph agent
        from app.agent.graph import agent
        
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
        
        # Format response
        response_text = result.get("final_response", "Sorry, I had trouble with that.")
        restaurants = result.get("restaurants", [])
        
        if restaurants:
            restaurant_list = "\n".join([
                f"• *{r.get('name', 'Restaurant')}* - {r.get('neighborhood','')} "
                f"({'Veg' if r.get('is_pure_veg') else 'Non-veg'}) "
                f"⭐{r.get('avg_rating','')} "
                for r in restaurants[:5]
            ])
            response_text += f"\n\n{restaurant_list}"
        
        # Send reply via WhatsApp API
        async with httpx.AsyncClient() as client:
            await client.post(
                f"https://graph.facebook.com/v18.0/{PHONE_NUMBER_ID}/messages",
                headers={"Authorization": f"Bearer {WHATSAPP_TOKEN}"},
                json={
                    "messaging_product": "whatsapp",
                    "to": from_number,
                    "type": "text",
                    "text": {"body": response_text}
                }
            )
    except Exception as e:
        print(f"WhatsApp webhook error: {e}")
    
    return {"status": "ok"}
