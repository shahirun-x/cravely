-- ============================================================================
-- Cravely Seed Data
-- Run AFTER schema.sql. All inserts use ON CONFLICT DO NOTHING for re-runnability.
-- ============================================================================

-- ============================================================================
-- 1. Cities
-- ============================================================================
INSERT INTO cities (id, name, state) VALUES
  ('a0000000-0000-0000-0000-000000000001', 'Chennai', 'Tamil Nadu')
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 2. Neighborhoods
-- ============================================================================
INSERT INTO neighborhoods (id, city_id, name, slug) VALUES
  ('b0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'T. Nagar',      't-nagar'),
  ('b0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 'Adyar',          'adyar'),
  ('b0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000001', 'Mylapore',       'mylapore'),
  ('b0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000001', 'Anna Nagar',     'anna-nagar'),
  ('b0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000001', 'OMR',            'omr'),
  ('b0000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000001', 'Nungambakkam',   'nungambakkam')
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 3. Cuisines
-- ============================================================================
INSERT INTO cuisines (id, name, slug) VALUES
  ('c0000000-0000-0000-0000-000000000001', 'South Indian',    'south-indian'),
  ('c0000000-0000-0000-0000-000000000002', 'Chettinad',       'chettinad'),
  ('c0000000-0000-0000-0000-000000000003', 'North Indian',    'north-indian'),
  ('c0000000-0000-0000-0000-000000000004', 'Chinese',         'chinese'),
  ('c0000000-0000-0000-0000-000000000005', 'Italian',         'italian'),
  ('c0000000-0000-0000-0000-000000000006', 'Biryani',         'biryani'),
  ('c0000000-0000-0000-0000-000000000007', 'Seafood',         'seafood'),
  ('c0000000-0000-0000-0000-000000000008', 'Street Food',     'street-food'),
  ('c0000000-0000-0000-0000-000000000009', 'Bakery & Cafe',   'bakery-cafe'),
  ('c0000000-0000-0000-0000-000000000010', 'Fast Food',       'fast-food'),
  ('c0000000-0000-0000-0000-000000000011', 'Mughlai',         'mughlai'),
  ('c0000000-0000-0000-0000-000000000012', 'Kerala',          'kerala'),
  ('c0000000-0000-0000-0000-000000000013', 'Continental',     'continental')
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 4. Categories
-- ============================================================================
INSERT INTO categories (id, name) VALUES
  ('d0000000-0000-0000-0000-000000000001', 'Breakfast'),
  ('d0000000-0000-0000-0000-000000000002', 'Starters'),
  ('d0000000-0000-0000-0000-000000000003', 'Soups'),
  ('d0000000-0000-0000-0000-000000000004', 'Main Course'),
  ('d0000000-0000-0000-0000-000000000005', 'Biryani & Rice'),
  ('d0000000-0000-0000-0000-000000000006', 'Breads'),
  ('d0000000-0000-0000-0000-000000000007', 'Desserts'),
  ('d0000000-0000-0000-0000-000000000008', 'Beverages'),
  ('d0000000-0000-0000-0000-000000000009', 'Combos & Meals'),
  ('d0000000-0000-0000-0000-000000000010', 'Street Food')
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 5. Restaurants (30 total)
-- ============================================================================

-- T. Nagar (7)
INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000001', 'ChIJ_TNagar_SBV01', 'Saravana Bhavan', 'Legendary vegetarian chain known for crispy dosas and elaborate South Indian thalis.', 'b0000000-0000-0000-0000-000000000001', '77, Usman Road, T. Nagar, Chennai 600017', 13.0418, 80.2341, '+91 44 2434 7879', 1, 4.3, 12500, true, '{"mon":"06:00-22:30","tue":"06:00-22:30","wed":"06:00-22:30","thu":"06:00-22:30","fri":"06:00-22:30","sat":"06:00-23:00","sun":"06:00-23:00"}'),
('e0000000-0000-0000-0000-000000000002', 'ChIJ_TNagar_SBV02', 'Murugan Idli Shop', 'Iconic spot for pillowy soft idlis served with an array of chutneys and sambar.', 'b0000000-0000-0000-0000-000000000001', '95, GN Chetty Road, T. Nagar, Chennai 600017', 13.0445, 80.2367, '+91 44 2815 5960', 1, 4.4, 9800, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:00","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000003', 'ChIJ_TNagar_SBV03', 'Anjappar Chettinad', 'The OG Chettinad restaurant — fiery pepper chicken, succulent mutton chukka, and robust flavors.', 'b0000000-0000-0000-0000-000000000001', '12, North Usman Road, T. Nagar, Chennai 600017', 13.0405, 80.2355, '+91 44 2434 0891', 2, 4.1, 7600, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000004', 'ChIJ_TNagar_SBV04', 'Dindigul Thalappakatti', 'Famous for their signature Dindigul-style biryani cooked with seeraga samba rice and aromatic spices.', 'b0000000-0000-0000-0000-000000000001', '53, Panagal Park, T. Nagar, Chennai 600017', 13.0412, 80.2329, '+91 44 2432 6789', 2, 4.2, 11200, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000005', 'ChIJ_TNagar_SBV05', 'Hot Chips', 'Beloved fast food chain serving crispy fried chicken, burgers, and South Indian comfort food under one roof.', 'b0000000-0000-0000-0000-000000000001', '30, South Usman Road, T. Nagar, Chennai 600017', 13.0395, 80.2348, '+91 44 2434 2211', 1, 3.9, 5400, false, '{"mon":"10:00-22:30","tue":"10:00-22:30","wed":"10:00-22:30","thu":"10:00-22:30","fri":"10:00-23:00","sat":"10:00-23:00","sun":"10:00-23:00"}'),
('e0000000-0000-0000-0000-000000000006', 'ChIJ_TNagar_SBV06', 'Grand Sweets & Snacks', 'Iconic sweet shop turned restaurant — famous for mixture, murukku, and full-course veg meals.', 'b0000000-0000-0000-0000-000000000001', '25, Bharathi Salai, T. Nagar, Chennai 600017', 13.0430, 80.2360, '+91 44 2434 5566', 1, 4.0, 8900, true, '{"mon":"08:00-21:30","tue":"08:00-21:30","wed":"08:00-21:30","thu":"08:00-21:30","fri":"08:00-22:00","sat":"08:00-22:00","sun":"08:00-22:00"}'),
('e0000000-0000-0000-0000-000000000007', 'ChIJ_TNagar_SBV07', 'Copper Chimney', 'Upscale North Indian dining with rich gravies, tandoori platters, and a warm ambience.', 'b0000000-0000-0000-0000-000000000001', '74, GN Chetty Road, T. Nagar, Chennai 600017', 13.0448, 80.2375, '+91 44 2815 7788', 3, 4.3, 4200, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:00,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- Adyar (5)
INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000008', 'ChIJ_Adyar_SBV01', 'Adyar Ananda Bhavan', 'The A2B empire — a vegetarian powerhouse known for rich sweets, crispy snacks, and wholesome meals.', 'b0000000-0000-0000-0000-000000000002', '1, LB Road, Adyar, Chennai 600020', 13.0063, 80.2574, '+91 44 2441 2233', 1, 4.2, 14000, true, '{"mon":"07:00-22:30","tue":"07:00-22:30","wed":"07:00-22:30","thu":"07:00-22:30","fri":"07:00-23:00","sat":"07:00-23:00","sun":"07:00-23:00"}'),
('e0000000-0000-0000-0000-000000000009', 'ChIJ_Adyar_SBV02', 'Buhari', 'A Chennai institution since 1951 — famous for their signature parotta and Buhari biryani.', 'b0000000-0000-0000-0000-000000000002', '10, Lattice Bridge Road, Adyar, Chennai 600020', 13.0071, 80.2553, '+91 44 2441 0099', 2, 4.0, 6800, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000010', 'ChIJ_Adyar_SBV03', 'Sangeetha Veg', 'Dependable vegetarian restaurant chain with generous thalis and a comforting menu.', 'b0000000-0000-0000-0000-000000000002', '22, Sardar Patel Road, Adyar, Chennai 600020', 13.0055, 80.2540, '+91 44 2441 5678', 1, 4.1, 5500, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000011', 'ChIJ_Adyar_SBV04', 'Cascade', 'Multi-cuisine family restaurant with generous portions and a loyal neighbourhood following.', 'b0000000-0000-0000-0000-000000000002', '48, Gandhi Nagar, Adyar, Chennai 600020', 13.0082, 80.2561, '+91 44 2441 7890', 2, 4.0, 3200, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:00","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000012', 'ChIJ_Adyar_SBV05', 'The Brew Room', 'Trendy cafe with artisan coffee, gourmet sandwiches, and all-day breakfast in a cozy setting.', 'b0000000-0000-0000-0000-000000000002', '5, Kasturba Nagar, Adyar, Chennai 600020', 13.0088, 80.2585, '+91 44 2441 3344', 2, 4.5, 2100, false, '{"mon":"08:00-22:00","tue":"08:00-22:00","wed":"08:00-22:00","thu":"08:00-22:00","fri":"08:00-23:00","sat":"08:00-23:00","sun":"09:00-22:00"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- Mylapore (5)
INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000013', 'ChIJ_Mylap_SBV01', 'Ratna Cafe', 'Heritage breakfast joint since 1948 — the sambar here is legendary among Chennai foodies.', 'b0000000-0000-0000-0000-000000000003', '40, Triplicane High Road, Mylapore, Chennai 600004', 13.0340, 80.2700, '+91 44 2498 1234', 1, 4.5, 8700, true, '{"mon":"06:30-12:00,16:00-21:00","tue":"06:30-12:00,16:00-21:00","wed":"06:30-12:00,16:00-21:00","thu":"06:30-12:00,16:00-21:00","fri":"06:30-12:00,16:00-21:00","sat":"06:30-12:00,16:00-21:30","sun":"06:30-12:00,16:00-21:30"}'),
('e0000000-0000-0000-0000-000000000014', 'ChIJ_Mylap_SBV02', 'Jannal Kadai', 'Iconic window-service eatery dishing out piping hot bajjis, bondas, and filter coffee.', 'b0000000-0000-0000-0000-000000000003', '12, Mada Streets, Mylapore, Chennai 600004', 13.0335, 80.2690, '+91 44 2498 5678', 1, 4.3, 4500, true, '{"mon":"06:00-20:00","tue":"06:00-20:00","wed":"06:00-20:00","thu":"06:00-20:00","fri":"06:00-20:00","sat":"06:00-20:30","sun":"06:00-20:30"}'),
('e0000000-0000-0000-0000-000000000015', 'ChIJ_Mylap_SBV03', 'Nair Mess', 'No-frills Kerala meals joint — the fish curry with matta rice is worth crossing the city for.', 'b0000000-0000-0000-0000-000000000003', '21, Kutchery Road, Mylapore, Chennai 600004', 13.0338, 80.2685, '+91 44 2498 9012', 1, 4.4, 3800, false, '{"mon":"11:30-15:30,19:00-22:00","tue":"11:30-15:30,19:00-22:00","wed":"11:30-15:30,19:00-22:00","thu":"11:30-15:30,19:00-22:00","fri":"11:30-15:30,19:00-22:00","sat":"11:30-15:30,19:00-22:00","sun":"11:30-15:30,19:00-22:00"}'),
('e0000000-0000-0000-0000-000000000016', 'ChIJ_Mylap_SBV04', 'Mylapore Kshatriya', 'Classic veg restaurant near Kapaleeshwarar Temple with hearty thalis and fresh filter coffee.', 'b0000000-0000-0000-0000-000000000003', '5, South Mada Street, Mylapore, Chennai 600004', 13.0332, 80.2695, '+91 44 2499 3456', 1, 4.1, 2900, true, '{"mon":"07:00-21:30","tue":"07:00-21:30","wed":"07:00-21:30","thu":"07:00-21:30","fri":"07:00-21:30","sat":"07:00-22:00","sun":"07:00-22:00"}'),
('e0000000-0000-0000-0000-000000000017', 'ChIJ_Mylap_SBV05', 'Kabul Restaurant', 'Flavourful Mughlai and biryani spot with generous portions and a loyal dinner crowd.', 'b0000000-0000-0000-0000-000000000003', '33, Bazaar Road, Mylapore, Chennai 600004', 13.0345, 80.2710, '+91 44 2498 6789', 2, 4.0, 3100, false, '{"mon":"12:00-23:00","tue":"12:00-23:00","wed":"12:00-23:00","thu":"12:00-23:00","fri":"12:00-23:30","sat":"12:00-23:30","sun":"12:00-23:30"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- Anna Nagar (5)
INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000018', 'ChIJ_Anna_SBV01', 'Cream Centre', 'Upscale vegetarian restaurant with innovative fusion dishes and lavish decor.', 'b0000000-0000-0000-0000-000000000004', '12, 2nd Avenue, Anna Nagar, Chennai 600040', 13.0850, 80.2100, '+91 44 2621 4455', 3, 4.3, 5600, true, '{"mon":"12:00-15:30,18:30-23:00","tue":"12:00-15:30,18:30-23:00","wed":"12:00-15:30,18:30-23:00","thu":"12:00-15:30,18:30-23:00","fri":"12:00-15:30,18:30-23:30","sat":"12:00-15:30,18:30-23:30","sun":"12:00-15:30,18:30-23:30"}'),
('e0000000-0000-0000-0000-000000000019', 'ChIJ_Anna_SBV02', 'Biriyani Zone', 'Neighbourhood biryani specialist serving Hyderabadi dum, Lucknowi, and Chennai-style varieties.', 'b0000000-0000-0000-0000-000000000004', '45, 3rd Avenue, Anna Nagar, Chennai 600040', 13.0862, 80.2115, '+91 44 2621 7788', 2, 4.1, 4300, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000020', 'ChIJ_Anna_SBV03', 'Tiffanys', 'Popular South Indian tiffin centre with fluffy idlis, crispy vadas, and pocket-friendly meals.', 'b0000000-0000-0000-0000-000000000004', '78, Shanti Colony, Anna Nagar, Chennai 600040', 13.0840, 80.2090, '+91 44 2621 3322', 1, 4.2, 6100, true, '{"mon":"06:30-22:00","tue":"06:30-22:00","wed":"06:30-22:00","thu":"06:30-22:00","fri":"06:30-22:30","sat":"06:30-22:30","sun":"06:30-22:30"}'),
('e0000000-0000-0000-0000-000000000021', 'ChIJ_Anna_SBV04', 'Palmshore', 'Family-friendly multi-cuisine restaurant with live counters and a lively weekend brunch.', 'b0000000-0000-0000-0000-000000000004', '20, AA Block, Anna Nagar, Chennai 600040', 13.0855, 80.2125, '+91 44 2621 6699', 2, 4.0, 3700, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000022', 'ChIJ_Anna_SBV05', 'Chai Kings', 'Trendy tea bar with kulhad chai, bun maska, Maggi, and Instagram-worthy interiors.', 'b0000000-0000-0000-0000-000000000004', '3, Round Tana, Anna Nagar, Chennai 600040', 13.0845, 80.2080, '+91 44 2621 1100', 1, 4.4, 2800, true, '{"mon":"07:00-23:00","tue":"07:00-23:00","wed":"07:00-23:00","thu":"07:00-23:00","fri":"07:00-23:30","sat":"07:00-23:30","sun":"08:00-23:00"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- OMR (5)
INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000023', 'ChIJ_OMR_SBV01', 'The Dhaba', 'Rustic North Indian highway-dhaba-themed restaurant with butter chicken, dal makhani, and naan on point.', 'b0000000-0000-0000-0000-000000000005', 'Thoraipakkam, OMR, Chennai 600097', 12.9350, 80.2320, '+91 44 4500 1122', 2, 4.1, 4800, false, '{"mon":"12:00-23:00","tue":"12:00-23:00","wed":"12:00-23:00","thu":"12:00-23:00","fri":"12:00-23:30","sat":"12:00-23:30","sun":"12:00-23:30"}'),
('e0000000-0000-0000-0000-000000000024', 'ChIJ_OMR_SBV02', 'Maplai', 'Contemporary South Indian — farm-to-fork dishes with a Chettinad twist and craft cocktails.', 'b0000000-0000-0000-0000-000000000005', 'Perungudi, OMR, Chennai 600096', 12.9550, 80.2410, '+91 44 4500 3344', 3, 4.5, 2500, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000025', 'ChIJ_OMR_SBV03', 'Pizzeria Italia', 'Wood-fired Neapolitan pizzas, handmade pastas, and Italian desserts in a chic setting.', 'b0000000-0000-0000-0000-000000000005', 'Sholinganallur, OMR, Chennai 600119', 12.9010, 80.2280, '+91 44 4500 5566', 3, 4.3, 1900, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000026', 'ChIJ_OMR_SBV04', 'Dosai Spot', 'Quick-service dosa specialist with 50+ varieties — from classic masala to cheese schezwan.', 'b0000000-0000-0000-0000-000000000005', 'Navalur, OMR, Chennai 600130', 12.8450, 80.2260, '+91 44 4500 7788', 1, 4.0, 3600, true, '{"mon":"07:00-22:30","tue":"07:00-22:30","wed":"07:00-22:30","thu":"07:00-22:30","fri":"07:00-23:00","sat":"07:00-23:00","sun":"07:00-23:00"}'),
('e0000000-0000-0000-0000-000000000027', 'ChIJ_OMR_SBV05', 'Dragon Bowl', 'Indo-Chinese street-style wok station — fiery manchurian, crispy noodles, and sizzlers.', 'b0000000-0000-0000-0000-000000000005', 'Karapakkam, OMR, Chennai 600097', 12.9280, 80.2310, '+91 44 4500 9900', 1, 3.9, 2700, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- Nungambakkam (3)
INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000028', 'ChIJ_Nungam_SBV01', 'Amethyst', 'Charming colonial bungalow turned cafe — European-inspired brunch, artisan pastries, and a lush garden.', 'b0000000-0000-0000-0000-000000000006', '14, Whites Road, Nungambakkam, Chennai 600034', 13.0610, 80.2480, '+91 44 4599 1234', 3, 4.6, 5200, false, '{"mon":"10:00-23:00","tue":"10:00-23:00","wed":"10:00-23:00","thu":"10:00-23:00","fri":"10:00-23:30","sat":"10:00-23:30","sun":"10:00-23:30"}'),
('e0000000-0000-0000-0000-000000000029', 'ChIJ_Nungam_SBV02', 'Eden', 'Sophisticated fine-dining with seasonal tasting menus blending Indian and Continental flavors.', 'b0000000-0000-0000-0000-000000000006', '20, Khader Nawaz Khan Road, Nungambakkam, Chennai 600034', 13.0625, 80.2495, '+91 44 4599 5678', 3, 4.7, 1800, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000030', 'ChIJ_Nungam_SBV03', 'Junior Kuppanna', 'Rustic Chettinad flavors — their nattu kozhi biryani and crab masala are legendary.', 'b0000000-0000-0000-0000-000000000006', '8, Wallace Garden, Nungambakkam, Chennai 600034', 13.0600, 80.2460, '+91 44 4599 9012', 2, 4.3, 6400, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- ============================================================================
-- 6. Restaurant ↔ Cuisine Links
-- ============================================================================
INSERT INTO restaurant_cuisines (restaurant_id, cuisine_id) VALUES
-- T. Nagar
('e0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000001'), -- Saravana Bhavan → South Indian
('e0000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000001'), -- Murugan Idli → South Indian
('e0000000-0000-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000002'), -- Anjappar → Chettinad
('e0000000-0000-0000-0000-000000000003', 'c0000000-0000-0000-0000-000000000001'), -- Anjappar → South Indian
('e0000000-0000-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000006'), -- Thalappakatti → Biryani
('e0000000-0000-0000-0000-000000000004', 'c0000000-0000-0000-0000-000000000001'), -- Thalappakatti → South Indian
('e0000000-0000-0000-0000-000000000005', 'c0000000-0000-0000-0000-000000000010'), -- Hot Chips → Fast Food
('e0000000-0000-0000-0000-000000000005', 'c0000000-0000-0000-0000-000000000001'), -- Hot Chips → South Indian
('e0000000-0000-0000-0000-000000000006', 'c0000000-0000-0000-0000-000000000001'), -- Grand Sweets → South Indian
('e0000000-0000-0000-0000-000000000006', 'c0000000-0000-0000-0000-000000000008'), -- Grand Sweets → Street Food
('e0000000-0000-0000-0000-000000000007', 'c0000000-0000-0000-0000-000000000003'), -- Copper Chimney → North Indian
('e0000000-0000-0000-0000-000000000007', 'c0000000-0000-0000-0000-000000000011'), -- Copper Chimney → Mughlai
-- Adyar
('e0000000-0000-0000-0000-000000000008', 'c0000000-0000-0000-0000-000000000001'), -- A2B → South Indian
('e0000000-0000-0000-0000-000000000009', 'c0000000-0000-0000-0000-000000000006'), -- Buhari → Biryani
('e0000000-0000-0000-0000-000000000009', 'c0000000-0000-0000-0000-000000000003'), -- Buhari → North Indian
('e0000000-0000-0000-0000-000000000010', 'c0000000-0000-0000-0000-000000000001'), -- Sangeetha → South Indian
('e0000000-0000-0000-0000-000000000011', 'c0000000-0000-0000-0000-000000000003'), -- Cascade → North Indian
('e0000000-0000-0000-0000-000000000011', 'c0000000-0000-0000-0000-000000000004'), -- Cascade → Chinese
('e0000000-0000-0000-0000-000000000012', 'c0000000-0000-0000-0000-000000000009'), -- Brew Room → Bakery & Cafe
('e0000000-0000-0000-0000-000000000012', 'c0000000-0000-0000-0000-000000000013'), -- Brew Room → Continental
-- Mylapore
('e0000000-0000-0000-0000-000000000013', 'c0000000-0000-0000-0000-000000000001'), -- Ratna Cafe → South Indian
('e0000000-0000-0000-0000-000000000014', 'c0000000-0000-0000-0000-000000000008'), -- Jannal Kadai → Street Food
('e0000000-0000-0000-0000-000000000014', 'c0000000-0000-0000-0000-000000000001'), -- Jannal Kadai → South Indian
('e0000000-0000-0000-0000-000000000015', 'c0000000-0000-0000-0000-000000000012'), -- Nair Mess → Kerala
('e0000000-0000-0000-0000-000000000015', 'c0000000-0000-0000-0000-000000000007'), -- Nair Mess → Seafood
('e0000000-0000-0000-0000-000000000016', 'c0000000-0000-0000-0000-000000000001'), -- Mylapore Kshatriya → South Indian
('e0000000-0000-0000-0000-000000000017', 'c0000000-0000-0000-0000-000000000011'), -- Kabul → Mughlai
('e0000000-0000-0000-0000-000000000017', 'c0000000-0000-0000-0000-000000000006'), -- Kabul → Biryani
-- Anna Nagar
('e0000000-0000-0000-0000-000000000018', 'c0000000-0000-0000-0000-000000000003'), -- Cream Centre → North Indian
('e0000000-0000-0000-0000-000000000018', 'c0000000-0000-0000-0000-000000000013'), -- Cream Centre → Continental
('e0000000-0000-0000-0000-000000000019', 'c0000000-0000-0000-0000-000000000006'), -- Biriyani Zone → Biryani
('e0000000-0000-0000-0000-000000000020', 'c0000000-0000-0000-0000-000000000001'), -- Tiffanys → South Indian
('e0000000-0000-0000-0000-000000000021', 'c0000000-0000-0000-0000-000000000003'), -- Palmshore → North Indian
('e0000000-0000-0000-0000-000000000021', 'c0000000-0000-0000-0000-000000000004'), -- Palmshore → Chinese
('e0000000-0000-0000-0000-000000000022', 'c0000000-0000-0000-0000-000000000009'), -- Chai Kings → Bakery & Cafe
('e0000000-0000-0000-0000-000000000022', 'c0000000-0000-0000-0000-000000000008'), -- Chai Kings → Street Food
-- OMR
('e0000000-0000-0000-0000-000000000023', 'c0000000-0000-0000-0000-000000000003'), -- The Dhaba → North Indian
('e0000000-0000-0000-0000-000000000024', 'c0000000-0000-0000-0000-000000000002'), -- Maplai → Chettinad
('e0000000-0000-0000-0000-000000000024', 'c0000000-0000-0000-0000-000000000001'), -- Maplai → South Indian
('e0000000-0000-0000-0000-000000000025', 'c0000000-0000-0000-0000-000000000005'), -- Pizzeria Italia → Italian
('e0000000-0000-0000-0000-000000000026', 'c0000000-0000-0000-0000-000000000001'), -- Dosai Spot → South Indian
('e0000000-0000-0000-0000-000000000027', 'c0000000-0000-0000-0000-000000000004'), -- Dragon Bowl → Chinese
('e0000000-0000-0000-0000-000000000027', 'c0000000-0000-0000-0000-000000000008'), -- Dragon Bowl → Street Food
-- Nungambakkam
('e0000000-0000-0000-0000-000000000028', 'c0000000-0000-0000-0000-000000000009'), -- Amethyst → Bakery & Cafe
('e0000000-0000-0000-0000-000000000028', 'c0000000-0000-0000-0000-000000000013'), -- Amethyst → Continental
('e0000000-0000-0000-0000-000000000029', 'c0000000-0000-0000-0000-000000000013'), -- Eden → Continental
('e0000000-0000-0000-0000-000000000029', 'c0000000-0000-0000-0000-000000000005'), -- Eden → Italian
('e0000000-0000-0000-0000-000000000030', 'c0000000-0000-0000-0000-000000000002'), -- Junior Kuppanna → Chettinad
('e0000000-0000-0000-0000-000000000030', 'c0000000-0000-0000-0000-000000000007')  -- Junior Kuppanna → Seafood
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 7. Menu Items (180+ items across 30 restaurants)
-- ============================================================================

-- R01: Saravana Bhavan (T. Nagar) — South Indian Veg
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0001-000000000001', 'e0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge tempered with black pepper, cumin, and generous ghee', 90.00, true, true),
('f0000000-0000-0000-0001-000000000002', 'e0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe stuffed with spiced potato filling, served with sambar and chutneys', 110.00, true, true),
('f0000000-0000-0000-0001-000000000003', 'e0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000009', 'Special Meals', 'Unlimited thali with rice, sambar, rasam, kootu, poriyal, curd, payasam, and papad', 199.00, true, true),
('f0000000-0000-0000-0001-000000000004', 'e0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy on the outside, fluffy inside — classic urad dal vadas served with coconut chutney', 70.00, true, true),
('f0000000-0000-0000-0001-000000000005', 'e0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000007', 'Rava Kesari', 'Semolina halwa with cashews, raisins, and cardamom — rich golden sweetness', 80.00, true, true),
('f0000000-0000-0000-0001-000000000006', 'e0000000-0000-0000-0000-000000000001', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian filter coffee — strong decoction with frothy hot milk', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R02: Murugan Idli Shop (T. Nagar) — South Indian Veg
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0002-000000000001', 'e0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000001', 'Soft Idli (4 pcs)', 'Signature pillowy steamed idlis with three varieties of chutney and sambar', 60.00, true, true),
('f0000000-0000-0000-0002-000000000002', 'e0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000001', 'Podi Idli', 'Idlis tossed in spicy gun powder with sesame oil — a flavour bomb', 80.00, true, true),
('f0000000-0000-0000-0002-000000000003', 'e0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000001', 'Ghee Roast Dosa', 'Paper-thin dosa roasted to a deep golden crisp with pure ghee', 100.00, true, true),
('f0000000-0000-0000-0002-000000000004', 'e0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000002', 'Sambar Vada', 'Crispy vadas dunked in aromatic sambar, topped with onions and coriander', 75.00, true, true),
('f0000000-0000-0000-0002-000000000005', 'e0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000001', 'Mini Tiffin Combo', 'Two idlis, one dosa, one vada with sambar and three chutneys', 120.00, true, true),
('f0000000-0000-0000-0002-000000000006', 'e0000000-0000-0000-0000-000000000002', 'd0000000-0000-0000-0000-000000000008', 'Badam Milk', 'Chilled almond milk sweetened with sugar and a hint of cardamom', 60.00, true, true)
ON CONFLICT DO NOTHING;

-- R03: Anjappar Chettinad (T. Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0003-000000000001', 'e0000000-0000-0000-0000-000000000003', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken tossed in fiery red chillies, curry leaves, and Chettinad spices', 220.00, false, true),
('f0000000-0000-0000-0003-000000000002', 'e0000000-0000-0000-0000-000000000003', 'd0000000-0000-0000-0000-000000000004', 'Chettinad Chicken Curry', 'Slow-cooked chicken in a robust gravy of freshly ground black pepper, fennel, and star anise', 280.00, false, true),
('f0000000-0000-0000-0003-000000000003', 'e0000000-0000-0000-0000-000000000003', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton chunks with crushed pepper, shallots, and coconut bits', 320.00, false, true),
('f0000000-0000-0000-0003-000000000004', 'e0000000-0000-0000-0000-000000000003', 'd0000000-0000-0000-0000-000000000004', 'Pepper Crab Masala', 'Whole crab cooked in a thick pepper-tamarind gravy — messy, glorious eating', 450.00, false, true),
('f0000000-0000-0000-0003-000000000005', 'e0000000-0000-0000-0000-000000000003', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant seeraga samba rice layered with spiced chicken and caramelised onions', 250.00, false, true),
('f0000000-0000-0000-0003-000000000006', 'e0000000-0000-0000-0000-000000000003', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky, layered Malabar parotta — perfect for soaking up gravy', 60.00, true, true)
ON CONFLICT DO NOTHING;

-- R04: Dindigul Thalappakatti (T. Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0004-000000000001', 'e0000000-0000-0000-0000-000000000004', 'd0000000-0000-0000-0000-000000000005', 'Thalappakatti Chicken Biryani', 'Signature Dindigul biryani with seeraga samba rice, small-cut chicken, and aromatic spice blend', 280.00, false, true),
('f0000000-0000-0000-0004-000000000002', 'e0000000-0000-0000-0000-000000000004', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton slow-cooked with fragrant rice and caramelised onions', 340.00, false, true),
('f0000000-0000-0000-0004-000000000003', 'e0000000-0000-0000-0000-000000000004', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chops', 'Marinated and grilled mutton chops with a smoky char and tangy mint sauce', 290.00, false, true),
('f0000000-0000-0000-0004-000000000004', 'e0000000-0000-0000-0000-000000000004', 'd0000000-0000-0000-0000-000000000004', 'Nattu Kozhi Rasam', 'Spicy country chicken rasam — a fiery, peppery broth to warm the soul', 180.00, false, true),
('f0000000-0000-0000-0004-000000000005', 'e0000000-0000-0000-0000-000000000004', 'd0000000-0000-0000-0000-000000000005', 'Veg Biryani', 'Aromatic basmati rice with seasonal vegetables and whole spices', 180.00, true, true),
('f0000000-0000-0000-0004-000000000006', 'e0000000-0000-0000-0000-000000000004', 'd0000000-0000-0000-0000-000000000007', 'Halwa', 'Warm wheat halwa dripping with ghee and topped with cashews', 70.00, true, true)
ON CONFLICT DO NOTHING;

-- R05: Hot Chips (T. Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0005-000000000001', 'e0000000-0000-0000-0000-000000000005', 'd0000000-0000-0000-0000-000000000002', 'Crispy Fried Chicken', 'Crunchy golden-fried chicken with Chennai-style spice coating', 180.00, false, true),
('f0000000-0000-0000-0005-000000000002', 'e0000000-0000-0000-0000-000000000005', 'd0000000-0000-0000-0000-000000000010', 'Veg Burger', 'Crispy aloo tikki patty with lettuce, tomato, and signature sauce', 99.00, true, true),
('f0000000-0000-0000-0005-000000000003', 'e0000000-0000-0000-0000-000000000005', 'd0000000-0000-0000-0000-000000000010', 'Chicken Shawarma', 'Grilled chicken wrapped in rumali roti with garlic mayo and pickled veggies', 130.00, false, true),
('f0000000-0000-0000-0005-000000000004', 'e0000000-0000-0000-0000-000000000005', 'd0000000-0000-0000-0000-000000000004', 'Noodles Combo', 'Hakka noodles with chicken manchurian and a soft drink', 199.00, false, true),
('f0000000-0000-0000-0005-000000000005', 'e0000000-0000-0000-0000-000000000005', 'd0000000-0000-0000-0000-000000000001', 'Idli Vada Combo', 'Two soft idlis and one vada with sambar and chutney — classic morning fuel', 80.00, true, true),
('f0000000-0000-0000-0005-000000000006', 'e0000000-0000-0000-0000-000000000005', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Freshly squeezed lime with soda, sugar, and a pinch of salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R06: Grand Sweets (T. Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0006-000000000001', 'e0000000-0000-0000-0000-000000000006', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, curry leaves, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0006-000000000002', 'e0000000-0000-0000-0000-000000000006', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral-shaped crispy rice flour snack seasoned with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0006-000000000003', 'e0000000-0000-0000-0000-000000000006', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-your-mouth ghee fudge made with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0006-000000000004', 'e0000000-0000-0000-0000-000000000006', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Elaborate veg thali with rice, sambar, rasam, two curries, curd, sweet, and papad', 180.00, true, true),
('f0000000-0000-0000-0006-000000000005', 'e0000000-0000-0000-0000-000000000006', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky, syrup-soaked pastry with a delicate cardamom aroma', 40.00, true, true),
('f0000000-0000-0000-0006-000000000006', 'e0000000-0000-0000-0000-000000000006', 'd0000000-0000-0000-0000-000000000002', 'Paneer Puff', 'Flaky puff pastry filled with spiced cottage cheese and onions', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R07: Copper Chimney (T. Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0007-000000000001', 'e0000000-0000-0000-0000-000000000007', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Charcoal-grilled chicken marinated overnight in yoghurt and Kashmiri spices', 350.00, false, true),
('f0000000-0000-0000-0007-000000000002', 'e0000000-0000-0000-0000-000000000007', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Succulent chicken tikka pieces simmered in rich tomato-cream makhani gravy', 380.00, false, true),
('f0000000-0000-0000-0007-000000000003', 'e0000000-0000-0000-0000-000000000007', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Slow-cooked black lentils and kidney beans in a velvety butter-cream sauce', 280.00, true, true),
('f0000000-0000-0000-0007-000000000004', 'e0000000-0000-0000-0000-000000000007', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked flatbread topped with garlic, butter, and fresh coriander', 80.00, true, true),
('f0000000-0000-0000-0007-000000000005', 'e0000000-0000-0000-0000-000000000007', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese cubes with capsicum and onion', 320.00, true, true),
('f0000000-0000-0000-0007-000000000006', 'e0000000-0000-0000-0000-000000000007', 'd0000000-0000-0000-0000-000000000005', 'Gosht Biryani', 'Hyderabadi-style dum biryani with tender goat meat and saffron rice', 420.00, false, true)
ON CONFLICT DO NOTHING;

-- R08: Adyar Ananda Bhavan (Adyar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0008-000000000001', 'e0000000-0000-0000-0000-000000000008', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy, crispy semolina crepe studded with cumin, pepper, and fresh curry leaves', 95.00, true, true),
('f0000000-0000-0000-0008-000000000002', 'e0000000-0000-0000-0000-000000000008', 'd0000000-0000-0000-0000-000000000009', 'A2B Special Thali', 'Signature unlimited thali with variety rice, sambar, rasam, and seasonal sweet', 220.00, true, true),
('f0000000-0000-0000-0008-000000000003', 'e0000000-0000-0000-0000-000000000008', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf — A2B''s bestselling sweet', 350.00, true, true),
('f0000000-0000-0000-0008-000000000004', 'e0000000-0000-0000-0000-000000000008', 'd0000000-0000-0000-0000-000000000001', 'Pongal Vada Combo', 'Warm ghee pongal paired with crispy medu vada and coconut chutney', 110.00, true, true),
('f0000000-0000-0000-0008-000000000005', 'e0000000-0000-0000-0000-000000000008', 'd0000000-0000-0000-0000-000000000010', 'Samosa (2 pcs)', 'Crispy triangular pastries stuffed with spiced potatoes and peas', 50.00, true, true),
('f0000000-0000-0000-0008-000000000006', 'e0000000-0000-0000-0000-000000000008', 'd0000000-0000-0000-0000-000000000008', 'Jigarthanda', 'Chennai-Madurai hybrid — chilled milk with almond gum, sarsaparilla, and ice cream', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R09: Buhari (Adyar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0009-000000000001', 'e0000000-0000-0000-0000-000000000009', 'd0000000-0000-0000-0000-000000000005', 'Buhari Biryani', 'The original 1951 recipe — bone-in chicken biryani with distinctive Buhari masala', 290.00, false, true),
('f0000000-0000-0000-0009-000000000002', 'e0000000-0000-0000-0000-000000000009', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas perfect for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0009-000000000003', 'e0000000-0000-0000-0000-000000000009', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick, spicy gravy with shredded chicken — the ultimate parotta companion', 230.00, false, true),
('f0000000-0000-0000-0009-000000000004', 'e0000000-0000-0000-0000-000000000009', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs grilled on skewers with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0009-000000000005', 'e0000000-0000-0000-0000-000000000009', 'd0000000-0000-0000-0000-000000000004', 'Mutton Kola Urundai', 'Crispy fried mutton meatballs with Chettinad spices — a Buhari classic', 280.00, false, true),
('f0000000-0000-0000-0009-000000000006', 'e0000000-0000-0000-0000-000000000009', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk-solid dumplings soaked in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R10: Sangeetha Veg (Adyar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0010-000000000001', 'e0000000-0000-0000-0000-000000000010', 'd0000000-0000-0000-0000-000000000001', 'Set Dosa (3 pcs)', 'Soft, spongy dosas served stacked with butter and gunpowder', 85.00, true, true),
('f0000000-0000-0000-0010-000000000002', 'e0000000-0000-0000-0000-000000000010', 'd0000000-0000-0000-0000-000000000009', 'Sangeetha Meals', 'Full South Indian thali — rice, sambar, rasam, dry curry, buttermilk, and payasam', 170.00, true, true),
('f0000000-0000-0000-0010-000000000003', 'e0000000-0000-0000-0000-000000000010', 'd0000000-0000-0000-0000-000000000001', 'Uttapam', 'Thick lentil-rice pancake topped with onions, tomatoes, and green chillies', 90.00, true, true),
('f0000000-0000-0000-0010-000000000004', 'e0000000-0000-0000-0000-000000000010', 'd0000000-0000-0000-0000-000000000005', 'Tomato Rice', 'Tangy rice tossed with tomato paste, peanuts, and curry leaves', 100.00, true, true),
('f0000000-0000-0000-0010-000000000005', 'e0000000-0000-0000-0000-000000000010', 'd0000000-0000-0000-0000-000000000003', 'Rasam', 'Hot tamarind-pepper broth with cumin and coriander — pure comfort', 50.00, true, true),
('f0000000-0000-0000-0010-000000000006', 'e0000000-0000-0000-0000-000000000010', 'd0000000-0000-0000-0000-000000000008', 'Buttermilk', 'Spiced and salted churned yoghurt with ginger and curry leaves', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R11: Cascade (Adyar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0011-000000000001', 'e0000000-0000-0000-0000-000000000011', 'd0000000-0000-0000-0000-000000000002', 'Gobi Manchurian', 'Crispy cauliflower florets in sweet-spicy Indo-Chinese sauce', 180.00, true, true),
('f0000000-0000-0000-0011-000000000002', 'e0000000-0000-0000-0000-000000000011', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Chicken', 'Wok-tossed chicken strips in fiery schezwan paste with peppers and onions', 250.00, false, true),
('f0000000-0000-0000-0011-000000000003', 'e0000000-0000-0000-0000-000000000011', 'd0000000-0000-0000-0000-000000000004', 'Paneer Butter Masala', 'Soft cottage cheese cubes in a buttery, mildly spiced tomato gravy', 220.00, true, true),
('f0000000-0000-0000-0011-000000000004', 'e0000000-0000-0000-0000-000000000011', 'd0000000-0000-0000-0000-000000000004', 'Egg Fried Rice', 'Wok-fried basmati rice with scrambled eggs, vegetables, and soy sauce', 160.00, false, true),
('f0000000-0000-0000-0011-000000000005', 'e0000000-0000-0000-0000-000000000011', 'd0000000-0000-0000-0000-000000000005', 'Chicken Fried Rice', 'Fragrant rice stir-fried with chicken, egg, and spring onions', 200.00, false, true),
('f0000000-0000-0000-0011-000000000006', 'e0000000-0000-0000-0000-000000000011', 'd0000000-0000-0000-0000-000000000008', 'Mango Lassi', 'Thick Alphonso mango yoghurt smoothie — creamy and refreshing', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R12: The Brew Room (Adyar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0012-000000000001', 'e0000000-0000-0000-0000-000000000012', 'd0000000-0000-0000-0000-000000000008', 'Cappuccino', 'Velvety espresso with perfectly steamed milk and a dusting of cocoa', 180.00, true, true),
('f0000000-0000-0000-0012-000000000002', 'e0000000-0000-0000-0000-000000000012', 'd0000000-0000-0000-0000-000000000001', 'Avocado Toast', 'Sourdough with smashed avocado, cherry tomatoes, feta, and chilli flakes', 280.00, true, true),
('f0000000-0000-0000-0012-000000000003', 'e0000000-0000-0000-0000-000000000012', 'd0000000-0000-0000-0000-000000000004', 'Grilled Chicken Sandwich', 'Herb-marinated chicken breast with lettuce, cheese, and pesto on ciabatta', 320.00, false, true),
('f0000000-0000-0000-0012-000000000004', 'e0000000-0000-0000-0000-000000000012', 'd0000000-0000-0000-0000-000000000001', 'Pancake Stack', 'Fluffy buttermilk pancakes drizzled with maple syrup and mixed berries', 260.00, true, true),
('f0000000-0000-0000-0012-000000000005', 'e0000000-0000-0000-0000-000000000012', 'd0000000-0000-0000-0000-000000000007', 'Tiramisu', 'Classic Italian dessert with espresso-soaked ladyfingers and mascarpone', 290.00, true, true),
('f0000000-0000-0000-0012-000000000006', 'e0000000-0000-0000-0000-000000000012', 'd0000000-0000-0000-0000-000000000008', 'Iced Matcha Latte', 'Japanese ceremonial-grade matcha over ice with oat milk', 220.00, true, true)
ON CONFLICT DO NOTHING;

-- R13: Ratna Cafe (Mylapore)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0013-000000000001', 'e0000000-0000-0000-0000-000000000013', 'd0000000-0000-0000-0000-000000000001', 'Sambar Idli', 'Fluffy idlis swimming in the legendary Ratna Cafe sambar — since 1948', 70.00, true, true),
('f0000000-0000-0000-0013-000000000002', 'e0000000-0000-0000-0000-000000000013', 'd0000000-0000-0000-0000-000000000001', 'Ghee Kara Dosa', 'Crispy dosa with spicy chutney spread, roasted in ghee for extra crunch', 100.00, true, true),
('f0000000-0000-0000-0013-000000000003', 'e0000000-0000-0000-0000-000000000013', 'd0000000-0000-0000-0000-000000000001', 'Rava Upma', 'Savoury semolina porridge tempered with mustard, urad dal, and cashews', 65.00, true, true),
('f0000000-0000-0000-0013-000000000004', 'e0000000-0000-0000-0000-000000000013', 'd0000000-0000-0000-0000-000000000002', 'Bonda (4 pcs)', 'Fluffy potato bonda with a crispy gram flour coating and coconut chutney', 60.00, true, true),
('f0000000-0000-0000-0013-000000000005', 'e0000000-0000-0000-0000-000000000013', 'd0000000-0000-0000-0000-000000000007', 'Sweet Pongal', 'Jaggery-sweetened rice and lentil pudding with ghee, cashews, and raisins', 70.00, true, true),
('f0000000-0000-0000-0013-000000000006', 'e0000000-0000-0000-0000-000000000013', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Thick, frothy South Indian filter coffee served in a steel tumbler-davara', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R14: Jannal Kadai (Mylapore)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0014-000000000001', 'e0000000-0000-0000-0000-000000000014', 'd0000000-0000-0000-0000-000000000010', 'Onion Bajji (6 pcs)', 'Thick onion rings dipped in spicy gram flour batter and deep-fried', 50.00, true, true),
('f0000000-0000-0000-0014-000000000002', 'e0000000-0000-0000-0000-000000000014', 'd0000000-0000-0000-0000-000000000010', 'Banana Bajji (4 pcs)', 'Ripe banana fritters in a light batter — sweet, crispy street-food bliss', 40.00, true, true),
('f0000000-0000-0000-0014-000000000003', 'e0000000-0000-0000-0000-000000000014', 'd0000000-0000-0000-0000-000000000010', 'Masala Vada (4 pcs)', 'Crunchy chana dal vadas with onion, curry leaves, and green chilli', 50.00, true, true),
('f0000000-0000-0000-0014-000000000004', 'e0000000-0000-0000-0000-000000000014', 'd0000000-0000-0000-0000-000000000010', 'Bread Pakora', 'Bread slices stuffed with potato, dipped in batter, and fried golden', 40.00, true, true),
('f0000000-0000-0000-0014-000000000005', 'e0000000-0000-0000-0000-000000000014', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Strong filter coffee brewed right at the window — handed hot to your palm', 30.00, true, true),
('f0000000-0000-0000-0014-000000000006', 'e0000000-0000-0000-0000-000000000014', 'd0000000-0000-0000-0000-000000000010', 'Sundal', 'Spiced chickpea salad with coconut shavings and curry leaves — temple festival classic', 30.00, true, true)
ON CONFLICT DO NOTHING;

-- R15: Nair Mess (Mylapore)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0015-000000000001', 'e0000000-0000-0000-0000-000000000015', 'd0000000-0000-0000-0000-000000000004', 'Fish Curry Meals', 'Kerala-style fish curry with matta rice, thoran, avial, and papadam', 180.00, false, true),
('f0000000-0000-0000-0015-000000000002', 'e0000000-0000-0000-0000-000000000015', 'd0000000-0000-0000-0000-000000000004', 'Chicken Curry Meals', 'Spicy Kerala chicken curry with rice, sambar, rasam, and pickle', 170.00, false, true),
('f0000000-0000-0000-0015-000000000003', 'e0000000-0000-0000-0000-000000000015', 'd0000000-0000-0000-0000-000000000002', 'Prawn Fry', 'Fresh prawns marinated in Kerala spices and shallow-fried until crispy', 250.00, false, true),
('f0000000-0000-0000-0015-000000000004', 'e0000000-0000-0000-0000-000000000015', 'd0000000-0000-0000-0000-000000000004', 'Meen Pollichathu', 'Pearl spot fish marinated and grilled in banana leaf with Kerala masala', 320.00, false, true),
('f0000000-0000-0000-0015-000000000005', 'e0000000-0000-0000-0000-000000000015', 'd0000000-0000-0000-0000-000000000006', 'Kerala Parotta (2 pcs)', 'Layered flaky parottas with a softer, butterier texture than Malabar style', 50.00, true, true),
('f0000000-0000-0000-0015-000000000006', 'e0000000-0000-0000-0000-000000000015', 'd0000000-0000-0000-0000-000000000007', 'Payasam', 'Creamy vermicelli kheer with cardamom, raisins, and cashews', 60.00, true, true)
ON CONFLICT DO NOTHING;

-- R16: Mylapore Kshatriya (Mylapore)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0016-000000000001', 'e0000000-0000-0000-0000-000000000016', 'd0000000-0000-0000-0000-000000000001', 'Idli (3 pcs)', 'Soft steamed rice cakes served with sambar and coconut chutney', 50.00, true, true),
('f0000000-0000-0000-0016-000000000002', 'e0000000-0000-0000-0000-000000000016', 'd0000000-0000-0000-0000-000000000001', 'Onion Uthappam', 'Thick lentil-rice pancake loaded with onions and green chillies', 85.00, true, true),
('f0000000-0000-0000-0016-000000000003', 'e0000000-0000-0000-0000-000000000016', 'd0000000-0000-0000-0000-000000000009', 'Temple Meals', 'Simple vegetarian thali with rice, sambar, rasam, poriyal, and curd', 120.00, true, true),
('f0000000-0000-0000-0016-000000000004', 'e0000000-0000-0000-0000-000000000016', 'd0000000-0000-0000-0000-000000000005', 'Curd Rice', 'Cooling yoghurt rice tempered with mustard, curry leaves, and pomegranate', 80.00, true, true),
('f0000000-0000-0000-0016-000000000005', 'e0000000-0000-0000-0000-000000000016', 'd0000000-0000-0000-0000-000000000007', 'Kesari Bath', 'Saffron-tinted semolina halwa with ghee, cashews, and raisins', 60.00, true, true),
('f0000000-0000-0000-0016-000000000006', 'e0000000-0000-0000-0000-000000000016', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Aromatic filter coffee made with freshly ground beans and chicory blend', 35.00, true, true)
ON CONFLICT DO NOTHING;

-- R17: Kabul Restaurant (Mylapore)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0017-000000000001', 'e0000000-0000-0000-0000-000000000017', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Fragrant basmati rice with tender bone-in mutton and fried onions', 300.00, false, true),
('f0000000-0000-0000-0017-000000000002', 'e0000000-0000-0000-0000-000000000017', 'd0000000-0000-0000-0000-000000000002', 'Seekh Kebab', 'Minced lamb kebabs seasoned with garam masala and grilled on charcoal', 280.00, false, true),
('f0000000-0000-0000-0017-000000000003', 'e0000000-0000-0000-0000-000000000017', 'd0000000-0000-0000-0000-000000000004', 'Mughlai Chicken', 'Rich cashew-cream gravy with tender chicken pieces and aromatic spices', 300.00, false, true),
('f0000000-0000-0000-0017-000000000004', 'e0000000-0000-0000-0000-000000000017', 'd0000000-0000-0000-0000-000000000006', 'Butter Naan', 'Soft tandoor-baked bread brushed with melted butter', 60.00, true, true),
('f0000000-0000-0000-0017-000000000005', 'e0000000-0000-0000-0000-000000000017', 'd0000000-0000-0000-0000-000000000004', 'Egg Curry', 'Boiled eggs in a tangy onion-tomato gravy with kasuri methi', 180.00, false, true),
('f0000000-0000-0000-0017-000000000006', 'e0000000-0000-0000-0000-000000000017', 'd0000000-0000-0000-0000-000000000007', 'Shahi Tukda', 'Fried bread soaked in saffron milk and topped with clotted cream', 100.00, true, true)
ON CONFLICT DO NOTHING;

-- R18: Cream Centre (Anna Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0018-000000000001', 'e0000000-0000-0000-0000-000000000018', 'd0000000-0000-0000-0000-000000000002', 'Mexican Nachos Tower', 'Loaded nachos with jalapeños, cheese sauce, salsa, and guacamole', 380.00, true, true),
('f0000000-0000-0000-0018-000000000002', 'e0000000-0000-0000-0000-000000000018', 'd0000000-0000-0000-0000-000000000004', 'Paneer Lababdar', 'Cottage cheese in a rich tomato-cashew gravy with cream and kasuri methi', 350.00, true, true),
('f0000000-0000-0000-0018-000000000003', 'e0000000-0000-0000-0000-000000000018', 'd0000000-0000-0000-0000-000000000004', 'Thai Green Curry', 'Creamy coconut curry with vegetables, basil, and lemongrass served with jasmine rice', 420.00, true, true),
('f0000000-0000-0000-0018-000000000004', 'e0000000-0000-0000-0000-000000000018', 'd0000000-0000-0000-0000-000000000002', 'Spinach Corn Tikki', 'Pan-seared patties of spinach and sweet corn with tangy tamarind chutney', 280.00, true, true),
('f0000000-0000-0000-0018-000000000005', 'e0000000-0000-0000-0000-000000000018', 'd0000000-0000-0000-0000-000000000007', 'Sizzling Brownie', 'Warm chocolate brownie on a sizzler plate with vanilla ice cream', 320.00, true, true),
('f0000000-0000-0000-0018-000000000006', 'e0000000-0000-0000-0000-000000000018', 'd0000000-0000-0000-0000-000000000008', 'Virgin Mojito', 'Fresh mint and lime muddled with soda and a splash of sprite', 180.00, true, true)
ON CONFLICT DO NOTHING;

-- R19: Biriyani Zone (Anna Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0019-000000000001', 'e0000000-0000-0000-0000-000000000019', 'd0000000-0000-0000-0000-000000000005', 'Hyderabadi Chicken Dum Biryani', 'Classic Hyderabadi dum biryani — layers of basmati rice and spiced chicken sealed with dough', 260.00, false, true),
('f0000000-0000-0000-0019-000000000002', 'e0000000-0000-0000-0000-000000000019', 'd0000000-0000-0000-0000-000000000005', 'Lucknowi Mutton Biryani', 'Awadhi-style biryani with tender mutton pieces infused with saffron and kewra', 340.00, false, true),
('f0000000-0000-0000-0019-000000000003', 'e0000000-0000-0000-0000-000000000019', 'd0000000-0000-0000-0000-000000000005', 'Chennai Star Biryani', 'Local favourite — spice-heavy biryani with short-grain rice and small-cut chicken', 220.00, false, true),
('f0000000-0000-0000-0019-000000000004', 'e0000000-0000-0000-0000-000000000019', 'd0000000-0000-0000-0000-000000000002', 'Chicken Lollipop', 'Crispy chicken drumettes tossed in sweet chilli sauce — perfect starter', 200.00, false, true),
('f0000000-0000-0000-0019-000000000005', 'e0000000-0000-0000-0000-000000000019', 'd0000000-0000-0000-0000-000000000003', 'Mutton Shorba', 'Slow-simmered mutton bone broth with aromatics and a hint of lime', 120.00, false, true),
('f0000000-0000-0000-0019-000000000006', 'e0000000-0000-0000-0000-000000000019', 'd0000000-0000-0000-0000-000000000008', 'Masala Chaas', 'Spiced buttermilk with roasted cumin, mint, and a pinch of chaat masala', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R20: Tiffanys (Anna Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0020-000000000001', 'e0000000-0000-0000-0000-000000000020', 'd0000000-0000-0000-0000-000000000001', 'Plain Dosa', 'Thin, crispy rice-lentil crepe served with sambar and three chutneys', 60.00, true, true),
('f0000000-0000-0000-0020-000000000002', 'e0000000-0000-0000-0000-000000000020', 'd0000000-0000-0000-0000-000000000001', 'Idli Sambar', 'Four soft idlis with piping hot sambar and fresh coconut chutney', 55.00, true, true),
('f0000000-0000-0000-0020-000000000003', 'e0000000-0000-0000-0000-000000000020', 'd0000000-0000-0000-0000-000000000001', 'Kuzhi Paniyaram', 'South Indian takoyaki — crispy outside, soft inside, served with chutneys', 70.00, true, true),
('f0000000-0000-0000-0020-000000000004', 'e0000000-0000-0000-0000-000000000020', 'd0000000-0000-0000-0000-000000000009', 'Mini Meals', 'Compact thali — rice, sambar, rasam, one curry, curd, pickle', 99.00, true, true),
('f0000000-0000-0000-0020-000000000005', 'e0000000-0000-0000-0000-000000000020', 'd0000000-0000-0000-0000-000000000002', 'Bajji Plate', 'Assorted bajjis — onion, chilli, and potato with coconut chutney', 60.00, true, true),
('f0000000-0000-0000-0020-000000000006', 'e0000000-0000-0000-0000-000000000020', 'd0000000-0000-0000-0000-000000000008', 'Degree Coffee', 'Strong filter coffee — the kind your grandmother would approve of', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R21: Palmshore (Anna Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0021-000000000001', 'e0000000-0000-0000-0000-000000000021', 'd0000000-0000-0000-0000-000000000002', 'Dragon Chicken', 'Crispy chicken strips tossed in sweet-spicy sauce with spring onions', 270.00, false, true),
('f0000000-0000-0000-0021-000000000002', 'e0000000-0000-0000-0000-000000000021', 'd0000000-0000-0000-0000-000000000004', 'Kadai Paneer', 'Cottage cheese cooked in a chunky capsicum-onion tomato gravy', 240.00, true, true),
('f0000000-0000-0000-0021-000000000003', 'e0000000-0000-0000-0000-000000000021', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Fiery Chettinad-spiced chicken gravy with coconut and curry leaves', 290.00, false, true),
('f0000000-0000-0000-0021-000000000004', 'e0000000-0000-0000-0000-000000000021', 'd0000000-0000-0000-0000-000000000005', 'Veg Fried Rice', 'Stir-fried rice with vegetables, soy sauce, and a touch of sesame', 170.00, true, true),
('f0000000-0000-0000-0021-000000000005', 'e0000000-0000-0000-0000-000000000021', 'd0000000-0000-0000-0000-000000000006', 'Rumali Roti', 'Paper-thin handkerchief bread — soft, foldable, and great with any gravy', 50.00, true, true),
('f0000000-0000-0000-0021-000000000006', 'e0000000-0000-0000-0000-000000000021', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun', 'Warm, syrup-soaked milk dumplings with a hint of cardamom', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R22: Chai Kings (Anna Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0022-000000000001', 'e0000000-0000-0000-0000-000000000022', 'd0000000-0000-0000-0000-000000000008', 'Kulhad Chai', 'Masala chai served in an earthen kulhad — earthy, fragrant, and comforting', 60.00, true, true),
('f0000000-0000-0000-0022-000000000002', 'e0000000-0000-0000-0000-000000000022', 'd0000000-0000-0000-0000-000000000010', 'Bun Maska', 'Toasted bun slathered with Amul butter — the perfect chai companion', 50.00, true, true),
('f0000000-0000-0000-0022-000000000003', 'e0000000-0000-0000-0000-000000000022', 'd0000000-0000-0000-0000-000000000010', 'Maggi', 'Classic 2-minute noodles with extra veggies and a spicy twist', 80.00, true, true),
('f0000000-0000-0000-0022-000000000004', 'e0000000-0000-0000-0000-000000000022', 'd0000000-0000-0000-0000-000000000010', 'Cheese Grilled Sandwich', 'Toasted multigrain bread with vegetables, cheese, and chilli flakes', 120.00, true, true),
('f0000000-0000-0000-0022-000000000005', 'e0000000-0000-0000-0000-000000000022', 'd0000000-0000-0000-0000-000000000008', 'Iced Chai', 'Cold-brewed masala chai over ice with a splash of condensed milk', 90.00, true, true),
('f0000000-0000-0000-0022-000000000006', 'e0000000-0000-0000-0000-000000000022', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Lava Cake', 'Warm mini cake with molten chocolate centre — served with ice cream', 150.00, true, true)
ON CONFLICT DO NOTHING;

-- R23: The Dhaba (OMR)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0023-000000000001', 'e0000000-0000-0000-0000-000000000023', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken chunks in a silky tomato-cream gravy with kasuri methi', 320.00, false, true),
('f0000000-0000-0000-0023-000000000002', 'e0000000-0000-0000-0000-000000000023', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Highway-dhaba-style black dal simmered overnight with butter and cream', 250.00, true, true),
('f0000000-0000-0000-0023-000000000003', 'e0000000-0000-0000-0000-000000000023', 'd0000000-0000-0000-0000-000000000002', 'Amritsari Fish Fry', 'Crispy batter-fried fish fillets with carom seeds and chaat masala', 350.00, false, true),
('f0000000-0000-0000-0023-000000000004', 'e0000000-0000-0000-0000-000000000023', 'd0000000-0000-0000-0000-000000000006', 'Tandoori Roti', 'Whole wheat bread baked in clay tandoor — slightly charred and smoky', 40.00, true, true),
('f0000000-0000-0000-0023-000000000005', 'e0000000-0000-0000-0000-000000000023', 'd0000000-0000-0000-0000-000000000004', 'Palak Paneer', 'Creamy spinach gravy with soft cottage cheese cubes and a dash of cream', 260.00, true, true),
('f0000000-0000-0000-0023-000000000006', 'e0000000-0000-0000-0000-000000000023', 'd0000000-0000-0000-0000-000000000008', 'Lassi (Sweet/Salted)', 'Thick churned yoghurt drink — sweet with cardamom or salted with cumin', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R24: Maplai (OMR)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0024-000000000001', 'e0000000-0000-0000-0000-000000000024', 'd0000000-0000-0000-0000-000000000002', 'Chettinad Mushroom Pepper Fry', 'Wild mushrooms tossed with cracked black pepper and fresh curry leaves', 380.00, true, true),
('f0000000-0000-0000-0024-000000000002', 'e0000000-0000-0000-0000-000000000024', 'd0000000-0000-0000-0000-000000000004', 'Nattu Kozhi Varuval', 'Country chicken dry-roasted with Chettinad masala and coconut slivers', 480.00, false, true),
('f0000000-0000-0000-0024-000000000003', 'e0000000-0000-0000-0000-000000000024', 'd0000000-0000-0000-0000-000000000004', 'Meen Kuzhambu', 'Tangy tamarind-based fish curry with drumstick and brinjal — Chettinad style', 420.00, false, true),
('f0000000-0000-0000-0024-000000000004', 'e0000000-0000-0000-0000-000000000024', 'd0000000-0000-0000-0000-000000000005', 'Seeraga Samba Mutton Biryani', 'Slow-cooked mutton biryani with seeraga samba rice and whole spices', 520.00, false, true),
('f0000000-0000-0000-0024-000000000005', 'e0000000-0000-0000-0000-000000000024', 'd0000000-0000-0000-0000-000000000007', 'Elaneer Payasam', 'Tender coconut kheer with jaggery and cardamom — light and refreshing', 250.00, true, true),
('f0000000-0000-0000-0024-000000000006', 'e0000000-0000-0000-0000-000000000024', 'd0000000-0000-0000-0000-000000000008', 'Nannari Sherbet', 'Traditional sarsaparilla root drink with lemon — deeply cooling', 150.00, true, true)
ON CONFLICT DO NOTHING;

-- R25: Pizzeria Italia (OMR)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0025-000000000001', 'e0000000-0000-0000-0000-000000000025', 'd0000000-0000-0000-0000-000000000004', 'Margherita Pizza', 'San Marzano tomato, fresh mozzarella, basil — wood-fired at 450°C', 399.00, true, true),
('f0000000-0000-0000-0025-000000000002', 'e0000000-0000-0000-0000-000000000025', 'd0000000-0000-0000-0000-000000000004', 'Pepperoni Diavola', 'Spicy pepperoni, chilli flakes, and mozzarella on a blistered crust', 499.00, false, true),
('f0000000-0000-0000-0025-000000000003', 'e0000000-0000-0000-0000-000000000025', 'd0000000-0000-0000-0000-000000000004', 'Truffle Mushroom Pasta', 'Handmade pappardelle with wild mushrooms, truffle oil, and parmesan', 520.00, true, true),
('f0000000-0000-0000-0025-000000000004', 'e0000000-0000-0000-0000-000000000025', 'd0000000-0000-0000-0000-000000000002', 'Bruschetta al Pomodoro', 'Toasted ciabatta with diced tomatoes, basil, garlic, and extra virgin olive oil', 280.00, true, true),
('f0000000-0000-0000-0025-000000000005', 'e0000000-0000-0000-0000-000000000025', 'd0000000-0000-0000-0000-000000000007', 'Panna Cotta', 'Silky vanilla cream pudding with mixed berry compote', 320.00, true, true),
('f0000000-0000-0000-0025-000000000006', 'e0000000-0000-0000-0000-000000000025', 'd0000000-0000-0000-0000-000000000003', 'Minestrone Soup', 'Hearty Italian vegetable soup with cannellini beans and fresh herbs', 250.00, true, true)
ON CONFLICT DO NOTHING;

-- R26: Dosai Spot (OMR)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0026-000000000001', 'e0000000-0000-0000-0000-000000000026', 'd0000000-0000-0000-0000-000000000001', 'Classic Masala Dosa', 'Traditional paper dosa with spiced potato stuffing, sambar, and chutneys', 80.00, true, true),
('f0000000-0000-0000-0026-000000000002', 'e0000000-0000-0000-0000-000000000026', 'd0000000-0000-0000-0000-000000000001', 'Cheese Schezwan Dosa', 'Crispy dosa with schezwan sauce spread, topped with melted cheese', 140.00, true, true),
('f0000000-0000-0000-0026-000000000003', 'e0000000-0000-0000-0000-000000000026', 'd0000000-0000-0000-0000-000000000001', 'Paneer Tikka Dosa', 'Stuffed dosa loaded with spicy paneer tikka filling and onions', 150.00, true, true),
('f0000000-0000-0000-0026-000000000004', 'e0000000-0000-0000-0000-000000000026', 'd0000000-0000-0000-0000-000000000001', 'Mysore Masala Dosa', 'Dosa with a fiery red chutney layer inside — Karnataka meets Chennai', 100.00, true, true),
('f0000000-0000-0000-0026-000000000005', 'e0000000-0000-0000-0000-000000000026', 'd0000000-0000-0000-0000-000000000001', 'Podi Butter Dosa', 'Crispy dosa generously spread with gunpowder and melted butter', 90.00, true, true),
('f0000000-0000-0000-0026-000000000006', 'e0000000-0000-0000-0000-000000000026', 'd0000000-0000-0000-0000-000000000008', 'Butter Milk', 'Chilled spiced buttermilk with ginger and curry leaves', 35.00, true, true)
ON CONFLICT DO NOTHING;

-- R27: Dragon Bowl (OMR)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0027-000000000001', 'e0000000-0000-0000-0000-000000000027', 'd0000000-0000-0000-0000-000000000002', 'Chicken Manchurian', 'Crispy chicken balls in a tangy-sweet Indo-Chinese gravy', 220.00, false, true),
('f0000000-0000-0000-0027-000000000002', 'e0000000-0000-0000-0000-000000000027', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Stir-fried hakka noodles in fiery schezwan sauce with crunchy vegetables', 180.00, true, true),
('f0000000-0000-0000-0027-000000000003', 'e0000000-0000-0000-0000-000000000027', 'd0000000-0000-0000-0000-000000000002', 'Chilli Paneer', 'Crispy paneer cubes tossed with bell peppers, onions, and green chillies', 200.00, true, true),
('f0000000-0000-0000-0027-000000000004', 'e0000000-0000-0000-0000-000000000027', 'd0000000-0000-0000-0000-000000000004', 'Chicken Sizzler', 'Sizzling hot plate with grilled chicken, noodles, vegetables, and pepper sauce', 350.00, false, true),
('f0000000-0000-0000-0027-000000000005', 'e0000000-0000-0000-0000-000000000027', 'd0000000-0000-0000-0000-000000000003', 'Hot and Sour Soup', 'Spicy-tangy broth with vegetables, tofu, and a dash of vinegar', 120.00, true, true),
('f0000000-0000-0000-0027-000000000006', 'e0000000-0000-0000-0000-000000000027', 'd0000000-0000-0000-0000-000000000005', 'Egg Fried Rice', 'Classic fried rice with scrambled eggs and spring onion garnish', 150.00, false, true)
ON CONFLICT DO NOTHING;

-- R28: Amethyst (Nungambakkam)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0028-000000000001', 'e0000000-0000-0000-0000-000000000028', 'd0000000-0000-0000-0000-000000000001', 'Eggs Benedict', 'Poached eggs on toasted muffin with hollandaise sauce and smoked salmon', 450.00, false, true),
('f0000000-0000-0000-0028-000000000002', 'e0000000-0000-0000-0000-000000000028', 'd0000000-0000-0000-0000-000000000004', 'Grilled Fish with Herbs', 'Pan-seared sea bass fillet with lemon-herb butter and roasted vegetables', 580.00, false, true),
('f0000000-0000-0000-0028-000000000003', 'e0000000-0000-0000-0000-000000000028', 'd0000000-0000-0000-0000-000000000002', 'Mezze Platter', 'Hummus, baba ganoush, falafel, and warm pita bread', 420.00, true, true),
('f0000000-0000-0000-0028-000000000004', 'e0000000-0000-0000-0000-000000000028', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Fondant', 'Warm dark chocolate cake with a liquid centre, served with vanilla gelato', 380.00, true, true),
('f0000000-0000-0000-0028-000000000005', 'e0000000-0000-0000-0000-000000000028', 'd0000000-0000-0000-0000-000000000008', 'Single Origin Pour Over', 'Hand-brewed single origin coffee from Indian micro-lots', 280.00, true, true),
('f0000000-0000-0000-0028-000000000006', 'e0000000-0000-0000-0000-000000000028', 'd0000000-0000-0000-0000-000000000002', 'Artisan Croissant', 'Flaky butter croissant — plain, almond, or chocolate', 220.00, true, true)
ON CONFLICT DO NOTHING;

-- R29: Eden (Nungambakkam)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0029-000000000001', 'e0000000-0000-0000-0000-000000000029', 'd0000000-0000-0000-0000-000000000002', 'Tuna Tartare', 'Fresh yellowfin tuna with avocado, sesame, and yuzu dressing', 680.00, false, true),
('f0000000-0000-0000-0029-000000000002', 'e0000000-0000-0000-0000-000000000029', 'd0000000-0000-0000-0000-000000000004', 'Lamb Rack', 'Herb-crusted New Zealand lamb rack with rosemary jus and potato gratin', 1200.00, false, true),
('f0000000-0000-0000-0029-000000000003', 'e0000000-0000-0000-0000-000000000029', 'd0000000-0000-0000-0000-000000000004', 'Risotto al Funghi', 'Creamy arborio rice with porcini mushrooms, truffle oil, and aged parmesan', 650.00, true, true),
('f0000000-0000-0000-0029-000000000004', 'e0000000-0000-0000-0000-000000000029', 'd0000000-0000-0000-0000-000000000003', 'Lobster Bisque', 'Velvety lobster soup with cognac cream and a drizzle of truffle oil', 520.00, false, true),
('f0000000-0000-0000-0029-000000000005', 'e0000000-0000-0000-0000-000000000029', 'd0000000-0000-0000-0000-000000000007', 'Crème Brûlée', 'Classic vanilla custard with a caramelised sugar crust — torched tableside', 420.00, true, true),
('f0000000-0000-0000-0029-000000000006', 'e0000000-0000-0000-0000-000000000029', 'd0000000-0000-0000-0000-000000000008', 'Espresso Martini', 'Shaken espresso with vodka and coffee liqueur — non-alcoholic version available', 480.00, true, true)
ON CONFLICT DO NOTHING;

-- R30: Junior Kuppanna (Nungambakkam)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0030-000000000001', 'e0000000-0000-0000-0000-000000000030', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice — Erode-style with intense spice', 380.00, false, true),
('f0000000-0000-0000-0030-000000000002', 'e0000000-0000-0000-0000-000000000030', 'd0000000-0000-0000-0000-000000000004', 'Crab Masala', 'Whole crab cooked in a rich, thick Chettinad masala with coconut and curry leaves', 520.00, false, true),
('f0000000-0000-0000-0030-000000000003', 'e0000000-0000-0000-0000-000000000030', 'd0000000-0000-0000-0000-000000000002', 'Chicken Sukka', 'Dry-roasted chicken with freshly ground Chettinad spices and coconut', 320.00, false, true),
('f0000000-0000-0000-0030-000000000004', 'e0000000-0000-0000-0000-000000000030', 'd0000000-0000-0000-0000-000000000004', 'Mutton Kuzhambu', 'Tangy mutton curry with tamarind, drumstick, and brinjal', 350.00, false, true),
('f0000000-0000-0000-0030-000000000005', 'e0000000-0000-0000-0000-000000000030', 'd0000000-0000-0000-0000-000000000002', 'Prawn 65', 'Crispy deep-fried prawns tossed with curry leaves, green chillies, and yoghurt', 380.00, false, true),
('f0000000-0000-0000-0030-000000000006', 'e0000000-0000-0000-0000-000000000030', 'd0000000-0000-0000-0000-000000000006', 'Kothu Parotta', 'Shredded parotta stir-fried with eggs, vegetables, and spicy masala', 150.00, false, true)
ON CONFLICT DO NOTHING;
