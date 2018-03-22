---
author: jswymer
title: "Upgrading an Extension V2 to a new version"
description: "Describes how to add code to upgrade data in a new extension version."
ms.custom: na
ms.date: 11/10/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Upgrading Extensions V2
This article provides information about how to make a newer version of extension upgrade available on tenants. The first phase of this process is to develop the extension for upgrading, which means adding code to upgrade data from the previous extension version. Once you have the upgrade code in place, you can publish and synchronize the new version, and the run the data upgrade.

> [!Note]
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
> Use the shortcuts `tcodunit` and `ttrigger` to create the basic structure for the codeunit and trigger.

### Get information about an extension
Each extension version has a set of properties that contain information about the extension, including: AppVersion, DataVersion, Dependencies, Id, Name, and Publisher. This information can be useful when upgrading. For example, one of the more important properties is the `DataVersion` property, which tells you what version of data you are dealing with. These properties are encapsulated in a `ModuleInfo` data type. You can access these properties through the `NAVApp.GetCurrentModuleInfo()` and `NAVAPP.GetModuleInfo()` methods.

### Upgrade codeunit example
This example uses the `OnCheckPreconditionsPerDatabase()` trigger to check whether the data version of the previous extension version is compatible for the upgrade.

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
                ERROR('The upgrade is not compatible');
    end;
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
