Capstone Project – Initial Configuration & Inventory
This directory contains documentation for the initial setup and hardware inventory involved in the Capstone project.

🖥️ Project Overview
The Capstone project begins with deploying a virtualized network environment using an Intel NUC and VMware ESXi. This forms the foundation for a segmented lab network consisting of:

Multiple VLANs

Two Domain Controllers

One Windows 11 host

A physical Cisco Layer 3 switch for routing and VLAN management

🔧 Hardware & Software Inventory
Component	Description
Intel NUC	Flashed with VMware ESXi; hosts the virtual environment
VMware ESXi	Hypervisor used to create and manage the lab VMs
Cisco Layer 3 Switch	Acts as both a Layer 2 switch and Layer 3 router
Classroom PC	Used to access the environment via VLAN 10

NUC Configuration
ESXi Installed on Intel NUC

Created and documented root account and password

Assigned static IP: 10.108.0.5

Connected to physical network via trunk port on the switch

🔌 Network Cabling & VLAN Mapping
Switch Port	Connected Device	VLAN	Purpose
Port 1	NUC (via trunk port)	All VLANs	Carries all VLAN traffic to ESXi
Port 3	Classroom PC	VLAN 10	Access to virtual network
Port 5	TS Switch (external)	Static route	Routed for external access via static route

📸 Visual Overview
A physical setup photo is referenced in this directory, showing:

The Cisco Layer 3 switch (mau rod)

Ports 1, 3, and 5 usage

The NUC located at the bottom of the setup
