📁 06-Additional-VMs
Capstone Project – Additional Virtual Machines
This section provides a brief overview of various additional virtual machines configured during the capstone project. These systems were used to expand functionality, simulate real-world services, and support security testing within the isolated lab environment.

📬 Postfix Mail Server (Linux)
A Linux VM was configured with Postfix to simulate an internal mail server.

Mail was successfully sent between test user accounts.

SMTP/IMAP services were configured for basic message delivery and retrieval.

🐳 Docker VM
A separate Linux VM was used to install and run Docker.

This system was used for containerization practice and to host lightweight services in isolated environments.

Sample containers were run to test network accessibility and segmentation.

🔍 Vulnerability Scanner (Nessus)
Nessus Essentials was installed on a dedicated VM.

Used to perform internal vulnerability scans on other VMs and services.

Confirmed detection of common misconfigurations and security gaps in test environments.

🌐 WordPress Server
A Linux-based WordPress server was configured for web hosting.

Served as both a functional CMS and a test target for web-based vulnerability scans.

Hosted in its own VLAN or behind the Docker VM depending on setup phase.
