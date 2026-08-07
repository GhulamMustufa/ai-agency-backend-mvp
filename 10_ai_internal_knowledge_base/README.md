# Module 10: AI Internal Knowledge Base (Enterprise RAG)

This module replaces archaic company wikis with an intelligent, conversational search engine. It allows employees to instantly query company SOPs, HR policies, and technical documentation via Slack or internal portals.

## 📈 Business Impact & ROI
*   **Onboarding Velocity:** Drastically reduces the time it takes for new hires to become productive by giving them an instant, 24/7 "mentor" to answer operational questions.
*   **SOP Compliance:** Ensures employees are actually following standard operating procedures by making the exact, correct steps instantly retrievable without digging through Google Drive folders.
*   **Management Deflection:** Saves senior leadership and HR departments countless hours answering repetitive internal questions ("What is the PTO policy?", "How do I process a refund?").

## 🏗️ System Architecture & Importance
*   **Vector Embeddings (pgvector):** The core of this system is a `pgvector` enabled Postgres database. Company documents are chunked and embedded via OpenAI (`text-embedding-ada-002`), allowing for mathematical similarity search rather than basic keyword matching.
*   **Secure Ingestion Pipelines:** Architecture includes separate workflows for *ingesting* knowledge (syncing with Notion/Google Drive, chunking, and embedding) and *querying* knowledge, ensuring the database stays fresh asynchronously.
*   **Hallucination Prevention:** By utilizing strict Retrieval-Augmented Generation (RAG) prompts ("Answer ONLY using the provided context"), the system is restricted from fabricating company policies.
