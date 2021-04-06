---
title: "Converting Extensions V1 to V2 Overview"
description: "Overview of the converting of extensions."
author: jswymer
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Converting Extensions V1 to Extensions V2

Extensions are a programming model where functionality is defined as an addition to existing objects and defines how they are different or modify the behavior of the solution. This article explains the steps involved in converting V1 extensions, written in C/SIDE. to V2 extensions; written using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] for Visual Studio Code. The overall steps for the conversion are:

1. Convert the source code from C/AL to the AL syntax.
2. Complete the development of the extension in AL syntax.
3. Write upgrade code to restore and modify data from the V1 Extension tables.
4. Build the extension.
5. Uninstall the V1 extension, and publish and run upgrade on the V2 extension.

> [!IMPORTANT]  
> Converting extensions V1 to extensions V2 can only be done on [!INCLUDE[prod_short](includes/prod_short.md)] Spring 2019 (version 14) and earlier versions. It isn't supported on later [!INCLUDE[prod_short](includes/prod_short.md)] versions, because it requires a working C/AL base application and several ArchiveData functions, which are not available in later versions.  

## Convert the source code from V1 to V2

To convert the source code, you must use the Txt2Al conversion tool. The Txt2Al conversion tool allows you to take existing application objects that have been exported in .txt format and convert them into the new .al format. The .al format is used when developing extensions for [!INCLUDE[prod_short](includes/prod_short.md)]. For more information about converting the source code, see [Txt2Al Conversion Tool](devenv-txt2al-tool.md).

## Complete the development of the extension

When the source code has been converted using the Txt2Al conversion tool, open the project folder in Visual Studio Code, and then modify or add code to the new version as needed. For more information about getting started with Visual Studio Code and the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], see [Getting Started with AL](devenv-get-started.md).

You might run into compilation errors, which can typically be caused by:

- Object IDs that have changed. The conversion tool tries to convert your code into the object ID range allowed for Extensions V2.
- Field or control names look different; the AL syntax requires names, this means that no empty or default names are allowed.
- Menu suites do not exist in Extensions V2.
- .NET references are not allowed; there is no support for .NET types. Instead you must use the classes that replace .NET calls. For more information, see [Reference](devenv-reference-overview.md).

> [!IMPORTANT]  
> In the `app.json` file, keep the ID the same as in the V1 extension. Also, make sure to increase the version number.
>
> The version number has the format `Major.Minor.Build.Revision`, for example `1.5.0.0`. To increase the version number, you must increase the value of `Major`, `Minor`, or `Build` by at least one, for example `1.5.1.0` or `1.6.0.0`. 
>
> To use `NAVAPP.RestoreArchiveData()` method for upgrading, you must not change the IDs of the tables that are being restored; this means that tables from your V1 extension must have the same IDs in the V2 extensions. 

## Write upgrade code to move data from V1 Extensions
Just like with V1 extensions, you have to write code to handle data in tables during upgrade. Writing code for the V1-to-V2 extension upgrade is very similar to the code that you have been writing for V1 Extensions. The differences are:

- Instead of adding code to normal codeunit, you write code in an upgrade codeunit, which is a codeunit whose [SubType property](/dynamics365/business-central/dev-itpro/developer/devenv-subtype-codeunit-property) is set to **Upgrade**.
- Instead of adding code to the user-defined methods `OnNavAppUpgradePerDatabase()` or `OnNavAppUpgradePerCompany()`, you add code to one or more of the following system triggers for data upgrade. These triggers are invoked when a data upgrade is started. The following table lists the upgrade triggers in the order in which they run.  

    |Trigger |Description |
    |--------|------------|
    |OnCheckPreconditionsPerCompany() or OnCheckPreconditionsPerDatabase()| Used to check that certain requirements are met in order to run.|
    |OnUpgradePerCompany() or OnUpgradePerDatabase()|Used to run the actual upgrade work|
    |OnValidateUpgradePerCompany() or OnValidateUpgradePerDatabase()|Used to check that the upgrade was successful|  

However, for this one-time conversion, all of the same **NAVAPP** system methods you used in V1 extensions work with V2 extensions and can be called from any of the upgrade triggers. 

|Method |Description |
|--------|------------|
|`NAVAPP.DeleteArchiveData(70000000)`|Deletes the archived data from table 70000000.|
|`NAVAPP.GetArchiveRecordRef(70000000, archRef)`|Gets a record ref to the archived data from table 70000000.|
|`archVersion := NAVAPP.GetArchiveVersion()`|Gets the version of the archived data from the old extension.|
|`NAVAPP.RestoreArchiveData(70000000)`|Restores the data from the archive of table 70000000.|
 
By using these methods, you can restore or move all your data from the old V1 extension into the new V2 by running an upgrade.

> [!IMPORTANT]  
> To use `NAVAPP.RestoreArchiveData()`, you must not change the IDs of the tables that are being restored; this means that tables from your V1 extension must have the same IDs in the V2 extensions. 

### Example
This code illustrates a simple upgrade codeunit for restoring the V1 extension data for extension table `70000000`. 

```AL
codeunit 70000001 MyExtensionUpgrade
{
    Subtype=Upgrade;

    trigger OnUpgradePerDatabase();
    begin
        NAVAPP.RestoreArchiveData(70000000);
    end;
}
```

> [!TIP]  
> Typing the shortcut `ttrigger` in Visual Studio Code will create the basic structure for a trigger.

## Build the extension package
Press Ctrl+Shift+B to compile and build the extension complete with the application objects and upgrade codeunit.

## Run the upgrade
The final task of the conversion is to publish the V2 extension, and run the data upgrade. The following steps use an example that upgrades a V1 extension that is called 'ProsewareStuff' and has the version '1.5.0.0.'. The V1 extension is published, installed, and populated with data. The V2 extension has the same name (and ID), but it has the version '1.5.1.0'. The [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] instance is called 'DynamicsNAV', and there is only one tenant.

The steps use the [!INCLUDE[nav_admin_md](includes/nav_admin_md.md)]. 

1. Uninstall the V1 extension.

    ```
    Uninstall-NAVApp -ServerInstance NAV -Name ProsewareStuff -Version 1.5.0.0
    ```
    This removes the tables from the SQL Server database and archives extension data.

    > [!IMPORTANT]
    > The V1 extension must be uninstalled before upgrading it to a V2 extension. 

2. Publish the V2 extension. This example assumes the extension is not signed.
    ```
    Publish-NAVApp -ServerInstance DynamicsNAV -Path .\ProswareStuff_1.5.1.0.app -SkipVerification
    ```
    This validates the extension syntax against server instance, and stages it for syncing.

3. Synchronize the V2 extension with the database.

    ```
    Sync-NAVApp -ServerInstance NAV -Name ProswareStuff -Version 1.5.1.0
    ```
    This adds tables from V2 extension to SQL database.

4. Run the upgrade process to handle archived data from the V1 extension. 
    ```
    Start-NAVAppDataUpgrade -ServerInstance NAV -Name ProswareStuff -Version 1.5.1.0
    ```
    This runs the upgrade logic defined by the upgrade codeunit in the extension, and installs the new V2 extension.

5. (optional) Unpublish the V1 extension.

    ```
    Unpublish-NAVApp -ServerInstance NAV -Name ProswareStuff -Version 1.5.0.0
    ```
    This removes the unused extension package from server.

## Going forward
The upgrade code unit becomes an integral part of the extension. The **NAVAPP** methods were mainly be used for the conversion from V1 to V2. After converting the extension, you should begin to write upgrade code as described in [Upgrading Extensions](devenv-upgrading-extensions.md).

## See Also
[Getting Started with AL](devenv-get-started.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)    
[AL Development Environment](devenv-reference-overview.md)