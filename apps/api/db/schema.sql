-- ============================================================================
-- Cravely Database Schema
-- Run this in your Supabase SQL Editor to initialize the database.
-- ============================================================================

-- Enable pgvector extension for semantic search
CREATE EXTENSION IF NOT EXISTS vector;

-- ============================================================================
-- 1. cities
-- ============================================================================
CREATE TABLE cities (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR NOT NULL,
    state VARCHAR NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- ============================================================================
-- 2. neighborhoods
-- ============================================================================
CREATE TABLE neighborhoods (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    city_id UUID NOT NULL REFERENCES cities(id) ON DELETE CASCADE,
    name VARCHAR NOT NULL,
    slug VARCHAR NOT NULL UNIQUE
);

-- ============================================================================
-- 3. cuisines
-- ============================================================================
CREATE TABLE cuisines (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR NOT NULL UNIQUE,
    slug VARCHAR NOT NULL UNIQUE
);

-- ============================================================================
-- 4. categories (menu categories)
-- ============================================================================
CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR NOT NULL
);

-- ============================================================================
-- 5. restaurants
-- ============================================================================
CREATE TABLE restaurants (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    google_place_id VARCHAR UNIQUE,
    name VARCHAR NOT NULL,
    description TEXT,
    neighborhood_id UUID REFERENCES neighborhoods(id) ON DELETE SET NULL,
    address TEXT,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    phone VARCHAR,
    timings JSONB,
    price_range SMALLINT CHECK (price_range BETWEEN 1 AND 3),
    avg_rating DECIMAL(2,1),
    total_ratings INTEGER DEFAULT 0,
    photos JSONB,
    zomato_url VARCHAR,
    swiggy_url VARCHAR,
    is_pure_veg BOOLEAN DEFAULT false,
    is_active BOOLEAN DEFAULT true,
    embedding vector(768),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- ============================================================================
-- 6. restaurant_cuisines (junction table)
-- ============================================================================
CREATE TABLE restaurant_cuisines (
    restaurant_id UUID NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
    cuisine_id UUID NOT NULL REFERENCES cuisines(id) ON DELETE CASCADE,
    PRIMARY KEY (restaurant_id, cuisine_id)
);

-- ============================================================================
-- 7. menu_items
-- ============================================================================
CREATE TABLE menu_items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    restaurant_id UUID NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
    category_id UUID REFERENCES categories(id) ON DELETE SET NULL,
    name VARCHAR NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    is_veg BOOLEAN,
    is_available BOOLEAN DEFAULT true,
    embedding vector(768),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- ============================================================================
-- 8. users (extends Supabase Auth)
-- ============================================================================
CREATE TABLE users (
    id UUID PRIMARY KEY,  -- matches auth.users.id
    full_name VARCHAR,
    phone VARCHAR,
    city_id UUID REFERENCES cities(id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- ============================================================================
-- 9. user_preferences
-- ============================================================================
CREATE TABLE user_preferences (
    user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    dietary VARCHAR[],
    favorite_cuisines UUID[],
    preferred_neighborhoods UUID[],
    price_range_max SMALLINT,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- ============================================================================
-- 10. conversations
-- ============================================================================
CREATE TABLE conversations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    channel VARCHAR NOT NULL CHECK (channel IN ('web', 'whatsapp')),
    session_id VARCHAR,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- ============================================================================
-- 11. messages
-- ============================================================================
CREATE TABLE messages (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    conversation_id UUID NOT NULL REFERENCES conversations(id) ON DELETE CASCADE,
    role VARCHAR NOT NULL CHECK (role IN ('user', 'assistant')),
    content TEXT NOT NULL,
    tool_calls JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now()
);

-- ============================================================================
-- 12. favorites
-- ============================================================================
CREATE TABLE favorites (
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    restaurant_id UUID NOT NULL REFERENCES restaurants(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    PRIMARY KEY (user_id, restaurant_id)
);

-- ============================================================================
-- Indexes
-- ============================================================================

-- Geospatial-style filtering
CREATE INDEX idx_restaurants_neighborhood ON restaurants(neighborhood_id);
CREATE INDEX idx_restaurants_price_range ON restaurants(price_range);
CREATE INDEX idx_restaurants_is_active ON restaurants(is_active);

-- pgvector HNSW indexes for fast semantic search
CREATE INDEX idx_restaurants_embedding ON restaurants
    USING hnsw (embedding vector_cosine_ops);
CREATE INDEX idx_menu_items_embedding ON menu_items
    USING hnsw (embedding vector_cosine_ops);

-- Message history lookup
CREATE INDEX idx_messages_conversation ON messages(conversation_id);
CREATE INDEX idx_conversations_session ON conversations(session_id);
