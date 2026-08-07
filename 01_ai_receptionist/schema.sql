-- ============================================================================
-- BLUEPRINT 01: AI RECEPTIONIST & BOOKING ENGINE DATABASE SCHEMA
-- Compatible with Supabase / PostgreSQL (Includes RLS & Indexes)
-- ============================================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. CLIENTS / BUSINESSES TABLE
CREATE TABLE IF NOT EXISTS public.clients (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    business_name VARCHAR(255) NOT NULL,
    industry_category VARCHAR(100) NOT NULL, -- e.g. Dental, MedSpa, Law Firm, HVAC
    contact_email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    timezone VARCHAR(50) DEFAULT 'Asia/Kuala_Lumpur',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. PATIENTS & LEADS TABLE
CREATE TABLE IF NOT EXISTS public.patient_leads (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    client_id UUID REFERENCES public.clients(id) ON DELETE CASCADE,
    full_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(255),
    lead_source VARCHAR(100) DEFAULT 'AI_Receptionist',
    qualification_status VARCHAR(50) DEFAULT 'unqualified', -- unqualified, qualified, converted
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. APPOINTMENTS TABLE
CREATE TABLE IF NOT EXISTS public.appointments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    client_id UUID REFERENCES public.clients(id) ON DELETE CASCADE,
    patient_id UUID REFERENCES public.patient_leads(id) ON DELETE SET NULL,
    patient_name VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    service_requested VARCHAR(255) NOT NULL,
    appointment_time TIMESTAMP WITH TIME ZONE NOT NULL,
    appointment_end_time TIMESTAMP WITH TIME ZONE NOT NULL,
    calendar_event_id VARCHAR(255),
    status VARCHAR(50) DEFAULT 'confirmed', -- confirmed, cancelled, rescheduled, completed
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. CLINIC FAQS & KNOWLEDGE BASE
CREATE TABLE IF NOT EXISTS public.clinic_faqs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    client_id UUID REFERENCES public.clients(id) ON DELETE CASCADE,
    category VARCHAR(100) NOT NULL, -- e.g. Pricing, Hours, Services, Parking, Insurance
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. AI CONVERSATION LOGS (AUDIT TRAIL)
CREATE TABLE IF NOT EXISTS public.ai_conversation_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    client_id UUID REFERENCES public.clients(id) ON DELETE CASCADE,
    user_phone VARCHAR(50) NOT NULL,
    user_message TEXT NOT NULL,
    ai_response TEXT NOT NULL,
    extracted_intent VARCHAR(100),
    confidence_score NUMERIC(3, 2),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================================================
-- INDEXES FOR FAST QUERY PERFORMANCE
-- ============================================================================
CREATE INDEX IF NOT EXISTS idx_appointments_client ON public.appointments(client_id);
CREATE INDEX IF NOT EXISTS idx_appointments_time ON public.appointments(appointment_time);
CREATE INDEX IF NOT EXISTS idx_patient_leads_phone ON public.patient_leads(phone);
CREATE INDEX IF NOT EXISTS idx_faqs_client_category ON public.clinic_faqs(client_id, category);

-- ============================================================================
-- ROW LEVEL SECURITY (RLS) POLICIES FOR SUPABASE
-- ============================================================================
ALTER TABLE public.clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.patient_leads ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.appointments ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.clinic_faqs ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ai_conversation_logs ENABLE ROW LEVEL SECURITY;

-- Allow service role full access
CREATE POLICY "Service Role Full Access" ON public.clients FOR ALL USING (true);
CREATE POLICY "Service Role Full Access Leads" ON public.patient_leads FOR ALL USING (true);
CREATE POLICY "Service Role Full Access Appointments" ON public.appointments FOR ALL USING (true);
CREATE POLICY "Service Role Full Access FAQs" ON public.clinic_faqs FOR ALL USING (true);
CREATE POLICY "Service Role Full Access Logs" ON public.ai_conversation_logs FOR ALL USING (true);
