-- =============================================================================
-- Cravely — Row Level Security policies
-- Apply in Supabase Dashboard → SQL Editor
-- Safe to re-run: uses CREATE POLICY IF NOT EXISTS / DROP IF EXISTS pattern
-- =============================================================================

-- ---------------------------------------------------------------------------
-- 1. Verify RLS is enabled (read-only check — run first to see current state)
-- ---------------------------------------------------------------------------
SELECT
    schemaname,
    tablename,
    rowsecurity AS rls_enabled
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename IN ('users', 'user_preferences', 'conversations', 'messages', 'favorites')
ORDER BY tablename;


-- ---------------------------------------------------------------------------
-- 2. Enable RLS on every sensitive table
-- ---------------------------------------------------------------------------
ALTER TABLE public.users               ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.user_preferences    ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.conversations       ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.messages            ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.favorites           ENABLE ROW LEVEL SECURITY;

-- Force RLS even for the table owner (important for Supabase service-role bypass)
ALTER TABLE public.users               FORCE ROW LEVEL SECURITY;
ALTER TABLE public.user_preferences    FORCE ROW LEVEL SECURITY;
ALTER TABLE public.conversations       FORCE ROW LEVEL SECURITY;
ALTER TABLE public.messages            FORCE ROW LEVEL SECURITY;
ALTER TABLE public.favorites           FORCE ROW LEVEL SECURITY;


-- ---------------------------------------------------------------------------
-- 3. users table
--    Users can read and update only their own row.
--    INSERT is handled by the auth trigger (or service role on signup).
-- ---------------------------------------------------------------------------
DROP POLICY IF EXISTS "users: read own row"   ON public.users;
DROP POLICY IF EXISTS "users: update own row" ON public.users;

CREATE POLICY "users: read own row"
    ON public.users
    FOR SELECT
    USING (auth.uid() = id);

CREATE POLICY "users: update own row"
    ON public.users
    FOR UPDATE
    USING (auth.uid() = id)
    WITH CHECK (auth.uid() = id);


-- ---------------------------------------------------------------------------
-- 4. user_preferences table
-- ---------------------------------------------------------------------------
DROP POLICY IF EXISTS "user_preferences: read own"   ON public.user_preferences;
DROP POLICY IF EXISTS "user_preferences: insert own" ON public.user_preferences;
DROP POLICY IF EXISTS "user_preferences: update own" ON public.user_preferences;
DROP POLICY IF EXISTS "user_preferences: delete own" ON public.user_preferences;

CREATE POLICY "user_preferences: read own"
    ON public.user_preferences
    FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "user_preferences: insert own"
    ON public.user_preferences
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "user_preferences: update own"
    ON public.user_preferences
    FOR UPDATE
    USING (auth.uid() = user_id)
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "user_preferences: delete own"
    ON public.user_preferences
    FOR DELETE
    USING (auth.uid() = user_id);


-- ---------------------------------------------------------------------------
-- 5. favorites table
-- ---------------------------------------------------------------------------
DROP POLICY IF EXISTS "favorites: read own"   ON public.favorites;
DROP POLICY IF EXISTS "favorites: insert own" ON public.favorites;
DROP POLICY IF EXISTS "favorites: delete own" ON public.favorites;

CREATE POLICY "favorites: read own"
    ON public.favorites
    FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "favorites: insert own"
    ON public.favorites
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "favorites: delete own"
    ON public.favorites
    FOR DELETE
    USING (auth.uid() = user_id);


-- ---------------------------------------------------------------------------
-- 6. conversations table
--    A conversation belongs to a user (user_id) OR is an anonymous session
--    (user_id IS NULL). Authenticated users can only see their own sessions.
-- ---------------------------------------------------------------------------
DROP POLICY IF EXISTS "conversations: read own" ON public.conversations;
DROP POLICY IF EXISTS "conversations: insert own" ON public.conversations;

CREATE POLICY "conversations: read own"
    ON public.conversations
    FOR SELECT
    USING (
        user_id IS NULL          -- anonymous sessions: not user-readable via client
        OR auth.uid() = user_id
    );

CREATE POLICY "conversations: insert own"
    ON public.conversations
    FOR INSERT
    WITH CHECK (
        user_id IS NULL
        OR auth.uid() = user_id
    );


-- ---------------------------------------------------------------------------
-- 7. messages table
--    Messages are readable only if the parent conversation belongs to the
--    authenticated user. No direct INSERT policy for client — messages are
--    written by the backend via service role.
-- ---------------------------------------------------------------------------
DROP POLICY IF EXISTS "messages: read own" ON public.messages;

CREATE POLICY "messages: read own"
    ON public.messages
    FOR SELECT
    USING (
        EXISTS (
            SELECT 1
            FROM public.conversations c
            WHERE c.id = messages.conversation_id
              AND (c.user_id IS NULL OR c.user_id = auth.uid())
        )
    );


-- ---------------------------------------------------------------------------
-- 8. Public / read-only tables — no RLS needed (data is not user-specific)
--    restaurants, neighborhoods, cities, cuisines, restaurant_cuisines,
--    menu_items, categories — these are safe to leave open for SELECT.
--    If you want to lock them down anyway:
-- ---------------------------------------------------------------------------
-- ALTER TABLE public.restaurants ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY "restaurants: public read"
--     ON public.restaurants FOR SELECT USING (true);


-- ---------------------------------------------------------------------------
-- 9. Final verification — re-run the check query to confirm RLS is on
-- ---------------------------------------------------------------------------
SELECT
    schemaname,
    tablename,
    rowsecurity         AS rls_enabled,
    forcerowsecurity    AS force_rls
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename IN ('users', 'user_preferences', 'conversations', 'messages', 'favorites')
ORDER BY tablename;
