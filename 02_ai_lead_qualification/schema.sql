-- BLUEPRINT 02: AI LEAD QUALIFICATION & RESEARCH SYSTEM DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.lead_scores (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    lead_email VARCHAR(255) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    lead_score INT CHECK (lead_score >= 0 AND lead_score <= 100),
    industry VARCHAR(100),
    employee_count_est VARCHAR(50),
    qualification_tier VARCHAR(50) DEFAULT 'medium', -- hot, medium, low
    summary TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_lead_scores_tier ON public.lead_scores(qualification_tier);
ALTER TABLE public.lead_scores ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Role Access Leads" ON public.lead_scores FOR ALL USING (true);
