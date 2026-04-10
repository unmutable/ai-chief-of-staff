# AI Chief of Staff

**Version 1.0.0**

You don't need another productivity app. You need someone who already knows what's on your plate, what's overdue, and what's about to blow up. Someone who shows up every morning with a briefing, not a blank screen.

That's what this is.

AI Chief of Staff turns Claude Code into a personal executive assistant that actually understands your life. Not just your calendar. Your clients, your deadlines, your recurring commitments, the stuff you told someone you'd do three weeks ago that's still sitting there.

## What this does

- **Morning briefing in under 15 seconds.** One command. You get today's priorities, your schedule, what's overdue, and what needs attention this week. No scrolling. No triage. Just the list.
- **Knows your entire workload.** Clients, projects, deadlines, personal commitments. All in plain markdown files you control. No proprietary database, no vendor lock-in, no subscription beyond Claude.
- **Only loads what matters right now.** Built on a RAG-style architecture, so it reads only today's slice of your data on boot. Deep dives happen when you ask for them, not every time you start your day.
- **Becomes your second brain's executive function.** If you use Obsidian (or any markdown-based system), this plugs right in. If you don't, it works standalone.
- **Delegation, prep, follow-up.** Ask it to prep you for a call. Ask it what you promised a client last week. Ask it to draft the follow-up. It pulls context from your files and gives you what you need.

## Who this is for

- Consultants and agency owners juggling multiple clients
- Leaders who manage more commitments than any human brain should hold
- Anyone who's ever opened their laptop on Monday morning and thought, "What am I supposed to be doing right now?"
- People who are great at the work but terrible at the systems around the work

## What changes

You stop losing things. You stop that low-grade anxiety of "what am I forgetting?" You start your day with clarity instead of chaos. You delegate faster because the context is already surfaced. You make better decisions because you're not reconstructing your week from memory every morning.

This isn't a to-do list app. It's the operating system for how you run your life.

---

## Installation

### Prerequisites

You need [Claude Code](https://claude.ai/code) installed. If you don't have it yet:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

You'll need a Claude subscription (Pro at $20/mo or Max at $100/mo). Follow the prompts to log in after installing.

### Install the AI Chief of Staff

**Option A: Clone into an existing Obsidian vault (recommended)**

If you use Obsidian, clone this directly into your vault so your daily notes and knowledge base live alongside your other notes:

```bash
cd ~/path/to/your/obsidian/vault
git clone https://github.com/unmutable/ai-chief-of-staff.git chief-of-staff-system
cd chief-of-staff-system
```

**Option B: Standalone (no Obsidian)**

```bash
git clone https://github.com/unmutable/ai-chief-of-staff.git
cd ai-chief-of-staff
```

### Set up your files

1. **Copy the templates to create your personal files:**

```bash
cp chief-of-staff/templates/time-lord.template.md chief-of-staff/time-lord.md
cp chief-of-staff/templates/weekly-rhythms.template.md chief-of-staff/personal/weekly-rhythms.md
cp chief-of-staff/templates/operating-manual.template.md chief-of-staff/personal/operating-manual.md
cp chief-of-staff/templates/personal-profile.template.md chief-of-staff/personal/personal-profile.md
cp chief-of-staff/clients/_example-client.md chief-of-staff/clients/my-first-client.md
```

2. **Fill in your data.** Open each file and replace the placeholder content with your own:
   - `time-lord.md` is your single source of truth for deadlines. Add what's due.
   - `weekly-rhythms.md` is your recurring schedule. Add your meetings.
   - `operating-manual.md` tells the AI how you work. Be honest.
   - `personal-profile.md` is deeper context: your strengths, your blind spots, your communication style.
   - Create one `.md` file per client in `chief-of-staff/clients/`.

3. **Configure your setup** by editing `CLAUDE.md`:
   - Set your `VAULT_NAME` if using Obsidian
   - Set your `DAILY_NOTE_PATH` preference
   - Adjust any style preferences

### Run it

```bash
claude
```

Then type:

```
/start
```

That's it. Your briefing generates, your daily note populates, and you're working.

### Get updates

When new versions drop:

```bash
git pull origin main
```

Your personal files are gitignored, so pulling updates never overwrites your data.

---

## File Structure

```
ai-chief-of-staff/
├── CLAUDE.md                          # AI instructions (DO NOT EDIT)
├── VERSION                            # Current version
├── README.md                          # You're reading this
├── .claude/
│   └── commands/
│       └── start.md                   # The /start command (DO NOT EDIT)
├── chief-of-staff/
│   ├── time-lord.md                   # YOUR deadlines (you fill this in)
│   ├── templates/                     # Template files (DO NOT EDIT)
│   │   ├── time-lord.template.md
│   │   ├── weekly-rhythms.template.md
│   │   ├── operating-manual.template.md
│   │   └── personal-profile.template.md
│   ├── personal/
│   │   ├── weekly-rhythms.md          # YOUR recurring schedule
│   │   ├── operating-manual.md        # YOUR work preferences
│   │   └── personal-profile.md        # YOUR deeper context
│   └── clients/
│       ├── _example-client.md         # Example client file
│       └── (your clients go here)
└── daily-notes/                       # Auto-generated daily briefings
```

**Files marked "DO NOT EDIT"** are maintained by the repository author. Updates come through `git pull`. Your personal files (time-lord.md, weekly-rhythms.md, client files, daily notes) are gitignored and never touched by updates.

---

## After the briefing

The `/start` command gives you the snapshot. But the Chief of Staff stays in the conversation. Ask follow-up questions:

- "Prep me for the Christine call at noon"
- "What did I promise Jamie last week?"
- "Draft a Slack message to the team about the deadline change"
- "What's my full schedule look like next week?"
- "Audit all open items across every client"

It pulls the relevant files only when you ask. Fast boot, deep dives on demand.

---

## Tips for getting the most out of it

- **One session per day.** Start your day with `/start`, then keep that session open for follow-ups. This keeps context warm and tokens low.
- **Update Time Lord daily.** It's your source of truth. If it's stale, your briefing is stale.
- **Be brutally honest in your Operating Manual.** The more the AI knows about how you actually work (not how you wish you worked), the better it serves you.
- **Use client files as living documents.** After every client call, dump notes into their file. The Chief of Staff will surface them when relevant.

---

## Version History

| Version | Date | What changed |
|---------|------|-------------|
| 1.0.0 | 2026-04-09 | Initial release. RAG-style /start command, template system, daily briefing format. |

---

## Credits

Created by **[Caleb Peavy](https://calebpeavy.com)**

Built with [Claude Code](https://claude.ai/code) by Anthropic.

---

*This isn't just a prompt. It's a system. Fill in your files, run the command, and get your mornings back.*
