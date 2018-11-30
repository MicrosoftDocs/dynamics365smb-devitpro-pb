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

[Using Multiple Business Central Servers for Stability](security-multiple-server-instances.md)  

## Client Security

[Configuring SSL to Secure the Client Connections](../deployment/configure-ssl-web-client-connection.md)

[Using Security Certificates with Business Central On-Premises](..deployment/implement-security-certificates-production-environment.md)

## Database Security

[Configuring the Database](../administration/configure-sql-server-authentication.md)

[Encrypt Traffic](enhancing-server-instance-security.md#data-encryption-between-includenavserverincludesnavservermdmd-and-sql-server)

[Upgrade to TLS 1.2](https://support.microsoft.com/en-us/help/3135244/tls-1-2-support-for-microsoft-sql-server)
  
[Transparent Data Encryption](transparent-data-encryption.md)

[Minimum database user privileges](security-minimum-database-user-privileges.md)

[SQL Server Hardening](https://docs.microsoft.com/en-us/sql/relational-databases/security/securing-sql-server?view=sql-server-2017)
  
[SQL Server Auditing](https://docs.microsoft.com/en-us/sql/relational-databases/security/auditing/sql-server-audit-database-engine?view=sql-server-2017)

[Backup Encryption](https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/backup-encryption?view=sql-server-2017)
 
## Network Security

[Configuring SSL to Secure the Client Connections](../deployment/configure-ssl-web-client-connection.md)

[Using Security Certificates with Business Central On-Premises](..deployment/implement-security-certificates-production-environment.md)

Always use HTTPS to connect to PowerBI server -> https://docs.microsoft.com/en-us/power-bi/service-connect-to-microsoft-dynamics-nav  
Always use HTTPS to connect to web services -> https://docs.microsoft.com/en-us/dynamics-nav/walkthrough--configuring-web-services-to-use-ssl--soap-and-odata-

## See Also  

[Security and Protection](security-and-protection.md)  
[Data Security](data-security.md)  
