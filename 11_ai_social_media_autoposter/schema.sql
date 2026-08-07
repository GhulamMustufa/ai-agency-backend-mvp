CREATE TABLE IF NOT EXISTS public.social_media_posts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    original_content TEXT NOT NULL,
    linkedin_draft TEXT,
    twitter_draft TEXT,
    facebook_draft TEXT,
    status VARCHAR(50) DEFAULT 'draft', -- 'draft', 'approved', 'published'
    published_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Note: This workflow primarily relies on a Google Sheet as the UI for human approval, 
-- but this Supabase table can be used to permanently log all published content.
