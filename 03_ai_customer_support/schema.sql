-- BLUEPRINT 03: AI CUSTOMER SUPPORT & VECTOR SEARCH DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS public.knowledge_embeddings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    client_id UUID NOT NULL,
    document_text TEXT NOT NULL,
    embedding vector(1536),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.support_tickets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    client_id UUID NOT NULL,
    user_email VARCHAR(255) NOT NULL,
    user_message TEXT NOT NULL,
    ai_response TEXT,
    status VARCHAR(50) DEFAULT 'resolved', -- resolved, escalated
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_knowledge_vec ON public.knowledge_embeddings USING ivfflat (embedding vector_cosine_ops);
ALTER TABLE public.knowledge_embeddings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.support_tickets ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Access Knowledge" ON public.knowledge_embeddings FOR ALL USING (true);
CREATE POLICY "Service Access Tickets" ON public.support_tickets FOR ALL USING (true);
