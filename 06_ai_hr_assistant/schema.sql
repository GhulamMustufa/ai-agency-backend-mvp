-- BLUEPRINT 06: AI HR & CANDIDATE SCREENING DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.candidate_applications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    candidate_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    match_score INT CHECK (match_score >= 0 AND match_score <= 100),
    experience_years NUMERIC(4, 1),
    status VARCHAR(50) DEFAULT 'applied',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.candidate_applications ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Access Candidates" ON public.candidate_applications FOR ALL USING (true);
