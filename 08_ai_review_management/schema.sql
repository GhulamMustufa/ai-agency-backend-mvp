-- BLUEPRINT 08: AI REVIEW & REPUTATION MANAGER DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.review_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    reviewer_name VARCHAR(255) NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    sentiment VARCHAR(50) DEFAULT 'neutral', -- positive, neutral, negative
    draft_reply TEXT,
    is_published BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.review_logs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Access Reviews" ON public.review_logs FOR ALL USING (true);
