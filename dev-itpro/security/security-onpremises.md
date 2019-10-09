---
title: "User Security in Business Central"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Business Central On-Premises Security

This section helps you understand and improve the security of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] hosted on-premises. In the links below you will find information, hardening guidance and recommended best practices addressing client, database, server and network security.  

## Authentication

Before users can sign-in to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application, they must be authenticated as valid user in the system. Business Central supports several authentication methods. You configure the authentication method on the server-tiers of Business Central.

For more information, see [Authentication and Credential Types](../administration/users-credential-types.md).

## Server Security

[!INCLUDE[server](../developer/includes/server.md)] handles communication between clients and databases, controlling authentication, event logging, scheduled tasks, reporting and more. The following articles explain how to improve the security of [!INCLUDE[server](../developer/includes/server.md)] instances.

[Hardening [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Server Security](enhancing-server-instance-security.md)  

[Locking Down Server Communication settings](security-lock-down-server-communication.md)  

<!-- [Using Multiple Business Central Servers for Stability](security-multiple-server-instances.md) available soon-->  

## Client Security

The following articles explain how to improve the security of connections from the clients to the [!INCLUDE[server](../developer/includes/server.md)].  

[Configuring SSL to Secure the Client Connections](../deployment/configure-ssl-web-client-connection.md)

[Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md)

## Database Security

The articles in this section explain how to improve database security in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

The following articles discuss configurations that you can perform on the Business Central Server:

[Configuring the Database](../administration/configure-sql-server-authentication.md)

[Encrypt Traffic](enhancing-server-instance-security.md#data-encryption)

<!-- coming soon [Minimum database user privileges](security-minimum-database-user-privileges.md)  -->

The following are general articles about SQL Server security that can also help secure the database:

[Upgrade to TLS 1.2](https://support.microsoft.com/en-us/help/3135244/tls-1-2-support-for-microsoft-sql-server)
  
[Data Encryption at Rest](transparent-data-encryption.md)

[SQL Server Hardening](https://docs.microsoft.com/en-us/sql/relational-databases/security/securing-sql-server?view=sql-server-2017)
  
[SQL Server Auditing](https://docs.microsoft.com/en-us/sql/relational-databases/security/auditing/sql-server-audit-database-engine?view=sql-server-2017)

[Backup Encryption](https://docs.microsoft.com/en-us/sql/relational-databases/backup-restore/backup-encryption?view=sql-server-2017)

## Network Security

The following articles explain to secure client, web service, and PowerBI connections over a wide area network using HTTPS and security certificates. 

[Configuring SSL to Secure the Client Connections](../deployment/configure-ssl-web-client-connection.md)

[Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md)

[Connect to Business Central with Power BI](https://docs.microsoft.com/en-us/power-bi/service-connect-to-microsoft-dynamics-nav)

## See Also  

[Security and Protection](security-and-protection.md)  
[Data Security](data-security.md)  
