-- BLUEPRINT 05: AI INVOICE, PO & RFQ PROCESSOR DB SCHEMA
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS public.rfq_documents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    rfq_number VARCHAR(100) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    pdf_storage_url TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'pending_approval',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS public.rfq_line_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    rfq_id UUID REFERENCES public.rfq_documents(id) ON DELETE CASCADE,
    rfq_number VARCHAR(100),
    company_name VARCHAR(255),
    part_number VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    unit_price NUMERIC(10, 2),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE public.rfq_documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.rfq_line_items ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Service Access RFQs" ON public.rfq_documents FOR ALL USING (true);
CREATE POLICY "Service Access Items" ON public.rfq_line_items FOR ALL USING (true);
