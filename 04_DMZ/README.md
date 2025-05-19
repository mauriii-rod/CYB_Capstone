Capstone Project – DMZ Web Server, HTTPS, OSPF & ACLs
This section of the project focuses on implementing a Demilitarized Zone (DMZ) within the virtualized network environment to securely host a CentOS web server. This includes creating a DMZ VLAN, configuring HTTPS access with a self-signed certificate, and implementing OSPF routing and ACLs for traffic control.

🛰️ DMZ VLAN Overview
A dedicated DMZ VLAN was created to logically segment the web server from the internal network.

The VLAN was configured on both the Cisco Layer 3 switch and the ESXi virtual switch.

This segmentation supports the security principle of isolating publicly accessible services from internal systems.

🌐 Web Server Configuration (CentOS)
🔧 HTTP/HTTPS Setup
A CentOS VM was used as the web server, with httpd already pre-installed.

A self-signed SSL certificate was generated and configured to enable HTTPS access to the server.

⚙️ ssl.conf Configuration
Updated fields in /etc/httpd/conf.d/ssl.conf:

SSLCertificateFile and SSLCertificateKeyFile paths were modified to point to the generated cert and key

ServerName was set to the IP address of the server

Listen and VirtualHost ports set to 443 for HTTPS

🔁 HTTP → HTTPS Redirection
A separate configuration file was created to redirect HTTP traffic to HTTPS.

This ensured secure connections by default.

📡 DNS and Hostname (Optional Testing)
Although not required, a DNS entry (web.mauri.local) was temporarily created on the domain controller for testing hostname-based redirection.

This was reverted to IP-based access due to DNS constraints in the test environment.

🔐 SSL Certificate
The HTTPS setup successfully presented a self-signed certificate when accessed via browser.

While untrusted by default (as expected), the presence of the certificate validated the secure configuration.

📶 OSPF Configuration
OSPF (Open Shortest Path First) was configured on the Layer 3 switch to advertise the DMZ subnet and integrate it into the existing routing structure.

This allowed internal devices with access to route to the DMZ subnet as needed.

🚧 Access Control Lists (ACLs)
ACLs were implemented on the Layer 3 switch to limit traffic to/from the DMZ.

Only necessary ports (such as 443 for HTTPS) were allowed.

Internal VLANs were restricted from directly accessing other services on the DMZ subnet, following the principle of least privilege.

✅ Result
The DMZ CentOS server is securely hosting a website over HTTPS.

Proper segmentation, routing, and access controls are in place to isolate and protect internal resources.

This completes the implementation of a secure, accessible, and controlled web server in the capstone network.

