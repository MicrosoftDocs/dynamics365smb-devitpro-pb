---
author: jswymer
title: "Upgrading an Extension V2 to a new version"
description: "Describes how to add code to upgrade data in a new extension version."
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Upgrading Extensions
This article provides information about how to make a newer version of extension upgrade available on tenants. The first phase of this process is to develop the extension for upgrading, which means adding code to upgrade data from the previous extension version. Once you have the upgrade code in place, you can publish and synchronize the new version, and the run the data upgrade.

> [!NOTE]
> An *upgrade* is defined as enabling an extension that has a greater version number, as defined in the app.json file, than the current installed extension version.

## Developing an extension for upgrading
When developing a new extension version, you must consider the data from the previous version, and any modifications that must be applied to the data to make it compatible with the current version. For example, it could be that the new version adds a new field that needs default values set for existing records or the new version adds new tables that must be linked to existing records. To address this type of data handling, you must write upgrade code for the extension version.

If there are no data changes between the versions of your extension, then you do not need to write upgrade code. All data that is not modified by upgrade code will automatically be available when the process completes.

### Writing upgrade code
You write upgrade logic in an upgrade codeunit, which is a codeunit whose [SubType property](properties/devenv-subtype-property-codeunit.md) is set to **Upgrade**. An upgrade codeunit supports several system triggers on which you can add data upgrade code. These triggers are invoked when you run the data upgrade process on the new extension.

The upgrade codeunit becomes an integral part of the extension and can be modified as needed for subsequent versions. You can have more than one upgrade codeunit. However, be aware that although there is a set order to the sequence of the upgrade triggers, there is no guarantee on the order of execution of the different codeunits. If you do use multiple upgrade units, make sure that they can run independent of each other.

### Upgrade triggers
The following tables describes the upgrade triggers and lists them in the order in which they are invoked.

|Trigger |Description | Fails the upgrade on error |
|--------|------------|------------------------|
|OnCheckPreconditionsPerCompany() and OnCheckPreconditionsPerDatabase()| Used to check that certain requirements are met in order to run the upgrade.|Yes|
|OnUpgradePerCompany() and OnUpgradePerDatabase()|Used to perform the actual upgrade.|Yes|
|OnValidateUpgradePerCompany() and OnValidateUpgradePerDatabase()|Used to check that the upgrade was successful.|Yes|

`PerCompany` triggers are run once for each company in the database, where each trigger is executed within its own system session for the company.

`PerDatabase` triggers are run once in the entire upgrade process, in a single system session that does not open any company.

> [!Note]
> These triggers are also available in upgrade codeunits for the base application, not just for extensions.

### Upgrade codeunit syntax
The following code illustrates the basic syntax and structure of an upgrade codeunit:

```
codeunit [ID] [NAME]
{
	Subtype=Upgrade;

	trigger OnCheckPreconditionsPerCompany()
	begin
		// Code to make sure company is OK to upgrade.
	end;

	trigger OnUpgradePerCompany()
	begin
		// Code to perform company related table upgrade tasks
	end;

	trigger OnValidateUpgradePerCompany()
	begin
		// Code to make sure that upgrade was successful for each company
	end;
}
```
> [!TIP]
> Use the shortcuts `tcodeunit` and `ttrigger` to create the basic structure for the codeunit and trigger.

### Get information about an extension
Each extension version has a set of properties that contain information about the extension, including: `AppVersion`, `DataVersion`, `Dependencies`, `Id`, `Name`, and `Publisher`. This information can be useful when upgrading. For more information, see [JSON Files](devenv-json-files.md).

The `AppVersion` is one of the available properties and it's value differs depending on the context of the code being run:

- Normal operation: `AppVersion` represents the value of the currently installed extension.
- Installation code: `AppVersion` represents the version of the extension we are trying to install.
- Upgrade code: `AppVersion` represents the version of the extension that we are upgrading to (e.g. ‘newer’ version).

Another one of the more important properties is the `DataVersion` property, that represents the value of most recently installed/uninstalled/upgraded version of the extension, meaning that it reflects the most recent version of the data on the system, be that from the currently installed, or a previously uninstalled extension. The `DataVersion` property value differs depending on the context of the code being run:

- Normal operation: `DataVersion` represents the version of the currently installed extension, in which case it is identical to the `AppVersion` property.
- Installation code: 
    - Reinstallation (applying the same version): `DataVersion` represents the version of the extension we are trying to install (identical to the `AppVersion` property).
    - New installation: `DataVersion` represents the value of ‘0.0.0.0’ which is used to indicate that there is no data.
- Upgrade code:
    - The version of the extension we are upgrading from. Either what was last uninstalled, or what is currently installed.

All of these properties are encapsulated in a `ModuleInfo` data type. You can access these properties through the `NAVApp.GetCurrentModuleInfo()` and `NAVApp.GetModuleInfo()` methods. 

### Upgrade codeunit example
This example uses the `OnCheckPreconditionsPerDatabase()` trigger to check whether the data version of the previous extension version is compatible for the upgrade before restoring the archived data of the old extension.

```
codeunit 70000001 MyUpgradeCodeunit
{
    Subtype=Upgrade;

    trigger OnCheckPreconditionsPerDatabase();
    var
        myInfo : ModuleInfo;
    begin
        if NavApp.GetCurrentModuleInfo(myInfo) then
            if myInfo.DataVersion = Version.Create(1, 0, 0, 1) then
                error('The upgrade is not compatible');
    end;

    trigger OnUpgradePerDatabase()
    begin
        NavApp.RestoreArchiveData(Database::"TableName");      
    end;
}
```

## Running the upgrade for the new extension version
To upgrade to the new extension version, you use the [Sync-NavApp](https://go.microsoft.com/fwlink/?linkid=846311) and [Start-NAVAppDataUpgrade](https://go.microsoft.com/fwlink/?linkid=849315) cmdlets of the [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)] to synchronize table schema changes in the extension with the SQL database and run the data upgrade code.

1.  Publish the new extension version. For simplicity, this example assumes the extension is not signed, which is not allowed with [!INCLUDE[d365fin_md](includes/d365fin_md.md)] and is not recommended with an on-premise production environment.

    ```
    Publish-NAVApp -ServerInstance DynamicsNAV -Path .\ProswareStuff_1.7.1.0.app -SkipVerification
    ```
    This validates the extension syntax against server instance, and stages it for synchronizing.

3.  Synchronize the new extension version with the database.

    ```
    Sync-NAVApp -ServerInstance DynamicsNAV -Name ProswareStuff -Version 1.7.1.0
    ```
    This synchronizes the database with any table schema changes in the extension; it adds the tables from the extension to the tenant.

4.  Run a data upgrade.

    ```
    Start-NAVAppDataUpgrade -ServerInstance DynamicsNAV -Name ProswareStuff -Version 1.7.1.0
    ```
    This runs the upgrade logic that is defined by the upgrade codeunits in the extension. This will uninstall the current extension version, and enable the new version instead.

## See Also  
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[How to: Publish and Install an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
[Converting Extensions V1 to Extensions V2](devenv-upgrade-v1-to-v2-overview.md)  
[Sample Extension](devenv-extension-example.md)  
