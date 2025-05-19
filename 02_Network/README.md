Capstone Project – Network Configuration & VLAN Setup
This section documents the logical network layout, subnetting, DHCP configuration, and VLAN assignments for the virtualized environment hosted on VMware ESXi.

🌐 Network Overview

VLAN Name	VLAN ID	Subnet	Gateway IP	DHCP Range / Notes
Classroom Clients	10	10.108.10.0/24	10.108.10.1	10.108.10.50 – 10.108.10.200
Virtual Clients	20	10.108.20.0/24	10.108.20.1	10.108.20.50 – 10.108.20.200
Servers	30	10.108.30.0/24	10.108.30.1	Static IPs
Cisco Devices	40	10.108.40.0/24	10.108.40.1	Static IPs (e.g., for Intel NUC)
Parking Lot	50	10.108.50.0/24	10.108.50.1	Static IPs (unused switch ports)

🖥️ VMware ESXi Virtual Network
Hypervisor: VMware ESXi on Intel NUC

Virtual Switch: vSwitch0

VLAN Assignment: Using port groups, each tied to a VLAN ID via ESXi's networking tab.

VLAN	Assigned To
10	Classroom clients
20	Virtual clients
30	Domain Controllers (Windows Server 2022)
40	NUC and cisco devices
50	Placeholder for unused ports (Parking Lot)

🛠️ DHCP Configuration
Server: Windows Server 2022

Roles Installed:

Active Directory Domain Services (AD DS)

DHCP Server

Key Notes:

AD DS must be installed and the server promoted before DHCP will fully function.

DHCP scopes were configured for VLANs 10 and 20.

Working DHCP leases were confirmed on both classroom and virtual clients.

🌍 Static Route to TS Switch
Purpose: External network access for testing

Connection: Switch Port 5

Method: Static IP route from Layer 3 switch

Result: Successful web interface access to the TS Switch via HTTP
