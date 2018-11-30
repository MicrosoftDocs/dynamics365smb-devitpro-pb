---
title: "User Security in Business Central"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# On-premises Security in Business Central

This section helps you understand and improve the security of Business Central hosted on-premises. In the links below you will find information, hardening guidance and recommended best practices addressing client, database, server and network security.  
 
 
## Authentication 

[Authentication and Credential Types](../administration/users-credential-types.md)

Link to new page on Authentication types 

## Server Security

[Server hardening](enhancing-server-instance-security.md)  
 
[Locking Down Server Communication settings](security-lock-down-server-communication.md)  
 
 
Should link to https://docs.microsoft.com/en-us/dynamics-nav/configuring-microsoft-dynamics-nav-server  
  
New page Using multiple NSTs for stability 
 
 
 
## Client Security

[https://docs.microsoft.com/en-us/dynamics-nav/How-to--Implement-Security-Certificates-in-a-Production-Environment#configuring-the-includenavwindowsincludesnavwindowsmdmd-or-includenavwebserverincludesnavwebservermdmd  
Database security 
https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/configure-sql-server-authentication  
Encrypt traffic -> https://docs.microsoft.com/en-us/dynamics-nav/enhancing-microsoft-dynamics-nav-server-security#data-encryption-between-includenavserverincludesnavservermdmd-and-sql-server  
Upgrade to TLS 1.2 -> https://support.microsoft.com/en-us/help/3135244/tls-1-2-support-for-microsoft-sql-server  
Transparent Data Encryption (TDE) -> https://review.docs.microsoft.com/en-us/dynamics-nav/transparent-data-encryption?branch=TFS267001-TDE  
Minimum database user privileges -> new page 
SQL Server hardening -> https://docs.microsoft.com/en-us/sql/relational-databases/security/securing-sql-server?view=sql-server-2017  
SQL Server auditing -> https://docs.microsoft.com/en-us/sql/relational-databases/security/auditing/sql-server-audit-database-engine?view=sql-server-2017 
Backup encryption -> https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/backup-encryption?view=sql-server-2017  
 
Network security 
Walkthrough: Configuring Web Services to Use SSL (SOAP and OData). 
Configuring SSL to Secure the Connection to Dynamics NAV Web Client  
How to: Implement Security Certificates in a Production Environment 
Always use HTTPS to connect to PowerBI server -> https://docs.microsoft.com/en-us/power-bi/service-connect-to-microsoft-dynamics-nav  
Always use HTTPS to connect to web services -> https://docs.microsoft.com/en-us/dynamics-nav/walkthrough--configuring-web-services-to-use-ssl--soap-and-odata-
## Intro - what is hardening

## Encryption 


## TDE 



  

## See Also  

[Security and Protection](security-and-protection.md)  
[Data Security](data-security.md)  
