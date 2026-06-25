---
title: Upgrading Permission Sets and Permissions
description: Describes how to upgrade permissions and permission sets 
ms.date: 01/08/2026
ms.topic: how-to
ms.author: jswymer
author: jswymer
ms.reviewer: jswymer
---
# Upgrading permission sets and permissions

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (v18) introduced a new model for permissions. In previous versions, permission sets and permissions are defined only as data, which means they're stored in the tables of the application and tenant databases. Permission sets and permissions can now be defined in AL code. They're created by using the `permissionset` and `permissionsetextension` objects in AL code, then packaged in extensions. Learn more in [Entitlements and Permissions](../developer/devenv-entitlements-and-permissionsets-overview.md).

This change has implications on upgrade from versions earlier than version 18. Or, if you're upgrading a later version that still uses the legacy data-based permission sets that include permission sets that are based on Microsoft permission. These implications are discussed in this article.

## Overview

Permissions as AL objects is now the default model in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. You see this change, for example, if you install the demonstration database for a version later than v17. If you view the permissions-related tables in the database, like the **Permission Set** and **Permission** tables, you notice that tables are almost empty.

Although it's recommended to transition to permissions defined as AL objects, you can choose to continue using the legacy databased permissions model. You specify which permissions model your solution uses by changing [!INCLUDE[server](../developer/includes/server.md)] setting called **Use Permission Sets From Extensions**.

When upgrading from a previous version, decide which model you want to use. Then, follow the appropriate instructions in the next sections.

## Start using permission sets defined as AL objects

If you've customized Microsoft permission sets in earlier versions, first identify those changes so that you can reimplement them as new AL permission set objects or permission set extension objects.

### Step 1: Identify your customizations

Compare the old permission sets with the new permission sets. You can do this in one of the following ways:  

#### Compare as XML

1. From your old [!INCLUDE [prod_short](../developer/includes/prod_short.md)] version, export the customized Microsoft permission sets to XML.
2. Connect to a demonstration database of previous version,and export the Microsoft permission sets to XML.
3. Compare the XML files to identify differences.

#### Compare as AL objects

[!INCLUDE [server](../developer/includes/server.md)] provides a Windows PowerShell script that converts databased permission sets to AL objects. 

1. Go to [Business Central Tech Samples](https://github.com/microsoft/BCTech/tree/master/samples/PermissionSetConversion) on GitHub.
1. Download the PowerShell script called **Convert-PermissionSets.psm1** to a folder on your computer.
1. Create a folder where you want to store the converted permission sets.
1. Start Windows PowerShell as an administrator.
1. From the command prompt, run the following command import the Convert-PermissionSets.psm1:

    ```powershell
    Import-Module -name "C:\folderpath\Convert-PermissionSets.psm1"
    ```

    Replace `C:\folderpath\` with the folder path to the file.

    <!-- Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned -Force
    Unblock-File 'C:\can-delete\Convert-PermissionSets.psm1'
    "-->

1. Run the Convert-PermissionSets cmdlet to export permission sets from the current [!INCLUDE [prod_short](../developer/includes/prod_short.md)] database to AL permission set object files:

   ```powershell
   Convert-PermissionSets -DatabaseServer server_name -DatabaseName BC_database -Destination "C:\permission_sets_folder"
   ```

   Replace:  

   - `server_name` with the name of the SQL Server computer, like localhost if the server is on the computer you're working with.
   - `BC_database` with the name of the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] application database.
   - `C:\permission_sets_folder` with the path to the folder where you want to store the converted permission sets

   This command creates a separate AL file for each permission set. File names follow the format *name*.permissionset.al.

1. Compare the exported AL permission set files with permission set files in new [!INCLUDE [prod_short](../developer/includes/prod_short.md)] version to determine the differences.

    You can find the new AL permission set files are on the installation media (DVD) in the **Applications\BaseApp\Source\Base Application.Source.zip\Permissions** folder.

Now you have the list of changes that you made compared to the latest version of the permission sets from Microsoft.

### Step 2: Create new AL objects for permissions sets based on the change list

1. Create new AL objects for permissions sets based on the change list.

    Use the following guidance to decide which AL objects to create.

   |If|Then|See...|
   |----|----|---|
   |You only added permissions to an existing Microsoft permission set|Create an AL permission set extension object with the added permissions.|[Permission Set Extension Object](../developer/devenv-permissionset-ext-object.md)|
   |You removed or changed permissions in a permission set|Create an AL permission set object.<ol><li>Make a copy of version 18 or version 19 AL permission set file.</li><li>Modify the copy to include the customizations you want.</li></ol> |[Permission Set Object](../developer/devenv-permissionset-object.md)

### Step 3: Build and deploy the extension

1. Create an AL project for version 18. Include the permission set files that you created in step 2 and other custom permission sets generated in step 1.6.

1. Compile and build the extension package.

1. Upgrade your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to the new [!INCLUDE [prod_short](../developer/includes/prod_short.md)] version.

    > [!IMPORTANT]
    > If you have a multitenant deployment, when you mount tenants, give tenants permission to write to the application database.

1. Publish, sync, and install the extension on your updated version deployment.

## Continue using permission sets defined as data

> [!NOTE]
> The ability to use permission sets defined as data is deprecated and will be removed in a future release. Learn more in [Deprecated Features in W1](deprecated-features-w1.md).

If your application uses permission sets from multiple sources, such as Microsoft, partners, extensions, or user-defined permission sets, you can continue using permission sets during upgrade. They'll exist as before in the database, even after upgrade. If you have customized Microsoft permission sets, you'll probably want to keep them up to date with the latest from Business Central.

1. From the old [!INCLUDE [prod_short](../developer/includes/prod_short.md)] version, open the **Permissions Sets** page and export the **System** permission sets as XML to a file.

    You can export all permission sets, but focus on Microsoft permission sets and custom permission sets derived from them.  

    > [!IMPORTANT]
    > If you're upgrading the application, exclude the SUPER permission set when exporting or remove it from the XML file that you'll import. You can't replace or modify the SUPER permission set. If you're doing a technical upgrade, include the SUPER permission set.

    For more information, refer [To export and import a permission set](/dynamics365/business-central/ui-define-granular-permissions#to-export-and-import-a-permission-set).

1. Install the new Business Central version that you're upgrading to with the demonstration database.
1. In the client client, open the **Permission Sets** page, and export the **System** permission sets to a file.
1. Use a file comparison tool to compare the two XML files and merge the required changes into a single XML file.

    You now have an upgraded XML files with updated permissions.
1. Upgrade your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to version 18 or 19.

    > [!IMPORTANT]
    > In multitenant deployments, make sure the tenants can write to the application database.

1. If not already set, configure the `UsePermissionSetsFromExtensions` parameter on [!INCLUDE [server](../developer/includes/server.md)] instance to `false`.

    > [!NOTE]
    >  Restart the [!INCLUDE [server](../developer/includes/server.md)] instance after the changing this setting.
1. In the client, open the **Permission Sets** page, and import the permission sets from the newly created XML file.

## Related information 

- [Upgrading to Business Central](upgrading-to-business-central.md)  
- [Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
