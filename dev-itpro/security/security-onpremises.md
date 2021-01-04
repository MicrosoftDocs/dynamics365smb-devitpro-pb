---
title: "Security in Business Central on-premises"
description: "Learn about the main aspects of security in your on-premises deployment of Dynamics 365 Business Central."
author: jswymer

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 10/01/2020
---
# Business Central On-Premises Security

This section helps you understand and improve the security of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] hosted on-premises. In the links below you will find information, hardening guidance and recommended best practices addressing client, database, server and network security.  

## Authentication

Before users can sign-in to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application, they must be authenticated as valid user in the system. Business Central supports several authentication methods. You configure the authentication method on the server-tiers of Business Central.

For more information, see [Authentication and Credential Types](../administration/users-credential-types.md).

## Server Security

[!INCLUDE[server](../developer/includes/server.md)] handles communication between clients and databases, controlling authentication, event logging, scheduled tasks, reporting and more. The following articles explain how to improve the security of [!INCLUDE[server](../developer/includes/server.md)] instances.

[Hardening [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server Security](enhancing-server-instance-security.md)  

[Locking Down Server Communication settings](security-lock-down-server-communication.md)  

<!-- [Using Multiple Business Central Servers for Stability](security-multiple-server-instances.md) available soon-->  

## Client Security

The following articles explain how to improve the security of connections from the clients to the [!INCLUDE[server](../developer/includes/server.md)].  

[Configuring SSL to Secure the Client Connections](../deployment/configure-ssl-web-client-connection.md)

[Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md)

## Database Security

The articles in this section explain how to improve database security in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

The following articles discuss configurations that you can perform on the Business Central Server:

[Configuring the Database](../administration/configure-sql-server-authentication.md)

[Encrypt Traffic](enhancing-server-instance-security.md#data-encryption)

<!-- coming soon [Minimum database user privileges](security-minimum-database-user-privileges.md)  -->

The following are general articles about SQL Server security that can also help secure the database:

[Upgrade to TLS 1.2](https://support.microsoft.com/help/3135244/tls-1-2-support-for-microsoft-sql-server)
  
[!INCLUDE [admin-tlswarning](../developer/includes/admin-tlswarning.md)]
[Data Encryption at Rest](transparent-data-encryption.md)

[SQL Server Hardening](/sql/relational-databases/security/securing-sql-server?view=sql-server-2017)
  
[SQL Server Auditing](/sql/relational-databases/security/auditing/sql-server-audit-database-engine?view=sql-server-2017)

[Backup Encryption](/sql/relational-databases/backup-restore/backup-encryption?view=sql-server-2017)

[Azure Database Security Best Practices](/azure/security/fundamentals/database-best-practices)

## Network Security

The following articles explain to secure client, web service, and PowerBI connections over a wide area network using HTTPS and security certificates. 

[Configuring SSL to Secure the Client Connections](../deployment/configure-ssl-web-client-connection.md)

[Using Security Certificates with Business Central On-Premises](../deployment/implement-security-certificates-production-environment.md)

[Connect to Business Central with Power BI](/power-bi/service-connect-to-microsoft-dynamics-nav)

## See Also  

[Security and Protection](security-and-protection.md)  
[Data Security](data-security.md)  
[Security Tips for Business Users](security-users.md)  
