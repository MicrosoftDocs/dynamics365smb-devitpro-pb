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

### Designing with cautiousness

If a permission set is extended through AL, that extension will make additive changes to the permission set. This means that an extension can provide elevated privileges to an otherwise limited set of permissions. Building permission sets that can be extended must be done carefully with this in mind.

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

Permission sets and permissions [included with apps in XML format](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-export-permission-sets) will continue to work as before, however we recommend you to start using the AL objects of type PermissionSet and PermissionSetExtension instead. 


## Upgrade considerations

Starting with [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1 (v.18.0), the [!INCLUDE [prod_short](includes/prod_short.md)] demo database, which is shipped with our on-prem installation does not contain any data in the `dbo.Permission Set` and `dbo.Permission` tables in the application database. Instead, the **System** permission sets and permissions are provided as AL objects of type `PermissionSet` and `PermissionSetExtension`, included with Microsoft apps. 

The application database tables which used to store the entitlements will not contain any data either, as the entitlements are now defined as AL objects.

[!INCLUDE [prod_short](includes/prod_short.md)] server configuration file (CustomSettings.config) includes a setting which allows on-prem administrators to decide whether they want to continue using the permissions defined as data or as AL objects: 

```
UsePermissionSetsFromExtensions: ‘true’
```

The default value for this setting is `true`, meaning that the server will be retrieving **System** and **Extensions** permission sets and permissions from the AL objects of type `PermissionSet` and `PermissionSetExtension`. 

It is not possible to customize the System and Extension permission sets and permissions used in the online version of [!INCLUDE [prod_short](includes/prod_short.md)], the users can only copy those to new permission sets, whcih they can then adjust to their needs (https://docs.microsoft.com/en-us/dynamics365/business-central/ui-define-granular-permissions#to-create-or-modify-a-permission-set).

In the on-prem version of [!INCLUDE [prod_short](includes/prod_short.md)], even though it is not recommended, the partners could customize the permission sets and permissions shipped in the application database. In this case, as for any upgrade before, the changes in Microsoft permissions should be merged with the customized permissions by VARs during upgrade. 

Although starting with [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1 (v.18.0) System permissions are no longer shipped as data in the applicaiton database, the partners can use the same procedure as before to export the new permissions, which are defined using AL objects. The new permission sets and permissions can be exported into  XML file by running XMLport 9171 Import/Export Permission Sets, making it possible to compare and merge the customized permission sets in your old database with the newly shipped permission sets. Find more details [here](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/upgrade/how-to--import-export-permission-sets-permissions). 

If you decide to start using the new AL objects, it is also possible to compare the permissions defined as data, in the previous versions of [!INCLUDE [prod_short](includes/prod_short.md)], with permissions defined as code. To generate permission set AL objects from the data in your applicaiton database, use a sample PowerShell script available in our GitHub repository https://github.com/Microsoft/ALAppExtensions [add the exact path later]. 


## See Also

[Getting Started with AL](devenv-get-started.md)  
[Entitlement Object](devenv-entitlement-object.md)  
[PermissionSet Object](devenv-permissionset-object.md)  
[PermissionSet Extension Object](devenv-permissionset-ext-object.md)  
