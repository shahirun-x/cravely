-- ============================================================================
-- Cravely Seed V2 — 120 Additional Chennai Restaurants
-- Run AFTER seed.sql. All inserts use ON CONFLICT DO NOTHING for re-runnability.
-- ============================================================================

-- ============================================================================
-- T. NAGAR — 25 restaurants (R031–R055)
-- ============================================================================

INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000031', 'ChIJ_TN_V2_01', 'Vasanta Bhavan', 'Old-school veg restaurant chain serving reliable South Indian tiffin and hearty meals since the 1980s.', 'b0000000-0000-0000-0000-000000000001', '35, South Usman Road, T. Nagar, Chennai 600017', 13.0400, 80.2340, '044-2434-1122', 1, 4.1, 7200, true, '{"mon":"06:30-22:00","tue":"06:30-22:00","wed":"06:30-22:00","thu":"06:30-22:00","fri":"06:30-22:30","sat":"06:30-22:30","sun":"06:30-22:30"}'),
('e0000000-0000-0000-0000-000000000032', 'ChIJ_TN_V2_02', 'Hotel Palmshore T. Nagar', 'Bustling family restaurant with multi-cuisine options, live counters, and generous portions.', 'b0000000-0000-0000-0000-000000000001', '48, North Usman Road, T. Nagar, Chennai 600017', 13.0425, 80.2350, '044-2434-2233', 2, 4.0, 5100, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000033', 'ChIJ_TN_V2_03', 'Sangeetha T. Nagar', 'Dependable vegetarian chain known for unlimited thalis, crispy dosas, and South Indian comfort food.', 'b0000000-0000-0000-0000-000000000001', '22, Panagal Park, T. Nagar, Chennai 600017', 13.0415, 80.2335, '044-2434-3344', 1, 4.2, 6800, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000034', 'ChIJ_TN_V2_04', 'Junior Kuppanna T. Nagar', 'The Erode-origin Chettinad powerhouse — nattu kozhi biryani and crab masala draw crowds nightly.', 'b0000000-0000-0000-0000-000000000001', '15, GN Chetty Road, T. Nagar, Chennai 600017', 13.0442, 80.2370, '044-2815-4455', 2, 4.3, 5500, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000035', 'ChIJ_TN_V2_05', 'Aachi Mess', 'No-frills Chettinad mess with fiery gravies, crispy varuval, and authentic flavours at throwaway prices.', 'b0000000-0000-0000-0000-000000000001', '8, Bazlullah Road, T. Nagar, Chennai 600017', 13.0408, 80.2365, '044-2434-5566', 1, 4.4, 3200, false, '{"mon":"06:00-22:00","tue":"06:00-22:00","wed":"06:00-22:00","thu":"06:00-22:00","fri":"06:00-22:30","sat":"06:00-22:30","sun":"06:00-22:30"}'),
('e0000000-0000-0000-0000-000000000036', 'ChIJ_TN_V2_06', 'Karpagambal Mess T. Nagar', 'Heritage mess serving classic Brahmin-style tiffin — podi idli, rava dosa, and filter coffee.', 'b0000000-0000-0000-0000-000000000001', '50, Ranganathan Street, T. Nagar, Chennai 600017', 13.0398, 80.2330, '044-2434-6677', 1, 4.5, 4100, true, '{"mon":"06:30-12:00,16:00-21:00","tue":"06:30-12:00,16:00-21:00","wed":"06:30-12:00,16:00-21:00","thu":"06:30-12:00,16:00-21:00","fri":"06:30-12:00,16:00-21:00","sat":"06:30-12:00,16:00-21:30","sun":"06:30-12:00,16:00-21:30"}'),
('e0000000-0000-0000-0000-000000000037', 'ChIJ_TN_V2_07', 'Ratna Cafe T. Nagar', 'Branch of the legendary Mylapore original — same famous sambar, same devoted following.', 'b0000000-0000-0000-0000-000000000001', '62, South Usman Road, T. Nagar, Chennai 600017', 13.0392, 80.2345, '044-2434-7788', 1, 4.3, 3800, true, '{"mon":"06:30-12:00,16:00-21:00","tue":"06:30-12:00,16:00-21:00","wed":"06:30-12:00,16:00-21:00","thu":"06:30-12:00,16:00-21:00","fri":"06:30-12:00,16:00-21:00","sat":"06:30-12:00,16:00-21:30","sun":"06:30-12:00,16:00-21:30"}'),
('e0000000-0000-0000-0000-000000000038', 'ChIJ_TN_V2_08', 'Shree Mithai', 'Vibrant sweet shop and restaurant serving Rajasthani and North Indian sweets alongside chaats.', 'b0000000-0000-0000-0000-000000000001', '33, Bharathi Salai, T. Nagar, Chennai 600017', 13.0432, 80.2355, '044-2434-8899', 1, 4.0, 3500, true, '{"mon":"08:00-22:00","tue":"08:00-22:00","wed":"08:00-22:00","thu":"08:00-22:00","fri":"08:00-22:30","sat":"08:00-22:30","sun":"08:00-22:30"}'),
('e0000000-0000-0000-0000-000000000039', 'ChIJ_TN_V2_09', 'A2B T. Nagar', 'Adyar Ananda Bhavan branch — sweets, snacks, and full South Indian meals under one roof.', 'b0000000-0000-0000-0000-000000000001', '70, Usman Road, T. Nagar, Chennai 600017', 13.0420, 80.2338, '044-2434-9900', 1, 4.1, 8500, true, '{"mon":"07:00-22:30","tue":"07:00-22:30","wed":"07:00-22:30","thu":"07:00-22:30","fri":"07:00-23:00","sat":"07:00-23:00","sun":"07:00-23:00"}'),
('e0000000-0000-0000-0000-000000000040', 'ChIJ_TN_V2_10', 'Ponnusamy T. Nagar', 'Chettinad powerhouse known for peppery mutton chukka, brandy-laced chicken, and fiery curries.', 'b0000000-0000-0000-0000-000000000001', '18, Habibullah Road, T. Nagar, Chennai 600017', 13.0435, 80.2380, '044-2815-1010', 2, 4.2, 4600, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000041', 'ChIJ_TN_V2_11', 'Sree Annapoorna', 'Coimbatore-origin pure veg restaurant with fluffy idlis, crispy vadas, and comfort thalis.', 'b0000000-0000-0000-0000-000000000001', '28, Theyagaraya Road, T. Nagar, Chennai 600017', 13.0410, 80.2360, '044-2434-1111', 1, 4.0, 3000, true, '{"mon":"06:30-22:00","tue":"06:30-22:00","wed":"06:30-22:00","thu":"06:30-22:00","fri":"06:30-22:30","sat":"06:30-22:30","sun":"06:30-22:30"}'),
('e0000000-0000-0000-0000-000000000042', 'ChIJ_TN_V2_12', 'The Wok', 'Pan-Asian restaurant with sushi rolls, Thai curries, dim sum, and fiery wok-tossed noodles.', 'b0000000-0000-0000-0000-000000000001', '55, GN Chetty Road, T. Nagar, Chennai 600017', 13.0440, 80.2372, '044-2815-1212', 2, 4.1, 2800, false, '{"mon":"12:00-23:00","tue":"12:00-23:00","wed":"12:00-23:00","thu":"12:00-23:00","fri":"12:00-23:30","sat":"12:00-23:30","sun":"12:00-23:30"}'),
('e0000000-0000-0000-0000-000000000043', 'ChIJ_TN_V2_13', 'Namma Veedu Vasanta Bhavan', 'Modern avatar of the classic veg chain with contemporary interiors and Instagram-worthy presentation.', 'b0000000-0000-0000-0000-000000000001', '42, Panagal Park, T. Nagar, Chennai 600017', 13.0413, 80.2332, '044-2434-1313', 2, 4.3, 4200, true, '{"mon":"07:00-22:30","tue":"07:00-22:30","wed":"07:00-22:30","thu":"07:00-22:30","fri":"07:00-23:00","sat":"07:00-23:00","sun":"07:00-23:00"}'),
('e0000000-0000-0000-0000-000000000044', 'ChIJ_TN_V2_14', 'Mehfil', 'Mughlai and biryani specialist with aromatic dum biryanis, succulent kebabs, and rich curries.', 'b0000000-0000-0000-0000-000000000001', '10, Kodambakkam High Road, T. Nagar, Chennai 600017', 13.0450, 80.2385, '044-2815-1414', 2, 4.0, 3100, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000045', 'ChIJ_TN_V2_15', 'Arusuvai', 'Traditional Tamil mess serving authentic home-style cooking — rasam, kuzhambu, and fresh poriyal.', 'b0000000-0000-0000-0000-000000000001', '5, Thanikachalam Road, T. Nagar, Chennai 600017', 13.0405, 80.2350, '044-2434-1515', 1, 4.2, 2500, true, '{"mon":"07:00-21:30","tue":"07:00-21:30","wed":"07:00-21:30","thu":"07:00-21:30","fri":"07:00-21:30","sat":"07:00-22:00","sun":"07:00-22:00"}'),
('e0000000-0000-0000-0000-000000000046', 'ChIJ_TN_V2_16', 'Sri Krishna Sweets T. Nagar', 'Famous sweets and snacks emporium with piping hot jalebi, crispy mixture, and festive specials.', 'b0000000-0000-0000-0000-000000000001', '58, Usman Road, T. Nagar, Chennai 600017', 13.0418, 80.2340, '044-2434-1616', 1, 4.1, 5800, true, '{"mon":"08:00-21:30","tue":"08:00-21:30","wed":"08:00-21:30","thu":"08:00-21:30","fri":"08:00-22:00","sat":"08:00-22:00","sun":"08:00-22:00"}'),
('e0000000-0000-0000-0000-000000000047', 'ChIJ_TN_V2_17', 'Dindigul Thalappakatti 2', 'Second T. Nagar outlet of the beloved Dindigul biryani chain, equally packed on weekends.', 'b0000000-0000-0000-0000-000000000001', '80, South Usman Road, T. Nagar, Chennai 600017', 13.0388, 80.2342, '044-2434-1717', 2, 4.1, 4800, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000048', 'ChIJ_TN_V2_18', 'Chai Waale', 'Cozy chai spot with artisan brews, Irani chai, bun maska, and keema pav.', 'b0000000-0000-0000-0000-000000000001', '3, Mahalingapuram, T. Nagar, Chennai 600017', 13.0455, 80.2375, '044-2815-1818', 1, 4.3, 1800, false, '{"mon":"07:00-23:00","tue":"07:00-23:00","wed":"07:00-23:00","thu":"07:00-23:00","fri":"07:00-23:30","sat":"07:00-23:30","sun":"08:00-23:00"}'),
('e0000000-0000-0000-0000-000000000049', 'ChIJ_TN_V2_19', 'Hotel Saravana', 'Budget-friendly non-veg restaurant with flavourful chicken curry, parotta, and fish fry.', 'b0000000-0000-0000-0000-000000000001', '12, Bazlullah Road, T. Nagar, Chennai 600017', 13.0410, 80.2368, '044-2434-1919', 1, 3.9, 2600, false, '{"mon":"06:00-22:00","tue":"06:00-22:00","wed":"06:00-22:00","thu":"06:00-22:00","fri":"06:00-22:30","sat":"06:00-22:30","sun":"06:00-22:30"}'),
('e0000000-0000-0000-0000-000000000050', 'ChIJ_TN_V2_20', 'Shanghai Kitchen', 'Indo-Chinese street food joint with fiery manchurians, crispy noodles, and loaded momos.', 'b0000000-0000-0000-0000-000000000001', '25, Theyagaraya Road, T. Nagar, Chennai 600017', 13.0415, 80.2355, '044-2434-2020', 1, 3.8, 2200, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000051', 'ChIJ_TN_V2_21', 'Bombay Halwa Shop', 'Generations-old sweet shop famous for melting Bombay halwa, soan papdi, and cashew barfi.', 'b0000000-0000-0000-0000-000000000001', '44, Ranganathan Street, T. Nagar, Chennai 600017', 13.0395, 80.2328, '044-2434-2121', 1, 4.0, 4000, true, '{"mon":"08:00-21:00","tue":"08:00-21:00","wed":"08:00-21:00","thu":"08:00-21:00","fri":"08:00-21:30","sat":"08:00-21:30","sun":"08:00-21:30"}'),
('e0000000-0000-0000-0000-000000000052', 'ChIJ_TN_V2_22', 'Kebab Factory T. Nagar', 'Premium kebab and grill house with seekh kebabs, galouti, and tandoori platters.', 'b0000000-0000-0000-0000-000000000001', '65, GN Chetty Road, T. Nagar, Chennai 600017', 13.0445, 80.2378, '044-2815-2222', 3, 4.2, 2400, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000053', 'ChIJ_TN_V2_23', 'Dosai Thotti', 'Street-style dosa cart turned restaurant with 40+ varieties and liberal butter use.', 'b0000000-0000-0000-0000-000000000001', '7, Habibullah Road, T. Nagar, Chennai 600017', 13.0438, 80.2382, '044-2815-2323', 1, 4.0, 1900, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000054', 'ChIJ_TN_V2_24', 'Chola Sheraton Bakery', 'Premium bakery with European-style pastries, artisan breads, and celebration cakes.', 'b0000000-0000-0000-0000-000000000001', '90, Kodambakkam High Road, T. Nagar, Chennai 600017', 13.0452, 80.2390, '044-2815-2424', 3, 4.4, 2100, true, '{"mon":"08:00-22:00","tue":"08:00-22:00","wed":"08:00-22:00","thu":"08:00-22:00","fri":"08:00-22:30","sat":"08:00-22:30","sun":"09:00-22:00"}'),
('e0000000-0000-0000-0000-000000000055', 'ChIJ_TN_V2_25', 'Parotta Kadai', 'Late-night parotta specialist — flaky layered parottas with spicy chicken or egg salna.', 'b0000000-0000-0000-0000-000000000001', '14, Bazlullah Road, T. Nagar, Chennai 600017', 13.0407, 80.2362, '044-2434-2525', 1, 4.1, 3300, false, '{"mon":"17:00-02:00","tue":"17:00-02:00","wed":"17:00-02:00","thu":"17:00-02:00","fri":"17:00-03:00","sat":"17:00-03:00","sun":"17:00-02:00"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- ============================================================================
-- ADYAR — 20 restaurants (R056–R075)
-- ============================================================================

INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000056', 'ChIJ_AD_V2_01', 'Cream Centre Adyar', 'Upscale vegetarian restaurant with innovative fusion dishes and lavish decor.', 'b0000000-0000-0000-0000-000000000002', '5, LB Road, Adyar, Chennai 600020', 13.0060, 80.2570, '044-2441-3030', 3, 4.3, 4200, true, '{"mon":"12:00-15:30,18:30-23:00","tue":"12:00-15:30,18:30-23:00","wed":"12:00-15:30,18:30-23:00","thu":"12:00-15:30,18:30-23:00","fri":"12:00-15:30,18:30-23:30","sat":"12:00-15:30,18:30-23:30","sun":"12:00-15:30,18:30-23:30"}'),
('e0000000-0000-0000-0000-000000000057', 'ChIJ_AD_V2_02', 'Zara''s Adyar', 'Charming multi-cuisine bistro with Mediterranean flavours, grilled meats, and artisan cocktails.', 'b0000000-0000-0000-0000-000000000002', '12, Kasturba Nagar, Adyar, Chennai 600020', 13.0085, 80.2580, '044-2441-3131', 3, 4.4, 2800, false, '{"mon":"12:00-23:00","tue":"12:00-23:00","wed":"12:00-23:00","thu":"12:00-23:00","fri":"12:00-23:30","sat":"12:00-23:30","sun":"12:00-23:30"}'),
('e0000000-0000-0000-0000-000000000058', 'ChIJ_AD_V2_03', 'Bombay Brasserie Adyar', 'Contemporary Indian restaurant with inventive small plates, curated cocktails, and moody interiors.', 'b0000000-0000-0000-0000-000000000002', '20, Sardar Patel Road, Adyar, Chennai 600020', 13.0052, 80.2545, '044-2441-3232', 3, 4.5, 2200, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000059', 'ChIJ_AD_V2_04', 'The Raintree', 'Heritage hotel restaurant with a legendary Chettinad tasting menu and colonial-era ambience.', 'b0000000-0000-0000-0000-000000000002', '120, St. Mary''s Road, Adyar, Chennai 600020', 13.0048, 80.2555, '044-2441-3333', 3, 4.6, 3100, false, '{"mon":"12:30-15:00,19:30-23:00","tue":"12:30-15:00,19:30-23:00","wed":"12:30-15:00,19:30-23:00","thu":"12:30-15:00,19:30-23:00","fri":"12:30-15:00,19:30-23:30","sat":"12:30-15:30,19:30-23:30","sun":"12:30-15:30,19:30-23:30"}'),
('e0000000-0000-0000-0000-000000000060', 'ChIJ_AD_V2_05', 'Benjarong Adyar', 'Authentic Thai restaurant with curries, pad Thai, and tom yum crafted by Thai chefs.', 'b0000000-0000-0000-0000-000000000002', '8, Gandhi Nagar, Adyar, Chennai 600020', 13.0078, 80.2565, '044-2441-3434', 3, 4.4, 1800, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000061', 'ChIJ_AD_V2_06', 'Copper Chimney Adyar', 'Upscale North Indian dining with tandoori platters, rich gravies, and warm service.', 'b0000000-0000-0000-0000-000000000002', '35, Lattice Bridge Road, Adyar, Chennai 600020', 13.0070, 80.2558, '044-2441-3535', 3, 4.2, 3400, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000062', 'ChIJ_AD_V2_07', 'Tuscana Pizzeria', 'Artisan pizzeria with sourdough crusts, imported Italian cheeses, and wood-fired oven.', 'b0000000-0000-0000-0000-000000000002', '15, Kasturba Nagar, Adyar, Chennai 600020', 13.0090, 80.2588, '044-2441-3636', 2, 4.3, 2500, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000063', 'ChIJ_AD_V2_08', 'Murugan Idli Shop Adyar', 'Beloved South Indian tiffin chain — pillowy idlis, crispy vadas, and lip-smacking podi dosa.', 'b0000000-0000-0000-0000-000000000002', '28, LB Road, Adyar, Chennai 600020', 13.0065, 80.2575, '044-2441-3737', 1, 4.4, 6200, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000064', 'ChIJ_AD_V2_09', 'Anjappar Adyar', 'Fiery Chettinad cuisine — pepper chicken, mutton chukka, and crab masala in a buzzy setting.', 'b0000000-0000-0000-0000-000000000002', '40, Sardar Patel Road, Adyar, Chennai 600020', 13.0058, 80.2548, '044-2441-3838', 2, 4.1, 4100, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000065', 'ChIJ_AD_V2_10', 'Ponnusamy Adyar', 'Chettinad favourite with generous portions of nattu kozhi curry, fish fry, and spicy gravies.', 'b0000000-0000-0000-0000-000000000002', '50, Gandhi Nagar, Adyar, Chennai 600020', 13.0080, 80.2560, '044-2441-3939', 2, 4.2, 3600, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000066', 'ChIJ_AD_V2_11', 'Thalappakatti Adyar', 'Dindigul-style biryani with seeraga samba rice — the Adyar outpost of the biryani legend.', 'b0000000-0000-0000-0000-000000000002', '18, LB Road, Adyar, Chennai 600020', 13.0062, 80.2572, '044-2441-4040', 2, 4.2, 5500, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000067', 'ChIJ_AD_V2_12', 'Saravana Bhavan Adyar', 'The iconic vegetarian chain — crispy dosas, ghee pongal, and full meals served with devotion.', 'b0000000-0000-0000-0000-000000000002', '72, LB Road, Adyar, Chennai 600020', 13.0068, 80.2578, '044-2441-4141', 1, 4.3, 9400, true, '{"mon":"06:00-22:30","tue":"06:00-22:30","wed":"06:00-22:30","thu":"06:00-22:30","fri":"06:00-23:00","sat":"06:00-23:00","sun":"06:00-23:00"}'),
('e0000000-0000-0000-0000-000000000068', 'ChIJ_AD_V2_13', 'Hot Chips Adyar', 'Chennai fast food chain with crispy fried chicken, burgers, shawarma, and South Indian tiffin.', 'b0000000-0000-0000-0000-000000000002', '55, Sardar Patel Road, Adyar, Chennai 600020', 13.0055, 80.2542, '044-2441-4242', 1, 3.9, 4800, false, '{"mon":"10:00-22:30","tue":"10:00-22:30","wed":"10:00-22:30","thu":"10:00-22:30","fri":"10:00-23:00","sat":"10:00-23:00","sun":"10:00-23:00"}'),
('e0000000-0000-0000-0000-000000000069', 'ChIJ_AD_V2_14', 'Cafe Amethyst Adyar', 'Charming cafe in a heritage bungalow with European brunch, fresh salads, and artisan coffee.', 'b0000000-0000-0000-0000-000000000002', '10, Kasturba Nagar, Adyar, Chennai 600020', 13.0088, 80.2582, '044-2441-4343', 3, 4.5, 1600, false, '{"mon":"08:00-22:00","tue":"08:00-22:00","wed":"08:00-22:00","thu":"08:00-22:00","fri":"08:00-22:30","sat":"08:00-22:30","sun":"09:00-22:00"}'),
('e0000000-0000-0000-0000-000000000070', 'ChIJ_AD_V2_15', 'Grand Sweets Adyar', 'Iconic sweet shop with mixture, murukku, mysore pak, and full South Indian veg meals.', 'b0000000-0000-0000-0000-000000000002', '60, LB Road, Adyar, Chennai 600020', 13.0064, 80.2576, '044-2441-4444', 1, 4.0, 6100, true, '{"mon":"08:00-21:30","tue":"08:00-21:30","wed":"08:00-21:30","thu":"08:00-21:30","fri":"08:00-22:00","sat":"08:00-22:00","sun":"08:00-22:00"}'),
('e0000000-0000-0000-0000-000000000071', 'ChIJ_AD_V2_16', 'Xander''s Kitchen', 'Modern cafe with Australian-style brunch, smashed avo, acai bowls, and speciality coffee.', 'b0000000-0000-0000-0000-000000000002', '3, Kasturba Nagar, Adyar, Chennai 600020', 13.0092, 80.2590, '044-2441-4545', 2, 4.4, 1500, false, '{"mon":"08:00-21:00","tue":"08:00-21:00","wed":"08:00-21:00","thu":"08:00-21:00","fri":"08:00-21:30","sat":"08:00-21:30","sun":"09:00-21:00"}'),
('e0000000-0000-0000-0000-000000000072', 'ChIJ_AD_V2_17', 'Maplai Express', 'Quick-service Chettinad restaurant with fast curries, parottas, and value-for-money meals.', 'b0000000-0000-0000-0000-000000000002', '30, Gandhi Nagar, Adyar, Chennai 600020', 13.0075, 80.2558, '044-2441-4646', 1, 4.0, 2800, false, '{"mon":"11:00-22:30","tue":"11:00-22:30","wed":"11:00-22:30","thu":"11:00-22:30","fri":"11:00-23:00","sat":"11:00-23:00","sun":"11:00-23:00"}'),
('e0000000-0000-0000-0000-000000000073', 'ChIJ_AD_V2_18', 'Fruit Shop on Greams', 'Legendary juice bar and milkshake shop serving fresh fruit juices, thick shakes, and sundaes.', 'b0000000-0000-0000-0000-000000000002', '45, LB Road, Adyar, Chennai 600020', 13.0066, 80.2574, '044-2441-4747', 1, 4.5, 3800, true, '{"mon":"09:00-23:00","tue":"09:00-23:00","wed":"09:00-23:00","thu":"09:00-23:00","fri":"09:00-23:30","sat":"09:00-23:30","sun":"09:00-23:30"}'),
('e0000000-0000-0000-0000-000000000074', 'ChIJ_AD_V2_19', 'Shawarma Junction', 'Late-night shawarma and kebab spot with massive wraps, loaded fries, and grilled platters.', 'b0000000-0000-0000-0000-000000000002', '22, Lattice Bridge Road, Adyar, Chennai 600020', 13.0072, 80.2555, '044-2441-4848', 1, 4.0, 2200, false, '{"mon":"16:00-02:00","tue":"16:00-02:00","wed":"16:00-02:00","thu":"16:00-02:00","fri":"16:00-03:00","sat":"16:00-03:00","sun":"16:00-02:00"}'),
('e0000000-0000-0000-0000-000000000075', 'ChIJ_AD_V2_20', 'Chai Kings Adyar', 'Trendy chai bar with kulhad chai, bun maska, Maggi, and quick bites for the college crowd.', 'b0000000-0000-0000-0000-000000000002', '65, Sardar Patel Road, Adyar, Chennai 600020', 13.0058, 80.2544, '044-2441-4949', 1, 4.3, 2400, true, '{"mon":"07:00-23:00","tue":"07:00-23:00","wed":"07:00-23:00","thu":"07:00-23:00","fri":"07:00-23:30","sat":"07:00-23:30","sun":"08:00-23:00"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- ============================================================================
-- MYLAPORE — 20 restaurants (R076–R095)
-- ============================================================================

INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000076', 'ChIJ_MY_V2_01', 'Mylai Karpagambal', 'Heritage mess near Kapaleeshwarar Temple — legendary podi idli, mini meals, and filter coffee.', 'b0000000-0000-0000-0000-000000000003', '18, East Mada Street, Mylapore, Chennai 600004', 13.0333, 80.2692, '044-2498-5050', 1, 4.6, 5200, true, '{"mon":"06:30-12:00,16:00-21:00","tue":"06:30-12:00,16:00-21:00","wed":"06:30-12:00,16:00-21:00","thu":"06:30-12:00,16:00-21:00","fri":"06:30-12:00,16:00-21:00","sat":"06:30-12:00,16:00-21:30","sun":"06:30-12:00,16:00-21:30"}'),
('e0000000-0000-0000-0000-000000000077', 'ChIJ_MY_V2_02', 'Sri Krishna Sweets Mylapore', 'Famous sweet emporium with hot jalebi, mysore pak, mixture, and fresh snacks daily.', 'b0000000-0000-0000-0000-000000000003', '25, South Mada Street, Mylapore, Chennai 600004', 13.0330, 80.2688, '044-2498-5151', 1, 4.2, 4800, true, '{"mon":"08:00-21:30","tue":"08:00-21:30","wed":"08:00-21:30","thu":"08:00-21:30","fri":"08:00-22:00","sat":"08:00-22:00","sun":"08:00-22:00"}'),
('e0000000-0000-0000-0000-000000000078', 'ChIJ_MY_V2_03', 'Mathsya', 'Contemporary fine-dining with a modern twist on traditional Tamil cuisine and stunning Kapaleeshwarar views.', 'b0000000-0000-0000-0000-000000000003', '8, North Mada Street, Mylapore, Chennai 600004', 13.0342, 80.2698, '044-2498-5252', 3, 4.5, 1800, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000079', 'ChIJ_MY_V2_04', 'Hotel Saravana Mylapore', 'Budget-friendly South Indian hotel with crispy dosas, fluffy idlis, and home-style meals.', 'b0000000-0000-0000-0000-000000000003', '14, Kutchery Road, Mylapore, Chennai 600004', 13.0336, 80.2682, '044-2498-5353', 1, 4.0, 3600, true, '{"mon":"06:00-22:00","tue":"06:00-22:00","wed":"06:00-22:00","thu":"06:00-22:00","fri":"06:00-22:30","sat":"06:00-22:30","sun":"06:00-22:30"}'),
('e0000000-0000-0000-0000-000000000080', 'ChIJ_MY_V2_05', 'Murugan Idli Shop Mylapore', 'Soft idli heaven with signature chutneys, podi dosa, and the creamiest filter coffee in Mylapore.', 'b0000000-0000-0000-0000-000000000003', '30, West Mada Street, Mylapore, Chennai 600004', 13.0338, 80.2685, '044-2498-5454', 1, 4.4, 5800, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000081', 'ChIJ_MY_V2_06', 'Saravana Bhavan Mylapore', 'The original veg giant — special meals, ghee pongal, and masala dosa perfected over decades.', 'b0000000-0000-0000-0000-000000000003', '42, Bazaar Road, Mylapore, Chennai 600004', 13.0344, 80.2705, '044-2498-5555', 1, 4.3, 8200, true, '{"mon":"06:00-22:30","tue":"06:00-22:30","wed":"06:00-22:30","thu":"06:00-22:30","fri":"06:00-23:00","sat":"06:00-23:00","sun":"06:00-23:00"}'),
('e0000000-0000-0000-0000-000000000082', 'ChIJ_MY_V2_07', 'Ponnusamy Mylapore', 'Rustic Chettinad restaurant with pepper chicken, mutton chops, and fire-roasted varuval.', 'b0000000-0000-0000-0000-000000000003', '6, Kutchery Road, Mylapore, Chennai 600004', 13.0337, 80.2683, '044-2498-5656', 2, 4.2, 3400, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000083', 'ChIJ_MY_V2_08', 'Bhima''s Residency', 'Multi-cuisine hotel restaurant with North Indian, Chinese, and continental options for families.', 'b0000000-0000-0000-0000-000000000003', '20, Luz Church Road, Mylapore, Chennai 600004', 13.0340, 80.2695, '044-2498-5757', 2, 4.0, 2800, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000084', 'ChIJ_MY_V2_09', 'Grand Sweets Mylapore', 'Iconic sweets chain with hot mixture, murukku, full veg meals, and festive sweet boxes.', 'b0000000-0000-0000-0000-000000000003', '35, South Mada Street, Mylapore, Chennai 600004', 13.0331, 80.2690, '044-2498-5858', 1, 4.0, 5600, true, '{"mon":"08:00-21:30","tue":"08:00-21:30","wed":"08:00-21:30","thu":"08:00-21:30","fri":"08:00-22:00","sat":"08:00-22:00","sun":"08:00-22:00"}'),
('e0000000-0000-0000-0000-000000000085', 'ChIJ_MY_V2_10', 'Sangeetha Mylapore', 'Reliable vegetarian chain with crispy set dosas, steaming sambar, and value-meal combos.', 'b0000000-0000-0000-0000-000000000003', '50, Kutchery Road, Mylapore, Chennai 600004', 13.0335, 80.2680, '044-2498-5959', 1, 4.1, 4000, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000086', 'ChIJ_MY_V2_11', 'Rayar''s Mess', 'Legendary Brahmin mess with limited menu — perfect set dosa, ghee pongal, and filter coffee.', 'b0000000-0000-0000-0000-000000000003', '9, Mada Streets, Mylapore, Chennai 600004', 13.0334, 80.2691, '044-2498-6060', 1, 4.7, 3200, true, '{"mon":"06:00-11:00,16:00-20:00","tue":"06:00-11:00,16:00-20:00","wed":"06:00-11:00,16:00-20:00","thu":"06:00-11:00,16:00-20:00","fri":"06:00-11:00,16:00-20:00","sat":"06:00-11:00,16:00-20:00","sun":"06:00-11:00,16:00-20:00"}'),
('e0000000-0000-0000-0000-000000000087', 'ChIJ_MY_V2_12', 'A2B Mylapore', 'Adyar Ananda Bhavan branch — full sweet counter, snacks, and South Indian meals.', 'b0000000-0000-0000-0000-000000000003', '60, Bazaar Road, Mylapore, Chennai 600004', 13.0346, 80.2712, '044-2498-6161', 1, 4.1, 6800, true, '{"mon":"07:00-22:30","tue":"07:00-22:30","wed":"07:00-22:30","thu":"07:00-22:30","fri":"07:00-23:00","sat":"07:00-23:00","sun":"07:00-23:00"}'),
('e0000000-0000-0000-0000-000000000088', 'ChIJ_MY_V2_13', 'Thalappakatti Mylapore', 'The Dindigul biryani chain''s Mylapore outpost — seeraga samba chicken biryani is the star.', 'b0000000-0000-0000-0000-000000000003', '15, Luz Church Road, Mylapore, Chennai 600004', 13.0339, 80.2694, '044-2498-6262', 2, 4.1, 4200, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000089', 'ChIJ_MY_V2_14', 'Junior Kuppanna Mylapore', 'Chettinad specialist with nattu kozhi biryani, crab masala, and prawn fry that keep fans coming.', 'b0000000-0000-0000-0000-000000000003', '28, Kutchery Road, Mylapore, Chennai 600004', 13.0337, 80.2684, '044-2498-6363', 2, 4.3, 3800, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000090', 'ChIJ_MY_V2_15', 'Chamiers Cafe Mylapore', 'Artsy cafe with a bookshop next door — gourmet sandwiches, fresh salads, and excellent coffee.', 'b0000000-0000-0000-0000-000000000003', '2, Chamiers Road, RA Puram, Chennai 600028', 13.0320, 80.2665, '044-2498-6464', 2, 4.4, 2100, false, '{"mon":"08:00-22:00","tue":"08:00-22:00","wed":"08:00-22:00","thu":"08:00-22:00","fri":"08:00-22:30","sat":"08:00-22:30","sun":"09:00-22:00"}'),
('e0000000-0000-0000-0000-000000000091', 'ChIJ_MY_V2_16', 'Ajantha Hotel', 'Classic non-veg hotel near San Thome Cathedral — chicken biryani, mutton stew, and appam.', 'b0000000-0000-0000-0000-000000000003', '38, San Thome Road, Mylapore, Chennai 600004', 13.0328, 80.2680, '044-2498-6565', 1, 3.9, 2900, false, '{"mon":"06:00-22:00","tue":"06:00-22:00","wed":"06:00-22:00","thu":"06:00-22:00","fri":"06:00-22:30","sat":"06:00-22:30","sun":"06:00-22:30"}'),
('e0000000-0000-0000-0000-000000000092', 'ChIJ_MY_V2_17', 'Kaidi Kitchen', 'Jail-themed quirky restaurant with creative plating, multi-cuisine options, and fun interiors.', 'b0000000-0000-0000-0000-000000000003', '10, Luz Corner, Mylapore, Chennai 600004', 13.0341, 80.2696, '044-2498-6666', 2, 3.8, 1800, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000093', 'ChIJ_MY_V2_18', 'Balaji Bhavan', 'Simple veg restaurant with budget meals, crispy vadas, and no-fuss Andhra-style tiffin.', 'b0000000-0000-0000-0000-000000000003', '44, Mada Streets, Mylapore, Chennai 600004', 13.0336, 80.2693, '044-2498-6767', 1, 4.0, 2600, true, '{"mon":"06:30-22:00","tue":"06:30-22:00","wed":"06:30-22:00","thu":"06:30-22:00","fri":"06:30-22:30","sat":"06:30-22:30","sun":"06:30-22:30"}'),
('e0000000-0000-0000-0000-000000000094', 'ChIJ_MY_V2_19', 'Buhari Mylapore', 'Chennai institution since 1951 — biryani, coin parotta, and chicken salna near the temple.', 'b0000000-0000-0000-0000-000000000003', '55, San Thome Road, Mylapore, Chennai 600004', 13.0325, 80.2675, '044-2498-6868', 2, 4.0, 4200, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000095', 'ChIJ_MY_V2_20', 'Mylapore Ganapathy Mess', 'Tiny traditional mess with soul-satisfying sambar rice, curd rice, and fresh poriyal.', 'b0000000-0000-0000-0000-000000000003', '7, West Mada Street, Mylapore, Chennai 600004', 13.0339, 80.2687, '044-2498-6969', 1, 4.3, 1900, true, '{"mon":"07:00-14:00,17:00-21:00","tue":"07:00-14:00,17:00-21:00","wed":"07:00-14:00,17:00-21:00","thu":"07:00-14:00,17:00-21:00","fri":"07:00-14:00,17:00-21:00","sat":"07:00-14:00,17:00-21:30","sun":"07:00-14:00,17:00-21:30"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- ============================================================================
-- ANNA NAGAR — 20 restaurants (R096–R115)
-- ============================================================================

INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000096', 'ChIJ_AN_V2_01', 'Buhari Anna Nagar', 'The historic Buhari chain''s Anna Nagar branch — biryani, parotta, and kebabs since 1951.', 'b0000000-0000-0000-0000-000000000004', '18, 2nd Avenue, Anna Nagar, Chennai 600040', 13.0855, 80.2105, '044-2621-7070', 2, 4.1, 5200, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000097', 'ChIJ_AN_V2_02', 'Hotel Palmshore Anna Nagar', 'Family multi-cuisine restaurant with live counters, weekend brunch, and generous portions.', 'b0000000-0000-0000-0000-000000000004', '35, 3rd Avenue, Anna Nagar, Chennai 600040', 13.0860, 80.2118, '044-2621-7171', 2, 4.0, 3800, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000098', 'ChIJ_AN_V2_03', 'Mainland China Anna Nagar', 'Premium Chinese restaurant with dim sum, Peking duck, hand-pulled noodles, and elegant interiors.', 'b0000000-0000-0000-0000-000000000004', '50, AA Block, Anna Nagar, Chennai 600040', 13.0858, 80.2128, '044-2621-7272', 3, 4.3, 2600, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000099', 'ChIJ_AN_V2_04', 'Charcoal Grill Anna Nagar', 'Charcoal-grilled kebabs, tikkas, and tandoori platters with smoky North Indian flavours.', 'b0000000-0000-0000-0000-000000000004', '10, Shanti Colony, Anna Nagar, Chennai 600040', 13.0845, 80.2095, '044-2621-7373', 2, 4.2, 3100, false, '{"mon":"12:00-23:00","tue":"12:00-23:00","wed":"12:00-23:00","thu":"12:00-23:00","fri":"12:00-23:30","sat":"12:00-23:30","sun":"12:00-23:30"}'),
('e0000000-0000-0000-0000-000000000100', 'ChIJ_AN_V2_05', 'Saravana Bhavan Anna Nagar', 'The iconic veg chain''s Anna Nagar outlet — dosas, pongal, and full meals never disappoint.', 'b0000000-0000-0000-0000-000000000004', '60, 2nd Avenue, Anna Nagar, Chennai 600040', 13.0852, 80.2108, '044-2621-7474', 1, 4.2, 7600, true, '{"mon":"06:00-22:30","tue":"06:00-22:30","wed":"06:00-22:30","thu":"06:00-22:30","fri":"06:00-23:00","sat":"06:00-23:00","sun":"06:00-23:00"}'),
('e0000000-0000-0000-0000-000000000101', 'ChIJ_AN_V2_06', 'Sangeetha Anna Nagar', 'Dependable veg chain with set dosas, unlimited thalis, and South Indian comfort at its best.', 'b0000000-0000-0000-0000-000000000004', '22, Round Tana, Anna Nagar, Chennai 600040', 13.0848, 80.2088, '044-2621-7575', 1, 4.1, 5400, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000102', 'ChIJ_AN_V2_07', 'Anjappar Anna Nagar', 'Fiery Chettinad cuisine — pepper chicken, mutton chops, and prawn masala in a buzzy setting.', 'b0000000-0000-0000-0000-000000000004', '15, 4th Avenue, Anna Nagar, Chennai 600040', 13.0862, 80.2120, '044-2621-7676', 2, 4.1, 4500, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000103', 'ChIJ_AN_V2_08', 'A2B Anna Nagar', 'Adyar Ananda Bhavan — veg meals, sweets counter, and quick snacks for the family crowd.', 'b0000000-0000-0000-0000-000000000004', '70, 2nd Avenue, Anna Nagar, Chennai 600040', 13.0853, 80.2110, '044-2621-7777', 1, 4.0, 6200, true, '{"mon":"07:00-22:30","tue":"07:00-22:30","wed":"07:00-22:30","thu":"07:00-22:30","fri":"07:00-23:00","sat":"07:00-23:00","sun":"07:00-23:00"}'),
('e0000000-0000-0000-0000-000000000104', 'ChIJ_AN_V2_09', 'Absolute Barbecues Anna Nagar', 'All-you-can-eat barbecue buffet with live grills, unlimited starters, and dessert spread.', 'b0000000-0000-0000-0000-000000000004', '25, AA Block, Anna Nagar, Chennai 600040', 13.0856, 80.2125, '044-2621-7878', 3, 4.2, 3400, false, '{"mon":"12:00-15:30,18:30-23:00","tue":"12:00-15:30,18:30-23:00","wed":"12:00-15:30,18:30-23:00","thu":"12:00-15:30,18:30-23:00","fri":"12:00-15:30,18:30-23:30","sat":"12:00-15:30,18:30-23:30","sun":"12:00-15:30,18:30-23:30"}'),
('e0000000-0000-0000-0000-000000000105', 'ChIJ_AN_V2_10', 'Junior Kuppanna Anna Nagar', 'Chettinad powerhouse — nattu kozhi biryani, crab masala, and mutton kuzhambu draw crowds.', 'b0000000-0000-0000-0000-000000000004', '40, 3rd Avenue, Anna Nagar, Chennai 600040', 13.0859, 80.2115, '044-2621-7979', 2, 4.3, 4800, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000106', 'ChIJ_AN_V2_11', 'Grand Sweets Anna Nagar', 'Iconic sweet shop with mixture, murukku, mysore pak, and full South Indian veg meals.', 'b0000000-0000-0000-0000-000000000004', '55, Shanti Colony, Anna Nagar, Chennai 600040', 13.0843, 80.2092, '044-2621-8080', 1, 4.0, 5200, true, '{"mon":"08:00-21:30","tue":"08:00-21:30","wed":"08:00-21:30","thu":"08:00-21:30","fri":"08:00-22:00","sat":"08:00-22:00","sun":"08:00-22:00"}'),
('e0000000-0000-0000-0000-000000000107', 'ChIJ_AN_V2_12', 'Murugan Idli Shop Anna Nagar', 'Soft idli haven — signature chutneys, podi dosa, and filter coffee perfected over years.', 'b0000000-0000-0000-0000-000000000004', '8, Round Tana, Anna Nagar, Chennai 600040', 13.0847, 80.2085, '044-2621-8181', 1, 4.3, 5000, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000108', 'ChIJ_AN_V2_13', 'Thalappakatti Anna Nagar', 'Dindigul-style seeraga samba biryani — the Anna Nagar branch is always packed for lunch.', 'b0000000-0000-0000-0000-000000000004', '28, 4th Avenue, Anna Nagar, Chennai 600040', 13.0864, 80.2122, '044-2621-8282', 2, 4.1, 5600, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000109', 'ChIJ_AN_V2_14', 'Sandy''s Chocolate Lab', 'Dessert paradise with artisan chocolates, liquid truffle cakes, and decadent hot chocolate.', 'b0000000-0000-0000-0000-000000000004', '5, Shanti Colony, Anna Nagar, Chennai 600040', 13.0844, 80.2094, '044-2621-8383', 2, 4.6, 3200, true, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000110', 'ChIJ_AN_V2_15', 'Ponnusamy Anna Nagar', 'Rustic Chettinad spot with pepper mutton, chicken varuval, and earthy gravy-parotta combos.', 'b0000000-0000-0000-0000-000000000004', '32, AA Block, Anna Nagar, Chennai 600040', 13.0857, 80.2126, '044-2621-8484', 2, 4.2, 3600, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000111', 'ChIJ_AN_V2_16', 'Hot Chips Anna Nagar', 'Fast food chain with fried chicken, burgers, shawarma, and budget-friendly meals.', 'b0000000-0000-0000-0000-000000000004', '48, 2nd Avenue, Anna Nagar, Chennai 600040', 13.0854, 80.2107, '044-2621-8585', 1, 3.9, 3800, false, '{"mon":"10:00-22:30","tue":"10:00-22:30","wed":"10:00-22:30","thu":"10:00-22:30","fri":"10:00-23:00","sat":"10:00-23:00","sun":"10:00-23:00"}'),
('e0000000-0000-0000-0000-000000000112', 'ChIJ_AN_V2_17', 'The Brew Room Anna Nagar', 'Trendy cafe with artisan coffee, gourmet sandwiches, and all-day breakfast vibes.', 'b0000000-0000-0000-0000-000000000004', '12, Shanti Colony, Anna Nagar, Chennai 600040', 13.0846, 80.2090, '044-2621-8686', 2, 4.4, 2200, false, '{"mon":"08:00-22:00","tue":"08:00-22:00","wed":"08:00-22:00","thu":"08:00-22:00","fri":"08:00-22:30","sat":"08:00-22:30","sun":"09:00-22:00"}'),
('e0000000-0000-0000-0000-000000000113', 'ChIJ_AN_V2_18', 'Dragon Bowl Anna Nagar', 'Indo-Chinese street wok with manchurian, noodles, sizzlers, and loaded fried rice.', 'b0000000-0000-0000-0000-000000000004', '62, 3rd Avenue, Anna Nagar, Chennai 600040', 13.0861, 80.2117, '044-2621-8787', 1, 3.9, 2600, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000114', 'ChIJ_AN_V2_19', 'Sri Krishna Sweets Anna Nagar', 'Sweet emporium with jalebi, laddu, mixture, and festive sweet boxes.', 'b0000000-0000-0000-0000-000000000004', '38, Round Tana, Anna Nagar, Chennai 600040', 13.0849, 80.2087, '044-2621-8888', 1, 4.1, 4800, true, '{"mon":"08:00-21:30","tue":"08:00-21:30","wed":"08:00-21:30","thu":"08:00-21:30","fri":"08:00-22:00","sat":"08:00-22:00","sun":"08:00-22:00"}'),
('e0000000-0000-0000-0000-000000000115', 'ChIJ_AN_V2_20', 'Namma Kadai Anna Nagar', 'Neighbourhood mess with home-style South Indian meals, fresh rasam, and fried appalam.', 'b0000000-0000-0000-0000-000000000004', '16, AA Block, Anna Nagar, Chennai 600040', 13.0855, 80.2123, '044-2621-8989', 1, 4.2, 2100, true, '{"mon":"07:00-21:30","tue":"07:00-21:30","wed":"07:00-21:30","thu":"07:00-21:30","fri":"07:00-21:30","sat":"07:00-22:00","sun":"07:00-22:00"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- ============================================================================
-- OMR — 20 restaurants (R116–R135)
-- ============================================================================

INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000116', 'ChIJ_OMR_V2_01', 'The Brew Room OMR', 'Artisan coffee shop with pour-overs, cold brews, and gourmet brunch in a cozy IT corridor space.', 'b0000000-0000-0000-0000-000000000005', '15, Thoraipakkam, OMR, Chennai 600097', 12.9345, 80.2325, '044-4500-9001', 2, 4.5, 2400, false, '{"mon":"08:00-22:00","tue":"08:00-22:00","wed":"08:00-22:00","thu":"08:00-22:00","fri":"08:00-22:30","sat":"08:00-22:30","sun":"09:00-22:00"}'),
('e0000000-0000-0000-0000-000000000117', 'ChIJ_OMR_V2_02', 'Sandy''s Chocolate Laboratory', 'Chocolate wonderland with liquid truffle cakes, artisan bars, and decadent dessert platters.', 'b0000000-0000-0000-0000-000000000005', '22, Perungudi, OMR, Chennai 600096', 12.9555, 80.2415, '044-4500-9002', 2, 4.6, 3800, true, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000118', 'ChIJ_OMR_V2_03', 'Absolute Barbecues OMR', 'Unlimited barbecue buffet with live grills at your table, starters galore, and dessert bar.', 'b0000000-0000-0000-0000-000000000005', '30, Sholinganallur, OMR, Chennai 600119', 12.9015, 80.2285, '044-4500-9003', 3, 4.2, 4200, false, '{"mon":"12:00-15:30,18:30-23:00","tue":"12:00-15:30,18:30-23:00","wed":"12:00-15:30,18:30-23:00","thu":"12:00-15:30,18:30-23:00","fri":"12:00-15:30,18:30-23:30","sat":"12:00-15:30,18:30-23:30","sun":"12:00-15:30,18:30-23:30"}'),
('e0000000-0000-0000-0000-000000000119', 'ChIJ_OMR_V2_04', 'Copper + Cloves', 'Modern Indian bistro with creative plates, craft cocktails, and industrial-chic interiors.', 'b0000000-0000-0000-0000-000000000005', '8, Thoraipakkam, OMR, Chennai 600097', 12.9348, 80.2322, '044-4500-9004', 3, 4.4, 2200, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000120', 'ChIJ_OMR_V2_05', 'Saravana Bhavan OMR', 'The veg chain on the IT corridor — quick dosas and meals for the tech workforce lunch rush.', 'b0000000-0000-0000-0000-000000000005', 'Perungudi Junction, OMR, Chennai 600096', 12.9552, 80.2412, '044-4500-9005', 1, 4.1, 6800, true, '{"mon":"06:00-22:30","tue":"06:00-22:30","wed":"06:00-22:30","thu":"06:00-22:30","fri":"06:00-23:00","sat":"06:00-23:00","sun":"06:00-23:00"}'),
('e0000000-0000-0000-0000-000000000121', 'ChIJ_OMR_V2_06', 'Ponnusamy OMR', 'Chettinad powerhouse on the IT strip — pepper chicken, mutton chukka, and spicy curries.', 'b0000000-0000-0000-0000-000000000005', '45, Karapakkam, OMR, Chennai 600097', 12.9285, 80.2315, '044-4500-9006', 2, 4.2, 3800, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000122', 'ChIJ_OMR_V2_07', 'Thalappakatti OMR', 'Dindigul biryani on the tech highway — seeraga samba rice, bone-in chicken, packed lunchtime.', 'b0000000-0000-0000-0000-000000000005', '55, Thoraipakkam, OMR, Chennai 600097', 12.9342, 80.2328, '044-4500-9007', 2, 4.1, 5200, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000123', 'ChIJ_OMR_V2_08', 'Buhari OMR', 'Classic Buhari biryani and parotta for the OMR crowd — consistent flavours since 1951.', 'b0000000-0000-0000-0000-000000000005', '18, Perungudi, OMR, Chennai 600096', 12.9558, 80.2418, '044-4500-9008', 2, 4.0, 3400, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000124', 'ChIJ_OMR_V2_09', 'A2B OMR', 'Adyar Ananda Bhavan — quick veg tiffin and meals near the IT parks for a busy workforce.', 'b0000000-0000-0000-0000-000000000005', '28, Sholinganallur, OMR, Chennai 600119', 12.9012, 80.2282, '044-4500-9009', 1, 4.0, 5400, true, '{"mon":"07:00-22:30","tue":"07:00-22:30","wed":"07:00-22:30","thu":"07:00-22:30","fri":"07:00-23:00","sat":"07:00-23:00","sun":"07:00-23:00"}'),
('e0000000-0000-0000-0000-000000000125', 'ChIJ_OMR_V2_10', 'Junior Kuppanna OMR', 'Chettinad specialist with nattu kozhi biryani and crab masala — IT crowd favourite.', 'b0000000-0000-0000-0000-000000000005', '35, Navalur, OMR, Chennai 600130', 12.8455, 80.2265, '044-4500-9010', 2, 4.3, 3200, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000126', 'ChIJ_OMR_V2_11', 'Anjappar OMR', 'Fiery Chettinad restaurant on the tech corridor with chicken 65, mutton chops, and biryani.', 'b0000000-0000-0000-0000-000000000005', '42, Perungudi, OMR, Chennai 600096', 12.9560, 80.2420, '044-4500-9011', 2, 4.1, 3600, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000127', 'ChIJ_OMR_V2_12', 'Sangeetha OMR', 'Dependable veg chain with dosas, thalis, and sambar that the IT crowd relies on daily.', 'b0000000-0000-0000-0000-000000000005', '50, Karapakkam, OMR, Chennai 600097', 12.9282, 80.2312, '044-4500-9012', 1, 4.1, 4800, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000128', 'ChIJ_OMR_V2_13', 'Cream Centre OMR', 'Upscale vegetarian restaurant with creative fusion dishes, nachos, and Italian options.', 'b0000000-0000-0000-0000-000000000005', '12, Sholinganallur, OMR, Chennai 600119', 12.9018, 80.2288, '044-4500-9013', 3, 4.3, 2800, true, '{"mon":"12:00-15:30,18:30-23:00","tue":"12:00-15:30,18:30-23:00","wed":"12:00-15:30,18:30-23:00","thu":"12:00-15:30,18:30-23:00","fri":"12:00-15:30,18:30-23:30","sat":"12:00-15:30,18:30-23:30","sun":"12:00-15:30,18:30-23:30"}'),
('e0000000-0000-0000-0000-000000000129', 'ChIJ_OMR_V2_14', 'Murugan Idli Shop OMR', 'Soft idli specialists — quick tiffin and filter coffee for the IT park morning crowd.', 'b0000000-0000-0000-0000-000000000005', '60, Thoraipakkam, OMR, Chennai 600097', 12.9340, 80.2330, '044-4500-9014', 1, 4.3, 4200, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000130', 'ChIJ_OMR_V2_15', 'Grand Sweets OMR', 'Sweet counter, mixture, murukku and full South Indian veg meals to feed the tech crowd.', 'b0000000-0000-0000-0000-000000000005', '25, Navalur, OMR, Chennai 600130', 12.8452, 80.2262, '044-4500-9015', 1, 4.0, 3600, true, '{"mon":"08:00-21:30","tue":"08:00-21:30","wed":"08:00-21:30","thu":"08:00-21:30","fri":"08:00-22:00","sat":"08:00-22:00","sun":"08:00-22:00"}'),
('e0000000-0000-0000-0000-000000000131', 'ChIJ_OMR_V2_16', 'Hotel Palmshore OMR', 'Family multi-cuisine restaurant catering to the OMR corridor with North Indian and Chinese.', 'b0000000-0000-0000-0000-000000000005', '38, Karapakkam, OMR, Chennai 600097', 12.9278, 80.2308, '044-4500-9016', 2, 4.0, 2800, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000132', 'ChIJ_OMR_V2_17', 'Chai Kings OMR', 'Chai bar with kulhad chai, bun maska, and quick snacks — tech worker tea break spot.', 'b0000000-0000-0000-0000-000000000005', '48, Perungudi, OMR, Chennai 600096', 12.9562, 80.2422, '044-4500-9017', 1, 4.2, 2400, true, '{"mon":"07:00-23:00","tue":"07:00-23:00","wed":"07:00-23:00","thu":"07:00-23:00","fri":"07:00-23:30","sat":"07:00-23:30","sun":"08:00-23:00"}'),
('e0000000-0000-0000-0000-000000000133', 'ChIJ_OMR_V2_18', 'Shawarma Factory OMR', 'Late-night shawarma joint near the IT parks — massive wraps, grilled meats, and loaded fries.', 'b0000000-0000-0000-0000-000000000005', '5, Sholinganallur, OMR, Chennai 600119', 12.9020, 80.2290, '044-4500-9018', 1, 4.0, 3000, false, '{"mon":"16:00-02:00","tue":"16:00-02:00","wed":"16:00-02:00","thu":"16:00-02:00","fri":"16:00-03:00","sat":"16:00-03:00","sun":"16:00-02:00"}'),
('e0000000-0000-0000-0000-000000000134', 'ChIJ_OMR_V2_19', 'Hot Chips OMR', 'Chennai fast food chain with fried chicken, burgers, and South Indian combos on the go.', 'b0000000-0000-0000-0000-000000000005', '58, Navalur, OMR, Chennai 600130', 12.8458, 80.2268, '044-4500-9019', 1, 3.9, 3200, false, '{"mon":"10:00-22:30","tue":"10:00-22:30","wed":"10:00-22:30","thu":"10:00-22:30","fri":"10:00-23:00","sat":"10:00-23:00","sun":"10:00-23:00"}'),
('e0000000-0000-0000-0000-000000000135', 'ChIJ_OMR_V2_20', 'Copper Chimney OMR', 'Upscale North Indian dining with tandoori kebabs, rich butter chicken, and naan platters.', 'b0000000-0000-0000-0000-000000000005', '10, Perungudi, OMR, Chennai 600096', 12.9565, 80.2425, '044-4500-9020', 3, 4.2, 2600, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- ============================================================================
-- NUNGAMBAKKAM — 15 restaurants (R136–R150)
-- ============================================================================

INSERT INTO restaurants (id, google_place_id, name, description, neighborhood_id, address, latitude, longitude, phone, price_range, avg_rating, total_ratings, is_pure_veg, timings) VALUES
('e0000000-0000-0000-0000-000000000136', 'ChIJ_NU_V2_01', 'Peshawri', 'ITC Grand Chola''s legendary North-West Frontier restaurant with tandoor-roasted meats and dal bukhara.', 'b0000000-0000-0000-0000-000000000006', '63, Mount Road, Nungambakkam, Chennai 600034', 13.0615, 80.2485, '044-4599-2020', 3, 4.7, 2800, false, '{"mon":"12:30-14:30,19:00-23:00","tue":"12:30-14:30,19:00-23:00","wed":"12:30-14:30,19:00-23:00","thu":"12:30-14:30,19:00-23:00","fri":"12:30-14:30,19:00-23:30","sat":"12:30-15:00,19:00-23:30","sun":"12:30-15:00,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000137', 'ChIJ_NU_V2_02', 'Focaccia', 'Italian fine-dining at The Leela Palace with handmade pasta, wood-fired pizza, and imported wines.', 'b0000000-0000-0000-0000-000000000006', '24, Nungambakkam High Road, Chennai 600034', 13.0620, 80.2490, '044-4599-2121', 3, 4.6, 2200, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000138', 'ChIJ_NU_V2_03', 'Chamiers Cafe', 'Artsy cafe in a heritage bungalow with a bookshop — European salads, sandwiches, and filter coffee.', 'b0000000-0000-0000-0000-000000000006', '106, Chamiers Road, Nungambakkam, Chennai 600034', 13.0605, 80.2465, '044-4599-2222', 2, 4.5, 2600, false, '{"mon":"08:00-22:00","tue":"08:00-22:00","wed":"08:00-22:00","thu":"08:00-22:00","fri":"08:00-22:30","sat":"08:00-22:30","sun":"09:00-22:00"}'),
('e0000000-0000-0000-0000-000000000139', 'ChIJ_NU_V2_04', 'Meze Mangal', 'Turkish and Lebanese cuisine with succulent kebabs, sizzling kofte, hummus, and fresh pita.', 'b0000000-0000-0000-0000-000000000006', '15, Wallace Garden, Nungambakkam, Chennai 600034', 13.0602, 80.2462, '044-4599-2323', 2, 4.3, 3200, false, '{"mon":"12:00-23:00","tue":"12:00-23:00","wed":"12:00-23:00","thu":"12:00-23:00","fri":"12:00-23:30","sat":"12:00-23:30","sun":"12:00-23:30"}'),
('e0000000-0000-0000-0000-000000000140', 'ChIJ_NU_V2_05', 'Zara''s Nungambakkam', 'Multi-cuisine bistro with grilled meats, Mediterranean plates, and a charming patio setting.', 'b0000000-0000-0000-0000-000000000006', '30, Khader Nawaz Khan Road, Nungambakkam, Chennai 600034', 13.0628, 80.2498, '044-4599-2424', 3, 4.4, 2400, false, '{"mon":"12:00-23:00","tue":"12:00-23:00","wed":"12:00-23:00","thu":"12:00-23:00","fri":"12:00-23:30","sat":"12:00-23:30","sun":"12:00-23:30"}'),
('e0000000-0000-0000-0000-000000000141', 'ChIJ_NU_V2_06', 'Saravana Bhavan Nungambakkam', 'The veg chain on the upmarket strip — masala dosas, ghee pongal, and filter coffee.', 'b0000000-0000-0000-0000-000000000006', '45, Nungambakkam High Road, Chennai 600034', 13.0618, 80.2488, '044-4599-2525', 1, 4.2, 6400, true, '{"mon":"06:00-22:30","tue":"06:00-22:30","wed":"06:00-22:30","thu":"06:00-22:30","fri":"06:00-23:00","sat":"06:00-23:00","sun":"06:00-23:00"}'),
('e0000000-0000-0000-0000-000000000142', 'ChIJ_NU_V2_07', 'Buhari Nungambakkam', 'The 1951 institution''s uptown branch — biryani, coin parotta, and chicken salna.', 'b0000000-0000-0000-0000-000000000006', '50, Mount Road, Nungambakkam, Chennai 600034', 13.0608, 80.2475, '044-4599-2626', 2, 4.0, 4800, false, '{"mon":"11:30-23:00","tue":"11:30-23:00","wed":"11:30-23:00","thu":"11:30-23:00","fri":"11:30-23:30","sat":"11:30-23:30","sun":"11:30-23:30"}'),
('e0000000-0000-0000-0000-000000000143', 'ChIJ_NU_V2_08', 'Anjappar Nungambakkam', 'Chettinad restaurant with chicken 65, pepper crab, and mutton varuval in a lively setting.', 'b0000000-0000-0000-0000-000000000006', '22, Wallace Garden, Nungambakkam, Chennai 600034', 13.0603, 80.2463, '044-4599-2727', 2, 4.1, 3600, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000144', 'ChIJ_NU_V2_09', 'Cream Centre Nungambakkam', 'Upscale veg with global fusion — Mexican nachos, Thai curry, Italian pasta, all vegetarian.', 'b0000000-0000-0000-0000-000000000006', '38, Khader Nawaz Khan Road, Nungambakkam, Chennai 600034', 13.0630, 80.2500, '044-4599-2828', 3, 4.3, 2800, true, '{"mon":"12:00-15:30,18:30-23:00","tue":"12:00-15:30,18:30-23:00","wed":"12:00-15:30,18:30-23:00","thu":"12:00-15:30,18:30-23:00","fri":"12:00-15:30,18:30-23:30","sat":"12:00-15:30,18:30-23:30","sun":"12:00-15:30,18:30-23:30"}'),
('e0000000-0000-0000-0000-000000000145', 'ChIJ_NU_V2_10', 'Murugan Idli Shop Nungambakkam', 'Soft idlis and podi dosa — a quick tiffin stop on the way to work.', 'b0000000-0000-0000-0000-000000000006', '55, Nungambakkam High Road, Chennai 600034', 13.0622, 80.2492, '044-4599-2929', 1, 4.3, 4200, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000146', 'ChIJ_NU_V2_11', 'Thalappakatti Nungambakkam', 'Dindigul biryani on the upmarket strip — seeraga samba rice and bone-in chicken perfection.', 'b0000000-0000-0000-0000-000000000006', '60, Wallace Garden, Nungambakkam, Chennai 600034', 13.0605, 80.2468, '044-4599-3030', 2, 4.1, 4600, false, '{"mon":"11:00-23:00","tue":"11:00-23:00","wed":"11:00-23:00","thu":"11:00-23:00","fri":"11:00-23:30","sat":"11:00-23:30","sun":"11:00-23:30"}'),
('e0000000-0000-0000-0000-000000000147', 'ChIJ_NU_V2_12', 'Copper Chimney Nungambakkam', 'Premium North Indian with butter chicken, tandoori platters, and rich dal makhani.', 'b0000000-0000-0000-0000-000000000006', '10, Whites Road, Nungambakkam, Chennai 600034', 13.0612, 80.2482, '044-4599-3131', 3, 4.2, 3000, false, '{"mon":"12:00-15:00,19:00-23:00","tue":"12:00-15:00,19:00-23:00","wed":"12:00-15:00,19:00-23:00","thu":"12:00-15:00,19:00-23:00","fri":"12:00-15:00,19:00-23:30","sat":"12:00-15:30,19:00-23:30","sun":"12:00-15:30,19:00-23:30"}'),
('e0000000-0000-0000-0000-000000000148', 'ChIJ_NU_V2_13', 'A2B Nungambakkam', 'Adyar Ananda Bhavan — sweets counter, snacks, and reliable veg meals.', 'b0000000-0000-0000-0000-000000000006', '70, Mount Road, Nungambakkam, Chennai 600034', 13.0610, 80.2478, '044-4599-3232', 1, 4.0, 5800, true, '{"mon":"07:00-22:30","tue":"07:00-22:30","wed":"07:00-22:30","thu":"07:00-22:30","fri":"07:00-23:00","sat":"07:00-23:00","sun":"07:00-23:00"}'),
('e0000000-0000-0000-0000-000000000149', 'ChIJ_NU_V2_14', 'Sangeetha Nungambakkam', 'Reliable veg chain with set dosa, sambar, and unlimited thalis near the business district.', 'b0000000-0000-0000-0000-000000000006', '42, Nungambakkam High Road, Chennai 600034', 13.0617, 80.2486, '044-4599-3333', 1, 4.1, 4400, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"07:00-22:30"}'),
('e0000000-0000-0000-0000-000000000150', 'ChIJ_NU_V2_15', 'Hot Breads Nungambakkam', 'Popular bakery chain with fresh croissants, puffs, cakes, and quick sandwiches.', 'b0000000-0000-0000-0000-000000000006', '28, Khader Nawaz Khan Road, Nungambakkam, Chennai 600034', 13.0625, 80.2495, '044-4599-3434', 1, 4.2, 3400, true, '{"mon":"07:00-22:00","tue":"07:00-22:00","wed":"07:00-22:00","thu":"07:00-22:00","fri":"07:00-22:30","sat":"07:00-22:30","sun":"08:00-22:00"}')
ON CONFLICT (google_place_id) DO NOTHING;

-- ============================================================================
-- Restaurant ↔ Cuisine Links for V2 restaurants
-- ============================================================================

INSERT INTO restaurant_cuisines (restaurant_id, cuisine_id) VALUES
-- T. Nagar V2
('e0000000-0000-0000-0000-000000000031', 'c0000000-0000-0000-0000-000000000001'), -- Vasanta Bhavan → South Indian
('e0000000-0000-0000-0000-000000000032', 'c0000000-0000-0000-0000-000000000003'), -- Palmshore TN → North Indian
('e0000000-0000-0000-0000-000000000032', 'c0000000-0000-0000-0000-000000000004'), -- Palmshore TN → Chinese
('e0000000-0000-0000-0000-000000000033', 'c0000000-0000-0000-0000-000000000001'), -- Sangeetha TN → South Indian
('e0000000-0000-0000-0000-000000000034', 'c0000000-0000-0000-0000-000000000002'), -- Jr Kuppanna TN → Chettinad
('e0000000-0000-0000-0000-000000000034', 'c0000000-0000-0000-0000-000000000007'), -- Jr Kuppanna TN → Seafood
('e0000000-0000-0000-0000-000000000035', 'c0000000-0000-0000-0000-000000000002'), -- Aachi Mess → Chettinad
('e0000000-0000-0000-0000-000000000036', 'c0000000-0000-0000-0000-000000000001'), -- Karpagambal TN → South Indian
('e0000000-0000-0000-0000-000000000037', 'c0000000-0000-0000-0000-000000000001'), -- Ratna Cafe TN → South Indian
('e0000000-0000-0000-0000-000000000038', 'c0000000-0000-0000-0000-000000000008'), -- Shree Mithai → Street Food
('e0000000-0000-0000-0000-000000000038', 'c0000000-0000-0000-0000-000000000003'), -- Shree Mithai → North Indian
('e0000000-0000-0000-0000-000000000039', 'c0000000-0000-0000-0000-000000000001'), -- A2B TN → South Indian
('e0000000-0000-0000-0000-000000000040', 'c0000000-0000-0000-0000-000000000002'), -- Ponnusamy TN → Chettinad
('e0000000-0000-0000-0000-000000000041', 'c0000000-0000-0000-0000-000000000001'), -- Sree Annapoorna → South Indian
('e0000000-0000-0000-0000-000000000042', 'c0000000-0000-0000-0000-000000000004'), -- The Wok → Chinese
('e0000000-0000-0000-0000-000000000043', 'c0000000-0000-0000-0000-000000000001'), -- Namma Veedu VB → South Indian
('e0000000-0000-0000-0000-000000000044', 'c0000000-0000-0000-0000-000000000011'), -- Mehfil → Mughlai
('e0000000-0000-0000-0000-000000000044', 'c0000000-0000-0000-0000-000000000006'), -- Mehfil → Biryani
('e0000000-0000-0000-0000-000000000045', 'c0000000-0000-0000-0000-000000000001'), -- Arusuvai → South Indian
('e0000000-0000-0000-0000-000000000046', 'c0000000-0000-0000-0000-000000000008'), -- Sri Krishna Sweets → Street Food
('e0000000-0000-0000-0000-000000000047', 'c0000000-0000-0000-0000-000000000006'), -- Thalappakatti 2 → Biryani
('e0000000-0000-0000-0000-000000000048', 'c0000000-0000-0000-0000-000000000009'), -- Chai Waale → Bakery & Cafe
('e0000000-0000-0000-0000-000000000049', 'c0000000-0000-0000-0000-000000000001'), -- Hotel Saravana → South Indian
('e0000000-0000-0000-0000-000000000050', 'c0000000-0000-0000-0000-000000000004'), -- Shanghai Kitchen → Chinese
('e0000000-0000-0000-0000-000000000051', 'c0000000-0000-0000-0000-000000000008'), -- Bombay Halwa → Street Food
('e0000000-0000-0000-0000-000000000052', 'c0000000-0000-0000-0000-000000000003'), -- Kebab Factory → North Indian
('e0000000-0000-0000-0000-000000000052', 'c0000000-0000-0000-0000-000000000011'), -- Kebab Factory → Mughlai
('e0000000-0000-0000-0000-000000000053', 'c0000000-0000-0000-0000-000000000001'), -- Dosai Thotti → South Indian
('e0000000-0000-0000-0000-000000000054', 'c0000000-0000-0000-0000-000000000009'), -- Chola Bakery → Bakery & Cafe
('e0000000-0000-0000-0000-000000000055', 'c0000000-0000-0000-0000-000000000001'), -- Parotta Kadai → South Indian
-- Adyar V2
('e0000000-0000-0000-0000-000000000056', 'c0000000-0000-0000-0000-000000000003'), -- Cream Centre Adyar → North Indian
('e0000000-0000-0000-0000-000000000056', 'c0000000-0000-0000-0000-000000000013'), -- Cream Centre Adyar → Continental
('e0000000-0000-0000-0000-000000000057', 'c0000000-0000-0000-0000-000000000013'), -- Zara's Adyar → Continental
('e0000000-0000-0000-0000-000000000058', 'c0000000-0000-0000-0000-000000000003'), -- Bombay Brasserie → North Indian
('e0000000-0000-0000-0000-000000000059', 'c0000000-0000-0000-0000-000000000002'), -- The Raintree → Chettinad
('e0000000-0000-0000-0000-000000000060', 'c0000000-0000-0000-0000-000000000004'), -- Benjarong → Chinese
('e0000000-0000-0000-0000-000000000061', 'c0000000-0000-0000-0000-000000000003'), -- Copper Chimney Adyar → North Indian
('e0000000-0000-0000-0000-000000000062', 'c0000000-0000-0000-0000-000000000005'), -- Tuscana → Italian
('e0000000-0000-0000-0000-000000000063', 'c0000000-0000-0000-0000-000000000001'), -- Murugan Adyar → South Indian
('e0000000-0000-0000-0000-000000000064', 'c0000000-0000-0000-0000-000000000002'), -- Anjappar Adyar → Chettinad
('e0000000-0000-0000-0000-000000000065', 'c0000000-0000-0000-0000-000000000002'), -- Ponnusamy Adyar → Chettinad
('e0000000-0000-0000-0000-000000000066', 'c0000000-0000-0000-0000-000000000006'), -- Thalappakatti Adyar → Biryani
('e0000000-0000-0000-0000-000000000067', 'c0000000-0000-0000-0000-000000000001'), -- Saravana Bhavan Adyar → South Indian
('e0000000-0000-0000-0000-000000000068', 'c0000000-0000-0000-0000-000000000010'), -- Hot Chips Adyar → Fast Food
('e0000000-0000-0000-0000-000000000069', 'c0000000-0000-0000-0000-000000000009'), -- Cafe Amethyst Adyar → Bakery & Cafe
('e0000000-0000-0000-0000-000000000070', 'c0000000-0000-0000-0000-000000000001'), -- Grand Sweets Adyar → South Indian
('e0000000-0000-0000-0000-000000000071', 'c0000000-0000-0000-0000-000000000009'), -- Xander's Kitchen → Bakery & Cafe
('e0000000-0000-0000-0000-000000000072', 'c0000000-0000-0000-0000-000000000002'), -- Maplai Express → Chettinad
('e0000000-0000-0000-0000-000000000073', 'c0000000-0000-0000-0000-000000000008'), -- Fruit Shop → Street Food
('e0000000-0000-0000-0000-000000000074', 'c0000000-0000-0000-0000-000000000010'), -- Shawarma Junction → Fast Food
('e0000000-0000-0000-0000-000000000075', 'c0000000-0000-0000-0000-000000000009'), -- Chai Kings Adyar → Bakery & Cafe
-- Mylapore V2
('e0000000-0000-0000-0000-000000000076', 'c0000000-0000-0000-0000-000000000001'), -- Mylai Karpagambal → South Indian
('e0000000-0000-0000-0000-000000000077', 'c0000000-0000-0000-0000-000000000008'), -- Sri Krishna Sweets Mylapore → Street Food
('e0000000-0000-0000-0000-000000000078', 'c0000000-0000-0000-0000-000000000001'), -- Mathsya → South Indian
('e0000000-0000-0000-0000-000000000078', 'c0000000-0000-0000-0000-000000000013'), -- Mathsya → Continental
('e0000000-0000-0000-0000-000000000079', 'c0000000-0000-0000-0000-000000000001'), -- Hotel Saravana Mylapore → South Indian
('e0000000-0000-0000-0000-000000000080', 'c0000000-0000-0000-0000-000000000001'), -- Murugan Mylapore → South Indian
('e0000000-0000-0000-0000-000000000081', 'c0000000-0000-0000-0000-000000000001'), -- Saravana Bhavan Mylapore → South Indian
('e0000000-0000-0000-0000-000000000082', 'c0000000-0000-0000-0000-000000000002'), -- Ponnusamy Mylapore → Chettinad
('e0000000-0000-0000-0000-000000000083', 'c0000000-0000-0000-0000-000000000003'), -- Bhima's → North Indian
('e0000000-0000-0000-0000-000000000083', 'c0000000-0000-0000-0000-000000000004'), -- Bhima's → Chinese
('e0000000-0000-0000-0000-000000000084', 'c0000000-0000-0000-0000-000000000001'), -- Grand Sweets Mylapore → South Indian
('e0000000-0000-0000-0000-000000000085', 'c0000000-0000-0000-0000-000000000001'), -- Sangeetha Mylapore → South Indian
('e0000000-0000-0000-0000-000000000086', 'c0000000-0000-0000-0000-000000000001'), -- Rayar's Mess → South Indian
('e0000000-0000-0000-0000-000000000087', 'c0000000-0000-0000-0000-000000000001'), -- A2B Mylapore → South Indian
('e0000000-0000-0000-0000-000000000088', 'c0000000-0000-0000-0000-000000000006'), -- Thalappakatti Mylapore → Biryani
('e0000000-0000-0000-0000-000000000089', 'c0000000-0000-0000-0000-000000000002'), -- Jr Kuppanna Mylapore → Chettinad
('e0000000-0000-0000-0000-000000000089', 'c0000000-0000-0000-0000-000000000007'), -- Jr Kuppanna Mylapore → Seafood
('e0000000-0000-0000-0000-000000000090', 'c0000000-0000-0000-0000-000000000009'), -- Chamiers Cafe Mylapore → Bakery & Cafe
('e0000000-0000-0000-0000-000000000091', 'c0000000-0000-0000-0000-000000000006'), -- Ajantha → Biryani
('e0000000-0000-0000-0000-000000000091', 'c0000000-0000-0000-0000-000000000012'), -- Ajantha → Kerala
('e0000000-0000-0000-0000-000000000092', 'c0000000-0000-0000-0000-000000000003'), -- Kaidi Kitchen → North Indian
('e0000000-0000-0000-0000-000000000092', 'c0000000-0000-0000-0000-000000000004'), -- Kaidi Kitchen → Chinese
('e0000000-0000-0000-0000-000000000093', 'c0000000-0000-0000-0000-000000000001'), -- Balaji Bhavan → South Indian
('e0000000-0000-0000-0000-000000000094', 'c0000000-0000-0000-0000-000000000006'), -- Buhari Mylapore → Biryani
('e0000000-0000-0000-0000-000000000095', 'c0000000-0000-0000-0000-000000000001'), -- Ganapathy Mess → South Indian
-- Anna Nagar V2
('e0000000-0000-0000-0000-000000000096', 'c0000000-0000-0000-0000-000000000006'), -- Buhari AN → Biryani
('e0000000-0000-0000-0000-000000000097', 'c0000000-0000-0000-0000-000000000003'), -- Palmshore AN → North Indian
('e0000000-0000-0000-0000-000000000097', 'c0000000-0000-0000-0000-000000000004'), -- Palmshore AN → Chinese
('e0000000-0000-0000-0000-000000000098', 'c0000000-0000-0000-0000-000000000004'), -- Mainland China → Chinese
('e0000000-0000-0000-0000-000000000099', 'c0000000-0000-0000-0000-000000000003'), -- Charcoal Grill → North Indian
('e0000000-0000-0000-0000-000000000100', 'c0000000-0000-0000-0000-000000000001'), -- Saravana Bhavan AN → South Indian
('e0000000-0000-0000-0000-000000000101', 'c0000000-0000-0000-0000-000000000001'), -- Sangeetha AN → South Indian
('e0000000-0000-0000-0000-000000000102', 'c0000000-0000-0000-0000-000000000002'), -- Anjappar AN → Chettinad
('e0000000-0000-0000-0000-000000000103', 'c0000000-0000-0000-0000-000000000001'), -- A2B AN → South Indian
('e0000000-0000-0000-0000-000000000104', 'c0000000-0000-0000-0000-000000000003'), -- Absolute BBQ AN → North Indian
('e0000000-0000-0000-0000-000000000105', 'c0000000-0000-0000-0000-000000000002'), -- Jr Kuppanna AN → Chettinad
('e0000000-0000-0000-0000-000000000105', 'c0000000-0000-0000-0000-000000000007'), -- Jr Kuppanna AN → Seafood
('e0000000-0000-0000-0000-000000000106', 'c0000000-0000-0000-0000-000000000001'), -- Grand Sweets AN → South Indian
('e0000000-0000-0000-0000-000000000107', 'c0000000-0000-0000-0000-000000000001'), -- Murugan AN → South Indian
('e0000000-0000-0000-0000-000000000108', 'c0000000-0000-0000-0000-000000000006'), -- Thalappakatti AN → Biryani
('e0000000-0000-0000-0000-000000000109', 'c0000000-0000-0000-0000-000000000009'), -- Sandy's Choc → Bakery & Cafe
('e0000000-0000-0000-0000-000000000110', 'c0000000-0000-0000-0000-000000000002'), -- Ponnusamy AN → Chettinad
('e0000000-0000-0000-0000-000000000111', 'c0000000-0000-0000-0000-000000000010'), -- Hot Chips AN → Fast Food
('e0000000-0000-0000-0000-000000000112', 'c0000000-0000-0000-0000-000000000009'), -- Brew Room AN → Bakery & Cafe
('e0000000-0000-0000-0000-000000000113', 'c0000000-0000-0000-0000-000000000004'), -- Dragon Bowl AN → Chinese
('e0000000-0000-0000-0000-000000000114', 'c0000000-0000-0000-0000-000000000008'), -- Sri Krishna Sweets AN → Street Food
('e0000000-0000-0000-0000-000000000115', 'c0000000-0000-0000-0000-000000000001'), -- Namma Kadai AN → South Indian
-- OMR V2
('e0000000-0000-0000-0000-000000000116', 'c0000000-0000-0000-0000-000000000009'), -- Brew Room OMR → Bakery & Cafe
('e0000000-0000-0000-0000-000000000117', 'c0000000-0000-0000-0000-000000000009'), -- Sandy's OMR → Bakery & Cafe
('e0000000-0000-0000-0000-000000000118', 'c0000000-0000-0000-0000-000000000003'), -- Absolute BBQ OMR → North Indian
('e0000000-0000-0000-0000-000000000119', 'c0000000-0000-0000-0000-000000000003'), -- Copper + Cloves → North Indian
('e0000000-0000-0000-0000-000000000119', 'c0000000-0000-0000-0000-000000000013'), -- Copper + Cloves → Continental
('e0000000-0000-0000-0000-000000000120', 'c0000000-0000-0000-0000-000000000001'), -- Saravana Bhavan OMR → South Indian
('e0000000-0000-0000-0000-000000000121', 'c0000000-0000-0000-0000-000000000002'), -- Ponnusamy OMR → Chettinad
('e0000000-0000-0000-0000-000000000122', 'c0000000-0000-0000-0000-000000000006'), -- Thalappakatti OMR → Biryani
('e0000000-0000-0000-0000-000000000123', 'c0000000-0000-0000-0000-000000000006'), -- Buhari OMR → Biryani
('e0000000-0000-0000-0000-000000000124', 'c0000000-0000-0000-0000-000000000001'), -- A2B OMR → South Indian
('e0000000-0000-0000-0000-000000000125', 'c0000000-0000-0000-0000-000000000002'), -- Jr Kuppanna OMR → Chettinad
('e0000000-0000-0000-0000-000000000126', 'c0000000-0000-0000-0000-000000000002'), -- Anjappar OMR → Chettinad
('e0000000-0000-0000-0000-000000000127', 'c0000000-0000-0000-0000-000000000001'), -- Sangeetha OMR → South Indian
('e0000000-0000-0000-0000-000000000128', 'c0000000-0000-0000-0000-000000000003'), -- Cream Centre OMR → North Indian
('e0000000-0000-0000-0000-000000000129', 'c0000000-0000-0000-0000-000000000001'), -- Murugan OMR → South Indian
('e0000000-0000-0000-0000-000000000130', 'c0000000-0000-0000-0000-000000000001'), -- Grand Sweets OMR → South Indian
('e0000000-0000-0000-0000-000000000131', 'c0000000-0000-0000-0000-000000000003'), -- Palmshore OMR → North Indian
('e0000000-0000-0000-0000-000000000132', 'c0000000-0000-0000-0000-000000000009'), -- Chai Kings OMR → Bakery & Cafe
('e0000000-0000-0000-0000-000000000133', 'c0000000-0000-0000-0000-000000000010'), -- Shawarma Factory → Fast Food
('e0000000-0000-0000-0000-000000000134', 'c0000000-0000-0000-0000-000000000010'), -- Hot Chips OMR → Fast Food
('e0000000-0000-0000-0000-000000000135', 'c0000000-0000-0000-0000-000000000003'), -- Copper Chimney OMR → North Indian
-- Nungambakkam V2
('e0000000-0000-0000-0000-000000000136', 'c0000000-0000-0000-0000-000000000003'), -- Peshawri → North Indian
('e0000000-0000-0000-0000-000000000136', 'c0000000-0000-0000-0000-000000000011'), -- Peshawri → Mughlai
('e0000000-0000-0000-0000-000000000137', 'c0000000-0000-0000-0000-000000000005'), -- Focaccia → Italian
('e0000000-0000-0000-0000-000000000138', 'c0000000-0000-0000-0000-000000000009'), -- Chamiers Cafe → Bakery & Cafe
('e0000000-0000-0000-0000-000000000139', 'c0000000-0000-0000-0000-000000000003'), -- Meze Mangal → North Indian
('e0000000-0000-0000-0000-000000000140', 'c0000000-0000-0000-0000-000000000013'), -- Zara's Nungam → Continental
('e0000000-0000-0000-0000-000000000141', 'c0000000-0000-0000-0000-000000000001'), -- Saravana Bhavan Nungam → South Indian
('e0000000-0000-0000-0000-000000000142', 'c0000000-0000-0000-0000-000000000006'), -- Buhari Nungam → Biryani
('e0000000-0000-0000-0000-000000000143', 'c0000000-0000-0000-0000-000000000002'), -- Anjappar Nungam → Chettinad
('e0000000-0000-0000-0000-000000000144', 'c0000000-0000-0000-0000-000000000003'), -- Cream Centre Nungam → North Indian
('e0000000-0000-0000-0000-000000000145', 'c0000000-0000-0000-0000-000000000001'), -- Murugan Nungam → South Indian
('e0000000-0000-0000-0000-000000000146', 'c0000000-0000-0000-0000-000000000006'), -- Thalappakatti Nungam → Biryani
('e0000000-0000-0000-0000-000000000147', 'c0000000-0000-0000-0000-000000000003'), -- Copper Chimney Nungam → North Indian
('e0000000-0000-0000-0000-000000000148', 'c0000000-0000-0000-0000-000000000001'), -- A2B Nungam → South Indian
('e0000000-0000-0000-0000-000000000149', 'c0000000-0000-0000-0000-000000000001'), -- Sangeetha Nungam → South Indian
('e0000000-0000-0000-0000-000000000150', 'c0000000-0000-0000-0000-000000000009')  -- Hot Breads Nungam → Bakery & Cafe
ON CONFLICT DO NOTHING;

-- ============================================================================
-- Menu Items for V2 restaurants (6 items each × 120 = 720 items)
-- Using ID pattern: f0000000-0000-0000-00XX-00000000000Y
-- XX = restaurant number (31-99, A0-F0 hex), Y = item 1-6
-- ============================================================================

-- R031: Vasanta Bhavan (T. Nagar)
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0031-000000000001', 'e0000000-0000-0000-0000-000000000031', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and coconut chutney', 95.00, true, true),
('f0000000-0000-0000-0031-000000000002', 'e0000000-0000-0000-0000-000000000031', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy rice-lentil porridge tempered with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0031-000000000003', 'e0000000-0000-0000-0000-000000000031', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 160.00, true, true),
('f0000000-0000-0000-0031-000000000004', 'e0000000-0000-0000-0000-000000000031', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters served with coconut chutney and sambar', 65.00, true, true),
('f0000000-0000-0000-0031-000000000005', 'e0000000-0000-0000-0000-000000000031', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe with cumin and pepper', 90.00, true, true),
('f0000000-0000-0000-0031-000000000006', 'e0000000-0000-0000-0000-000000000031', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional decoction-based coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R032: Hotel Palmshore T. Nagar
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0032-000000000001', 'e0000000-0000-0000-0000-000000000032', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in creamy tomato makhani gravy', 310.00, false, true),
('f0000000-0000-0000-0032-000000000002', 'e0000000-0000-0000-0000-000000000032', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant basmati rice layered with spiced chicken', 260.00, false, true),
('f0000000-0000-0000-0032-000000000003', 'e0000000-0000-0000-0000-000000000032', 'd0000000-0000-0000-0000-000000000004', 'Kadai Paneer', 'Cottage cheese in spicy capsicum-onion gravy', 240.00, true, true),
('f0000000-0000-0000-0032-000000000004', 'e0000000-0000-0000-0000-000000000032', 'd0000000-0000-0000-0000-000000000002', 'Dragon Chicken', 'Crispy chicken in sweet-spicy Indo-Chinese sauce', 280.00, false, true),
('f0000000-0000-0000-0032-000000000005', 'e0000000-0000-0000-0000-000000000032', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic and butter', 75.00, true, true),
('f0000000-0000-0000-0032-000000000006', 'e0000000-0000-0000-0000-000000000032', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun', 'Warm milk-solid dumplings in rose-cardamom syrup', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R033: Sangeetha T. Nagar
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0033-000000000001', 'e0000000-0000-0000-0000-000000000033', 'd0000000-0000-0000-0000-000000000001', 'Set Dosa', 'Three soft spongy dosas with butter and gunpowder', 80.00, true, true),
('f0000000-0000-0000-0033-000000000002', 'e0000000-0000-0000-0000-000000000033', 'd0000000-0000-0000-0000-000000000009', 'Sangeetha Special Meals', 'Unlimited thali with rice, sambar, rasam, and dessert', 170.00, true, true),
('f0000000-0000-0000-0033-000000000003', 'e0000000-0000-0000-0000-000000000033', 'd0000000-0000-0000-0000-000000000001', 'Onion Uttapam', 'Thick rice pancake topped with onions and chillies', 85.00, true, true),
('f0000000-0000-0000-0033-000000000004', 'e0000000-0000-0000-0000-000000000033', 'd0000000-0000-0000-0000-000000000005', 'Curd Rice', 'Cooling yoghurt rice with curry leaves and pomegranate', 75.00, true, true),
('f0000000-0000-0000-0033-000000000005', 'e0000000-0000-0000-0000-000000000033', 'd0000000-0000-0000-0000-000000000002', 'Sambar Vada', 'Crispy vadas soaked in aromatic sambar', 70.00, true, true),
('f0000000-0000-0000-0033-000000000006', 'e0000000-0000-0000-0000-000000000033', 'd0000000-0000-0000-0000-000000000008', 'Buttermilk', 'Spiced churned yoghurt with ginger and curry leaves', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R034: Junior Kuppanna T. Nagar
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0034-000000000001', 'e0000000-0000-0000-0000-000000000034', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice and intense Chettinad spices', 380.00, false, true),
('f0000000-0000-0000-0034-000000000002', 'e0000000-0000-0000-0000-000000000034', 'd0000000-0000-0000-0000-000000000004', 'Crab Masala', 'Whole crab in thick Chettinad masala with coconut and curry leaves', 520.00, false, true),
('f0000000-0000-0000-0034-000000000003', 'e0000000-0000-0000-0000-000000000034', 'd0000000-0000-0000-0000-000000000002', 'Chicken Sukka', 'Dry-roasted chicken with ground Chettinad spices and coconut', 320.00, false, true),
('f0000000-0000-0000-0034-000000000004', 'e0000000-0000-0000-0000-000000000034', 'd0000000-0000-0000-0000-000000000002', 'Prawn 65', 'Crispy deep-fried prawns with curry leaves and green chillies', 380.00, false, true),
('f0000000-0000-0000-0034-000000000005', 'e0000000-0000-0000-0000-000000000034', 'd0000000-0000-0000-0000-000000000004', 'Mutton Kuzhambu', 'Tangy mutton curry with tamarind and drumstick', 350.00, false, true),
('f0000000-0000-0000-0034-000000000006', 'e0000000-0000-0000-0000-000000000034', 'd0000000-0000-0000-0000-000000000006', 'Kothu Parotta', 'Shredded parotta stir-fried with egg and spicy masala', 150.00, false, true)
ON CONFLICT DO NOTHING;

-- R035: Aachi Mess
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0035-000000000001', 'e0000000-0000-0000-0000-000000000035', 'd0000000-0000-0000-0000-000000000004', 'Chicken Curry Meals', 'Fiery Chettinad chicken curry with rice, rasam, and appalam', 130.00, false, true),
('f0000000-0000-0000-0035-000000000002', 'e0000000-0000-0000-0000-000000000035', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 220.00, false, true),
('f0000000-0000-0000-0035-000000000003', 'e0000000-0000-0000-0000-000000000035', 'd0000000-0000-0000-0000-000000000002', 'Chicken Varuval', 'Dry chicken fry with Chettinad masala and curry leaves', 180.00, false, true),
('f0000000-0000-0000-0035-000000000004', 'e0000000-0000-0000-0000-000000000035', 'd0000000-0000-0000-0000-000000000004', 'Fish Curry', 'Tangy fish curry with tamarind and drumstick', 160.00, false, true),
('f0000000-0000-0000-0035-000000000005', 'e0000000-0000-0000-0000-000000000035', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 40.00, true, true),
('f0000000-0000-0000-0035-000000000006', 'e0000000-0000-0000-0000-000000000035', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 30.00, true, true)
ON CONFLICT DO NOTHING;

-- R036: Karpagambal Mess T. Nagar
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0036-000000000001', 'e0000000-0000-0000-0000-000000000036', 'd0000000-0000-0000-0000-000000000001', 'Podi Idli', 'Idlis tossed in spicy gun powder with sesame oil', 70.00, true, true),
('f0000000-0000-0000-0036-000000000002', 'e0000000-0000-0000-0000-000000000036', 'd0000000-0000-0000-0000-000000000009', 'Mini Meals', 'Compact thali with rice, sambar, rasam, poriyal and curd', 110.00, true, true),
('f0000000-0000-0000-0036-000000000003', 'e0000000-0000-0000-0000-000000000036', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe with cumin and curry leaves', 85.00, true, true),
('f0000000-0000-0000-0036-000000000004', 'e0000000-0000-0000-0000-000000000036', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Rich lentil-rice porridge loaded with ghee and pepper', 75.00, true, true),
('f0000000-0000-0000-0036-000000000005', 'e0000000-0000-0000-0000-000000000036', 'd0000000-0000-0000-0000-000000000007', 'Sweet Pongal', 'Jaggery-sweetened rice pudding with cashews and raisins', 65.00, true, true),
('f0000000-0000-0000-0036-000000000006', 'e0000000-0000-0000-0000-000000000036', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Strong decoction coffee with frothy hot milk', 35.00, true, true)
ON CONFLICT DO NOTHING;

-- R037
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0037-000000000001', 'e0000000-0000-0000-0000-000000000037', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0037-000000000002', 'e0000000-0000-0000-0000-000000000037', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0037-000000000003', 'e0000000-0000-0000-0000-000000000037', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0037-000000000004', 'e0000000-0000-0000-0000-000000000037', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0037-000000000005', 'e0000000-0000-0000-0000-000000000037', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0037-000000000006', 'e0000000-0000-0000-0000-000000000037', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R038
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0038-000000000001', 'e0000000-0000-0000-0000-000000000038', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0038-000000000002', 'e0000000-0000-0000-0000-000000000038', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0038-000000000003', 'e0000000-0000-0000-0000-000000000038', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0038-000000000004', 'e0000000-0000-0000-0000-000000000038', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0038-000000000005', 'e0000000-0000-0000-0000-000000000038', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0038-000000000006', 'e0000000-0000-0000-0000-000000000038', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R039
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0039-000000000001', 'e0000000-0000-0000-0000-000000000039', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0039-000000000002', 'e0000000-0000-0000-0000-000000000039', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0039-000000000003', 'e0000000-0000-0000-0000-000000000039', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0039-000000000004', 'e0000000-0000-0000-0000-000000000039', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0039-000000000005', 'e0000000-0000-0000-0000-000000000039', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0039-000000000006', 'e0000000-0000-0000-0000-000000000039', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R040
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0040-000000000001', 'e0000000-0000-0000-0000-000000000040', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0040-000000000002', 'e0000000-0000-0000-0000-000000000040', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0040-000000000003', 'e0000000-0000-0000-0000-000000000040', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0040-000000000004', 'e0000000-0000-0000-0000-000000000040', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0040-000000000005', 'e0000000-0000-0000-0000-000000000040', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0040-000000000006', 'e0000000-0000-0000-0000-000000000040', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R041
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0041-000000000001', 'e0000000-0000-0000-0000-000000000041', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0041-000000000002', 'e0000000-0000-0000-0000-000000000041', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0041-000000000003', 'e0000000-0000-0000-0000-000000000041', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0041-000000000004', 'e0000000-0000-0000-0000-000000000041', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0041-000000000005', 'e0000000-0000-0000-0000-000000000041', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0041-000000000006', 'e0000000-0000-0000-0000-000000000041', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R042
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0042-000000000001', 'e0000000-0000-0000-0000-000000000042', 'd0000000-0000-0000-0000-000000000002', 'Chicken Manchurian', 'Crispy chicken balls in tangy Indo-Chinese sauce', 220.00, false, true),
('f0000000-0000-0000-0042-000000000002', 'e0000000-0000-0000-0000-000000000042', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Hakka noodles in fiery schezwan sauce with vegetables', 180.00, true, true),
('f0000000-0000-0000-0042-000000000003', 'e0000000-0000-0000-0000-000000000042', 'd0000000-0000-0000-0000-000000000002', 'Chilli Paneer', 'Crispy paneer with bell peppers and green chillies', 200.00, true, true),
('f0000000-0000-0000-0042-000000000004', 'e0000000-0000-0000-0000-000000000042', 'd0000000-0000-0000-0000-000000000005', 'Fried Rice', 'Wok-fried rice with vegetables and soy sauce', 170.00, true, true),
('f0000000-0000-0000-0042-000000000005', 'e0000000-0000-0000-0000-000000000042', 'd0000000-0000-0000-0000-000000000003', 'Hot and Sour Soup', 'Spicy-tangy broth with vegetables and tofu', 120.00, true, true),
('f0000000-0000-0000-0042-000000000006', 'e0000000-0000-0000-0000-000000000042', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Squeezed lime with soda and a pinch of salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R043
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0043-000000000001', 'e0000000-0000-0000-0000-000000000043', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0043-000000000002', 'e0000000-0000-0000-0000-000000000043', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0043-000000000003', 'e0000000-0000-0000-0000-000000000043', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0043-000000000004', 'e0000000-0000-0000-0000-000000000043', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0043-000000000005', 'e0000000-0000-0000-0000-000000000043', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0043-000000000006', 'e0000000-0000-0000-0000-000000000043', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R044
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0044-000000000001', 'e0000000-0000-0000-0000-000000000044', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0044-000000000002', 'e0000000-0000-0000-0000-000000000044', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0044-000000000003', 'e0000000-0000-0000-0000-000000000044', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0044-000000000004', 'e0000000-0000-0000-0000-000000000044', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0044-000000000005', 'e0000000-0000-0000-0000-000000000044', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0044-000000000006', 'e0000000-0000-0000-0000-000000000044', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R045
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0045-000000000001', 'e0000000-0000-0000-0000-000000000045', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0045-000000000002', 'e0000000-0000-0000-0000-000000000045', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0045-000000000003', 'e0000000-0000-0000-0000-000000000045', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0045-000000000004', 'e0000000-0000-0000-0000-000000000045', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0045-000000000005', 'e0000000-0000-0000-0000-000000000045', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0045-000000000006', 'e0000000-0000-0000-0000-000000000045', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R046
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0046-000000000001', 'e0000000-0000-0000-0000-000000000046', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0046-000000000002', 'e0000000-0000-0000-0000-000000000046', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0046-000000000003', 'e0000000-0000-0000-0000-000000000046', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0046-000000000004', 'e0000000-0000-0000-0000-000000000046', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0046-000000000005', 'e0000000-0000-0000-0000-000000000046', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0046-000000000006', 'e0000000-0000-0000-0000-000000000046', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R047
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0047-000000000001', 'e0000000-0000-0000-0000-000000000047', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0047-000000000002', 'e0000000-0000-0000-0000-000000000047', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0047-000000000003', 'e0000000-0000-0000-0000-000000000047', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0047-000000000004', 'e0000000-0000-0000-0000-000000000047', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0047-000000000005', 'e0000000-0000-0000-0000-000000000047', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0047-000000000006', 'e0000000-0000-0000-0000-000000000047', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R048
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0048-000000000001', 'e0000000-0000-0000-0000-000000000048', 'd0000000-0000-0000-0000-000000000008', 'Kulhad Chai', 'Masala chai in earthen kulhad, fragrant and comforting', 60.00, true, true),
('f0000000-0000-0000-0048-000000000002', 'e0000000-0000-0000-0000-000000000048', 'd0000000-0000-0000-0000-000000000010', 'Bun Maska', 'Toasted bun with Amul butter, the perfect chai partner', 50.00, true, true),
('f0000000-0000-0000-0048-000000000003', 'e0000000-0000-0000-0000-000000000048', 'd0000000-0000-0000-0000-000000000010', 'Maggi', 'Classic 2-minute noodles with extra veggies and spice', 80.00, true, true),
('f0000000-0000-0000-0048-000000000004', 'e0000000-0000-0000-0000-000000000048', 'd0000000-0000-0000-0000-000000000010', 'Cheese Grilled Sandwich', 'Multigrain bread with vegetables and melted cheese', 120.00, true, true),
('f0000000-0000-0000-0048-000000000005', 'e0000000-0000-0000-0000-000000000048', 'd0000000-0000-0000-0000-000000000008', 'Iced Chai', 'Cold-brewed masala chai over ice with condensed milk', 90.00, true, true),
('f0000000-0000-0000-0048-000000000006', 'e0000000-0000-0000-0000-000000000048', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Lava Cake', 'Mini cake with molten chocolate centre and ice cream', 150.00, true, true)
ON CONFLICT DO NOTHING;

-- R049
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0049-000000000001', 'e0000000-0000-0000-0000-000000000049', 'd0000000-0000-0000-0000-000000000002', 'Crispy Fried Chicken', 'Crunchy golden-fried chicken with Chennai spice coating', 180.00, false, true),
('f0000000-0000-0000-0049-000000000002', 'e0000000-0000-0000-0000-000000000049', 'd0000000-0000-0000-0000-000000000010', 'Veg Burger', 'Crispy aloo tikki with lettuce, tomato, and signature sauce', 99.00, true, true),
('f0000000-0000-0000-0049-000000000003', 'e0000000-0000-0000-0000-000000000049', 'd0000000-0000-0000-0000-000000000010', 'Chicken Shawarma', 'Grilled chicken in rumali roti with garlic mayo', 130.00, false, true),
('f0000000-0000-0000-0049-000000000004', 'e0000000-0000-0000-0000-000000000049', 'd0000000-0000-0000-0000-000000000004', 'Noodles Combo', 'Hakka noodles with manchurian and a soft drink', 199.00, false, true),
('f0000000-0000-0000-0049-000000000005', 'e0000000-0000-0000-0000-000000000049', 'd0000000-0000-0000-0000-000000000001', 'Idli Vada Combo', 'Two idlis and one vada with sambar and chutney', 80.00, true, true),
('f0000000-0000-0000-0049-000000000006', 'e0000000-0000-0000-0000-000000000049', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Freshly squeezed lime with soda and salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R050
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0050-000000000001', 'e0000000-0000-0000-0000-000000000050', 'd0000000-0000-0000-0000-000000000002', 'Chicken Manchurian', 'Crispy chicken balls in tangy Indo-Chinese sauce', 220.00, false, true),
('f0000000-0000-0000-0050-000000000002', 'e0000000-0000-0000-0000-000000000050', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Hakka noodles in fiery schezwan sauce with vegetables', 180.00, true, true),
('f0000000-0000-0000-0050-000000000003', 'e0000000-0000-0000-0000-000000000050', 'd0000000-0000-0000-0000-000000000002', 'Chilli Paneer', 'Crispy paneer with bell peppers and green chillies', 200.00, true, true),
('f0000000-0000-0000-0050-000000000004', 'e0000000-0000-0000-0000-000000000050', 'd0000000-0000-0000-0000-000000000005', 'Fried Rice', 'Wok-fried rice with vegetables and soy sauce', 170.00, true, true),
('f0000000-0000-0000-0050-000000000005', 'e0000000-0000-0000-0000-000000000050', 'd0000000-0000-0000-0000-000000000003', 'Hot and Sour Soup', 'Spicy-tangy broth with vegetables and tofu', 120.00, true, true),
('f0000000-0000-0000-0050-000000000006', 'e0000000-0000-0000-0000-000000000050', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Squeezed lime with soda and a pinch of salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R051
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0051-000000000001', 'e0000000-0000-0000-0000-000000000051', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0051-000000000002', 'e0000000-0000-0000-0000-000000000051', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0051-000000000003', 'e0000000-0000-0000-0000-000000000051', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0051-000000000004', 'e0000000-0000-0000-0000-000000000051', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0051-000000000005', 'e0000000-0000-0000-0000-000000000051', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0051-000000000006', 'e0000000-0000-0000-0000-000000000051', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R052
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0052-000000000001', 'e0000000-0000-0000-0000-000000000052', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0052-000000000002', 'e0000000-0000-0000-0000-000000000052', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0052-000000000003', 'e0000000-0000-0000-0000-000000000052', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0052-000000000004', 'e0000000-0000-0000-0000-000000000052', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0052-000000000005', 'e0000000-0000-0000-0000-000000000052', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0052-000000000006', 'e0000000-0000-0000-0000-000000000052', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R053
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0053-000000000001', 'e0000000-0000-0000-0000-000000000053', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0053-000000000002', 'e0000000-0000-0000-0000-000000000053', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0053-000000000003', 'e0000000-0000-0000-0000-000000000053', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0053-000000000004', 'e0000000-0000-0000-0000-000000000053', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0053-000000000005', 'e0000000-0000-0000-0000-000000000053', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0053-000000000006', 'e0000000-0000-0000-0000-000000000053', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R054
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0054-000000000001', 'e0000000-0000-0000-0000-000000000054', 'd0000000-0000-0000-0000-000000000008', 'Cappuccino', 'Velvety espresso with perfectly steamed milk', 180.00, true, true),
('f0000000-0000-0000-0054-000000000002', 'e0000000-0000-0000-0000-000000000054', 'd0000000-0000-0000-0000-000000000001', 'Avocado Toast', 'Sourdough with smashed avocado, feta, and chilli flakes', 280.00, true, true),
('f0000000-0000-0000-0054-000000000003', 'e0000000-0000-0000-0000-000000000054', 'd0000000-0000-0000-0000-000000000004', 'Grilled Chicken Sandwich', 'Herb chicken with lettuce, cheese, and pesto on ciabatta', 320.00, false, true),
('f0000000-0000-0000-0054-000000000004', 'e0000000-0000-0000-0000-000000000054', 'd0000000-0000-0000-0000-000000000001', 'Pancake Stack', 'Fluffy buttermilk pancakes with maple syrup and berries', 260.00, true, true),
('f0000000-0000-0000-0054-000000000005', 'e0000000-0000-0000-0000-000000000054', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Brownie', 'Warm brownie with vanilla ice cream and chocolate sauce', 290.00, true, true),
('f0000000-0000-0000-0054-000000000006', 'e0000000-0000-0000-0000-000000000054', 'd0000000-0000-0000-0000-000000000008', 'Iced Latte', 'Cold brewed espresso over ice with milk', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R055
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0055-000000000001', 'e0000000-0000-0000-0000-000000000055', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0055-000000000002', 'e0000000-0000-0000-0000-000000000055', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0055-000000000003', 'e0000000-0000-0000-0000-000000000055', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0055-000000000004', 'e0000000-0000-0000-0000-000000000055', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0055-000000000005', 'e0000000-0000-0000-0000-000000000055', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0055-000000000006', 'e0000000-0000-0000-0000-000000000055', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R056
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0056-000000000001', 'e0000000-0000-0000-0000-000000000056', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0056-000000000002', 'e0000000-0000-0000-0000-000000000056', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0056-000000000003', 'e0000000-0000-0000-0000-000000000056', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0056-000000000004', 'e0000000-0000-0000-0000-000000000056', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0056-000000000005', 'e0000000-0000-0000-0000-000000000056', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0056-000000000006', 'e0000000-0000-0000-0000-000000000056', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R057
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0057-000000000001', 'e0000000-0000-0000-0000-000000000057', 'd0000000-0000-0000-0000-000000000002', 'Tuna Tartare', 'Fresh tuna with avocado, sesame, and yuzu dressing', 680.00, false, true),
('f0000000-0000-0000-0057-000000000002', 'e0000000-0000-0000-0000-000000000057', 'd0000000-0000-0000-0000-000000000004', 'Lamb Rack', 'Herb-crusted lamb rack with rosemary jus', 1200.00, false, true),
('f0000000-0000-0000-0057-000000000003', 'e0000000-0000-0000-0000-000000000057', 'd0000000-0000-0000-0000-000000000004', 'Risotto al Funghi', 'Arborio rice with porcini mushrooms and truffle oil', 650.00, true, true),
('f0000000-0000-0000-0057-000000000004', 'e0000000-0000-0000-0000-000000000057', 'd0000000-0000-0000-0000-000000000003', 'Lobster Bisque', 'Velvety lobster soup with cognac cream', 520.00, false, true),
('f0000000-0000-0000-0057-000000000005', 'e0000000-0000-0000-0000-000000000057', 'd0000000-0000-0000-0000-000000000007', 'Creme Brulee', 'Vanilla custard with caramelised sugar crust', 420.00, true, true),
('f0000000-0000-0000-0057-000000000006', 'e0000000-0000-0000-0000-000000000057', 'd0000000-0000-0000-0000-000000000008', 'Espresso Martini', 'Shaken espresso with coffee liqueur, non-alc available', 480.00, true, true)
ON CONFLICT DO NOTHING;

-- R058
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0058-000000000001', 'e0000000-0000-0000-0000-000000000058', 'd0000000-0000-0000-0000-000000000002', 'Tuna Tartare', 'Fresh tuna with avocado, sesame, and yuzu dressing', 680.00, false, true),
('f0000000-0000-0000-0058-000000000002', 'e0000000-0000-0000-0000-000000000058', 'd0000000-0000-0000-0000-000000000004', 'Lamb Rack', 'Herb-crusted lamb rack with rosemary jus', 1200.00, false, true),
('f0000000-0000-0000-0058-000000000003', 'e0000000-0000-0000-0000-000000000058', 'd0000000-0000-0000-0000-000000000004', 'Risotto al Funghi', 'Arborio rice with porcini mushrooms and truffle oil', 650.00, true, true),
('f0000000-0000-0000-0058-000000000004', 'e0000000-0000-0000-0000-000000000058', 'd0000000-0000-0000-0000-000000000003', 'Lobster Bisque', 'Velvety lobster soup with cognac cream', 520.00, false, true),
('f0000000-0000-0000-0058-000000000005', 'e0000000-0000-0000-0000-000000000058', 'd0000000-0000-0000-0000-000000000007', 'Creme Brulee', 'Vanilla custard with caramelised sugar crust', 420.00, true, true),
('f0000000-0000-0000-0058-000000000006', 'e0000000-0000-0000-0000-000000000058', 'd0000000-0000-0000-0000-000000000008', 'Espresso Martini', 'Shaken espresso with coffee liqueur, non-alc available', 480.00, true, true)
ON CONFLICT DO NOTHING;

-- R059
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0059-000000000001', 'e0000000-0000-0000-0000-000000000059', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0059-000000000002', 'e0000000-0000-0000-0000-000000000059', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0059-000000000003', 'e0000000-0000-0000-0000-000000000059', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0059-000000000004', 'e0000000-0000-0000-0000-000000000059', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0059-000000000005', 'e0000000-0000-0000-0000-000000000059', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0059-000000000006', 'e0000000-0000-0000-0000-000000000059', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R060
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0060-000000000001', 'e0000000-0000-0000-0000-000000000060', 'd0000000-0000-0000-0000-000000000002', 'Chicken Manchurian', 'Crispy chicken balls in tangy Indo-Chinese sauce', 220.00, false, true),
('f0000000-0000-0000-0060-000000000002', 'e0000000-0000-0000-0000-000000000060', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Hakka noodles in fiery schezwan sauce with vegetables', 180.00, true, true),
('f0000000-0000-0000-0060-000000000003', 'e0000000-0000-0000-0000-000000000060', 'd0000000-0000-0000-0000-000000000002', 'Chilli Paneer', 'Crispy paneer with bell peppers and green chillies', 200.00, true, true),
('f0000000-0000-0000-0060-000000000004', 'e0000000-0000-0000-0000-000000000060', 'd0000000-0000-0000-0000-000000000005', 'Fried Rice', 'Wok-fried rice with vegetables and soy sauce', 170.00, true, true),
('f0000000-0000-0000-0060-000000000005', 'e0000000-0000-0000-0000-000000000060', 'd0000000-0000-0000-0000-000000000003', 'Hot and Sour Soup', 'Spicy-tangy broth with vegetables and tofu', 120.00, true, true),
('f0000000-0000-0000-0060-000000000006', 'e0000000-0000-0000-0000-000000000060', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Squeezed lime with soda and a pinch of salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R061
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0061-000000000001', 'e0000000-0000-0000-0000-000000000061', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0061-000000000002', 'e0000000-0000-0000-0000-000000000061', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0061-000000000003', 'e0000000-0000-0000-0000-000000000061', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0061-000000000004', 'e0000000-0000-0000-0000-000000000061', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0061-000000000005', 'e0000000-0000-0000-0000-000000000061', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0061-000000000006', 'e0000000-0000-0000-0000-000000000061', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R062
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0062-000000000001', 'e0000000-0000-0000-0000-000000000062', 'd0000000-0000-0000-0000-000000000004', 'Margherita Pizza', 'San Marzano tomato, mozzarella, basil, wood-fired', 399.00, true, true),
('f0000000-0000-0000-0062-000000000002', 'e0000000-0000-0000-0000-000000000062', 'd0000000-0000-0000-0000-000000000004', 'Pepperoni Pizza', 'Spicy pepperoni with chilli flakes on blistered crust', 499.00, false, true),
('f0000000-0000-0000-0062-000000000003', 'e0000000-0000-0000-0000-000000000062', 'd0000000-0000-0000-0000-000000000004', 'Penne Arrabbiata', 'Penne in spicy tomato sauce with garlic and chilli', 380.00, true, true),
('f0000000-0000-0000-0062-000000000004', 'e0000000-0000-0000-0000-000000000062', 'd0000000-0000-0000-0000-000000000002', 'Bruschetta', 'Toasted ciabatta with tomatoes, basil, and olive oil', 280.00, true, true),
('f0000000-0000-0000-0062-000000000005', 'e0000000-0000-0000-0000-000000000062', 'd0000000-0000-0000-0000-000000000007', 'Tiramisu', 'Espresso-soaked ladyfingers with mascarpone cream', 350.00, true, true),
('f0000000-0000-0000-0062-000000000006', 'e0000000-0000-0000-0000-000000000062', 'd0000000-0000-0000-0000-000000000003', 'Minestrone', 'Hearty Italian vegetable soup with beans and herbs', 250.00, true, true)
ON CONFLICT DO NOTHING;

-- R063
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0063-000000000001', 'e0000000-0000-0000-0000-000000000063', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0063-000000000002', 'e0000000-0000-0000-0000-000000000063', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0063-000000000003', 'e0000000-0000-0000-0000-000000000063', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0063-000000000004', 'e0000000-0000-0000-0000-000000000063', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0063-000000000005', 'e0000000-0000-0000-0000-000000000063', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0063-000000000006', 'e0000000-0000-0000-0000-000000000063', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R064
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0064-000000000001', 'e0000000-0000-0000-0000-000000000064', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0064-000000000002', 'e0000000-0000-0000-0000-000000000064', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0064-000000000003', 'e0000000-0000-0000-0000-000000000064', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0064-000000000004', 'e0000000-0000-0000-0000-000000000064', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0064-000000000005', 'e0000000-0000-0000-0000-000000000064', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0064-000000000006', 'e0000000-0000-0000-0000-000000000064', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R065
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0065-000000000001', 'e0000000-0000-0000-0000-000000000065', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0065-000000000002', 'e0000000-0000-0000-0000-000000000065', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0065-000000000003', 'e0000000-0000-0000-0000-000000000065', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0065-000000000004', 'e0000000-0000-0000-0000-000000000065', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0065-000000000005', 'e0000000-0000-0000-0000-000000000065', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0065-000000000006', 'e0000000-0000-0000-0000-000000000065', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R066
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0066-000000000001', 'e0000000-0000-0000-0000-000000000066', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0066-000000000002', 'e0000000-0000-0000-0000-000000000066', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0066-000000000003', 'e0000000-0000-0000-0000-000000000066', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0066-000000000004', 'e0000000-0000-0000-0000-000000000066', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0066-000000000005', 'e0000000-0000-0000-0000-000000000066', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0066-000000000006', 'e0000000-0000-0000-0000-000000000066', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R067
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0067-000000000001', 'e0000000-0000-0000-0000-000000000067', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0067-000000000002', 'e0000000-0000-0000-0000-000000000067', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0067-000000000003', 'e0000000-0000-0000-0000-000000000067', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0067-000000000004', 'e0000000-0000-0000-0000-000000000067', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0067-000000000005', 'e0000000-0000-0000-0000-000000000067', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0067-000000000006', 'e0000000-0000-0000-0000-000000000067', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R068
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0068-000000000001', 'e0000000-0000-0000-0000-000000000068', 'd0000000-0000-0000-0000-000000000002', 'Crispy Fried Chicken', 'Crunchy golden-fried chicken with Chennai spice coating', 180.00, false, true),
('f0000000-0000-0000-0068-000000000002', 'e0000000-0000-0000-0000-000000000068', 'd0000000-0000-0000-0000-000000000010', 'Veg Burger', 'Crispy aloo tikki with lettuce, tomato, and signature sauce', 99.00, true, true),
('f0000000-0000-0000-0068-000000000003', 'e0000000-0000-0000-0000-000000000068', 'd0000000-0000-0000-0000-000000000010', 'Chicken Shawarma', 'Grilled chicken in rumali roti with garlic mayo', 130.00, false, true),
('f0000000-0000-0000-0068-000000000004', 'e0000000-0000-0000-0000-000000000068', 'd0000000-0000-0000-0000-000000000004', 'Noodles Combo', 'Hakka noodles with manchurian and a soft drink', 199.00, false, true),
('f0000000-0000-0000-0068-000000000005', 'e0000000-0000-0000-0000-000000000068', 'd0000000-0000-0000-0000-000000000001', 'Idli Vada Combo', 'Two idlis and one vada with sambar and chutney', 80.00, true, true),
('f0000000-0000-0000-0068-000000000006', 'e0000000-0000-0000-0000-000000000068', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Freshly squeezed lime with soda and salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R069
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0069-000000000001', 'e0000000-0000-0000-0000-000000000069', 'd0000000-0000-0000-0000-000000000008', 'Cappuccino', 'Velvety espresso with perfectly steamed milk', 180.00, true, true),
('f0000000-0000-0000-0069-000000000002', 'e0000000-0000-0000-0000-000000000069', 'd0000000-0000-0000-0000-000000000001', 'Avocado Toast', 'Sourdough with smashed avocado, feta, and chilli flakes', 280.00, true, true),
('f0000000-0000-0000-0069-000000000003', 'e0000000-0000-0000-0000-000000000069', 'd0000000-0000-0000-0000-000000000004', 'Grilled Chicken Sandwich', 'Herb chicken with lettuce, cheese, and pesto on ciabatta', 320.00, false, true),
('f0000000-0000-0000-0069-000000000004', 'e0000000-0000-0000-0000-000000000069', 'd0000000-0000-0000-0000-000000000001', 'Pancake Stack', 'Fluffy buttermilk pancakes with maple syrup and berries', 260.00, true, true),
('f0000000-0000-0000-0069-000000000005', 'e0000000-0000-0000-0000-000000000069', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Brownie', 'Warm brownie with vanilla ice cream and chocolate sauce', 290.00, true, true),
('f0000000-0000-0000-0069-000000000006', 'e0000000-0000-0000-0000-000000000069', 'd0000000-0000-0000-0000-000000000008', 'Iced Latte', 'Cold brewed espresso over ice with milk', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R070
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0070-000000000001', 'e0000000-0000-0000-0000-000000000070', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0070-000000000002', 'e0000000-0000-0000-0000-000000000070', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0070-000000000003', 'e0000000-0000-0000-0000-000000000070', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0070-000000000004', 'e0000000-0000-0000-0000-000000000070', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0070-000000000005', 'e0000000-0000-0000-0000-000000000070', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0070-000000000006', 'e0000000-0000-0000-0000-000000000070', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R071
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0071-000000000001', 'e0000000-0000-0000-0000-000000000071', 'd0000000-0000-0000-0000-000000000008', 'Cappuccino', 'Velvety espresso with perfectly steamed milk', 180.00, true, true),
('f0000000-0000-0000-0071-000000000002', 'e0000000-0000-0000-0000-000000000071', 'd0000000-0000-0000-0000-000000000001', 'Avocado Toast', 'Sourdough with smashed avocado, feta, and chilli flakes', 280.00, true, true),
('f0000000-0000-0000-0071-000000000003', 'e0000000-0000-0000-0000-000000000071', 'd0000000-0000-0000-0000-000000000004', 'Grilled Chicken Sandwich', 'Herb chicken with lettuce, cheese, and pesto on ciabatta', 320.00, false, true),
('f0000000-0000-0000-0071-000000000004', 'e0000000-0000-0000-0000-000000000071', 'd0000000-0000-0000-0000-000000000001', 'Pancake Stack', 'Fluffy buttermilk pancakes with maple syrup and berries', 260.00, true, true),
('f0000000-0000-0000-0071-000000000005', 'e0000000-0000-0000-0000-000000000071', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Brownie', 'Warm brownie with vanilla ice cream and chocolate sauce', 290.00, true, true),
('f0000000-0000-0000-0071-000000000006', 'e0000000-0000-0000-0000-000000000071', 'd0000000-0000-0000-0000-000000000008', 'Iced Latte', 'Cold brewed espresso over ice with milk', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R072
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0072-000000000001', 'e0000000-0000-0000-0000-000000000072', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0072-000000000002', 'e0000000-0000-0000-0000-000000000072', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0072-000000000003', 'e0000000-0000-0000-0000-000000000072', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0072-000000000004', 'e0000000-0000-0000-0000-000000000072', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0072-000000000005', 'e0000000-0000-0000-0000-000000000072', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0072-000000000006', 'e0000000-0000-0000-0000-000000000072', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R073
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0073-000000000001', 'e0000000-0000-0000-0000-000000000073', 'd0000000-0000-0000-0000-000000000008', 'Mango Milkshake', 'Thick Alphonso mango shake with vanilla ice cream', 150.00, true, true),
('f0000000-0000-0000-0073-000000000002', 'e0000000-0000-0000-0000-000000000073', 'd0000000-0000-0000-0000-000000000008', 'Watermelon Juice', 'Fresh pressed watermelon juice with mint', 90.00, true, true),
('f0000000-0000-0000-0073-000000000003', 'e0000000-0000-0000-0000-000000000073', 'd0000000-0000-0000-0000-000000000007', 'Mixed Fruit Bowl', 'Seasonal fruits with ice cream and honey drizzle', 180.00, true, true),
('f0000000-0000-0000-0073-000000000004', 'e0000000-0000-0000-0000-000000000073', 'd0000000-0000-0000-0000-000000000008', 'Tender Coconut', 'Fresh tender coconut water served chilled', 60.00, true, true),
('f0000000-0000-0000-0073-000000000005', 'e0000000-0000-0000-0000-000000000073', 'd0000000-0000-0000-0000-000000000008', 'Chocolate Shake', 'Rich chocolate milkshake with whipped cream', 160.00, true, true),
('f0000000-0000-0000-0073-000000000006', 'e0000000-0000-0000-0000-000000000073', 'd0000000-0000-0000-0000-000000000007', 'Fruit Sundae', 'Mixed fruit sundae with vanilla ice cream and nuts', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R074
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0074-000000000001', 'e0000000-0000-0000-0000-000000000074', 'd0000000-0000-0000-0000-000000000010', 'Chicken Shawarma', 'Grilled chicken wrapped in pita with garlic mayo and pickles', 150.00, false, true),
('f0000000-0000-0000-0074-000000000002', 'e0000000-0000-0000-0000-000000000074', 'd0000000-0000-0000-0000-000000000010', 'Mutton Shawarma', 'Spiced lamb shawarma with tahini and pickled turnips', 180.00, false, true),
('f0000000-0000-0000-0074-000000000003', 'e0000000-0000-0000-0000-000000000074', 'd0000000-0000-0000-0000-000000000010', 'Falafel Wrap', 'Crispy chickpea falafel with hummus and fresh salad', 130.00, true, true),
('f0000000-0000-0000-0074-000000000004', 'e0000000-0000-0000-0000-000000000074', 'd0000000-0000-0000-0000-000000000010', 'Loaded Fries', 'French fries topped with cheese, jalapenos, and sauce', 150.00, true, true),
('f0000000-0000-0000-0074-000000000005', 'e0000000-0000-0000-0000-000000000074', 'd0000000-0000-0000-0000-000000000004', 'Chicken Kebab Plate', 'Grilled kebabs with rice, salad, and garlic sauce', 220.00, false, true),
('f0000000-0000-0000-0074-000000000006', 'e0000000-0000-0000-0000-000000000074', 'd0000000-0000-0000-0000-000000000008', 'Lemon Mint Cooler', 'Fresh mint and lime with soda and crushed ice', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R075
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0075-000000000001', 'e0000000-0000-0000-0000-000000000075', 'd0000000-0000-0000-0000-000000000008', 'Kulhad Chai', 'Masala chai in earthen kulhad, fragrant and comforting', 60.00, true, true),
('f0000000-0000-0000-0075-000000000002', 'e0000000-0000-0000-0000-000000000075', 'd0000000-0000-0000-0000-000000000010', 'Bun Maska', 'Toasted bun with Amul butter, the perfect chai partner', 50.00, true, true),
('f0000000-0000-0000-0075-000000000003', 'e0000000-0000-0000-0000-000000000075', 'd0000000-0000-0000-0000-000000000010', 'Maggi', 'Classic 2-minute noodles with extra veggies and spice', 80.00, true, true),
('f0000000-0000-0000-0075-000000000004', 'e0000000-0000-0000-0000-000000000075', 'd0000000-0000-0000-0000-000000000010', 'Cheese Grilled Sandwich', 'Multigrain bread with vegetables and melted cheese', 120.00, true, true),
('f0000000-0000-0000-0075-000000000005', 'e0000000-0000-0000-0000-000000000075', 'd0000000-0000-0000-0000-000000000008', 'Iced Chai', 'Cold-brewed masala chai over ice with condensed milk', 90.00, true, true),
('f0000000-0000-0000-0075-000000000006', 'e0000000-0000-0000-0000-000000000075', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Lava Cake', 'Mini cake with molten chocolate centre and ice cream', 150.00, true, true)
ON CONFLICT DO NOTHING;

-- R076
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0076-000000000001', 'e0000000-0000-0000-0000-000000000076', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0076-000000000002', 'e0000000-0000-0000-0000-000000000076', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0076-000000000003', 'e0000000-0000-0000-0000-000000000076', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0076-000000000004', 'e0000000-0000-0000-0000-000000000076', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0076-000000000005', 'e0000000-0000-0000-0000-000000000076', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0076-000000000006', 'e0000000-0000-0000-0000-000000000076', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R077
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0077-000000000001', 'e0000000-0000-0000-0000-000000000077', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0077-000000000002', 'e0000000-0000-0000-0000-000000000077', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0077-000000000003', 'e0000000-0000-0000-0000-000000000077', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0077-000000000004', 'e0000000-0000-0000-0000-000000000077', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0077-000000000005', 'e0000000-0000-0000-0000-000000000077', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0077-000000000006', 'e0000000-0000-0000-0000-000000000077', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R078
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0078-000000000001', 'e0000000-0000-0000-0000-000000000078', 'd0000000-0000-0000-0000-000000000002', 'Tuna Tartare', 'Fresh tuna with avocado, sesame, and yuzu dressing', 680.00, false, true),
('f0000000-0000-0000-0078-000000000002', 'e0000000-0000-0000-0000-000000000078', 'd0000000-0000-0000-0000-000000000004', 'Lamb Rack', 'Herb-crusted lamb rack with rosemary jus', 1200.00, false, true),
('f0000000-0000-0000-0078-000000000003', 'e0000000-0000-0000-0000-000000000078', 'd0000000-0000-0000-0000-000000000004', 'Risotto al Funghi', 'Arborio rice with porcini mushrooms and truffle oil', 650.00, true, true),
('f0000000-0000-0000-0078-000000000004', 'e0000000-0000-0000-0000-000000000078', 'd0000000-0000-0000-0000-000000000003', 'Lobster Bisque', 'Velvety lobster soup with cognac cream', 520.00, false, true),
('f0000000-0000-0000-0078-000000000005', 'e0000000-0000-0000-0000-000000000078', 'd0000000-0000-0000-0000-000000000007', 'Creme Brulee', 'Vanilla custard with caramelised sugar crust', 420.00, true, true),
('f0000000-0000-0000-0078-000000000006', 'e0000000-0000-0000-0000-000000000078', 'd0000000-0000-0000-0000-000000000008', 'Espresso Martini', 'Shaken espresso with coffee liqueur, non-alc available', 480.00, true, true)
ON CONFLICT DO NOTHING;

-- R079
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0079-000000000001', 'e0000000-0000-0000-0000-000000000079', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0079-000000000002', 'e0000000-0000-0000-0000-000000000079', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0079-000000000003', 'e0000000-0000-0000-0000-000000000079', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0079-000000000004', 'e0000000-0000-0000-0000-000000000079', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0079-000000000005', 'e0000000-0000-0000-0000-000000000079', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0079-000000000006', 'e0000000-0000-0000-0000-000000000079', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R080
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0080-000000000001', 'e0000000-0000-0000-0000-000000000080', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0080-000000000002', 'e0000000-0000-0000-0000-000000000080', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0080-000000000003', 'e0000000-0000-0000-0000-000000000080', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0080-000000000004', 'e0000000-0000-0000-0000-000000000080', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0080-000000000005', 'e0000000-0000-0000-0000-000000000080', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0080-000000000006', 'e0000000-0000-0000-0000-000000000080', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R081
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0081-000000000001', 'e0000000-0000-0000-0000-000000000081', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0081-000000000002', 'e0000000-0000-0000-0000-000000000081', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0081-000000000003', 'e0000000-0000-0000-0000-000000000081', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0081-000000000004', 'e0000000-0000-0000-0000-000000000081', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0081-000000000005', 'e0000000-0000-0000-0000-000000000081', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0081-000000000006', 'e0000000-0000-0000-0000-000000000081', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R082
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0082-000000000001', 'e0000000-0000-0000-0000-000000000082', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0082-000000000002', 'e0000000-0000-0000-0000-000000000082', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0082-000000000003', 'e0000000-0000-0000-0000-000000000082', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0082-000000000004', 'e0000000-0000-0000-0000-000000000082', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0082-000000000005', 'e0000000-0000-0000-0000-000000000082', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0082-000000000006', 'e0000000-0000-0000-0000-000000000082', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R083
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0083-000000000001', 'e0000000-0000-0000-0000-000000000083', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in creamy tomato gravy', 310.00, false, true),
('f0000000-0000-0000-0083-000000000002', 'e0000000-0000-0000-0000-000000000083', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice with spiced chicken and fried onions', 260.00, false, true),
('f0000000-0000-0000-0083-000000000003', 'e0000000-0000-0000-0000-000000000083', 'd0000000-0000-0000-0000-000000000004', 'Kadai Paneer', 'Cottage cheese in spicy capsicum-onion gravy', 240.00, true, true),
('f0000000-0000-0000-0083-000000000004', 'e0000000-0000-0000-0000-000000000083', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Wok-tossed noodles in fiery schezwan sauce', 180.00, true, true),
('f0000000-0000-0000-0083-000000000005', 'e0000000-0000-0000-0000-000000000083', 'd0000000-0000-0000-0000-000000000006', 'Naan', 'Soft tandoor-baked flatbread with butter', 60.00, true, true),
('f0000000-0000-0000-0083-000000000006', 'e0000000-0000-0000-0000-000000000083', 'd0000000-0000-0000-0000-000000000008', 'Mango Lassi', 'Thick Alphonso mango yoghurt smoothie', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R084
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0084-000000000001', 'e0000000-0000-0000-0000-000000000084', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0084-000000000002', 'e0000000-0000-0000-0000-000000000084', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0084-000000000003', 'e0000000-0000-0000-0000-000000000084', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0084-000000000004', 'e0000000-0000-0000-0000-000000000084', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0084-000000000005', 'e0000000-0000-0000-0000-000000000084', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0084-000000000006', 'e0000000-0000-0000-0000-000000000084', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R085
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0085-000000000001', 'e0000000-0000-0000-0000-000000000085', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0085-000000000002', 'e0000000-0000-0000-0000-000000000085', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0085-000000000003', 'e0000000-0000-0000-0000-000000000085', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0085-000000000004', 'e0000000-0000-0000-0000-000000000085', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0085-000000000005', 'e0000000-0000-0000-0000-000000000085', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0085-000000000006', 'e0000000-0000-0000-0000-000000000085', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R086
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0086-000000000001', 'e0000000-0000-0000-0000-000000000086', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0086-000000000002', 'e0000000-0000-0000-0000-000000000086', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0086-000000000003', 'e0000000-0000-0000-0000-000000000086', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0086-000000000004', 'e0000000-0000-0000-0000-000000000086', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0086-000000000005', 'e0000000-0000-0000-0000-000000000086', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0086-000000000006', 'e0000000-0000-0000-0000-000000000086', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R087
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0087-000000000001', 'e0000000-0000-0000-0000-000000000087', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0087-000000000002', 'e0000000-0000-0000-0000-000000000087', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0087-000000000003', 'e0000000-0000-0000-0000-000000000087', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0087-000000000004', 'e0000000-0000-0000-0000-000000000087', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0087-000000000005', 'e0000000-0000-0000-0000-000000000087', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0087-000000000006', 'e0000000-0000-0000-0000-000000000087', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R088
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0088-000000000001', 'e0000000-0000-0000-0000-000000000088', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0088-000000000002', 'e0000000-0000-0000-0000-000000000088', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0088-000000000003', 'e0000000-0000-0000-0000-000000000088', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0088-000000000004', 'e0000000-0000-0000-0000-000000000088', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0088-000000000005', 'e0000000-0000-0000-0000-000000000088', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0088-000000000006', 'e0000000-0000-0000-0000-000000000088', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R089
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0089-000000000001', 'e0000000-0000-0000-0000-000000000089', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0089-000000000002', 'e0000000-0000-0000-0000-000000000089', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0089-000000000003', 'e0000000-0000-0000-0000-000000000089', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0089-000000000004', 'e0000000-0000-0000-0000-000000000089', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0089-000000000005', 'e0000000-0000-0000-0000-000000000089', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0089-000000000006', 'e0000000-0000-0000-0000-000000000089', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R090
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0090-000000000001', 'e0000000-0000-0000-0000-000000000090', 'd0000000-0000-0000-0000-000000000008', 'Cappuccino', 'Velvety espresso with perfectly steamed milk', 180.00, true, true),
('f0000000-0000-0000-0090-000000000002', 'e0000000-0000-0000-0000-000000000090', 'd0000000-0000-0000-0000-000000000001', 'Avocado Toast', 'Sourdough with smashed avocado, feta, and chilli flakes', 280.00, true, true),
('f0000000-0000-0000-0090-000000000003', 'e0000000-0000-0000-0000-000000000090', 'd0000000-0000-0000-0000-000000000004', 'Grilled Chicken Sandwich', 'Herb chicken with lettuce, cheese, and pesto on ciabatta', 320.00, false, true),
('f0000000-0000-0000-0090-000000000004', 'e0000000-0000-0000-0000-000000000090', 'd0000000-0000-0000-0000-000000000001', 'Pancake Stack', 'Fluffy buttermilk pancakes with maple syrup and berries', 260.00, true, true),
('f0000000-0000-0000-0090-000000000005', 'e0000000-0000-0000-0000-000000000090', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Brownie', 'Warm brownie with vanilla ice cream and chocolate sauce', 290.00, true, true),
('f0000000-0000-0000-0090-000000000006', 'e0000000-0000-0000-0000-000000000090', 'd0000000-0000-0000-0000-000000000008', 'Iced Latte', 'Cold brewed espresso over ice with milk', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R091
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0091-000000000001', 'e0000000-0000-0000-0000-000000000091', 'd0000000-0000-0000-0000-000000000004', 'Fish Curry Meals', 'Kerala-style fish curry with matta rice and thoran', 180.00, false, true),
('f0000000-0000-0000-0091-000000000002', 'e0000000-0000-0000-0000-000000000091', 'd0000000-0000-0000-0000-000000000004', 'Chicken Stew', 'Mild coconut milk stew with chicken and vegetables', 200.00, false, true),
('f0000000-0000-0000-0091-000000000003', 'e0000000-0000-0000-0000-000000000091', 'd0000000-0000-0000-0000-000000000006', 'Appam (2 pcs)', 'Lacy rice hoppers with soft centre, perfect with stew', 60.00, true, true),
('f0000000-0000-0000-0091-000000000004', 'e0000000-0000-0000-0000-000000000091', 'd0000000-0000-0000-0000-000000000002', 'Prawn Fry', 'Fresh prawns marinated in Kerala spices and shallow-fried', 250.00, false, true),
('f0000000-0000-0000-0091-000000000005', 'e0000000-0000-0000-0000-000000000091', 'd0000000-0000-0000-0000-000000000004', 'Meen Pollichathu', 'Fish grilled in banana leaf with Kerala masala', 320.00, false, true),
('f0000000-0000-0000-0091-000000000006', 'e0000000-0000-0000-0000-000000000091', 'd0000000-0000-0000-0000-000000000007', 'Payasam', 'Creamy vermicelli kheer with cardamom and cashews', 60.00, true, true)
ON CONFLICT DO NOTHING;

-- R092
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0092-000000000001', 'e0000000-0000-0000-0000-000000000092', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in creamy tomato gravy', 310.00, false, true),
('f0000000-0000-0000-0092-000000000002', 'e0000000-0000-0000-0000-000000000092', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice with spiced chicken and fried onions', 260.00, false, true),
('f0000000-0000-0000-0092-000000000003', 'e0000000-0000-0000-0000-000000000092', 'd0000000-0000-0000-0000-000000000004', 'Kadai Paneer', 'Cottage cheese in spicy capsicum-onion gravy', 240.00, true, true),
('f0000000-0000-0000-0092-000000000004', 'e0000000-0000-0000-0000-000000000092', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Wok-tossed noodles in fiery schezwan sauce', 180.00, true, true),
('f0000000-0000-0000-0092-000000000005', 'e0000000-0000-0000-0000-000000000092', 'd0000000-0000-0000-0000-000000000006', 'Naan', 'Soft tandoor-baked flatbread with butter', 60.00, true, true),
('f0000000-0000-0000-0092-000000000006', 'e0000000-0000-0000-0000-000000000092', 'd0000000-0000-0000-0000-000000000008', 'Mango Lassi', 'Thick Alphonso mango yoghurt smoothie', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R093
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0093-000000000001', 'e0000000-0000-0000-0000-000000000093', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0093-000000000002', 'e0000000-0000-0000-0000-000000000093', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0093-000000000003', 'e0000000-0000-0000-0000-000000000093', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0093-000000000004', 'e0000000-0000-0000-0000-000000000093', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0093-000000000005', 'e0000000-0000-0000-0000-000000000093', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0093-000000000006', 'e0000000-0000-0000-0000-000000000093', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R094
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0094-000000000001', 'e0000000-0000-0000-0000-000000000094', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0094-000000000002', 'e0000000-0000-0000-0000-000000000094', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0094-000000000003', 'e0000000-0000-0000-0000-000000000094', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0094-000000000004', 'e0000000-0000-0000-0000-000000000094', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0094-000000000005', 'e0000000-0000-0000-0000-000000000094', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0094-000000000006', 'e0000000-0000-0000-0000-000000000094', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R095
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0095-000000000001', 'e0000000-0000-0000-0000-000000000095', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0095-000000000002', 'e0000000-0000-0000-0000-000000000095', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0095-000000000003', 'e0000000-0000-0000-0000-000000000095', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0095-000000000004', 'e0000000-0000-0000-0000-000000000095', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0095-000000000005', 'e0000000-0000-0000-0000-000000000095', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0095-000000000006', 'e0000000-0000-0000-0000-000000000095', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R096
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0096-000000000001', 'e0000000-0000-0000-0000-000000000096', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0096-000000000002', 'e0000000-0000-0000-0000-000000000096', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0096-000000000003', 'e0000000-0000-0000-0000-000000000096', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0096-000000000004', 'e0000000-0000-0000-0000-000000000096', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0096-000000000005', 'e0000000-0000-0000-0000-000000000096', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0096-000000000006', 'e0000000-0000-0000-0000-000000000096', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R097
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0097-000000000001', 'e0000000-0000-0000-0000-000000000097', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in creamy tomato gravy', 310.00, false, true),
('f0000000-0000-0000-0097-000000000002', 'e0000000-0000-0000-0000-000000000097', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice with spiced chicken and fried onions', 260.00, false, true),
('f0000000-0000-0000-0097-000000000003', 'e0000000-0000-0000-0000-000000000097', 'd0000000-0000-0000-0000-000000000004', 'Kadai Paneer', 'Cottage cheese in spicy capsicum-onion gravy', 240.00, true, true),
('f0000000-0000-0000-0097-000000000004', 'e0000000-0000-0000-0000-000000000097', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Wok-tossed noodles in fiery schezwan sauce', 180.00, true, true),
('f0000000-0000-0000-0097-000000000005', 'e0000000-0000-0000-0000-000000000097', 'd0000000-0000-0000-0000-000000000006', 'Naan', 'Soft tandoor-baked flatbread with butter', 60.00, true, true),
('f0000000-0000-0000-0097-000000000006', 'e0000000-0000-0000-0000-000000000097', 'd0000000-0000-0000-0000-000000000008', 'Mango Lassi', 'Thick Alphonso mango yoghurt smoothie', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R098
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0098-000000000001', 'e0000000-0000-0000-0000-000000000098', 'd0000000-0000-0000-0000-000000000002', 'Chicken Manchurian', 'Crispy chicken balls in tangy Indo-Chinese sauce', 220.00, false, true),
('f0000000-0000-0000-0098-000000000002', 'e0000000-0000-0000-0000-000000000098', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Hakka noodles in fiery schezwan sauce with vegetables', 180.00, true, true),
('f0000000-0000-0000-0098-000000000003', 'e0000000-0000-0000-0000-000000000098', 'd0000000-0000-0000-0000-000000000002', 'Chilli Paneer', 'Crispy paneer with bell peppers and green chillies', 200.00, true, true),
('f0000000-0000-0000-0098-000000000004', 'e0000000-0000-0000-0000-000000000098', 'd0000000-0000-0000-0000-000000000005', 'Fried Rice', 'Wok-fried rice with vegetables and soy sauce', 170.00, true, true),
('f0000000-0000-0000-0098-000000000005', 'e0000000-0000-0000-0000-000000000098', 'd0000000-0000-0000-0000-000000000003', 'Hot and Sour Soup', 'Spicy-tangy broth with vegetables and tofu', 120.00, true, true),
('f0000000-0000-0000-0098-000000000006', 'e0000000-0000-0000-0000-000000000098', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Squeezed lime with soda and a pinch of salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R099
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0099-000000000001', 'e0000000-0000-0000-0000-000000000099', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0099-000000000002', 'e0000000-0000-0000-0000-000000000099', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0099-000000000003', 'e0000000-0000-0000-0000-000000000099', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0099-000000000004', 'e0000000-0000-0000-0000-000000000099', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0099-000000000005', 'e0000000-0000-0000-0000-000000000099', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0099-000000000006', 'e0000000-0000-0000-0000-000000000099', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R100
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0100-000000000001', 'e0000000-0000-0000-0000-000000000100', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0100-000000000002', 'e0000000-0000-0000-0000-000000000100', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0100-000000000003', 'e0000000-0000-0000-0000-000000000100', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0100-000000000004', 'e0000000-0000-0000-0000-000000000100', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0100-000000000005', 'e0000000-0000-0000-0000-000000000100', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0100-000000000006', 'e0000000-0000-0000-0000-000000000100', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R101
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0101-000000000001', 'e0000000-0000-0000-0000-000000000101', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0101-000000000002', 'e0000000-0000-0000-0000-000000000101', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0101-000000000003', 'e0000000-0000-0000-0000-000000000101', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0101-000000000004', 'e0000000-0000-0000-0000-000000000101', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0101-000000000005', 'e0000000-0000-0000-0000-000000000101', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0101-000000000006', 'e0000000-0000-0000-0000-000000000101', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R102
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0102-000000000001', 'e0000000-0000-0000-0000-000000000102', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0102-000000000002', 'e0000000-0000-0000-0000-000000000102', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0102-000000000003', 'e0000000-0000-0000-0000-000000000102', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0102-000000000004', 'e0000000-0000-0000-0000-000000000102', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0102-000000000005', 'e0000000-0000-0000-0000-000000000102', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0102-000000000006', 'e0000000-0000-0000-0000-000000000102', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R103
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0103-000000000001', 'e0000000-0000-0000-0000-000000000103', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0103-000000000002', 'e0000000-0000-0000-0000-000000000103', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0103-000000000003', 'e0000000-0000-0000-0000-000000000103', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0103-000000000004', 'e0000000-0000-0000-0000-000000000103', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0103-000000000005', 'e0000000-0000-0000-0000-000000000103', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0103-000000000006', 'e0000000-0000-0000-0000-000000000103', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R104
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0104-000000000001', 'e0000000-0000-0000-0000-000000000104', 'd0000000-0000-0000-0000-000000000002', 'BBQ Chicken Wings', 'Smoky grilled wings with tangy barbecue glaze', 320.00, false, true),
('f0000000-0000-0000-0104-000000000002', 'e0000000-0000-0000-0000-000000000104', 'd0000000-0000-0000-0000-000000000002', 'Lamb Seekh Kebab', 'Minced lamb with spices grilled on charcoal skewers', 380.00, false, true),
('f0000000-0000-0000-0104-000000000003', 'e0000000-0000-0000-0000-000000000104', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky grilled cottage cheese with capsicum and onion', 280.00, true, true),
('f0000000-0000-0000-0104-000000000004', 'e0000000-0000-0000-0000-000000000104', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant dum biryani with tender chicken pieces', 290.00, false, true),
('f0000000-0000-0000-0104-000000000005', 'e0000000-0000-0000-0000-000000000104', 'd0000000-0000-0000-0000-000000000004', 'Dal Tadka', 'Yellow lentils tempered with cumin, garlic, and chillies', 180.00, true, true),
('f0000000-0000-0000-0104-000000000006', 'e0000000-0000-0000-0000-000000000104', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun', 'Warm milk-solid dumplings in sugary rose syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R105
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0105-000000000001', 'e0000000-0000-0000-0000-000000000105', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0105-000000000002', 'e0000000-0000-0000-0000-000000000105', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0105-000000000003', 'e0000000-0000-0000-0000-000000000105', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0105-000000000004', 'e0000000-0000-0000-0000-000000000105', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0105-000000000005', 'e0000000-0000-0000-0000-000000000105', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0105-000000000006', 'e0000000-0000-0000-0000-000000000105', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R106
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0106-000000000001', 'e0000000-0000-0000-0000-000000000106', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0106-000000000002', 'e0000000-0000-0000-0000-000000000106', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0106-000000000003', 'e0000000-0000-0000-0000-000000000106', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0106-000000000004', 'e0000000-0000-0000-0000-000000000106', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0106-000000000005', 'e0000000-0000-0000-0000-000000000106', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0106-000000000006', 'e0000000-0000-0000-0000-000000000106', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R107
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0107-000000000001', 'e0000000-0000-0000-0000-000000000107', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0107-000000000002', 'e0000000-0000-0000-0000-000000000107', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0107-000000000003', 'e0000000-0000-0000-0000-000000000107', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0107-000000000004', 'e0000000-0000-0000-0000-000000000107', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0107-000000000005', 'e0000000-0000-0000-0000-000000000107', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0107-000000000006', 'e0000000-0000-0000-0000-000000000107', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R108
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0108-000000000001', 'e0000000-0000-0000-0000-000000000108', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0108-000000000002', 'e0000000-0000-0000-0000-000000000108', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0108-000000000003', 'e0000000-0000-0000-0000-000000000108', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0108-000000000004', 'e0000000-0000-0000-0000-000000000108', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0108-000000000005', 'e0000000-0000-0000-0000-000000000108', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0108-000000000006', 'e0000000-0000-0000-0000-000000000108', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R109
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0109-000000000001', 'e0000000-0000-0000-0000-000000000109', 'd0000000-0000-0000-0000-000000000007', 'Liquid Truffle Cake', 'Warm chocolate cake with molten truffle centre', 350.00, true, true),
('f0000000-0000-0000-0109-000000000002', 'e0000000-0000-0000-0000-000000000109', 'd0000000-0000-0000-0000-000000000007', 'Artisan Chocolate Bar', 'Single-origin dark chocolate with sea salt', 280.00, true, true),
('f0000000-0000-0000-0109-000000000003', 'e0000000-0000-0000-0000-000000000109', 'd0000000-0000-0000-0000-000000000008', 'Hot Chocolate', 'Rich Belgian chocolate melted into steamed milk', 220.00, true, true),
('f0000000-0000-0000-0109-000000000004', 'e0000000-0000-0000-0000-000000000109', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Mousse', 'Light airy mousse with dark chocolate shavings', 300.00, true, true),
('f0000000-0000-0000-0109-000000000005', 'e0000000-0000-0000-0000-000000000109', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Fondant', 'Warm cake with liquid chocolate centre and ice cream', 380.00, true, true),
('f0000000-0000-0000-0109-000000000006', 'e0000000-0000-0000-0000-000000000109', 'd0000000-0000-0000-0000-000000000008', 'Cold Brew Coffee', 'Slow-brewed for 18 hours, served over ice', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R110
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0110-000000000001', 'e0000000-0000-0000-0000-000000000110', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0110-000000000002', 'e0000000-0000-0000-0000-000000000110', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0110-000000000003', 'e0000000-0000-0000-0000-000000000110', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0110-000000000004', 'e0000000-0000-0000-0000-000000000110', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0110-000000000005', 'e0000000-0000-0000-0000-000000000110', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0110-000000000006', 'e0000000-0000-0000-0000-000000000110', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R111
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0111-000000000001', 'e0000000-0000-0000-0000-000000000111', 'd0000000-0000-0000-0000-000000000002', 'Crispy Fried Chicken', 'Crunchy golden-fried chicken with Chennai spice coating', 180.00, false, true),
('f0000000-0000-0000-0111-000000000002', 'e0000000-0000-0000-0000-000000000111', 'd0000000-0000-0000-0000-000000000010', 'Veg Burger', 'Crispy aloo tikki with lettuce, tomato, and signature sauce', 99.00, true, true),
('f0000000-0000-0000-0111-000000000003', 'e0000000-0000-0000-0000-000000000111', 'd0000000-0000-0000-0000-000000000010', 'Chicken Shawarma', 'Grilled chicken in rumali roti with garlic mayo', 130.00, false, true),
('f0000000-0000-0000-0111-000000000004', 'e0000000-0000-0000-0000-000000000111', 'd0000000-0000-0000-0000-000000000004', 'Noodles Combo', 'Hakka noodles with manchurian and a soft drink', 199.00, false, true),
('f0000000-0000-0000-0111-000000000005', 'e0000000-0000-0000-0000-000000000111', 'd0000000-0000-0000-0000-000000000001', 'Idli Vada Combo', 'Two idlis and one vada with sambar and chutney', 80.00, true, true),
('f0000000-0000-0000-0111-000000000006', 'e0000000-0000-0000-0000-000000000111', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Freshly squeezed lime with soda and salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R112
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0112-000000000001', 'e0000000-0000-0000-0000-000000000112', 'd0000000-0000-0000-0000-000000000008', 'Cappuccino', 'Velvety espresso with perfectly steamed milk', 180.00, true, true),
('f0000000-0000-0000-0112-000000000002', 'e0000000-0000-0000-0000-000000000112', 'd0000000-0000-0000-0000-000000000001', 'Avocado Toast', 'Sourdough with smashed avocado, feta, and chilli flakes', 280.00, true, true),
('f0000000-0000-0000-0112-000000000003', 'e0000000-0000-0000-0000-000000000112', 'd0000000-0000-0000-0000-000000000004', 'Grilled Chicken Sandwich', 'Herb chicken with lettuce, cheese, and pesto on ciabatta', 320.00, false, true),
('f0000000-0000-0000-0112-000000000004', 'e0000000-0000-0000-0000-000000000112', 'd0000000-0000-0000-0000-000000000001', 'Pancake Stack', 'Fluffy buttermilk pancakes with maple syrup and berries', 260.00, true, true),
('f0000000-0000-0000-0112-000000000005', 'e0000000-0000-0000-0000-000000000112', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Brownie', 'Warm brownie with vanilla ice cream and chocolate sauce', 290.00, true, true),
('f0000000-0000-0000-0112-000000000006', 'e0000000-0000-0000-0000-000000000112', 'd0000000-0000-0000-0000-000000000008', 'Iced Latte', 'Cold brewed espresso over ice with milk', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R113
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0113-000000000001', 'e0000000-0000-0000-0000-000000000113', 'd0000000-0000-0000-0000-000000000002', 'Chicken Manchurian', 'Crispy chicken balls in tangy Indo-Chinese sauce', 220.00, false, true),
('f0000000-0000-0000-0113-000000000002', 'e0000000-0000-0000-0000-000000000113', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Hakka noodles in fiery schezwan sauce with vegetables', 180.00, true, true),
('f0000000-0000-0000-0113-000000000003', 'e0000000-0000-0000-0000-000000000113', 'd0000000-0000-0000-0000-000000000002', 'Chilli Paneer', 'Crispy paneer with bell peppers and green chillies', 200.00, true, true),
('f0000000-0000-0000-0113-000000000004', 'e0000000-0000-0000-0000-000000000113', 'd0000000-0000-0000-0000-000000000005', 'Fried Rice', 'Wok-fried rice with vegetables and soy sauce', 170.00, true, true),
('f0000000-0000-0000-0113-000000000005', 'e0000000-0000-0000-0000-000000000113', 'd0000000-0000-0000-0000-000000000003', 'Hot and Sour Soup', 'Spicy-tangy broth with vegetables and tofu', 120.00, true, true),
('f0000000-0000-0000-0113-000000000006', 'e0000000-0000-0000-0000-000000000113', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Squeezed lime with soda and a pinch of salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R114
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0114-000000000001', 'e0000000-0000-0000-0000-000000000114', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0114-000000000002', 'e0000000-0000-0000-0000-000000000114', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0114-000000000003', 'e0000000-0000-0000-0000-000000000114', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0114-000000000004', 'e0000000-0000-0000-0000-000000000114', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0114-000000000005', 'e0000000-0000-0000-0000-000000000114', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0114-000000000006', 'e0000000-0000-0000-0000-000000000114', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R115
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0115-000000000001', 'e0000000-0000-0000-0000-000000000115', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0115-000000000002', 'e0000000-0000-0000-0000-000000000115', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0115-000000000003', 'e0000000-0000-0000-0000-000000000115', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0115-000000000004', 'e0000000-0000-0000-0000-000000000115', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0115-000000000005', 'e0000000-0000-0000-0000-000000000115', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0115-000000000006', 'e0000000-0000-0000-0000-000000000115', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R116
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0116-000000000001', 'e0000000-0000-0000-0000-000000000116', 'd0000000-0000-0000-0000-000000000008', 'Cappuccino', 'Velvety espresso with perfectly steamed milk', 180.00, true, true),
('f0000000-0000-0000-0116-000000000002', 'e0000000-0000-0000-0000-000000000116', 'd0000000-0000-0000-0000-000000000001', 'Avocado Toast', 'Sourdough with smashed avocado, feta, and chilli flakes', 280.00, true, true),
('f0000000-0000-0000-0116-000000000003', 'e0000000-0000-0000-0000-000000000116', 'd0000000-0000-0000-0000-000000000004', 'Grilled Chicken Sandwich', 'Herb chicken with lettuce, cheese, and pesto on ciabatta', 320.00, false, true),
('f0000000-0000-0000-0116-000000000004', 'e0000000-0000-0000-0000-000000000116', 'd0000000-0000-0000-0000-000000000001', 'Pancake Stack', 'Fluffy buttermilk pancakes with maple syrup and berries', 260.00, true, true),
('f0000000-0000-0000-0116-000000000005', 'e0000000-0000-0000-0000-000000000116', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Brownie', 'Warm brownie with vanilla ice cream and chocolate sauce', 290.00, true, true),
('f0000000-0000-0000-0116-000000000006', 'e0000000-0000-0000-0000-000000000116', 'd0000000-0000-0000-0000-000000000008', 'Iced Latte', 'Cold brewed espresso over ice with milk', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R117
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0117-000000000001', 'e0000000-0000-0000-0000-000000000117', 'd0000000-0000-0000-0000-000000000007', 'Liquid Truffle Cake', 'Warm chocolate cake with molten truffle centre', 350.00, true, true),
('f0000000-0000-0000-0117-000000000002', 'e0000000-0000-0000-0000-000000000117', 'd0000000-0000-0000-0000-000000000007', 'Artisan Chocolate Bar', 'Single-origin dark chocolate with sea salt', 280.00, true, true),
('f0000000-0000-0000-0117-000000000003', 'e0000000-0000-0000-0000-000000000117', 'd0000000-0000-0000-0000-000000000008', 'Hot Chocolate', 'Rich Belgian chocolate melted into steamed milk', 220.00, true, true),
('f0000000-0000-0000-0117-000000000004', 'e0000000-0000-0000-0000-000000000117', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Mousse', 'Light airy mousse with dark chocolate shavings', 300.00, true, true),
('f0000000-0000-0000-0117-000000000005', 'e0000000-0000-0000-0000-000000000117', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Fondant', 'Warm cake with liquid chocolate centre and ice cream', 380.00, true, true),
('f0000000-0000-0000-0117-000000000006', 'e0000000-0000-0000-0000-000000000117', 'd0000000-0000-0000-0000-000000000008', 'Cold Brew Coffee', 'Slow-brewed for 18 hours, served over ice', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R118
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0118-000000000001', 'e0000000-0000-0000-0000-000000000118', 'd0000000-0000-0000-0000-000000000002', 'BBQ Chicken Wings', 'Smoky grilled wings with tangy barbecue glaze', 320.00, false, true),
('f0000000-0000-0000-0118-000000000002', 'e0000000-0000-0000-0000-000000000118', 'd0000000-0000-0000-0000-000000000002', 'Lamb Seekh Kebab', 'Minced lamb with spices grilled on charcoal skewers', 380.00, false, true),
('f0000000-0000-0000-0118-000000000003', 'e0000000-0000-0000-0000-000000000118', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky grilled cottage cheese with capsicum and onion', 280.00, true, true),
('f0000000-0000-0000-0118-000000000004', 'e0000000-0000-0000-0000-000000000118', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant dum biryani with tender chicken pieces', 290.00, false, true),
('f0000000-0000-0000-0118-000000000005', 'e0000000-0000-0000-0000-000000000118', 'd0000000-0000-0000-0000-000000000004', 'Dal Tadka', 'Yellow lentils tempered with cumin, garlic, and chillies', 180.00, true, true),
('f0000000-0000-0000-0118-000000000006', 'e0000000-0000-0000-0000-000000000118', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun', 'Warm milk-solid dumplings in sugary rose syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R119
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0119-000000000001', 'e0000000-0000-0000-0000-000000000119', 'd0000000-0000-0000-0000-000000000002', 'Tuna Tartare', 'Fresh tuna with avocado, sesame, and yuzu dressing', 680.00, false, true),
('f0000000-0000-0000-0119-000000000002', 'e0000000-0000-0000-0000-000000000119', 'd0000000-0000-0000-0000-000000000004', 'Lamb Rack', 'Herb-crusted lamb rack with rosemary jus', 1200.00, false, true),
('f0000000-0000-0000-0119-000000000003', 'e0000000-0000-0000-0000-000000000119', 'd0000000-0000-0000-0000-000000000004', 'Risotto al Funghi', 'Arborio rice with porcini mushrooms and truffle oil', 650.00, true, true),
('f0000000-0000-0000-0119-000000000004', 'e0000000-0000-0000-0000-000000000119', 'd0000000-0000-0000-0000-000000000003', 'Lobster Bisque', 'Velvety lobster soup with cognac cream', 520.00, false, true),
('f0000000-0000-0000-0119-000000000005', 'e0000000-0000-0000-0000-000000000119', 'd0000000-0000-0000-0000-000000000007', 'Creme Brulee', 'Vanilla custard with caramelised sugar crust', 420.00, true, true),
('f0000000-0000-0000-0119-000000000006', 'e0000000-0000-0000-0000-000000000119', 'd0000000-0000-0000-0000-000000000008', 'Espresso Martini', 'Shaken espresso with coffee liqueur, non-alc available', 480.00, true, true)
ON CONFLICT DO NOTHING;

-- R120
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0120-000000000001', 'e0000000-0000-0000-0000-000000000120', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0120-000000000002', 'e0000000-0000-0000-0000-000000000120', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0120-000000000003', 'e0000000-0000-0000-0000-000000000120', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0120-000000000004', 'e0000000-0000-0000-0000-000000000120', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0120-000000000005', 'e0000000-0000-0000-0000-000000000120', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0120-000000000006', 'e0000000-0000-0000-0000-000000000120', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R121
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0121-000000000001', 'e0000000-0000-0000-0000-000000000121', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0121-000000000002', 'e0000000-0000-0000-0000-000000000121', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0121-000000000003', 'e0000000-0000-0000-0000-000000000121', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0121-000000000004', 'e0000000-0000-0000-0000-000000000121', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0121-000000000005', 'e0000000-0000-0000-0000-000000000121', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0121-000000000006', 'e0000000-0000-0000-0000-000000000121', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R122
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0122-000000000001', 'e0000000-0000-0000-0000-000000000122', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0122-000000000002', 'e0000000-0000-0000-0000-000000000122', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0122-000000000003', 'e0000000-0000-0000-0000-000000000122', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0122-000000000004', 'e0000000-0000-0000-0000-000000000122', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0122-000000000005', 'e0000000-0000-0000-0000-000000000122', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0122-000000000006', 'e0000000-0000-0000-0000-000000000122', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R123
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0123-000000000001', 'e0000000-0000-0000-0000-000000000123', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0123-000000000002', 'e0000000-0000-0000-0000-000000000123', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0123-000000000003', 'e0000000-0000-0000-0000-000000000123', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0123-000000000004', 'e0000000-0000-0000-0000-000000000123', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0123-000000000005', 'e0000000-0000-0000-0000-000000000123', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0123-000000000006', 'e0000000-0000-0000-0000-000000000123', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R124
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0124-000000000001', 'e0000000-0000-0000-0000-000000000124', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0124-000000000002', 'e0000000-0000-0000-0000-000000000124', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0124-000000000003', 'e0000000-0000-0000-0000-000000000124', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0124-000000000004', 'e0000000-0000-0000-0000-000000000124', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0124-000000000005', 'e0000000-0000-0000-0000-000000000124', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0124-000000000006', 'e0000000-0000-0000-0000-000000000124', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R125
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0125-000000000001', 'e0000000-0000-0000-0000-000000000125', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0125-000000000002', 'e0000000-0000-0000-0000-000000000125', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0125-000000000003', 'e0000000-0000-0000-0000-000000000125', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0125-000000000004', 'e0000000-0000-0000-0000-000000000125', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0125-000000000005', 'e0000000-0000-0000-0000-000000000125', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0125-000000000006', 'e0000000-0000-0000-0000-000000000125', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R126
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0126-000000000001', 'e0000000-0000-0000-0000-000000000126', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0126-000000000002', 'e0000000-0000-0000-0000-000000000126', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0126-000000000003', 'e0000000-0000-0000-0000-000000000126', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0126-000000000004', 'e0000000-0000-0000-0000-000000000126', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0126-000000000005', 'e0000000-0000-0000-0000-000000000126', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0126-000000000006', 'e0000000-0000-0000-0000-000000000126', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R127
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0127-000000000001', 'e0000000-0000-0000-0000-000000000127', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0127-000000000002', 'e0000000-0000-0000-0000-000000000127', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0127-000000000003', 'e0000000-0000-0000-0000-000000000127', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0127-000000000004', 'e0000000-0000-0000-0000-000000000127', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0127-000000000005', 'e0000000-0000-0000-0000-000000000127', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0127-000000000006', 'e0000000-0000-0000-0000-000000000127', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R128
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0128-000000000001', 'e0000000-0000-0000-0000-000000000128', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0128-000000000002', 'e0000000-0000-0000-0000-000000000128', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0128-000000000003', 'e0000000-0000-0000-0000-000000000128', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0128-000000000004', 'e0000000-0000-0000-0000-000000000128', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0128-000000000005', 'e0000000-0000-0000-0000-000000000128', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0128-000000000006', 'e0000000-0000-0000-0000-000000000128', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R129
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0129-000000000001', 'e0000000-0000-0000-0000-000000000129', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0129-000000000002', 'e0000000-0000-0000-0000-000000000129', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0129-000000000003', 'e0000000-0000-0000-0000-000000000129', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0129-000000000004', 'e0000000-0000-0000-0000-000000000129', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0129-000000000005', 'e0000000-0000-0000-0000-000000000129', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0129-000000000006', 'e0000000-0000-0000-0000-000000000129', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R130
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0130-000000000001', 'e0000000-0000-0000-0000-000000000130', 'd0000000-0000-0000-0000-000000000010', 'Mixture (250g)', 'Crunchy savoury mix of sev, peanuts, and dried chillies', 120.00, true, true),
('f0000000-0000-0000-0130-000000000002', 'e0000000-0000-0000-0000-000000000130', 'd0000000-0000-0000-0000-000000000010', 'Murukku (250g)', 'Spiral rice flour snack with cumin and sesame', 100.00, true, true),
('f0000000-0000-0000-0130-000000000003', 'e0000000-0000-0000-0000-000000000130', 'd0000000-0000-0000-0000-000000000007', 'Mysore Pak', 'Melt-in-mouth ghee fudge with gram flour and cardamom', 80.00, true, true),
('f0000000-0000-0000-0130-000000000004', 'e0000000-0000-0000-0000-000000000130', 'd0000000-0000-0000-0000-000000000007', 'Kaju Katli (250g)', 'Diamond-shaped cashew fudge with silver leaf', 350.00, true, true),
('f0000000-0000-0000-0130-000000000005', 'e0000000-0000-0000-0000-000000000130', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Veg thali with rice, sambar, rasam, curries, and sweet', 180.00, true, true),
('f0000000-0000-0000-0130-000000000006', 'e0000000-0000-0000-0000-000000000130', 'd0000000-0000-0000-0000-000000000007', 'Badusha', 'Flaky syrup-soaked pastry with cardamom aroma', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R131
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0131-000000000001', 'e0000000-0000-0000-0000-000000000131', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in creamy tomato gravy', 310.00, false, true),
('f0000000-0000-0000-0131-000000000002', 'e0000000-0000-0000-0000-000000000131', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice with spiced chicken and fried onions', 260.00, false, true),
('f0000000-0000-0000-0131-000000000003', 'e0000000-0000-0000-0000-000000000131', 'd0000000-0000-0000-0000-000000000004', 'Kadai Paneer', 'Cottage cheese in spicy capsicum-onion gravy', 240.00, true, true),
('f0000000-0000-0000-0131-000000000004', 'e0000000-0000-0000-0000-000000000131', 'd0000000-0000-0000-0000-000000000004', 'Schezwan Noodles', 'Wok-tossed noodles in fiery schezwan sauce', 180.00, true, true),
('f0000000-0000-0000-0131-000000000005', 'e0000000-0000-0000-0000-000000000131', 'd0000000-0000-0000-0000-000000000006', 'Naan', 'Soft tandoor-baked flatbread with butter', 60.00, true, true),
('f0000000-0000-0000-0131-000000000006', 'e0000000-0000-0000-0000-000000000131', 'd0000000-0000-0000-0000-000000000008', 'Mango Lassi', 'Thick Alphonso mango yoghurt smoothie', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R132
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0132-000000000001', 'e0000000-0000-0000-0000-000000000132', 'd0000000-0000-0000-0000-000000000008', 'Kulhad Chai', 'Masala chai in earthen kulhad, fragrant and comforting', 60.00, true, true),
('f0000000-0000-0000-0132-000000000002', 'e0000000-0000-0000-0000-000000000132', 'd0000000-0000-0000-0000-000000000010', 'Bun Maska', 'Toasted bun with Amul butter, the perfect chai partner', 50.00, true, true),
('f0000000-0000-0000-0132-000000000003', 'e0000000-0000-0000-0000-000000000132', 'd0000000-0000-0000-0000-000000000010', 'Maggi', 'Classic 2-minute noodles with extra veggies and spice', 80.00, true, true),
('f0000000-0000-0000-0132-000000000004', 'e0000000-0000-0000-0000-000000000132', 'd0000000-0000-0000-0000-000000000010', 'Cheese Grilled Sandwich', 'Multigrain bread with vegetables and melted cheese', 120.00, true, true),
('f0000000-0000-0000-0132-000000000005', 'e0000000-0000-0000-0000-000000000132', 'd0000000-0000-0000-0000-000000000008', 'Iced Chai', 'Cold-brewed masala chai over ice with condensed milk', 90.00, true, true),
('f0000000-0000-0000-0132-000000000006', 'e0000000-0000-0000-0000-000000000132', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Lava Cake', 'Mini cake with molten chocolate centre and ice cream', 150.00, true, true)
ON CONFLICT DO NOTHING;

-- R133
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0133-000000000001', 'e0000000-0000-0000-0000-000000000133', 'd0000000-0000-0000-0000-000000000010', 'Chicken Shawarma', 'Grilled chicken wrapped in pita with garlic mayo and pickles', 150.00, false, true),
('f0000000-0000-0000-0133-000000000002', 'e0000000-0000-0000-0000-000000000133', 'd0000000-0000-0000-0000-000000000010', 'Mutton Shawarma', 'Spiced lamb shawarma with tahini and pickled turnips', 180.00, false, true),
('f0000000-0000-0000-0133-000000000003', 'e0000000-0000-0000-0000-000000000133', 'd0000000-0000-0000-0000-000000000010', 'Falafel Wrap', 'Crispy chickpea falafel with hummus and fresh salad', 130.00, true, true),
('f0000000-0000-0000-0133-000000000004', 'e0000000-0000-0000-0000-000000000133', 'd0000000-0000-0000-0000-000000000010', 'Loaded Fries', 'French fries topped with cheese, jalapenos, and sauce', 150.00, true, true),
('f0000000-0000-0000-0133-000000000005', 'e0000000-0000-0000-0000-000000000133', 'd0000000-0000-0000-0000-000000000004', 'Chicken Kebab Plate', 'Grilled kebabs with rice, salad, and garlic sauce', 220.00, false, true),
('f0000000-0000-0000-0133-000000000006', 'e0000000-0000-0000-0000-000000000133', 'd0000000-0000-0000-0000-000000000008', 'Lemon Mint Cooler', 'Fresh mint and lime with soda and crushed ice', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R134
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0134-000000000001', 'e0000000-0000-0000-0000-000000000134', 'd0000000-0000-0000-0000-000000000002', 'Crispy Fried Chicken', 'Crunchy golden-fried chicken with Chennai spice coating', 180.00, false, true),
('f0000000-0000-0000-0134-000000000002', 'e0000000-0000-0000-0000-000000000134', 'd0000000-0000-0000-0000-000000000010', 'Veg Burger', 'Crispy aloo tikki with lettuce, tomato, and signature sauce', 99.00, true, true),
('f0000000-0000-0000-0134-000000000003', 'e0000000-0000-0000-0000-000000000134', 'd0000000-0000-0000-0000-000000000010', 'Chicken Shawarma', 'Grilled chicken in rumali roti with garlic mayo', 130.00, false, true),
('f0000000-0000-0000-0134-000000000004', 'e0000000-0000-0000-0000-000000000134', 'd0000000-0000-0000-0000-000000000004', 'Noodles Combo', 'Hakka noodles with manchurian and a soft drink', 199.00, false, true),
('f0000000-0000-0000-0134-000000000005', 'e0000000-0000-0000-0000-000000000134', 'd0000000-0000-0000-0000-000000000001', 'Idli Vada Combo', 'Two idlis and one vada with sambar and chutney', 80.00, true, true),
('f0000000-0000-0000-0134-000000000006', 'e0000000-0000-0000-0000-000000000134', 'd0000000-0000-0000-0000-000000000008', 'Fresh Lime Soda', 'Freshly squeezed lime with soda and salt', 50.00, true, true)
ON CONFLICT DO NOTHING;

-- R135
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0135-000000000001', 'e0000000-0000-0000-0000-000000000135', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0135-000000000002', 'e0000000-0000-0000-0000-000000000135', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0135-000000000003', 'e0000000-0000-0000-0000-000000000135', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0135-000000000004', 'e0000000-0000-0000-0000-000000000135', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0135-000000000005', 'e0000000-0000-0000-0000-000000000135', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0135-000000000006', 'e0000000-0000-0000-0000-000000000135', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R136
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0136-000000000001', 'e0000000-0000-0000-0000-000000000136', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0136-000000000002', 'e0000000-0000-0000-0000-000000000136', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0136-000000000003', 'e0000000-0000-0000-0000-000000000136', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0136-000000000004', 'e0000000-0000-0000-0000-000000000136', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0136-000000000005', 'e0000000-0000-0000-0000-000000000136', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0136-000000000006', 'e0000000-0000-0000-0000-000000000136', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R137
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0137-000000000001', 'e0000000-0000-0000-0000-000000000137', 'd0000000-0000-0000-0000-000000000004', 'Margherita Pizza', 'San Marzano tomato, mozzarella, basil, wood-fired', 399.00, true, true),
('f0000000-0000-0000-0137-000000000002', 'e0000000-0000-0000-0000-000000000137', 'd0000000-0000-0000-0000-000000000004', 'Pepperoni Pizza', 'Spicy pepperoni with chilli flakes on blistered crust', 499.00, false, true),
('f0000000-0000-0000-0137-000000000003', 'e0000000-0000-0000-0000-000000000137', 'd0000000-0000-0000-0000-000000000004', 'Penne Arrabbiata', 'Penne in spicy tomato sauce with garlic and chilli', 380.00, true, true),
('f0000000-0000-0000-0137-000000000004', 'e0000000-0000-0000-0000-000000000137', 'd0000000-0000-0000-0000-000000000002', 'Bruschetta', 'Toasted ciabatta with tomatoes, basil, and olive oil', 280.00, true, true),
('f0000000-0000-0000-0137-000000000005', 'e0000000-0000-0000-0000-000000000137', 'd0000000-0000-0000-0000-000000000007', 'Tiramisu', 'Espresso-soaked ladyfingers with mascarpone cream', 350.00, true, true),
('f0000000-0000-0000-0137-000000000006', 'e0000000-0000-0000-0000-000000000137', 'd0000000-0000-0000-0000-000000000003', 'Minestrone', 'Hearty Italian vegetable soup with beans and herbs', 250.00, true, true)
ON CONFLICT DO NOTHING;

-- R138
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0138-000000000001', 'e0000000-0000-0000-0000-000000000138', 'd0000000-0000-0000-0000-000000000008', 'Cappuccino', 'Velvety espresso with perfectly steamed milk', 180.00, true, true),
('f0000000-0000-0000-0138-000000000002', 'e0000000-0000-0000-0000-000000000138', 'd0000000-0000-0000-0000-000000000001', 'Avocado Toast', 'Sourdough with smashed avocado, feta, and chilli flakes', 280.00, true, true),
('f0000000-0000-0000-0138-000000000003', 'e0000000-0000-0000-0000-000000000138', 'd0000000-0000-0000-0000-000000000004', 'Grilled Chicken Sandwich', 'Herb chicken with lettuce, cheese, and pesto on ciabatta', 320.00, false, true),
('f0000000-0000-0000-0138-000000000004', 'e0000000-0000-0000-0000-000000000138', 'd0000000-0000-0000-0000-000000000001', 'Pancake Stack', 'Fluffy buttermilk pancakes with maple syrup and berries', 260.00, true, true),
('f0000000-0000-0000-0138-000000000005', 'e0000000-0000-0000-0000-000000000138', 'd0000000-0000-0000-0000-000000000007', 'Chocolate Brownie', 'Warm brownie with vanilla ice cream and chocolate sauce', 290.00, true, true),
('f0000000-0000-0000-0138-000000000006', 'e0000000-0000-0000-0000-000000000138', 'd0000000-0000-0000-0000-000000000008', 'Iced Latte', 'Cold brewed espresso over ice with milk', 200.00, true, true)
ON CONFLICT DO NOTHING;

-- R139
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0139-000000000001', 'e0000000-0000-0000-0000-000000000139', 'd0000000-0000-0000-0000-000000000002', 'Chicken Adana Kebab', 'Spiced minced chicken grilled on flat skewers', 380.00, false, true),
('f0000000-0000-0000-0139-000000000002', 'e0000000-0000-0000-0000-000000000139', 'd0000000-0000-0000-0000-000000000002', 'Lamb Kofte', 'Grilled lamb meatballs with yoghurt sauce', 420.00, false, true),
('f0000000-0000-0000-0139-000000000003', 'e0000000-0000-0000-0000-000000000139', 'd0000000-0000-0000-0000-000000000002', 'Hummus', 'Creamy chickpea dip with tahini, lemon, and olive oil', 220.00, true, true),
('f0000000-0000-0000-0139-000000000004', 'e0000000-0000-0000-0000-000000000139', 'd0000000-0000-0000-0000-000000000004', 'Mixed Grill Platter', 'Assorted grilled meats with rice and salad', 580.00, false, true),
('f0000000-0000-0000-0139-000000000005', 'e0000000-0000-0000-0000-000000000139', 'd0000000-0000-0000-0000-000000000002', 'Falafel Plate', 'Crispy chickpea fritters with hummus and pita', 280.00, true, true),
('f0000000-0000-0000-0139-000000000006', 'e0000000-0000-0000-0000-000000000139', 'd0000000-0000-0000-0000-000000000008', 'Turkish Tea', 'Strong black tea served in traditional tulip glass', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R140
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0140-000000000001', 'e0000000-0000-0000-0000-000000000140', 'd0000000-0000-0000-0000-000000000002', 'Tuna Tartare', 'Fresh tuna with avocado, sesame, and yuzu dressing', 680.00, false, true),
('f0000000-0000-0000-0140-000000000002', 'e0000000-0000-0000-0000-000000000140', 'd0000000-0000-0000-0000-000000000004', 'Lamb Rack', 'Herb-crusted lamb rack with rosemary jus', 1200.00, false, true),
('f0000000-0000-0000-0140-000000000003', 'e0000000-0000-0000-0000-000000000140', 'd0000000-0000-0000-0000-000000000004', 'Risotto al Funghi', 'Arborio rice with porcini mushrooms and truffle oil', 650.00, true, true),
('f0000000-0000-0000-0140-000000000004', 'e0000000-0000-0000-0000-000000000140', 'd0000000-0000-0000-0000-000000000003', 'Lobster Bisque', 'Velvety lobster soup with cognac cream', 520.00, false, true),
('f0000000-0000-0000-0140-000000000005', 'e0000000-0000-0000-0000-000000000140', 'd0000000-0000-0000-0000-000000000007', 'Creme Brulee', 'Vanilla custard with caramelised sugar crust', 420.00, true, true),
('f0000000-0000-0000-0140-000000000006', 'e0000000-0000-0000-0000-000000000140', 'd0000000-0000-0000-0000-000000000008', 'Espresso Martini', 'Shaken espresso with coffee liqueur, non-alc available', 480.00, true, true)
ON CONFLICT DO NOTHING;

-- R141
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0141-000000000001', 'e0000000-0000-0000-0000-000000000141', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0141-000000000002', 'e0000000-0000-0000-0000-000000000141', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0141-000000000003', 'e0000000-0000-0000-0000-000000000141', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0141-000000000004', 'e0000000-0000-0000-0000-000000000141', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0141-000000000005', 'e0000000-0000-0000-0000-000000000141', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0141-000000000006', 'e0000000-0000-0000-0000-000000000141', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R142
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0142-000000000001', 'e0000000-0000-0000-0000-000000000142', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0142-000000000002', 'e0000000-0000-0000-0000-000000000142', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0142-000000000003', 'e0000000-0000-0000-0000-000000000142', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0142-000000000004', 'e0000000-0000-0000-0000-000000000142', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0142-000000000005', 'e0000000-0000-0000-0000-000000000142', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0142-000000000006', 'e0000000-0000-0000-0000-000000000142', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R143
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0143-000000000001', 'e0000000-0000-0000-0000-000000000143', 'd0000000-0000-0000-0000-000000000002', 'Chicken 65', 'Deep-fried chicken in fiery Chettinad spices and curry leaves', 220.00, false, true),
('f0000000-0000-0000-0143-000000000002', 'e0000000-0000-0000-0000-000000000143', 'd0000000-0000-0000-0000-000000000002', 'Mutton Chukka', 'Dry-roasted mutton with crushed pepper and shallots', 320.00, false, true),
('f0000000-0000-0000-0143-000000000003', 'e0000000-0000-0000-0000-000000000143', 'd0000000-0000-0000-0000-000000000004', 'Chicken Chettinad', 'Robust chicken curry with freshly ground pepper and fennel', 280.00, false, true),
('f0000000-0000-0000-0143-000000000004', 'e0000000-0000-0000-0000-000000000143', 'd0000000-0000-0000-0000-000000000005', 'Nattu Kozhi Biryani', 'Country chicken biryani with seeraga samba rice', 380.00, false, true),
('f0000000-0000-0000-0143-000000000005', 'e0000000-0000-0000-0000-000000000143', 'd0000000-0000-0000-0000-000000000006', 'Parotta (2 pcs)', 'Flaky layered parottas perfect for scooping up gravy', 60.00, true, true),
('f0000000-0000-0000-0143-000000000006', 'e0000000-0000-0000-0000-000000000143', 'd0000000-0000-0000-0000-000000000008', 'Rasam', 'Hot peppery tamarind broth with cumin and coriander', 40.00, true, true)
ON CONFLICT DO NOTHING;

-- R144
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0144-000000000001', 'e0000000-0000-0000-0000-000000000144', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0144-000000000002', 'e0000000-0000-0000-0000-000000000144', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0144-000000000003', 'e0000000-0000-0000-0000-000000000144', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0144-000000000004', 'e0000000-0000-0000-0000-000000000144', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0144-000000000005', 'e0000000-0000-0000-0000-000000000144', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0144-000000000006', 'e0000000-0000-0000-0000-000000000144', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R145
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0145-000000000001', 'e0000000-0000-0000-0000-000000000145', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0145-000000000002', 'e0000000-0000-0000-0000-000000000145', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0145-000000000003', 'e0000000-0000-0000-0000-000000000145', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0145-000000000004', 'e0000000-0000-0000-0000-000000000145', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0145-000000000005', 'e0000000-0000-0000-0000-000000000145', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0145-000000000006', 'e0000000-0000-0000-0000-000000000145', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R146
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0146-000000000001', 'e0000000-0000-0000-0000-000000000146', 'd0000000-0000-0000-0000-000000000005', 'Chicken Biryani', 'Fragrant rice layered with spiced chicken and caramelised onions', 280.00, false, true),
('f0000000-0000-0000-0146-000000000002', 'e0000000-0000-0000-0000-000000000146', 'd0000000-0000-0000-0000-000000000005', 'Mutton Biryani', 'Tender bone-in mutton with aromatic basmati rice', 340.00, false, true),
('f0000000-0000-0000-0146-000000000003', 'e0000000-0000-0000-0000-000000000146', 'd0000000-0000-0000-0000-000000000002', 'Chicken Kebab', 'Smoky minced chicken kebabs with mint chutney', 260.00, false, true),
('f0000000-0000-0000-0146-000000000004', 'e0000000-0000-0000-0000-000000000146', 'd0000000-0000-0000-0000-000000000006', 'Coin Parotta', 'Bite-sized crispy parottas for dipping into salna', 80.00, true, true),
('f0000000-0000-0000-0146-000000000005', 'e0000000-0000-0000-0000-000000000146', 'd0000000-0000-0000-0000-000000000004', 'Chicken Salna', 'Thick spicy gravy with shredded chicken', 230.00, false, true),
('f0000000-0000-0000-0146-000000000006', 'e0000000-0000-0000-0000-000000000146', 'd0000000-0000-0000-0000-000000000007', 'Gulab Jamun (3 pcs)', 'Soft milk dumplings in rose-cardamom sugar syrup', 90.00, true, true)
ON CONFLICT DO NOTHING;

-- R147
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0147-000000000001', 'e0000000-0000-0000-0000-000000000147', 'd0000000-0000-0000-0000-000000000004', 'Butter Chicken', 'Tandoori chicken in silky tomato-cream gravy', 350.00, false, true),
('f0000000-0000-0000-0147-000000000002', 'e0000000-0000-0000-0000-000000000147', 'd0000000-0000-0000-0000-000000000004', 'Dal Makhani', 'Black lentils slow-cooked with butter and cream overnight', 280.00, true, true),
('f0000000-0000-0000-0147-000000000003', 'e0000000-0000-0000-0000-000000000147', 'd0000000-0000-0000-0000-000000000002', 'Tandoori Chicken Half', 'Yoghurt-marinated chicken grilled in clay tandoor', 350.00, false, true),
('f0000000-0000-0000-0147-000000000004', 'e0000000-0000-0000-0000-000000000147', 'd0000000-0000-0000-0000-000000000002', 'Paneer Tikka', 'Smoky tandoor-grilled cottage cheese with capsicum', 320.00, true, true),
('f0000000-0000-0000-0147-000000000005', 'e0000000-0000-0000-0000-000000000147', 'd0000000-0000-0000-0000-000000000006', 'Garlic Naan', 'Tandoor-baked bread with garlic, butter, and coriander', 80.00, true, true),
('f0000000-0000-0000-0147-000000000006', 'e0000000-0000-0000-0000-000000000147', 'd0000000-0000-0000-0000-000000000008', 'Lassi', 'Thick churned yoghurt drink, sweet or salted', 80.00, true, true)
ON CONFLICT DO NOTHING;

-- R148
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0148-000000000001', 'e0000000-0000-0000-0000-000000000148', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0148-000000000002', 'e0000000-0000-0000-0000-000000000148', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0148-000000000003', 'e0000000-0000-0000-0000-000000000148', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0148-000000000004', 'e0000000-0000-0000-0000-000000000148', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0148-000000000005', 'e0000000-0000-0000-0000-000000000148', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0148-000000000006', 'e0000000-0000-0000-0000-000000000148', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R149
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0149-000000000001', 'e0000000-0000-0000-0000-000000000149', 'd0000000-0000-0000-0000-000000000001', 'Masala Dosa', 'Crispy golden crepe with spiced potato filling and chutneys', 95.00, true, true),
('f0000000-0000-0000-0149-000000000002', 'e0000000-0000-0000-0000-000000000149', 'd0000000-0000-0000-0000-000000000001', 'Ghee Pongal', 'Creamy lentil-rice porridge with pepper and cumin', 80.00, true, true),
('f0000000-0000-0000-0149-000000000003', 'e0000000-0000-0000-0000-000000000149', 'd0000000-0000-0000-0000-000000000009', 'Full Meals', 'Unlimited thali with rice, sambar, rasam, poriyal, and payasam', 170.00, true, true),
('f0000000-0000-0000-0149-000000000004', 'e0000000-0000-0000-0000-000000000149', 'd0000000-0000-0000-0000-000000000002', 'Medu Vada', 'Crispy urad dal fritters with coconut chutney', 65.00, true, true),
('f0000000-0000-0000-0149-000000000005', 'e0000000-0000-0000-0000-000000000149', 'd0000000-0000-0000-0000-000000000001', 'Rava Dosa', 'Lacy semolina crepe studded with cumin and curry leaves', 90.00, true, true),
('f0000000-0000-0000-0149-000000000006', 'e0000000-0000-0000-0000-000000000149', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'Traditional South Indian decoction coffee with frothy milk', 45.00, true, true)
ON CONFLICT DO NOTHING;

-- R150
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, is_veg, is_available) VALUES
('f0000000-0000-0000-0150-000000000001', 'e0000000-0000-0000-0000-000000000150', 'd0000000-0000-0000-0000-000000000001', 'Croissant', 'Flaky butter croissant available plain, almond, or chocolate', 150.00, true, true),
('f0000000-0000-0000-0150-000000000002', 'e0000000-0000-0000-0000-000000000150', 'd0000000-0000-0000-0000-000000000010', 'Veg Puff', 'Flaky pastry filled with spiced potato and peas', 40.00, true, true),
('f0000000-0000-0000-0150-000000000003', 'e0000000-0000-0000-0000-000000000150', 'd0000000-0000-0000-0000-000000000010', 'Chicken Puff', 'Golden puff pastry with spiced minced chicken filling', 55.00, false, true),
('f0000000-0000-0000-0150-000000000004', 'e0000000-0000-0000-0000-000000000150', 'd0000000-0000-0000-0000-000000000007', 'Black Forest Cake Slice', 'Chocolate sponge with cherry and cream layers', 180.00, true, true),
('f0000000-0000-0000-0150-000000000005', 'e0000000-0000-0000-0000-000000000150', 'd0000000-0000-0000-0000-000000000007', 'Fresh Cream Sandwich', 'Soft bread with cream and fresh fruit', 120.00, true, true),
('f0000000-0000-0000-0150-000000000006', 'e0000000-0000-0000-0000-000000000150', 'd0000000-0000-0000-0000-000000000008', 'Filter Coffee', 'South Indian filter coffee, strong and frothy', 50.00, true, true)
ON CONFLICT DO NOTHING;
