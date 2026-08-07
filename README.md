# 🚀 LeadIQ AI / Autonomous Agency Operations Platform (MVP)

Welcome to the **Autonomous Agency Operations Platform**. This repository contains the source code, architectural blueprints, and orchestration logic for a highly scalable, serverless Enterprise AI automation engine.

While currently architected as a deployable Minimum Viable Product (MVP) utilizing **n8n** as the core orchestration layer, this system is the foundational backend for what will evolve into a multi-tenant SaaS application (LeadIQ AI).

It is designed to replace costly human operational hours with deterministic, cognitive AI workflows that execute 24/7 with zero latency.

---

## 🏗️ System Architecture & Tech Stack

This platform leverages a robust, modern tech stack designed for high throughput, data sovereignty, and cognitive flexibility:

*   **Orchestration Layer (n8n):** Acts as a visual, serverless backend. Handles parallel routing, API abstraction, webhook ingestion, and resilient retry logic without the overhead of maintaining thousands of lines of monolithic Node.js/Python code.
*   **Cognitive Engine (OpenAI / GPT-4o):** Powers the semantic understanding, unstructured data extraction (JSON parsing from natural language), and contextual generation across all workflows.
*   **State Management & Vector Storage (Postgres / Supabase):** Serves as the central source of truth. Handles relational lead storage, transactional logs, and crucially, stores `pgvector` embeddings for Retrieval-Augmented Generation (RAG) capabilities.
*   **Extensibility (REST APIs):** Because the entry points are standard HTTP webhooks, this backend can be connected to **any custom frontend** (React, Next.js, Flutter) or third-party CRM instantly.

---

## 📈 Business Impact & Value Proposition

This repository is not a collection of "toys." It is an enterprise-grade solution designed for high-ticket implementation ($1,000 to $10,000+ ACV). 

**For Founders & Operators:**
These workflows directly attack the highest-cost operational centers of a business:
1.  **Sales Deflection & Lead Qualification:** Instantly scores inbound leads and filters out "tire kickers", ensuring human sales reps only spend time on high-value closing calls.
2.  **Customer Support Deflection:** Resolves Tier-1 support tickets autonomously via RAG (Retrieval-Augmented Generation) against company SOPs, reducing Support SLA response times from hours to seconds.
3.  **Administrative Automation:** Replaces manual data entry, proposal drafting, and invoice parsing with zero-error, stateless micro-operations.

---

## 🔮 Future Scope & V2 Roadmap

This MVP proves the core cognitive capabilities and unit economics of the automation. As we scale, the architecture is primed to evolve:

*   **Multi-Tenancy (SaaS Conversion):** Wrapping these decoupled n8n APIs into a centralized Next.js frontend, allowing businesses to subscribe to "AI Agents as a Service" via a unified dashboard (LeadIQ AI).
*   **Custom LLM Routing:** Implementing a middleware router to dynamically switch between OpenAI, Anthropic (Claude), and localized Llama 3 models based on token cost and task complexity.
*   **Agentic Frameworks:** Upgrading from linear DAG (Directed Acyclic Graph) workflows to fully autonomous, multi-agent frameworks (e.g., AutoGen, LangChain) that can self-correct and execute complex chained tasks.
*   **SOC2 & Enterprise Auth:** Hardening the data pipelines for strict enterprise compliance and PII redaction before hitting the LLM endpoints.

---

## 📂 The Core Engines (Modules)

1. **`01_ai_receptionist`**: 24/7 inbound AI answering, FAQ handling, and automated Calendar booking. 
2. **`02_ai_lead_qualification`**: Algorithmic scoring of inbound leads based on intent/budget with instant Slack routing.
3. **`03_ai_customer_support`**: Vector database (RAG) powered support agent to deflect level-1 support tickets.
4. **`04_ai_proposal_generator`**: Turns brief bullet points into full PDF proposals/SOWs using dynamic HTML rendering.
5. **`05_ai_invoice_rfq_processor`**: Parses incoming PDFs using LlamaParse and extracts structured JSON line items.
6. **`06_ai_hr_assistant`**: Automates initial candidate screening against job requirements.
7. **`07_ai_sales_crm_assistant`**: Integrates with CRMs to draft contextual follow-up emails based on parsed meeting notes.
8. **`08_ai_review_management`**: Intercepts negative sentiment and reroutes happy customers to public review platforms.
9. **`09_ai_meeting_assistant`**: Summarizes meeting transcripts and extracts actionable, assigned next steps.
10. **`10_ai_internal_knowledge_base`**: Enterprise-grade vector search engine for company standard operating procedures.
11. **`11_ai_social_media_autoposter`**: Omni-channel content repurposer that rewrites drafts for varying network constraints.

> Note: Inside each folder, you will find highly tailored, niche-specific variations demonstrating the flexibility of the core architecture.

---

### Getting Started (Technical Setup)
1. Execute the `schema.sql` file located in each blueprint folder inside your Postgres instance to establish the relational tables and Vector indexing.
2. Import the `workflow.json` into your self-hosted or cloud n8n instance.
3. Map your environment variables (OpenAI API Keys, Supabase Credentials).
