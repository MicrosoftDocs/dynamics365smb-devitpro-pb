---
title: Known Issues with On-premises
description: Provides an overview of the known issues in Business Central versions
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
---

# Some Known Issues in [!INCLUDE[prod long](../developer/includes/prodlong.md)] On-premises

This article describes some known issues in [!INCLUDE[prod short](../developer/includes/prodshort.md)] versions. These issues can impact installation, upgrade, and various operations of [!INCLUDE[prod short](../developer/includes/prodshort.md)] on-premises.

> [!NOTE]
> The article doesn't include a complete list of known issues. Instead, it addresses some common issues that you might experience or might consider when upgrading to a version. If you're aware of issues that aren't in this article, or you'd like more help, see [Resources for Help and Support](../help-and-support.md).

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

[!INCLUDE[prod short](../developer/includes/prodshort.md)] version 17 introduced [data audit](../developer/devenv-table-system-fields.md#audit) fields on tables. When you upgrade from version 15 or 16, the $systemModifiedAt field is populated with values from field **5120 ModifiedOn** in table **5151 Integration Record**. However, this mapping doesn't work in a version 14-to-17 upgrade.  

### Impact

When upgrading from version 14 to version 17, the $systemModifiedAt field will be blank.

### Workaround

Upgrade to version 15 or 16 before upgrading to version 17.

## Wrong .NET assemblies for external connected services

> Applies to: 16.5

### Problem

Version 16.5 includes the wrong .NET 4.5 assemblies for connecting to external services that use OAuth, like Common Data Service.

### Impact

In the [!INCLUDE[prod short](../developer/includes/prodshort.md)] client, you can set up external service connections from the **Service Connections** page. When you try to set up a connection, it will fail because [!INCLUDE[prod short](../developer/includes/prodshort.md)] can't obtain an access token for connecting to the service.

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
