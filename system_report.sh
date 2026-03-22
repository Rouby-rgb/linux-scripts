#!/bin/bash

# Colours
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Colour

echo -e "${CYAN}==============================${NC}"
echo -e "${CYAN}       SYSTEM REPORT${NC}"
echo -e "${CYAN}==============================${NC}"

echo -e "${YELLOW}User:${NC} $(whoami)"
echo -e "${YELLOW}Date:${NC} $(date)"

echo -e "\n${YELLOW}Disk Space:${NC}"
df -h /

echo -e "\n${YELLOW}RAM Usage:${NC}"
free -h

echo -e "\n${YELLOW}IP Address:${NC}"
hostname -I

# Disk warning
DISK=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
if [ $DISK -gt 80 ]; then
  echo -e "\n${RED}⚠️  WARNING: Disk is ${DISK}% full!${NC}"
else
  echo -e "\n${GREEN}✅ Disk is healthy at ${DISK}% used${NC}"
fi

echo -e "${CYAN}==============================${NC}"
