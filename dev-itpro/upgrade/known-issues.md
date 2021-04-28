---
title: Known Issues with On-premises
description: Provides an overview of the known issues in Business Central versions
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
---

# Some Known Issues in [!INCLUDE[prod long](../developer/includes/prod_long.md)] On-premises

This article describes some known issues in [!INCLUDE[prod short](../developer/includes/prod_short.md)] versions. These issues can impact installation, upgrade, and various operations of [!INCLUDE[prod short](../developer/includes/prod_short.md)] on-premises.

> [!NOTE]
> The article doesn't include a complete list of known issues. Instead, it addresses some common issues that you might experience or might consider when upgrading to a version. If you're aware of issues that aren't in this article, or you'd like more help, see [Resources for Help and Support](../help-and-support.md).

## Package Microsoft .NET Core Windows Server Hosting failed with error

> Applies to: All versions up to and including version 18.0.

### Problem

When you install [!INCLUDE [prod_short](../includes/prod_short.md)] on premises, installation may fail with the error `Package Microsoft .NET Core Windows Server Hosting failed with error`, or with error code 1638, when the installer attempts to install prerequisite components.  

This occurs when a version of Windows Server Hosting is installed on the server that is newer than version 2.1.14, which is what [!INCLUDE [prod_short](../includes/prod_short.md)] attempts to install from its installation folder.  

The issue only occurs when the currently installed version is a newer minor version, not a newer major version of Windows Server Hosting.  

### Impact

Installation will fail and will be rolled back.

### Workaround

The issue can be resolved in different ways:

* Manually install Windows Server Hosting version 3 or later before you install Business Central components.
* Uninstall Windows Server Hosting from your server before you install Business Central
* Use the installer from Business Central version 18.1 or later. In those versions, Business Central will skip installing Windows Server Hosting as a prerequisite component if the installer determines that newer Windows Server Hosting components are already installed on the server.


<!-- never included 
## <a name="azuregqlmi"></a>Can't convert version 14 and earlier databases on Azure SQL Managed Instance to later Business Central platform

defect 395751 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/395751

> Applies to: 15.0-15.17, 16.0-16.12, 17.0-17.6, 18.0

### Problem

Converting a database from one of these versions requires that your account is a member of the **dbmanager** server role in the master database, and that the database can run in single-user mode. However, Azure SQL Managed Instance doesn't support these prerequisites.

### Impact

You won't be able to successfully convert the database from it's current platform the later version, which prevents you from completing technical and application upgrade scenarios. If you try to convert the database, you'll get an error similar to `Alter Database set Single_User failed`.

### Workaround

We recommend that use the latest update for the target version &mdash; at minimum 15.18, 16.13, 17.7, or 18.1. This issue has been fixed in these versions. Otherwise, you can make a BACPAC of the database and restore it to an on-premise SQL Server. Then, run the conversion against the SQL Server database, and restore BABPAC to Azure SQL Managed Instance.-->

## <a name="keys"></a>Primary key mismatch between converted tables in local 14 versions and Microsoft Base Application
<!--https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/387119 -->

> Applies to: 14.18-14.x, 15.12-15.x, 16.7-16.x, 17.1-17.x

### Problem

In some local versions, new table objects were added as part of a minor update. In version 14, which is still C/AL based, the primary keys of these tables are unnamed. When you convert the tables from CAL to AL using the txt2AL tool, primary keys are given the name `Key1`. In version 15, 16, and 17, which is fully AL-based, these tables have been moved to Microsoft base application extension, and the primary keys have the name `PK`. This difference can cause problems when you upgrade to use the Microsoft Base Application because it introduces breaking changes.

The affected local versions and tables include:

|Local 14 version|Tables|
|-------------|------|
|CH|<ul><li>QRBill Buffer</li><li>QRBill Billing Detail</li><li>QRBill Billing Info</li><li>QRBill Layout QRBill</li><li>QRBill Setup</li><li>VAT Reg. No. Srv. Template</li><li>VAT Registration Log Details</li></ul>|
|NA|<ul><li>VAT Reg. No. Srv. Template</li><li>VAT Registration Log Details</li></ul>|

> [!NOTE]
> You don't experience this problem with table objects in other Microsoft extension because the primary keys are named `KEY1`.

### Impact

If you don't resolve this conflict, you'll experience problems when upgrading a customized version 14 (C/AL) application to the Microsoft Base Application.

For example, consider the following articles:

- [Upgrading Customized C/AL Application to Microsoft Base Application Version 16](upgrade-to-microsoft-base-app.md)
- [Upgrading Customized C/AL Application to Microsoft Base Application Version 17](upgrade-to-microsoft-base-app-v17.md)

During this upgrade process, you'll create two versions of an extension referred to as the *table migration* extension. This extension is used for transferring ownership of existing tables in the database to other extensions. The first version contains table objects. The second version contains a migration.json file instead of the table objects. When you try synchronize the second version of the table migration extension ([Task 13.5](upgrade-to-microsoft-base-app.md#syncfinal) or [Task 12.6](upgrade-to-microsoft-base-app-v17.md#syncfinal)), you'll get the following errors for each affected table:

<!--
More specifically, you'll get the following errors when synchronizing the table migration extension. Depending on the upgrade article you're following, the error occurs in either [Task 13.5](upgrade-to-microsoft-base-app.md#syncfinal) or [Task 12.6](upgrade-to-microsoft-base-app-v17.md#syncfinal).
-->

`Table <table name> :: The previous primary key 'Key1' cannot be located. Changing the primary key is not allowed.`

`Table <table name> :: Introducing a new key 'PK' as the primary key is not allowed. Please make the key 'Key1' the primary key again.`

### Workaround

To avoid these errors, after converting the version 14 tables to AL, rename instances of the primary key `Key1 ` to `PK` in the affected table objects before building your extensions.

- If you're following the upgrade articles listed above, do this change as part of Task 2. If you've already published the first table migration extension with the wrong key names, we recommend restore the databases and go through the upgrade again, starting from Task 2.
- You should also make these changes if you're only doing a technical upgrade, so you won't run into problems later if eventually uptake the Microsoft Base Application.

For each affected table object, do the following steps:

1. Open the \.al file.
2. Locate the primary key  definition. For example: 

    ```al
    keys
    {
        key(Key1; "Primary key")
        {
            Clustered = true;
        }
    }
    ```

3. Change the name from `Key1` to `PK`. For example:

    ```al
    keys
    {
        key(PK; "Primary key")
        {
            Clustered = true;
        }
    }
    ```

<!-- 

1. Create another version of the table migration extension that contains the table objects.
2. In this version, change the name of the primary keys in the affected tables to `PK`.
3. Build the extension package.
4. Publish the extension version.
5. Synchronize the extension version by using Sync-NAVApp cmdlet with the `-Mode ForceSync` parameter.
6. Synchronize the table migration extension that contains the migration.json.
7. Complete the upgrade.
-->

## <a name="enum"></a>Enum type fields not transferred as part of schema migration between extensions

<!--defect 363940 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/363940, 3666199 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/366199, 376391 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/376391-->

> Applies to: 15.3-15.11, 16.0-16.4

### Problem

The table migration feature fails to transfer data from a table object to a table extension object that introduces an enumeration.

> [!NOTE]
> The table migration feature was introduced in version 15.3. For more information, see [Migrating Tables and Fields Between Extensions](../developer/devenv-migrate-table-fields.md).

### Impact

You'll experience this issue in the following scenarios:

- Upgrading a customized version 14 solution to version 15 or 16
- Migrating data from one extension to another.

The issue occurs when synchronizing extensions. You'll get an error similar to one of the following messages:

`Sync-NAVApp : The metadata object Enum <ID> was not found.`

`Message App Sync Exception -- Microsoft.Dynamics.Nav.Types.NavMetadataNotFoundException: The metadata object Enum <ID> was not found.`

### Workaround

- If you're upgrading from version 14, use 15.12 (or later) or 16.5 (or later) as the target version.

- If you're migrating data between extensions, upgrade your solution to 15.12 (or later) or 16.5 (or later).

## $systemModifiedAt fields in tables not populated during upgrade

> Applies to: 14.0-14.x

### Problem

[!INCLUDE[prod short](../developer/includes/prod_short.md)] version 17 introduced [data audit](../developer/devenv-table-system-fields.md#audit) fields on tables. When you upgrade from version 15 or 16, the $systemModifiedAt field is populated with values from field **5120 ModifiedOn** in table **5151 Integration Record**. However, this mapping doesn't work in a version 14-to-17 upgrade.  

### Impact

When upgrading from version 14 to version 17, the $systemModifiedAt field will be blank.

### Workaround

Upgrade to version 15 or 16 before upgrading to version 17.

## Wrong .NET assemblies for external connected services

> Applies to: 16.5

### Problem

Version 16.5 includes the wrong .NET 4.5 assemblies for connecting to external services that use OAuth, like Common Data Service.

### Impact

In the [!INCLUDE[prod short](../developer/includes/prod_short.md)] client, you can set up external service connections from the **Service Connections** page. When you try to set up a connection, it will fail because [!INCLUDE[prod short](../developer/includes/prod_short.md)] can't obtain an access token for connecting to the service.

In the client, you'll get an error similar to the following message:

`Failed to acquire authorization token for <service>.`

In the event log, you'll see an error similar to the following message:

`Could not load file or assembly 'Microsoft.Identity.Client, Version=4.14.0, Culture=neutral, PublicToken=0a613f4dd989e8e' or one of its dependencies. The located assembly's manifest location does not match the assembly reference.`

### Workaround

There are two workarounds for this issue:

1. Upgrade to 16.6 or later.

2. Install the required assemblies:

    1. Go to [https://www.nuget.org/packages/Microsoft.Identity.Client/4.14.0](https://www.nuget.org/packages/Microsoft.Identity.Client/4.14.0).
    2. Under **Info**, select **Download package**.
    3. Extract the contents of the nupkg file to a folder.

        There are different ways to extract the content of nupkg file. An easy way is to change the file extension from *.nupkg* to *.zip*. Then, extract the files like you would do with any .zip file.

    4. Copy the files in the **\lib\net45** folder to the **Service** folder of the [!INCLUDE[server](../developer/includes/server.md)] installation. Replace the existing files when prompted.

        The default folder is C:\Program Files\Microsoft Dynamics 365 Business Central\160\Service.
    5. Restart the [!INCLUDE[server](../developer/includes/server.md)] instance.

## Help Server for India preview missing files

> Applies to: 17.x

### Problem

The installation media (DVD) is missing required HTML files for the Help Server.

### Impact

The Help Server installation will fail.

### Workaround

Install Help Server without the HTML files for local functionality, then pick up the content from GitHub instead. For more information, see [Get updates from Microsoft](../help/contributor-guide.md#get-updates-from-microsoft).

## [!INCLUDE[admintool](../developer/includes/admintool.md)] doesn't work for multitenant server instances

<!--Defect 377645 https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/377645 -->

> Applies to: 17.0-17.1

If a [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a multitenant instance, you can't manage the tenants by using the [!INCLUDE[admintool](../developer/includes/admintool.md)].

### Impact

When you try to use the **Tenant** node in the [!INCLUDE[admintool](../developer/includes/admintool.md)], you get a message: The MMC has detected an error in the snap-in and will unload it. This message is followed by:

`FX:{ba484c42-ed9a-0170-925f-23e64e686fd0}`

`Value cannot be null.`
`Parameter name: objectToValidate at Microsoft.ManagementConsole.BaseCollection.OnValidate(Object objectToValidate, Boolean testForDuplicate) at System.Collections.CollectionBase.System.Collections.IList.Add(Object value)    at CallSite.Target(Closure , CallSite , NodeSubItemDisplayNameCollection , Object )    at System.Dynamic.UpdateDelegates.UpdateAndExecuteVoid2[T0,T1](CallSite site, T0 arg0, T1 arg1)    at Microsoft.Dynamics.Nav.ManagementUI.NavTenantsListView.RefreshWithNodeStateChangedCheck(IList1 tenants, ResultNodeCollection currentResultNodes)    at Microsoft.Dynamics.Nav.ManagementUI.NavTenantsListView.RefreshCore()    at Microsoft.Dynamics.Nav.ManagementUI.NavTenantsListView.OnInitialize(AsyncStatus status)    at Microsoft.ManagementConsole.View.ProcessRequest(Request request)    at Microsoft.ManagementConsole.ViewMessageClient.ProcessRequest(Request request)    at Microsoft.ManagementConsole.Internal.IMessageClient.ProcessRequest(Request request)    at Microsoft.ManagementConsole.Executive.RequestStatus.BeginRequest(IMessageClient messageClient, RequestInfo requestInfo)    at Microsoft.ManagementConsole.Executive.SnapInRequestOperation.ProcessRequest()    at Microsoft.ManagementConsole.Executive.Operation.OnThreadTransfer(SimpleOperationCallback callback)`

### Workaround

Use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. This error is fixed in later updates.

## See Also

[Upgrading to Business Central](upgrading-to-business-central.md)  
