# Module 09: AI Meeting Assistant

This module automates the entire post-meeting administrative burden. It ingests raw audio transcripts, extracts executive summaries, and autonomously routes assigned action items to project management tools.

## 📈 Business Impact & ROI
*   **Executive Leverage:** Saves founders and project managers 30-45 minutes per meeting by completely eliminating the need to write and distribute meeting minutes.
*   **Accountability Tracking:** Ensures no action item falls through the cracks. Because tasks are automatically assigned in Jira/Asana, team execution velocity increases dramatically.
*   **Knowledge Democratization:** Creates a searchable, written record of every decision made on voice/video calls, accessible to team members who could not attend.

## 🏗️ System Architecture & Importance
*   **Context Window Optimization:** Uses advanced chunking and summarization techniques (via GPT-4o) to handle massive transcript payloads (e.g., 2-hour long Zoom calls) without hitting token limits or losing critical nuance.
*   **Entity Extraction:** The LLM is strictly prompted to identify specific entities (Assignee, Task, Deadline) and output them in a structured JSON schema, which is then parsed by n8n to create individual Jira/Trello tickets.
*   **Ecosystem Agnostic:** The architecture is decoupled from the video provider. It can accept transcripts from Zoom webhooks, Otter.ai, or raw `.vtt` file uploads, routing them through a unified parsing pipeline.
