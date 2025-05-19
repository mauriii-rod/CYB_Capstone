Capstone Project – Active Directory & Core Infrastructure Services
This section documents the configuration of Active Directory Domain Services (AD DS) and key infrastructure services that support and extend domain functionality. These services were hosted across two Windows Server 2022 virtual machines running on VMware ESXi, and form the backbone of authentication, device management, and network services for the capstone lab environment.

🧩 Domain Setup
✅ Domain Controllers
Two Windows Server 2022 VMs were promoted as Domain Controllers for the domain mauri.local.

Domain controller setup followed best practices including DNS pointing, role installation, and DSRM password configuration.

🏁 DC Promotion Process
Steps included:

Installing the Active Directory Domain Services role via Server Manager

Promoting the secondary server to a Domain Controller

Registering it with the existing domain using domain admin credentials

🖇️ Organizational Units (OUs) & Users
Multiple OUs were created, such as Employees, NetworkEngineers, and NetworkTechs

Group structures aligned with security needs and RADIUS authentication

PowerShell scripts were used to automate user creation and group assignment

⚙️ PowerShell Automation
Two scripts were developed:

User Creation Script
Creates new users within designated OUs

Weekly Export Script
Scheduled task that generates a .txt list of all users in the Employees OU on a weekly basis

🧭 DNS & DHCP Configuration
📡 DHCP
Hosted on a domain controller

Address pools configured for VLANs 10 and 20 (Classroom and Virtual Clients)

Supports dynamic IP assignment for domain-joined devices

🌐 DNS
Integrated with AD

Configured to support domain resolution and replication across domain controllers

🔐 Group Policy Configuration
A domain-wide Group Policy was applied to enforce:

Password complexity requirements

Password expiration policies

Policy was applied at the domain level and verified through the Group Policy Management Console

🛡️ RADIUS (NPS) Configuration
🧩 Setup Steps:
Installed the Network Policy and Access Services role on the secondary domain controller

Registered the NPS server with Active Directory

Added the Cisco Layer 3 switch as a RADIUS client in NPS using its IP

📜 Network Policy
Created RADIUS policy for users in NetworkEngineers and NetworkTechs OUs

Policy conditions:

Windows group membership based on OU

Constraints:

EAP-MSCHAPv2 and Smart Card authentication types enabled

Less secure authentication methods disabled

Vendor-specific attributes:

shell:priv-lvl=15 for Engineers

shell:priv-lvl=1 for Techs

🔧 Switch Configuration
Cisco Layer 3 switch was configured to authenticate CLI logins via RADIUS

Login attempts from console/SSH confirmed RADIUS-based authentication success

📁 TFTP Configuration
TFTP Server installed via a lightweight 64-bit installer from GitHub

Firewall rule created for inbound traffic on UDP port 69

A directory on the server was specified for backup file storage

📤 Use Case:
Cisco switch configuration files were successfully exported to the TFTP server

This serves as a reliable backup method for switch configuration management
