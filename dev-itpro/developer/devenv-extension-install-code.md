---
author: jswymer
title: "Writing extensions installation code"
description: "Describes how to add code to run to initialize data when an extension is installed."
ms.custom: na
ms.date: 02/04/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---

# Writing Extension Install Code

There might be operations outside of the extension code itself that you want run when an extension is installed. Operations could include, for example, populating empty records with data, service callbacks and telemetry, version checks, and messages to users. To do these types of operations, you write extension install code. Extension install code is run when:

- An extension is installed for the first time.
- An uninstalled version is installed again.

This behavior enables you to write different code for initial installation and reinstallation.

Install code is run only when an extension version is first installed or reinstalled by running the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) or from the **Extension Management** page in the client. Install code isn't run when a new version of an existing extension is installed as part the upgrade operation by running the [Start-NAVAppDataUgrade cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade). For upgrade, see [Upgrading Extensions](devenv-upgrading-extensions.md).

## How to write install code

You write install logic in an *install* codeunit. This codeunit has the [SubType property](properties/devenv-subtype-codeunit-property.md) set to **Install**. An install codeunit supports two system triggers on which you can add the install code.

|Trigger |Description |
|--------|------------|
|OnInstallAppPerCompany()|Includes code for company-related operations. Runs once for each company in the database.|
|OnInstallAppPerDatabase()|Includes code for database-related operations. Runs once in the entire install process.|

The install codeunit becomes an integral part of the extension version. You can have more than one install codeunit. However, there's no guarantee on the order of execution of the different codeunits. If you do use multiple install units, make sure that they can run independently of each other.

### Install codeunit syntax

The following code illustrates the basic syntax and structure of an install codeunit:

```AL
codeunit [ID] [NAME]
{
    Subtype=Install;

    trigger OnInstallAppPerCompany()
    begin
        // Code for company related operations
    end;

    trigger OnInstallAppPerDatabase()
    begin
        // Code for database related operations
    end;

}
```
> [!TIP]
> Use the shortcuts `tcodeunit` and `ttrigger` to create the basic structure for the codeunit and trigger.

### Get information about an extension

Each extension version has a set of properties that contain information about the extension, including: AppVersion, DataVersion, Dependencies, ID, Name, and Publisher. This information can be useful when installing. For example, one of the more important properties is the `DataVersion` property, which tells you what version of data you're dealing with. These properties are encapsulated in a `ModuleInfo` data type. You can access these properties by through the `NAVApp.GetCurrentModuleInfo()` and `NAVAPP.GetModuleInfo()` methods. For more information, see [NavApp Data Type](methods-auto/navapp/navapp-data-type.md)

### Install codeunit example

This example uses the ` OnInstallAppPerDatabase()` trigger to check whether an extension version is being installed for the first time or it's being reinstalled.

```AL
codeunit 50100 MyInstallCodeunit
{
    Subtype=Install;

    trigger OnInstallAppPerDatabase();
    var
        myAppInfo : ModuleInfo;
    begin
        // Get info about the currently executing module
        NavApp.GetCurrentModuleInfo(myAppInfo); 

        // A 'DataVersion' of 0.0.0.0 indicates a 'fresh/new' install
        if myAppInfo.DataVersion = Version.Create(0,0,0,0) then 
            HandleFreshInstall
        else
            // If not a fresh install, then we are Re-installing the same version of the extension
            HandleReinstall;
    end;

    local procedure HandleFreshInstall();
    begin
        // Do work needed the first time this extension is ever installed for this tenant.
        // Some possible usages:
        // - Service callback/telemetry indicating that extension was installed
        // - Initial data setup for use
    end;

    local procedure HandleReinstall();
    begin
        // Do work needed when reinstalling the same version of this extension back on this tenant.
        // Some possible usages:
        // - Service callback/telemetry indicating that extension was reinstalled
        // - Data 'patchup' work, for example, detecting if new 'base' records have been
        //   changed while you have been working 'offline'.
        // - Setup 'welcome back' messaging for next user access.
    end;
}

```

## See Also  
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[How to: Publish and Install an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
[Converting Extensions V1 to Extensions V2](devenv-upgrade-v1-to-v2-overview.md)  
[Building Your First Sample Extension With Extension Objects, Install Code, and Upgrade Code](devenv-extension-example.md)