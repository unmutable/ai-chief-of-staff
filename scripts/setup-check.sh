#!/bin/bash
# AI Chief of Staff - Setup Status Check
# Returns which files exist and which still need to be created.

CYAN='\033[36m'
GREEN='\033[32m'
RED='\033[31m'
YELLOW='\033[33m'
DIM='\033[2m'
BOLD='\033[1m'
RESET='\033[0m'

ROOT="$(dirname "$0")/.."
READY=0
TOTAL=4

check_file() {
  local path="$1"
  local label="$2"
  if [ -f "$ROOT/$path" ]; then
    echo -e "  ${GREEN}✓${RESET}  ${label}"
    READY=$((READY + 1))
  else
    echo -e "  ${RED}✗${RESET}  ${label} ${DIM}(not yet created)${RESET}"
  fi
}

echo ""
echo -e "  ${BOLD}Setup Status${RESET}"
echo -e "  ${DIM}─────────────────────────────────${RESET}"
check_file "chief-of-staff/time-lord.md" "Time Lord (deadlines)"
check_file "chief-of-staff/personal/weekly-rhythms.md" "Weekly Rhythms (schedule)"
check_file "chief-of-staff/personal/operating-manual.md" "Operating Manual (how you work)"
check_file "chief-of-staff/personal/personal-profile.md" "Personal Profile (who you are)"
echo -e "  ${DIM}─────────────────────────────────${RESET}"

if [ $READY -eq $TOTAL ]; then
  echo -e "  ${GREEN}${BOLD}All set!${RESET} Run ${CYAN}/start${RESET} to begin your day."
elif [ $READY -eq 0 ]; then
  echo -e "  ${YELLOW}No files set up yet.${RESET} Let's get started!"
else
  echo -e "  ${YELLOW}${READY}/${TOTAL} complete.${RESET} Let's keep going."
fi
echo ""
