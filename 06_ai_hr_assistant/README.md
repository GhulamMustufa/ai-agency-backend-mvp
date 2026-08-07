# Module 06: AI HR & Recruitment Assistant

This module streamlines the top-of-funnel hiring process by autonomously parsing resumes, scoring applicants against strict job criteria, and managing interview scheduling loops.

## 📈 Business Impact & ROI
*   **Rapid Talent Acquisition:** Reduces Time-to-Hire by instantly filtering out 80% of unqualified applicants the moment they apply.
*   **HR Bandwidth Optimization:** Frees up Senior Recruiters to focus purely on high-leverage interviews and closing candidates, rather than spending 15 hours a week scanning PDFs.
*   **Enhanced Candidate Experience:** Applicants receive immediate feedback and automated scheduling links, preventing top talent from being poached by faster competitors.

## 🏗️ System Architecture & Importance
*   **Multi-modal Ingestion:** Capable of ingesting data from webhooks (Typeform/Greenhouse) or scanning email attachments for PDF resumes.
*   **Algorithmic Scoring Matrix:** The LLM does not just read the resume; it is prompted to score the candidate mathematically across 5 custom criteria (e.g., Years of React experience, Leadership skills) and output a standardized JSON assessment.
*   **Automated Logistics:** Interfaces directly with Google Calendar/Calendly APIs to manage stateful booking logic without human bottlenecking.
