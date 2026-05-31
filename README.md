# Automated Reverse Shell Handler (PoC) 🛡️

> **Historical Note:** *This project was originally developed in April 2022 during my early explorations into cybersecurity methodologies, Linux administration, and bash automation. It has been migrated and refactored here for archival and portfolio purposes.*

This repository contains a lightweight, two-part Bash script utility designed to demonstrate a basic **Reverse Shell** connection using standard Unix networking infrastructure. It serves as an educational Proof-of-Concept (PoC) highlighting network socket bindings, automated interface IP parsing, and remote command-line administration.

## 🧠 Architectural Overview

In a typical remote connection (like SSH), the client connects directly to the server. However, in restricted network environments protected by firewalls, inbound connections are often blocked while outbound traffic is permitted. 

A **Reverse Shell** flips this paradigm: the target (victim) initiates an *outbound* connection to the administration station (attacker), bypassing strict ingress firewall rules.

## 🛠️ Features & Technical Implementation

* **Dynamic IP Parsing:** The attacker script leverages core Linux pipeline utilities (`ifconfig`, `grep`, `awk`, and `sed`) to dynamically isolate and extract the local IPv4 address of a specified network interface (e.g., `eth0`, `wlan0`), automating manual network configuration steps.
* **Environment Agnostic:** Built entirely using native POSIX compliant Bash syntax and standard binaries (`netcat`/`nc`), requiring zero external heavy frameworks.
* **Post-Execution Cleanup:** The victim script features a basic anti-forensic post-execution mechanism (`history -c`) to demonstrate awareness of system footprint management during cybersecurity audits.

## ⚙️ How It Works

### 1. Attacker Setup (The Listener)
The administrator runs the attacker script, selects the target network interface, and spins up a dedicated `netcat` listening server bound specifically to that network interface's IP on port `87`.

```bash
chmod +x attacker.sh
./attacker.sh
```

### 2. Victim Execution (The Payload)
The target execution script connects back to the listening machine's designated IP and port, redirection routing standard input/output streams to allow remote terminal interaction.

```bash
chmod +x victim.sh
./victim.sh
```

## ⚠️ Disclaimer
This project is strictly intended for educational use, internal network troubleshooting, authorized penetration testing exercises, and portfolio demonstration. Running unauthorized remote access tools on infrastructures without explicit prior consent is strictly illegal.
