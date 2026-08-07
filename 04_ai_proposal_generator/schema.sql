-- BLUEPRINT 04: AI PROPOSAL GENERATOR DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.proposals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    client_name VARCHAR(255) NOT NULL,
    lead_email VARCHAR(255) NOT NULL,
    proposal_text TEXT NOT NULL,
    estimated_budget NUMERIC(10, 2),
    status VARCHAR(50) DEFAULT 'draft', -- draft, sent, accepted
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.proposals ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Access Proposals" ON public.proposals FOR ALL USING (true);
