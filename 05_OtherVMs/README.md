📁 06-Additional-VMs
Capstone Project – Additional Virtual Machines
This section provides a brief overview of various additional virtual machines configured during the capstone project. These systems were used to expand functionality, simulate real-world services, and support security testing within the isolated lab environment.

📬 Postfix Mail Server (Linux)
A Linux VM was configured with Postfix to simulate an internal mail server.

SMTP/IMAP services were configured for basic message delivery and retrieval.

Mail was successfully sent between test user accounts.

🐳 Docker VM
A separate Linux VM was used to install and run Docker. I also created the "webdev" (Web Development) VLAN for this service specifically, that is able to be seen by the student and teacher networks.

This system was used for containerization practice and to host lightweight services in isolated environments.

🔍 Vulnerability Scanner (Nessus)
Nessus Essentials was installed on a dedicated VM.

Used to perform internal vulnerability scans on other VMs and services. An in-depth scan was run on my Windows domain controller

Confirmed detection of common misconfigurations and security gaps in test environments.

🌐 WordPress Server
A Linux-based WordPress server was configured for web hosting.

A sample template was used just to have something different to look at from other devices in the network.
