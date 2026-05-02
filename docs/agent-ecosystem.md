# AI Agent Ecosystem

This document defines the VIDAL multi-agent operating model for Swiss SME SaaS delivery. The goal is disciplined AI leverage: each assistant has a narrow job, cost is capped, and compliance-sensitive decisions remain reviewable.

## Cost Envelope

| Tool | Monthly Budget | Primary Value |
|---|---:|---|
| Claude Code | USD 20 | Autonomous coding, repository-level execution, architectural implementation |
| GitHub Copilot | USD 10 | Inline suggestions, boilerplate reduction, IDE velocity |
| Gemini | USD 0-10 | Performance review, Lighthouse interpretation, SEO checks, broad comparison |
| Codex | Included or usage-controlled | Logic review, test design, refactoring, consistency checks |
| **Total** | **USD 30-40** | Balanced AI stack for solo or micro-team SaaS delivery |

## Agent Roles

| Agent | Mode | Responsibilities | Guardrails |
|---|---|---|---|
| Claude Code | Autonomous | Implements features, navigates repositories, edits files, runs local checks, updates docs | Must follow `CLAUDE.md`, avoid speculative abstractions, preserve Swiss DSG boundaries |
| GitHub Copilot | Suggestion | Completes local code patterns, helps write tests, reduces repetitive typing inside IDE | Developer accepts or rejects suggestions; never treated as architectural authority |
| Gemini | Performance | Reviews Lighthouse output, SEO metadata, JSON-LD, image strategy, comparative options | Used for analysis and optimization recommendations, not direct production changes |
| Codex | Logic | Validates reasoning, refactors complex flows, designs tests, reviews edge cases and contracts | Must inspect local context before changing behavior |

## Operating Protocol

1. Define the business outcome and compliance boundary.
2. Let Claude Code or Codex inspect the repository before implementation.
3. Use Copilot for narrow local acceleration while the developer remains in control.
4. Use Gemini for performance and SEO passes after a runnable build exists.
5. Commit only after generated docs and script registry are current.

## Swiss DSG Alignment

AI tooling must not receive unnecessary personal data. Use anonymized examples, synthetic payloads, and minimal logs when asking any agent to inspect workflows involving clients, invoices, HR data, tickets, identity records, or support transcripts.

Required controls:

| Control | Implementation |
|---|---|
| Data minimization | Share only the files and snippets required for the task |
| Purpose limitation | Each agent prompt names the exact engineering purpose |
| Traceability | Material AI-assisted changes are documented in commits or ADRs |
| Human accountability | Architecture, compliance, and deployment decisions remain human-approved |

## Cost Optimization Rules

| Rule | Impact |
|---|---|
| Use one autonomous agent per implementation thread | Prevents duplicate token spend |
| Reserve Gemini for post-build performance work | Keeps usage focused on its comparative strengths |
| Keep Copilot inside IDE suggestion mode | Low-cost productivity without adding process overhead |
| Ask Codex for bounded logic and review tasks | Avoids broad exploratory loops |
| Store reusable standards in this repository | Reduces repeated prompting across projects |

## Decision Matrix

| Task | Preferred Agent |
|---|---|
| Build or modify repository files | Claude Code or Codex |
| Explain a tricky function or refactor tests | Codex |
| Generate repetitive UI or TypeScript snippets in IDE | GitHub Copilot |
| Interpret Lighthouse, Core Web Vitals, or SEO JSON-LD | Gemini |
| Prepare client-facing architecture notes | Claude Code with human review |
