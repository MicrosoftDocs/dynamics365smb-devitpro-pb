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

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (v18) introduced a new model for permissions. In previous versions, permission sets and permissions are only defined in data, which means they're stored in the tables of the application and tenant databases. Permission sets and permissions can now be defined in AL code. They're created in extensions by using the `permissionset` and `permissionsetextension` objects. See [Entitlements and Permissions](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-entitlements-and-permissionsets-overview?branch=permissionset) to learn more. This change has implications on upgrade as discussed in this article.

## Overview

Permissions as AL objects is now the default model. For example, you'll see this change in a v18 demonstration database. If you view the permissions-related tables in the database, like the **Permission Set** and **Permission** tables, you'll notice that tables are almost empty.

Although it's recommended to transition to permissions defined as AL objects, you can choose to continue using the legacy databased permissions model. The permissions model used by your solution is changed by a server setting called **Use Permission Sets From Extensions**.

When upgrading from previous version, decide which model you want to use. Then, follow the appropriate instructions in the next sections.

## Continue using the permission sets defined as data

When you upgrade, the existing permission sets and permissions stored as data aren't affected during upgrade. They'll exist as before in the database even after upgrade. Included are permissions sets from Microsoft, partners, extensions, and user-defined permission sets. If you have customized Microsoft permission sets, or made your own from copies, you'll probably want to keep them up to date with the latest from Business Central.

1. From the old [!INCLUDE [prod_short](includes/prod_short.md)] version, open the **Permissions Sets** page and export the **System** permission sets as XML to a file.

    You can export all permission sets. But you're mostly interested in the Microsoft permission sets and custom permission sets based on Microsoft permission sets.  

    > [!IMPORTANT]
    > Either exclude the SUPER permission set when exporting or be sure to remove it later from the XML file that you'll import. You can't replace or modify the SUPER permission set.

    For more information, see [To export and import a permission set](https://docs.microsoft.com/dynamics365/business-central/ui-define-granular-permissions#to-export-and-import-a-permission-set).

2. Install version 18 with the demonstration database.
3. From the version 18 client, open the **Permissions Sets** page, and export the **System** permission sets to a file.
4. Using a file comparison tool, compare the to XML files and merge the necessary changes into a single XML file.

    Now you have upgraded permissions as XML.
5. Upgrade your [!INCLUDE [prod_short](includes/prod_short.md)] to version 18.

    > [!IMPORTANT]
    > If you have a multitenant deployment, make sure the application database is writeable.

6. If not already done during upgrade, set the `UsePermissionSetsFromExtensions` parameter of [!INCLUDE [server](includes/server.md)] instance (version 18) to `false`.

    > [!NOTE]
    >  Restart the [!INCLUDE [server](includes/server.md)] instance.
7. From the version 18 client, open the **Permissions Sets** page, and import the permission sets from the newly created XML file.

### Start using permission sets defined as AL objects

If you've customized Microsoft permission sets, it's important to know what you've changed in these permission sets. Knowing these changes will let you reimplement the permission sets as new AL permission set objects or permission set extension objects.

1. Determine what customizations you made to Microsoft permission sets.

    You identify the customizations by comparing the old permission sets with the new permission sets. There are two ways to compare the permission sets:  

    **Compare as XML**
    1. From your old [!INCLUDE [prod_short](includes/prod_short.md)] version, export the customized Microsoft permissions sets to XML.
    2. Connect to a demonstration database of previous version, then export the Microsoft permission sets to XML.
    3. Compare the XML files.

    **Compare as AL objects**

    [!INCLUDE [server](includes/server.md)] provides a Windows PowerShell script that converts databased permission sets to AL objects. 

    1. Go to [Business Central Tech Samples](https://github.com/microsoft/BCTech/tree/master/samples/PermissionSetConversion) on GitHub.
    2. Download the PowerShell script called **Convert-PermissionSets.psm1** to a folder on your computer.
    3. Create a folder whee you want to store the converted permission sets.
    4. Start Windows PowerShell as an administrator.
    5. From the command prompt, run the following command import the Convert-PermissionSets.psm1:

       ```powershell
       Import-Module -name "C:\folderpath\Convert-PermissionSets.psm1"
       ```

       Replace `C:\folderpath\` with the folder path to the file.

    5. Run the following command to export permission sets from the current [!INCLUDE [prod_short](includes/prod_short.md)] database to AL object files.

       ```powershell
       Convert-PermissionSets -DatabaseServer server_name -DatabaseName BC_database -Destination "C:\new_permission_sets"
       ```

       Replace:

       - `server_name` with the name of the SQL Server computer, like localhost if the server is on the computer you're working with.
       - `BC_database` with the name of the [!INCLUDE [prod_short](includes/prod_short.md)] application database.
       -  `C:\new_permission_sets` with the path to the folder where you want to store the converted permission sets

       This command create a separate AL file for each permission set. The file names have the format *name*.permissionset.al. 
    6. Compare the exported AL objects with permission set objects from the version 18 to determine the differences  

    Now you have the list of changes that you made compared to the version 18 permission sets from Microsoft.

2. Create new AL objects based on the change list.

   |If the change|Then|
   |----|----|
   |Only added new permissions to the existing permission sets|Create AL permission set extension objects with the added permissions.|
   |Removed or changed permissions in objects|<ol><li>Find the AL objects from Microsoft that implement the permission sets that you modified in the previous version.</li><li>Make copies of these AL objects</li><li>Modify the copies to include the customizations you want.</li></ol> |

3. Convert your other custom permission sets to new AL objects.

    1. Get the PowerShell script called Convert-PermissionSets.psm1 from [Business Central Tech Samples](https://github.com/microsoft/BCTech/tree/master/samples/PermissionSetConversion) on GitHub.
    2. Connect to the old version's database.
    3. Run the script to generate AL objects.

4. Include the new AL permission sets and permission set extension objects into an AL project and compile the extension package.

5. Publish and install the extension on your version 18 deployment.e

## See Also  

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
