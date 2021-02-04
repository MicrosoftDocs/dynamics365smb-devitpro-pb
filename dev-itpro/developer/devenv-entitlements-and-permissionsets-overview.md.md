---
title: "Entitlements and Permission Sets Overview"
ms.custom: na
ms.date: 04/02/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Entitlements and Permission Sets Overview

[!INCLUDE [prod_short](includes/prod_short.md)] uses two main concepts for defining access to functionality: Entitlements and Permissions.

*Entitlements* describe which objects in [!INCLUDE [prod_short](includes/prod_short.md)] a customer is entitled to use according to the license that they purchased from Microsoft or according to the Azure Active Directory role that they have assigned in Microsoft 365 Admin Center, for example, Global Administrator.  

*Permissions* describe which objects an administrator or a partner has given the user.

In AL, there are three object types used for handling entitlements and permissions: 

- [Entitlement Object](devenv-entitlement-object.md)
- [PermissionSet](devenv-permissionset-object.md)
- [PermissionSetExtension](devenv-permissionset-ext-object.md)

## Earlier versions of Business Central

In previous releases of [!INCLUDE [prod_short](includes/prod_short.md)], permissions and entitlements were defined as data in the application database. Keeping such sensitive information as data comes with additional security and audit risks. Changes applied to this data should ideally be well traceable. With this release of [!INCLUDE [prod_short](includes/prod_short.md)] we are turning this data into code.

Permissions and entitlements issues also fall into a category of frequently experienced issues online and on-prem. Turning this data into code has another significant advantage; the ability to apply hotfixes to the entitlements and permissions in the same way that the hotfixes are applied to the apps themselves, simply by updating an app to a new version which carries fixed code. This improves Business Central online support agility considerably, ultimately improving customer satisfaction with the service.  

And finally, the new objects that we introduce in this release are envisioned to become the core building blocks in the story of monetizing the AppSource apps. It is through these new AL objects that AppSource ISVs will be able to define which capabilities of their apps should be made available to their users, when the customers purchase their app licenses. With the current release we are paving the way by moving the entitlements and permission sets into AL objects for Microsoft apps, so that ISVs could follow the same approach for their apps, when the monetization story is introduced with one of the next releases of Business Central. 

## See Also

[Getting Started with AL](devenv-get-started.md)  
[Entitlement Object](devenv-entitlement-object.md)  
[PermissionSet Object](devenv-permissionset-object.md)  
[PermissionSet Extension Object](devenv-permissionset-ext-object.md)  