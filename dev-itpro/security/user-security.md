---
title: User Permissions and Security in Business Central
description: Provides information about managing user access to the database based on permissions and the different levels of security.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.service: "dynamics365-business-central"
---
# User Security in Business Central

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides a security system that allows administrators to manage user access to the objects and data in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. Because the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database is on SQL Server or Azure SQL Database, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] security system and either the SQL Server SQL Server or Azure SQL Database security system work together to help ensure that only authorized users can gain access to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  


## User permissions in the application

For users to access the application, they must be have a valid user account in the application. Then, they must be granted permissions to the various areas of the application, based on their role. The management of user accounts and permissions is done from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client. For more information, see the following articles in the Business Central application help:

-   [Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions)  

-   [Understanding Users, Profiles, and Role Centers](/dynamics365/business-central/admin-users-profiles-roles)

## User authentication
Before users can sign-in to the application, they must be authenticated as valid user in the system. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports several authentication methods. You configure the authentication method on the server-tiers of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

For more information, see [Authentication and Credential Types](../administration/users-credential-types.md).

## Limiting user access beyond the permission level

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides options for limiting and monitoring user access to the database. 
  
### Limiting access to specific database entries
  
 You can specify that each individual user or group can only access specific entries in the database. For example, you can limit access to the entries that relate to a specific department or project. This level of access control is known as record level security.  
  
### Time-limited passwords
  
Passwords in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] do not have time limits, but you can put time limits on user IDs.  
  
 If you have the required permissions, then you can delete a user ID from the system or cancel all permissions. If deleting a user ID is too drastic a step to take, then you can specify a limited time period during which a particular user ID is allowed to post in the system. You set up this limitation in the **User Setup** page in the client.  
  
### Customizing password requirements
  
 Codeunit 9801, Identity Management, contains a method called ValidateKeyStrength that you can modify to customize the requirements for user passwords. You can, for example, change the minimum length required \(the default is eight characters\) or specify whether uppercase, lowercase, or numeric characters are required.  
  
### Registering user time
  
 You can specify that you want [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to register the amount of time that each user works with a company in the database.  To register user time, use the **User Setup** page in the client. To see the time use that has been registered, search for the **Time Registers** page.  
  
### Default and fixed printer selections
  
 You can specify which printer that each individual user can use. In the client, search for the **Printer Selections** page.  
  
## See Also  

[Security and Protection](security-and-protection.md)  
[Data Security](data-security.md)  
