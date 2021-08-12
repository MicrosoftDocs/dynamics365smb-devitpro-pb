---
title: "Customizing Security"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b928abe2-e462-40e9-9d03-863c10f03e67
caps.latest.revision: 13
manager: edupont
---
# Customizing Security
[!INCLUDE[navnowlong](../developer/includes/navnowlong_md.md)] provides options for limiting and monitoring user access to the database.  
  
## Security Customization Options  
 Use the following options to limit user access beyond the permission level:  
  
### Limiting Access to Specific Database Entries  
 You can specify that each individual user or group can only access specific entries in the database. For example, you can limit access to the entries that relate to a specific department or project. This level of access control is known as record level security.  
  
### Time-Limited Passwords  
Passwords in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] do not have time limits, but you can put time limits on user IDs.  
  
 If you have the required permissions, then you can delete a user ID from the system or cancel all permissions. If deleting a user ID is too drastic a step to take, then you can specify a limited time period during which a particular user ID is allowed to post in the system. You set up this limitation in the **User Setup** window. For more information, see [How to: Set Up User Time Constraints](How-to--Set-Up-User-Time-Constraints.md).  
  
### Customizing Password Requirements  
 Codeunit 9801, Identity Management, contains a function ValidateKeyStrength that you can modify to customize the requirements for user passwords. You can, for example, change the minimum length required \(the default is eight characters\) or specify whether uppercase, lowercase, or numeric characters are required.  
  
### Registering User Time  
 You can specify that you want [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to register the amount of time that each user works with a company in the database.  
  
 To register user time, use the **User Setup** window. In the [!INCLUDE[rtc](../developer/includes/rtc_md.md)], search for or navigate to the **User Setup** page.  
  
 To see the time use that has been registered, search for or navigate to the **Time Registers** page.  
  
### Default and Fixed Printer Selections  
 You can specify which printer that each individual user can use. In the [!INCLUDE[rtc](../developer/includes/rtc_md.md)], search for or navigate to the **Printer Selections** page.  
  
## See Also  
 [How to: Set Up User Time Constraints](How-to--Set-Up-User-Time-Constraints.md)   
 [Managing Users and Permissions]( /dynamics365/business-central/ui-how-users-permissions)