-- BLUEPRINT 09: AI MEETING ASSISTANT DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.meeting_notes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    meeting_title VARCHAR(255) NOT NULL,
    transcript_text TEXT NOT NULL,
    summary TEXT NOT NULL,
    action_items JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.meeting_notes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Access Meetings" ON public.meeting_notes FOR ALL USING (true);
