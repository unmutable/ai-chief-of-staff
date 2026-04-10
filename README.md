# AI Chief of Staff

**Version 1.2.0**

You don't need another productivity app. You need someone who already knows what's on your plate, what's overdue, and what's about to blow up. Someone who shows up every morning with a briefing, not a blank screen.

That's what this is.

AI Chief of Staff turns Claude Code into a personal executive assistant that actually understands your life. Not just your calendar. Your clients, your deadlines, your recurring commitments, the stuff you told someone you'd do three weeks ago that's still sitting there.

## What this does

- **Morning briefing in under 15 seconds.** One command. You get today's priorities, your schedule, what's overdue, and what needs attention this week. No scrolling. No triage. Just the list.
- **Knows your entire workload.** Clients, projects, deadlines, personal commitments. All in plain markdown files you control. No proprietary database, no vendor lock-in.
- **Only loads what matters right now.** Built on a RAG-style architecture, so it reads only today's slice of your data on boot. Deep dives happen when you ask for them, not every time you start your day.
- **Becomes your second brain's executive function.** Your notes live in Obsidian. Your Chief of Staff reads them, writes your daily briefing, and opens it for you. One system, zero friction.
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

## The Stack

Three tools. All of them matter.

| Tool | What it does | Cost |
|------|-------------|------|
| [**Obsidian**](https://obsidian.md) | Where your files live. Markdown notes, local-first, you own everything. | Free (Sync is $4/mo, recommended) |
| [**Claude Code**](https://claude.ai/code) | The AI that reads your files and runs your briefing. | Pro $20/mo or Max $100/mo |
| [**Wispr Flow**](https://wisprflow.ai/r?CALEB765) | Voice-to-text so you can talk instead of type. Dictate your Operating Manual, dump notes after calls, update deadlines by just saying them out loud. This is how I built my own setup. | [Get 1 month free here.](https://wisprflow.ai/r?CALEB765) |

**Why Obsidian Sync?** Your Chief of Staff files are your entire professional brain. Obsidian Sync backs them up automatically, encrypts them end-to-end, and keeps everything in sync across devices. If your laptop dies tomorrow, you lose nothing. It's $4/mo for peace of mind. Get it.

---

## Installation

### Step 1: Install your tools

**Claude Code** (required):

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

Follow the prompts to log in. You'll need a Claude subscription (Pro at $20/mo or Max at $100/mo).

**Obsidian** (required): Download from [obsidian.md](https://obsidian.md). Create a vault if you don't have one. Turn on Obsidian Sync if you want your files backed up and available on all your devices.

**Wispr Flow** (recommended): Download from [wisprflow.ai](https://wisprflow.ai/r?CALEB765). This lets you talk instead of type when filling in your files. Seriously, don't skip this. Your Operating Manual and Personal Profile are 10x easier to fill out when you can just talk through them. [Get 1 month free.](https://wisprflow.ai/r?CALEB765)

### Step 2: Install into your Obsidian vault

**If you're starting fresh (no existing vault structure):**

```bash
cd ~/path/to/your/obsidian/vault
git clone https://github.com/unmutable/ai-chief-of-staff.git
cd ai-chief-of-staff
```

**If you already have an Obsidian vault with your own folders and files:**

Don't clone inside your vault. Clone the repo somewhere else, then run the installer to copy only the system files into your vault. Your existing files are never touched.

```bash
git clone https://github.com/unmutable/ai-chief-of-staff.git ~/ai-chief-of-staff
cd ~/ai-chief-of-staff
bash install.sh ~/path/to/your/obsidian/vault
```

The installer copies commands, agents, scripts, and templates into your vault. It never overwrites existing files. If you already have a CLAUDE.md, it leaves yours alone.

On Mac, your vault path is usually something like `~/Documents/MyVault` or `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/YourVault`.

### Step 3: Run setup

```bash
cd ~/path/to/your/obsidian/vault
claude
```

Then type:

```
/setup
```

The setup wizard scans your vault and adapts to your existing folder structure. If you already have folders for projects, team members, daily notes, or anything else, it maps to them instead of creating new ones. It asks you questions one at a time, builds your files for you, and tells you when you're done. Nothing gets overwritten.

**Pro tip:** Turn on Wispr Flow before you start `/setup`. You can dictate your answers instead of typing them. Way faster, way more natural.

### Step 4: Start your first day

Once setup is complete:

```
/start
```

Your briefing generates, your daily note populates, and you're working. That's the whole workflow. Every morning, open your terminal, run `claude`, type `/start`.

### Get updates

When new versions drop:

**If you cloned directly (fresh vault):**

```bash
cd ~/path/to/your/vault/ai-chief-of-staff
git pull origin main
```

**If you used the installer (existing vault):**

```bash
cd ~/ai-chief-of-staff
git pull origin main
bash install.sh ~/path/to/your/obsidian/vault
```

The installer re-copies system files (commands, agents, scripts) but never overwrites your CLAUDE.md, personal files, or vault data.

---

## File Structure

```
ai-chief-of-staff/
├── CLAUDE.md                          # AI instructions (DO NOT EDIT)
├── VERSION                            # Current version
├── README.md                          # You're reading this
├── .claude/
│   └── commands/
│       ├── start.md                   # The /start command (DO NOT EDIT)
│       └── setup.md                   # The /setup wizard (DO NOT EDIT)
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
├── daily-notes/                       # Auto-generated daily briefings
└── scripts/
    ├── welcome.sh                     # Branded welcome banner
    └── setup-check.sh                # Setup progress display
```

**Files marked "DO NOT EDIT"** are maintained by the repository author. Updates come through `git pull`. Your personal files (time-lord.md, weekly-rhythms.md, client files, daily notes) are gitignored and never touched by updates.

---

## After the briefing

The `/start` command gives you the snapshot. But the Chief of Staff stays in the conversation. Ask follow-up questions:

- "Prep me for the client call at noon"
- "What did I promise Sarah last week?"
- "Draft a Slack message to the team about the deadline change"
- "What's my full schedule look like next week?"
- "Audit all open items across every client"

It pulls the relevant files only when you ask. Fast boot, deep dives on demand.

---

## Tips for getting the most out of it

- **One session per day.** Start your day with `/start`, then keep that session open for follow-ups. This keeps context warm and tokens low.
- **Update Time Lord daily.** It's your source of truth. If it's stale, your briefing is stale. Use Wispr Flow to dictate updates as they come in.
- **Be brutally honest in your Operating Manual.** The more the AI knows about how you actually work (not how you wish you worked), the better it serves you.
- **Use client files as living documents.** After every client call, dump notes into their file. The Chief of Staff will surface them when relevant.
- **Talk, don't type.** [Wispr Flow](https://wisprflow.ai/r?CALEB765) turns your voice into text anywhere on your computer. Dictate meeting notes, update deadlines, brain dump into your daily note. It's how this whole system was built. ([Get 1 month free.](https://wisprflow.ai/r?CALEB765))

---

## Version History

| Version | Date | What changed |
|---------|------|-------------|
| 1.0.0 | 2026-04-09 | Initial release. RAG-style /start command, guided /setup onboarding, template system, daily briefing format. |
| 1.1.0 | 2026-04-09 | Vault structure map in CLAUDE.md. AI now files to Obsidian instead of Claude memory. Directory skeleton ships with repo. |
| 1.2.0 | 2026-04-09 | Three-tier agent architecture (Opus/Sonnet/Haiku). Delegation Writer and Data Runner agents. Agent architecture playbook. |

---

## Credits

Created by **[Caleb Peavy](https://calebpeavy.com)**

Built with [Claude Code](https://claude.ai/code) by Anthropic.

---

*This isn't just a prompt. It's a system. Fill in your files, run the command, and get your mornings back.*
