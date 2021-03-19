---
title: "Upgrading Permission Sets and Permissions"
description: Describes how to upgrade permissions and permission sets 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
---
# Upgrading Permissions Sets and Permissions

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (v18) introduced a new model for permissions. In previous versions, permission sets and permissions are only defined in data, which means they're stored in the tables of the application and tenant databases. Permission sets and permissions can now be defined in AL code. They're created by using the `permissionset` and `permissionsetextension` objects, and packaged in extensions. See [Entitlements and Permissions](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-entitlements-and-permissionsets-overview?branch=permissionset) to learn more. This change has implications on upgrade as discussed in this article.

## Overview

Permissions as AL objects is now the default model. You'll see this change, for example, in a v18 demonstration database. If you view the permissions-related tables in the database, like the **Permission Set** and **Permission** tables, you'll notice that tables are almost empty.

Although it's recommended to transition to permissions defined as AL objects, you can choose to continue using the legacy databased permissions model. You specify which permissions model your solution uses by changing [!INCLUDE[server](../developer/includes/server.md)] setting called **Use Permission Sets From Extensions**.

When upgrading from previous version, decide which model you want to use. Then, follow the appropriate instructions in the next sections.

## Continue using the permission sets defined as data

> [!NOTE]
> Permission sets defined as data has been deprecated and will be removed in an upcoming release. For more information, see [Deprecated Features in W1](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/upgrade/deprecated-features-w1?branch=permissionset#permissions).

When you upgrade, the existing permission sets and permissions stored as data aren't affected during upgrade. They'll exist as before in the database even after upgrade. Included are permissions sets from Microsoft, partners, extensions, and user-defined permission sets. If you have customized Microsoft permission sets, or made your own from copies, you'll probably want to keep them up to date with the latest from Business Central.

1. From the old [!INCLUDE [prod_short](../developer/includes/prod_short.md)] version, open the **Permissions Sets** page and export the **System** permission sets as XML to a file.

    You can export all permission sets. But you're mostly interested in the Microsoft permission sets and custom permission sets based on Microsoft permission sets.  

    > [!IMPORTANT]
    > If you're upgrading the application, either exclude the SUPER permission set when exporting or be sure to remove it later from the XML file that you'll import. You can't replace or modify the SUPER permission set. If you doing a technical upgrade, you'll have to include the SUPER permission set.

    For more information, see [To export and import a permission set](https://docs.microsoft.com/dynamics365/business-central/ui-define-granular-permissions#to-export-and-import-a-permission-set).

2. Install version 18 with the demonstration database.
3. From the version 18 client, open the **Permissions Sets** page, and export the **System** permission sets to a file.
4. Using a file comparison tool, compare the to XML files and merge the necessary changes into a single XML file.

    Now you have upgraded permissions as XML.
5. Upgrade your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to version 18.

    > [!IMPORTANT]
    > If you have a multitenant deployment, make sure the tenants are allowed to write to application database.

6. If not already done during upgrade, set the `UsePermissionSetsFromExtensions` parameter of [!INCLUDE [server](../developer/includes/server.md)] instance (version 18) to `false`.

    > [!NOTE]
    >  Restart the [!INCLUDE [server](../developer/includes/server.md)] instance.
7. From the version 18 client, open the **Permissions Sets** page, and import the permission sets from the newly created XML file.

## Start using permission sets defined as AL objects

If you've customized Microsoft permission sets, it's important to know what you've changed in these permission sets. Knowing these changes will let you reimplement the permission sets as new AL permission set objects or permission set extension objects.

1. Determine what customizations you made to Microsoft permission sets.

    You identify the customizations by comparing the old permission sets with the new permission sets. There are two ways to compare the permission sets:  

    **Compare as XML**
    1. From your old [!INCLUDE [prod_short](../developer/includes/prod_short.md)] version, export the customized Microsoft permissions sets to XML.
    2. Connect to a demonstration database of previous version, then export the Microsoft permission sets to XML.
    3. Compare the XML files.

    **Compare as AL objects**

    [!INCLUDE [server](../developer/includes/server.md)] provides a Windows PowerShell script that converts databased permission sets to AL objects. 

    1. Go to [Business Central Tech Samples](https://github.com/microsoft/BCTech/tree/master/samples/PermissionSetConversion) on GitHub.
    2. Download the PowerShell script called **Convert-PermissionSets.psm1** to a folder on your computer.
    3. Create a folder where you want to store the converted permission sets.
    4. Start Windows PowerShell as an administrator.
    5. From the command prompt, run the following command import the Convert-PermissionSets.psm1:

       ```powershell
       Import-Module -name "C:\folderpath\Convert-PermissionSets.psm1"
       ```

       Replace `C:\folderpath\` with the folder path to the file.

    6. Run the Convert-PermissionSets cmdlet to export permission sets from the current [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database to AL permission set object files:

       ```powershell
       Convert-PermissionSets -DatabaseServer server_name -DatabaseName BC_database -Destination "C:\permission_sets_folder"
       ```

       Replace:

       - `server_name` with the name of the SQL Server computer, like localhost if the server is on the computer you're working with.
       - `BC_database` with the name of the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] application database.
       - `C:\permission_sets_folder` with the path to the folder where you want to store the converted permission sets

       This command creates a separate AL file for each permission set. The file names have the format *name*.permissionset.al.

    7. Compare the exported AL permission set files with permission set files from the version 18 to determine the differences.

      Find the new AL permission set files are on the installation media (DVD) in the **Applications\BaseApp\Source\Base Application.Source.zip\Permissions** folder.

    Now you have the list of changes that you made compared to the version 18 permission sets from Microsoft.

2. Create new AL objects for permissions sets based on the change list.

    Use the following table as a guide.

   |If the change|Then|See...|
   |----|----|---|
   |Only added new permissions to an existing permission set|Create an AL permission set extension object with the added permissions.|[Permission Set Extension Object](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-permissionset-ext-object?branch=permissionset)|
   |Removed or changed permissions in a permission set|<ol><li>Make a copy of version 18 AL permission set file.</li><li>Modify the copy to include the customizations you want.</li></ol> |[Permission Set Extension Object](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-permissionset-ext-object?branch=permissionset)

3. Create an AL project for version 18. Include the permission set files that you created in step 2 and other custom permission sets generated in step 1.6.

4. Compile and build the extension package.

5. Upgrade your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to version 18.

    > [!IMPORTANT]
    > If you have a multitenant deployment, when you mount tenants, give tenants permission to write to the application database.

6. Publish and install the extension on your version 18 deployment.

## See Also  

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
