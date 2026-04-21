-- Run this in the Supabase SQL editor before running fetch_photos.py
ALTER TABLE restaurants ADD COLUMN IF NOT EXISTS photo_url TEXT;
