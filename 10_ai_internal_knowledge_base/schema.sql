-- BLUEPRINT 10: AI INTERNAL KNOWLEDGE BASE (RAG) DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE IF NOT EXISTS public.enterprise_kb_chunks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    doc_title VARCHAR(255) NOT NULL,
    chunk_content TEXT NOT NULL,
    embedding vector(1536),
    metadata JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_enterprise_vec ON public.enterprise_kb_chunks USING ivfflat (embedding vector_cosine_ops);
ALTER TABLE public.enterprise_kb_chunks ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Access Enterprise KB" ON public.enterprise_kb_chunks FOR ALL USING (true);
