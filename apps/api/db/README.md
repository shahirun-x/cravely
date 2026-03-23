# Cravely Database Setup

Follow these 3 steps to set up the database from scratch.

## Step 1: Create Schema

Run `schema.sql` in your Supabase SQL Editor (or via `psql`).

This creates all tables, enables pgvector, and adds indexes.

```bash
# Via psql
psql $SUPABASE_DATABASE_URL -f schema.sql
```

## Step 2: Seed Data

Run `seed.sql` to insert starter data — cities, neighborhoods, cuisines, 30 restaurants, and 180+ menu items.

```bash
psql $SUPABASE_DATABASE_URL -f seed.sql
```

All inserts use `ON CONFLICT DO NOTHING`, so the file is safely re-runnable.

## Step 3: Generate Embeddings

After seeding, run the embedding script to populate the `embedding` columns on restaurants and menu items.

```bash
cd ../scripts
pip install -r ../requirements.txt
python generate_embeddings.py
```

This uses Google's `text-embedding-004` model (768 dimensions) and writes embeddings directly to the database. It processes in batches of 20 with rate limiting for the free tier.

## Optional: Fetch Live Google Places Data

To fetch real restaurant data from the Google Places API:

```bash
cd ../scripts
pip install -r requirements.txt
python fetch_places.py --neighborhood "T. Nagar"
python fetch_places.py --neighborhood "all"
```

Output is saved to `../data/places_{slug}.json`.
