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

*Entitlements* describe which objects in [!INCLUDE [prod_short](includes/prod_short.md)] a customer is entitled to use according to the license that they purchased from Microsoft or according to the Azure Active Directory role that they have assigned in Microsoft 365 Admin Center, for example, Global Administrator. Entitlements are only used in the online version of [!INCLUDE [prod_short](includes/prod_short.md)]. 

*Permissions* describe which objects an administrator or a partner has given the user.

## Permission Set Scope

A [!INCLUDE [prod_short](includes/prod_short.md)] solution contains a number of predefined permission sets that are added by Microsoft or by your software provider (ISV application you installed from AppSource). These permission sets are of type **System** or **Extension**. End-users cannot create or edit these types of permission sets or the permissions within them. However, they can copy these permission sets to define their own permission sets and permissions.

Permission sets that users create, from new or as copies, are of the type **User-Defined** and they can be edited.

## Creating Entitlements and Permission Sets in AL

When developing an app, you can create new entitlement and permission set objects or extend existing permission sets in AL. The following object types are used for handling entitlements and permissions:

- [Entitlement Object](devenv-entitlement-object.md)  
- [PermissionSet](devenv-permissionset-object.md)  
- [PermissionSetExtension](devenv-permissionset-ext-object.md)

> [!NOTE]  
> In the current version of [!INCLUDE[prod_short](includes/d365fin_long_md.md)][!INCLUDE[prod_long](includes/prod_long.md)] the entitlements can only be included with Microsoft apps (enforced by the AppSource cop rules and the technical validation checks that we run for the apps submitted to AppSource). These objects will become available for the ISV apps when we introduce ability to monetize AppSource apps in one of our future releases. 

> [!IMPORTANT]  
> If a permission set is extended through AL, that extension will make additive changes to the permission set. This means that an extension can provide elevated privileges to an otherwise limited set of permissions. Building permission sets that can be extended must be done carefully with this in mind.
<!-- From security review, we need to call out the trust model that lies in the modeling of entitlements and permissions -->

## Earlier versions of Business Central

In releases of [!INCLUDE [prod_short](includes/prod_short.md)] prior to 2021 release wave 1 (v.18.0), System and Extension permissions and entitlements were defined as data in the application database: 

Entitlements: 
  - dbo.Entitlement
  - dbo.Entitlement Set
  - dbo.Membership Entitlement

Permissions:
  - dbo.Permission Set
  - dbo.Permission

Keeping such sensitive information as data comes with additional maintenance, security, and audit risks for the software providers (ISVs). Changes applied to this data should ideally be well traceable, easy to update and maintain. Starting with [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1, the System and Extensions permissions and entitlements are defined in code, using Entitlement, PermissionSet, and PermissionSetExtension AL objects. This change provides ISVs with all of the advantages of using the AL Language extension in Visual Studio Code and source control systems (as Visual Studio Online and GitHub) to design, get an overview, and track changes to the objects that describe user access. 

Turning this data into code has another significant advantage: the ability to apply hotfixes to the entitlements and permissions in the same way that the hotfixes are applied to the apps themselves, simply by updating an app to a new version which carries fixed code. This improves [!INCLUDE [prod_short](includes/prod_short.md)] support agility considerably, ultimately improving customer satisfaction with the service.

And finally, the new AL objects are envisioned to become the core building blocks in the story of monetizing the AppSource apps. It is through these new AL objects that AppSource ISVs will be able to define which capabilities of their apps should be made available to their users, when the customers purchase their app licenses. With [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1 we are paving the way by moving the entitlements and permission sets into AL objects for Microsoft apps, so that ISVs can follow the same approach for their apps, when the monetization story is introduced with one of the next releases of [!INCLUDE [prod_short](includes/prod_short.md)].

User-Defined permission sets and permissions, and functionality around them remain unchanged. They are still stored as data in the tenant database: 

- dbo.Tenant Permission
- dbo.Tenant Permission Set

## Upgrade considerations

Starting with [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1 (v.18.0), the [!INCLUDE [prod_short](includes/prod_short.md)] demo database, which is shipped with our on-prem installation does not contain any data in the `dbo.Permission Set` and `dbo.Permission` tables in the application database. Instead, the **System** permission sets and permissions are provided as AL objects of type `PermissionSet` and `PermissionSetExtension`, included with Microsoft apps. 

[!INCLUDE [prod_short](includes/prod_short.md)] server configuration file (CustomSettings.config) includes a setting which allows on-prem administrators to decide whether they want to continue using the permissions defined as data or as AL objects: 

```
UsePermissionSetsFromExtensions: ‘true’
```

The default value for this setting is `true`, meaning that the server will be retrieving **System** permission sets and permissions from the AL objects of type `PermissionSet` and `PermissionSetExtension`. 


[WORK IN PROGRESS] Permissions:

ISVs/VARs are encouraged to uptake the new objects, but no hard requirement to do so in this release

Advantages: manage in code, ability to HF more easily, getting ready for AppSource monetization

No entitlement/permissions data in the App database 

Demotool part that generates permissions is removed  

If MS permission sets were customized, the changes should be merged by VARs during upgrade

Continue using data: export new permissions and permission sets using XML ports, then merge XML files

Switch to the new AL objects: use PS sample script from GitHub to export old data into AL objects, then merge AL objects 

Permissions supplied within apps as XML permissions will still work (as Tenant permissions)

New AL objects can be used by ISVs to define their System permissions (instead of including XML into Apps)

Entitlements: 

In this release created/used only for MS apps/licenses

ISVs cannot use yet, no option for them to create their own service plans in AppSource

No requirement to for ISVs/VARs to uptake MS entitlements or create their own



## See Also

[Getting Started with AL](devenv-get-started.md)  
[Entitlement Object](devenv-entitlement-object.md)  
[PermissionSet Object](devenv-permissionset-object.md)  
[PermissionSet Extension Object](devenv-permissionset-ext-object.md)  
