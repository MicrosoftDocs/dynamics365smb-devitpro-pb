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

[!INCLUDE [2021_releasewave1](../includes/2021_releasewave1.md)]

[!INCLUDE [prod_short](includes/prod_short.md)] uses two main concepts for defining access to functionality: Entitlements and Permissions.

*Entitlements* describe which objects in [!INCLUDE [prod_short](includes/prod_short.md)] a customer is entitled to use according to the license that they purchased from Microsoft or according to the Azure Active Directory role that they have assigned in Microsoft 365 Admin Center, for example, Global Administrator. Entitlements are only used in the online version of [!INCLUDE [prod_short](includes/prod_short.md)]. 

*Permissions* describe which objects an administrator or a partner has given the user.

*Permission Sets* allow combining objects permissions into logical groups (or sets), which can then be assigned to the users explicitly or via the User Group.

## Permission Set scope

A [!INCLUDE [prod_short](includes/prod_short.md)] solution contains a number of predefined permission sets that are added by Microsoft or by your software provider (by an ISV application that you installed from AppSource).

Permission sets included with Microsoft and AppSource apps defined as AL objects are of the type **System**. <!-- If they are included in XML format, they are of the type **Extension**.--> <!-- Old data-sourced permissions are also tagged as System type. These are permission sets that on-premises admins/devs can add using our PowerShell cmdlets or creating and importing XML files with scope=system-->

End-users cannot create or edit these types of permission sets or the permissions within them. However, they can copy these permission sets to define their own permission sets and permissions. Permission sets that users create, from new or as copies, are of the type **User-Defined** and they can be edited.

## Creating Entitlements and Permission Sets in AL

When developing an app, entitlements and permission sets are handled as objects in AL, and existing permission sets can be extended in AL. The following object types are used for handling entitlements and permissions:

- [Entitlement Object](devenv-entitlement-object.md)  
- [PermissionSet](devenv-permissionset-object.md)  
- [PermissionSetExtension](devenv-permissionset-ext-object.md)

> [!NOTE]  
> In the current version of [!INCLUDE[prod_short](includes/d365fin_long_md.md)] entitlements can only be included with Microsoft apps (enforced by the AppSource cop rules and the technical validation checks that we run for the apps submitted to AppSource). These objects will become available for the ISV apps when we introduce ability to monetize AppSource apps in one of our future releases. 

## Earlier versions of Business Central

In releases of [!INCLUDE [prod_short](includes/prod_short.md)] prior to 2021 release wave 1 (v18.0), System and Extension permissions and entitlements were defined as data in the application database: 

Entitlements tables:

- Entitlement
- Entitlement Set
- Membership Entitlement

Permissions tables:

- Permission Set
- Permission

Keeping such sensitive information as data comes with additional maintenance, security, and audit risks for the software providers (ISVs). Changes applied to this data should ideally be well traceable, easy to update and maintain. Starting with [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1, the System permissions and entitlements are defined in code, using Entitlement, PermissionSet, and PermissionSetExtension AL objects. This change provides ISVs with all of the advantages of using the AL Language extension in Visual Studio Code and source control systems (as Visual Studio Online and GitHub) to design, get an overview, and track changes to the objects that describe user access. 

Turning this data into code has another significant advantage: the ability to apply hotfixes to the entitlements and permissions in the same way that the hotfixes are applied to the apps themselves, simply by updating an app to a new version which carries fixed code. This improves [!INCLUDE [prod_short](includes/prod_short.md)] support agility considerably, ultimately improving customer satisfaction with the service.

And finally, the new AL objects are envisioned to become the core building blocks in the story of monetizing the AppSource apps. It's through these new AL objects that AppSource ISVs will be able to define which capabilities of their apps should be made available to their users, when the customers purchase their app licenses. With [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1, we're paving the way by moving the entitlements and permission sets into AL objects for Microsoft apps, so that ISVs can follow the same approach for their apps, when the monetization story is introduced with one of the next releases of [!INCLUDE [prod_short](includes/prod_short.md)].

User-Defined permission sets and permissions, and functionality around them, remain unchanged. They're still stored as data in the tenant database:

- Tenant Permission
- Tenant Permission Set

Permission sets and permissions [included with apps in XML format](devenv-export-permission-sets.md) will continue to work as before, however, we recommend you to start using the AL objects of type `PermissionSet` and `PermissionSetExtension` instead.

## Upgrade considerations

Starting with [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1 (v18.0), the [!INCLUDE [prod_short](includes/prod_short.md)] demo database, which is shipped with our on-premises installation, doesn't contain any data in the **Permission Set** and **Permission** tables in the application database. Instead, the **System** permission sets and permissions are provided as AL objects of type `PermissionSet` and `PermissionSetExtension`, included with Microsoft apps. 

The application database tables that used to store the entitlements won't contain any data either, because entitlements are now defined as AL objects.

[!INCLUDE [prod_short](includes/prod_short.md)] server configuration file (CustomSettings.config) includes a setting that allows on-premises administrators to decide whether they want to continue using the permissions defined as data or as AL objects: 

```
UsePermissionSetsFromExtensions: ‘true’
```

The default value for this setting is `true`, meaning that the server will be retrieving all **System** permission sets and permissions from the AL objects of type `PermissionSet` and `PermissionSetExtension`. With the value for this setting set to `true`, the permissions data, in case it is still present in the application database, will be disregarded. 

It's not possible to customize the **System** permission sets and permissions used in the online version of [!INCLUDE [prod_short](includes/prod_short.md)]. End-users can only copy these types to new permission sets, which they can then adjust to their needs. For more information, see [Assign Permissions to Users and Group](/dynamics365/business-central/ui-define-granular-permissions#to-create-or-modify-a-permission-set).

In the on-premises version of [!INCLUDE [prod_short](includes/prod_short.md)], even though it's not recommended, the partners can customize the permission sets and permissions shipped in the application database. In this case, as for any upgrade before, the changes in Microsoft permissions should be merged with the customized permissions by partners during upgrade.

Although starting with [!INCLUDE [prod_short](includes/prod_short.md)] 2021 release wave 1 (v.18.0), System permissions are no longer shipped as data in the application database, the partners can use the same procedure as before to export the new permissions that are defined using AL objects. The new permission sets and permissions can be exported into XML file by running XMLport 9171 Import/Export Permission Sets, making it possible to compare and merge the customized permission sets in your old database with the newly shipped permission sets. Find more details [here](/dynamics365/business-central/dev-itpro/upgrade/how-to--import-export-permission-sets-permissions.md).

### How to upgrade permission sets

When upgrading to version 18, first decide whether you want to use the permissions defined as data or switch to permissions defined as AL objects. Then, follow the guidelines at [Upgrading Permission Sets](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/upgrade/upgrade-permissions?branch=deliv390525-2021-rw1-upgrade) for details on how to do the upgrade.



<!--
### Before you start upgrading

When upgrading to version 18, decide whether you want to use the permissions defined as data or switch to permissions defined as AL objects. Then, use the following guidelines to help you complete the permissions upgrade.

### To continue using permission sets defined as data

1. From the old [!INCLUDE [prod_short](includes/prod_short.md)] version, export the permission sets to XML.

   For more information, see [To export and import a permission set](https://docs.microsoft.com/dynamics365/business-central/ui-define-granular-permissions#to-export-and-import-a-permission-set).
2. Install version 18 with the demonstration database.
3. From the version 18 client, export the permission sets to XML.
4. Using standard file comparison tools, compare XML files and merge the necessary changes. 

    Now you have upgraded permissions as XML files.
5. Upgrade your [!INCLUDE [prod_short](includes/prod_short.md)] to version 18.

    > [!IMPORTANT]
    > If you have a multitenant deployment, make sure the application database is writeable. 
6. Set the `UsePermissionSetsFromExtensions` parameter of [!INCLUDE [server](includes/server.md)] instance (version 18) to `false`.
7. Restart the [!INCLUDE [server](includes/server.md)] instance.
8. From the version 18 client, import the permission sets from the newly created XML files.

### To start using permission sets defined as AL objects

If you've customized Microsoft permission sets, it's important to know what you've changed in these permission sets compared to what Microsoft provides in version 18. Knowing these changes will let you re-implement the permission sets as new AL permission set objects or permission set extension objects.

1. Determine what customizations you made to Microsoft permission sets.

    There are two ways to do this task.

    **Option 1**
    1. From your old [!INCLUDE [prod_short](includes/prod_short.md)] version, export the customized Microsoft permissions sets to XML.
    2. Connect to a demonstration database of previous version, then export the Microsoft permission sets to XML.
    3. Compare the XML files.

    **Option 2**

    1. Get the PowerShell script called Convert-PermissionSets.psm1 from [Business Central Tech Samples](https://github.com/microsoft/BCTech/tree/master/samples/PermissionSetConversion) on GitHub.
    2. Run the script against the old [!INCLUDE [prod_short](includes/prod_short.md)] version to export the permission sets to AL objects.
    3. Compare the exported AL objects with permission set objects from the version 18.  

    Now you have the list of changes that you made compared to the version 18 permission sets from Microsoft.

2. Create new AL objects based on the change list.

   |If you|Then|
   |----|----|
   |Only added new permissions to the existing permission sets|Create AL permission set extension objects with the added permissions.|
   |Removed or changed permissions in objects|<ol><li>Find the AL objects from Microsoft that implement the permission sets that you modified in the previous version.</li><li>Make copies of these AL objects</li><li>Modify the copies to include the customizations you want.</li></ol> |

3. Convert your other custom permission sets to new AL objects.

    1. Get the PowerShell script called Convert-PermissionSets.psm1 from [Business Central Tech Samples](https://github.com/microsoft/BCTech/tree/master/samples/PermissionSetConversion) on GitHub.
    2. Connect to the old version's database.
    3. Run the script to generate AL objects.

4. Include the new AL permission sets and permission set extension objects into an AL project and compile the extension package.

5. Publish and install the extension on your version 18 deployment.
-->

## See Also

[Getting Started with AL](devenv-get-started.md)  
[Entitlement Object](devenv-entitlement-object.md)  
[PermissionSet Object](devenv-permissionset-object.md)  
[PermissionSet Extension Object](devenv-permissionset-ext-object.md)  
