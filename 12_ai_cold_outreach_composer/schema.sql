-- Schema for AI Cold Outreach Composer

-- Table to track overall campaigns
CREATE TABLE outreach_campaigns (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    campaign_name VARCHAR(255) NOT NULL,
    target_persona VARCHAR(255),
    value_proposition TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'active'
);

-- Table to track individual leads and the generated emails
CREATE TABLE outreach_leads (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    campaign_id UUID REFERENCES outreach_campaigns(id),
    lead_name VARCHAR(255),
    company_name VARCHAR(255),
    industry VARCHAR(100),
    email_address VARCHAR(255),
    validation_status VARCHAR(50), -- 'valid', 'bounce', 'catch_all', 'untested'
    generated_subject_line TEXT,
    generated_email_body TEXT,
    human_approved BOOLEAN DEFAULT FALSE,
    email_sent_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Index for fast lookups by email to prevent duplicate sending
CREATE INDEX idx_outreach_email ON outreach_leads(email_address);
CREATE INDEX idx_outreach_campaign ON outreach_leads(campaign_id);
