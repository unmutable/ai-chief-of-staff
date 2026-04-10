#!/bin/bash
# AI Chief of Staff - Welcome Banner
# This script displays the branded welcome screen.

CYAN='\033[36m'
BOLD='\033[1m'
WHITE='\033[1;37m'
YELLOW='\033[33m'
GREEN='\033[32m'
DIM='\033[2m'
RESET='\033[0m'

VERSION=$(cat "$(dirname "$0")/../VERSION" 2>/dev/null || echo "1.0.0")

echo ""
echo -e "${CYAN}  ┌──────────────────────────────────────────────────────┐${RESET}"
echo -e "${CYAN}  │                                                      │${RESET}"
echo -e "${CYAN}  │${RESET}   ${WHITE}${BOLD}◆  A I   C H I E F   O F   S T A F F${RESET}${CYAN}              │${RESET}"
echo -e "${CYAN}  │                                                      │${RESET}"
echo -e "${CYAN}  │${RESET}      ${DIM}v${VERSION}${RESET}${CYAN}                                          │${RESET}"
echo -e "${CYAN}  │${RESET}      ${YELLOW}Your mornings are about to change.${RESET}${CYAN}              │${RESET}"
echo -e "${CYAN}  │                                                      │${RESET}"
echo -e "${CYAN}  └──────────────────────────────────────────────────────┘${RESET}"
echo ""
