#!/bin/bash
# AI Chief of Staff - Installer
# Copies system files into an existing Obsidian vault without touching your data.

CYAN='\033[36m'
BOLD='\033[1m'
WHITE='\033[1;37m'
YELLOW='\033[33m'
GREEN='\033[32m'
RED='\033[31m'
DIM='\033[2m'
RESET='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
VERSION=$(cat "$SCRIPT_DIR/VERSION" 2>/dev/null || echo "unknown")

echo ""
echo -e "${CYAN}  ┌──────────────────────────────────────────────────────┐${RESET}"
echo -e "${CYAN}  │                                                      │${RESET}"
echo -e "${CYAN}  │${RESET}   ${WHITE}${BOLD}◆  A I   C H I E F   O F   S T A F F${RESET}${CYAN}              │${RESET}"
echo -e "${CYAN}  │                                                      │${RESET}"
echo -e "${CYAN}  │${RESET}      ${DIM}Installer v${VERSION}${RESET}${CYAN}                                  │${RESET}"
echo -e "${CYAN}  │                                                      │${RESET}"
echo -e "${CYAN}  └──────────────────────────────────────────────────────┘${RESET}"
echo ""

# Determine target directory
if [ -n "$1" ]; then
  TARGET="$1"
else
  echo -e "  ${BOLD}Where is your Obsidian vault?${RESET}"
  echo -e "  ${DIM}Paste the full path to your vault root directory.${RESET}"
  echo -e "  ${DIM}Example: ~/Documents/MyVault${RESET}"
  echo ""
  read -p "  Path: " TARGET
fi

# Expand tilde
TARGET="${TARGET/#\~/$HOME}"

# Validate target
if [ ! -d "$TARGET" ]; then
  echo -e "\n  ${RED}Error:${RESET} Directory not found: $TARGET"
  echo -e "  ${DIM}Make sure the path exists and try again.${RESET}\n"
  exit 1
fi

echo ""
echo -e "  ${BOLD}Installing to:${RESET} $TARGET"
echo -e "  ${DIM}─────────────────────────────────${RESET}"

# Copy .claude/ directory (commands and agents)
echo -e "  ${DIM}Copying commands and agents...${RESET}"
mkdir -p "$TARGET/.claude/commands"
mkdir -p "$TARGET/.claude/agents"

cp "$SCRIPT_DIR/.claude/commands/start.md" "$TARGET/.claude/commands/start.md"
cp "$SCRIPT_DIR/.claude/commands/setup.md" "$TARGET/.claude/commands/setup.md"
cp "$SCRIPT_DIR/.claude/agents/delegation-writer.md" "$TARGET/.claude/agents/delegation-writer.md"
cp "$SCRIPT_DIR/.claude/agents/data-runner.md" "$TARGET/.claude/agents/data-runner.md"
echo -e "  ${GREEN}✓${RESET}  Commands: /start, /setup"
echo -e "  ${GREEN}✓${RESET}  Agents: delegation-writer, data-runner"

# Copy scripts
echo -e "  ${DIM}Copying scripts...${RESET}"
mkdir -p "$TARGET/scripts"
cp "$SCRIPT_DIR/scripts/welcome.sh" "$TARGET/scripts/welcome.sh"
cp "$SCRIPT_DIR/scripts/setup-check.sh" "$TARGET/scripts/setup-check.sh"
chmod +x "$TARGET/scripts/welcome.sh" "$TARGET/scripts/setup-check.sh"
echo -e "  ${GREEN}✓${RESET}  Scripts: welcome banner, setup check"

# Copy templates (never overwrite existing files)
echo -e "  ${DIM}Copying templates...${RESET}"
mkdir -p "$TARGET/chief-of-staff/templates"
cp "$SCRIPT_DIR/chief-of-staff/templates/"*.template.md "$TARGET/chief-of-staff/templates/" 2>/dev/null
cp "$SCRIPT_DIR/chief-of-staff/clients/_example-client.md" "$TARGET/chief-of-staff/templates/_example-client.md" 2>/dev/null
echo -e "  ${GREEN}✓${RESET}  Templates copied to chief-of-staff/templates/"

# Copy playbooks (don't overwrite if they exist)
mkdir -p "$TARGET/chief-of-staff/playbooks"
if [ ! -f "$TARGET/chief-of-staff/playbooks/agent-architecture.md" ]; then
  cp "$SCRIPT_DIR/chief-of-staff/playbooks/agent-architecture.md" "$TARGET/chief-of-staff/playbooks/agent-architecture.md"
  echo -e "  ${GREEN}✓${RESET}  Agent architecture playbook"
else
  echo -e "  ${DIM}─${RESET}  Agent architecture playbook (already exists, skipped)"
fi

# Copy CLAUDE.md only if one doesn't exist
if [ ! -f "$TARGET/CLAUDE.md" ] && [ ! -f "$TARGET/.claude/CLAUDE.md" ]; then
  cp "$SCRIPT_DIR/CLAUDE.md" "$TARGET/CLAUDE.md"
  echo -e "  ${GREEN}✓${RESET}  CLAUDE.md (base instructions)"
else
  echo -e "  ${YELLOW}!${RESET}  CLAUDE.md already exists, ${BOLD}not overwritten${RESET}"
  echo -e "     ${DIM}Review $SCRIPT_DIR/CLAUDE.md for new settings to add manually.${RESET}"
fi

# Copy VERSION
cp "$SCRIPT_DIR/VERSION" "$TARGET/.claude/VERSION" 2>/dev/null

echo ""
echo -e "  ${DIM}─────────────────────────────────${RESET}"
echo -e "  ${GREEN}${BOLD}Done!${RESET}"
echo ""
echo -e "  ${BOLD}Next steps:${RESET}"
echo -e "  1. ${CYAN}cd \"$TARGET\"${RESET}"
echo -e "  2. ${CYAN}claude${RESET}"
echo -e "  3. Type ${CYAN}/setup${RESET} to configure your Chief of Staff"
echo ""
echo -e "  ${DIM}The setup wizard will scan your vault and adapt to your${RESET}"
echo -e "  ${DIM}existing folder structure. Nothing gets overwritten.${RESET}"
echo ""
