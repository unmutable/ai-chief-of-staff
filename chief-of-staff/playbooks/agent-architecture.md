# Agent Architecture: AI Chief of Staff

> How the AI Chief of Staff system routes work across model tiers for speed, cost efficiency, and quality. This document is the source of truth for how agents are structured, when they're used, and how information flows.

---

## Overview

The AI Chief of Staff operates as a three-tier agent system. The primary model (Opus) acts as the thinking partner and router. Two specialized agents handle lower-complexity tasks at faster speeds and lower cost.

All agents share the same Obsidian vault as the system of record. No agent tracks its own state. Everything lives in client files, project files, and Time Lord.

---

## Agent Structure

### Chief of Staff (Opus)

**Role:** Primary thinking partner and router.

**When it's used:**
- Strategy sessions and complex decisions
- Processing nuanced meeting notes (routing items by type)
- Deep email copywriting (sales copy, client-facing campaigns)
- Client positioning and messaging
- Executive briefs and planning documents
- Any task requiring judgment about *why* something matters

**How it works:**
- You talk directly to Opus in the main conversation
- When raw input comes in (meeting notes, brain dumps, scratch pad items), Opus processes and routes each item by type: decision, issue, deadline, delegation, reporting, or needs deeper work
- Opus updates the vault directly for decisions, issues, deadlines, and reporting
- Opus spins up the Delegation Writer or Data Runner when the task fits their scope
- Opus never delegates strategic decisions or nuanced judgment

---

### Delegation Writer (Sonnet)

**Role:** Drafts team communication and handles delegation output.

**Agent file:** `.claude/agents/delegation-writer.md`

**When it's used:**
- Slack messages to team channels or individual team members
- Task creation in your project management tool (Asana, Linear, etc.) with clear scope, owner, and deadline
- Client-facing communication drafts (for you to review before sending)
- Meeting recap formatting
- Document generation from templates

**How it works:**
- Opus identifies an item as a delegation and spins up the Delegation Writer
- The agent receives the context: what needs to happen, who owns it, the deadline, and any links
- It drafts the message or creates the task via MCP tools
- For client-facing communication, it drafts only; you review before sending
- Style: direct, actionable, scannable. No fluff.

**Team members it knows:**

<!-- Fill in your team below -->
| Name | Role |
|---|---|
| (Name) | (Role and primary tools/responsibilities) |

**Output channels:**
<!-- Configure based on your MCP integrations -->
- Slack: `slack_send_message` or `slack_send_message_draft`
- Asana: `asana_create_task`
- (Add your own: Linear, Notion, email, etc.)

---

### Data Runner (Haiku)

**Role:** Fast lookups, data pulls, and simple vault updates.

**Agent file:** `.claude/agents/data-runner.md`

**When it's used:**
- Pulling numbers from vault files (metrics, stats, tracking data)
- Updating tracking tables in project files with new data points
- Looking up links from client files (reporting dashboards, shared docs)
- Appending new deadlines to Time Lord
- Simple formatting tasks (building tables from raw input, reformatting data)
- Quick vault searches ("what's the reporting link for [client]?")

**How it works:**
- Opus identifies a task as a simple data operation and spins up the Data Runner
- The agent receives the specific task: what to find, what to update, where it lives
- It executes quickly with minimal tool calls
- It does not make strategic decisions. If a task requires judgment about where something should go or what it means, it escalates back to Opus.

**Vault structure it knows:**

| Location | Contents |
|---|---|
| `chief-of-staff/clients/[Client Name].md` | Client profiles, action items, reporting |
| `chief-of-staff/projects/` | Active project working documents |
| `chief-of-staff/time-lord.md` | Master deadline tracker |
| `daily-notes/YYYY-MM-DD.md` | Daily notes / scratch pad |

---

## Information Flow

```
You (raw input: meeting notes, brain dump, scratch pad)
    |
    v
Chief of Staff (Opus) -- processes and routes by type
    |
    |-- Decision made? --> Update client file directly
    |-- Issue / pending? --> Update client file with context
    |-- Deadline? ---------> Client file + Time Lord
    |-- Reporting/numbers -> Data Runner (Haiku) updates tracking tables
    |-- Delegation needed -> Delegation Writer (Sonnet) drafts + sends
    |-- Needs deeper work -> Stay in Opus, work through it with you
    |
    v
Daily note gets a "Processed to Library" summary appended
```

---

## Key Principles

1. **The vault is the system of record.** Client files, project files, and Time Lord. Not your project management tool, not Slack, not Claude memory.

2. **Project management tools are output channels, not tracking systems.** When something needs to be delegated to the team, it goes to Asana/Linear/Slack. But the source of truth stays in the vault.

3. **Communication is a first-class output.** Filing to the vault is necessary but not sufficient. If something needs to reach the team, the Delegation Writer handles that as a separate action.

4. **The daily note is a scratch pad.** Brain dump so nothing gets lost. It stays lean. The system processes it into the vault, not the other way around.

5. **Route by cost and complexity.** Opus handles judgment. Sonnet handles writing for others. Haiku handles data. Never run a simple lookup through Opus pricing.

6. **No wasted tool calls.** If information is already in context, use it. Don't re-read files. Don't verify paths that are already known.

---

## Setup Requirements

- Claude Code CLI with Opus as the primary model
- MCP integrations configured for your tools (Slack, Asana, Gmail, Google Calendar, etc.)
- Agent files in `.claude/agents/` within the project directory
- Obsidian vault with the chief-of-staff folder structure (clients, projects, playbooks, time-lord)

---

## File Locations

| File | Path |
|---|---|
| Delegation Writer agent | `.claude/agents/delegation-writer.md` |
| Data Runner agent | `.claude/agents/data-runner.md` |
| This document | `chief-of-staff/playbooks/agent-architecture.md` |
