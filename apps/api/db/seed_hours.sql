-- Seed realistic opening hours for Chennai restaurants.
-- Day keys: 0 = Sunday, 1 = Monday, ..., 6 = Saturday.
-- Times are integers in HHMM format (e.g. 800 = 08:00, 2300 = 23:00).

-- Step 1: Standard hours for all restaurants still missing data.
UPDATE restaurants
SET opening_hours = '{
  "0": {"open": 800, "close": 2200},
  "1": {"open": 800, "close": 2200},
  "2": {"open": 800, "close": 2200},
  "3": {"open": 800, "close": 2200},
  "4": {"open": 800, "close": 2200},
  "5": {"open": 800, "close": 2300},
  "6": {"open": 800, "close": 2300}
}'::jsonb
WHERE opening_hours IS NULL;

-- Step 2: Override with later hours for premium / fine-dining restaurants
--         (price_range = 3 in the schema's SMALLINT 1–3 scale).
UPDATE restaurants
SET opening_hours = '{
  "0": {"open": 1200, "close": 2300},
  "1": {"open": 1200, "close": 2300},
  "2": {"open": 1200, "close": 2300},
  "3": {"open": 1200, "close": 2300},
  "4": {"open": 1200, "close": 2300},
  "5": {"open": 1200, "close": 2359},
  "6": {"open": 1200, "close": 2359}
}'::jsonb
WHERE price_range = 3;
