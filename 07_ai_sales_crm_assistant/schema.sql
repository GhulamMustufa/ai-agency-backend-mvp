-- BLUEPRINT 07: AI SALES CRM ASSISTANT DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.crm_outreach_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    company_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255),
    body_text TEXT,
    linkedin_message TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.crm_outreach_logs ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Access CRM Logs" ON public.crm_outreach_logs FOR ALL USING (true);
