---
author: jswymer
title: "Upgrading Extensions"
description: "Describes how to add code to upgrade data in a new extension version."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---

# Upgrading Extensions

This article provides information about how to make a newer version of extension upgrade available on tenants. The first phase of the process is to develop the extension for upgrading. In this phase, you add code to upgrade data from the previous extension version. Once you have the upgrade code in place, you can publish and synchronize the new version, and the run the data upgrade.

> [!NOTE]
> An *upgrade* is defined as enabling an extension that has a greater version number, as defined in the app.json file, than the current installed extension version.

## Writing upgrade code

When you develop a new extension version, you must consider the data from the previous version. You have to determine the modifications that must be made to the data to make it compatible with the current version. For example, maybe the new version adds a new field that needs default values set for existing records. Or, the new version adds new tables that must be linked to existing records. To address this type of data handling, you must write upgrade code for the extension version. If there are no data changes between the extension versions, you don't need to write upgrade code. All data that isn't modified by upgrade code will automatically be available when the process completes.

You write upgrade logic in an upgrade codeunit, which is a codeunit whose [SubType property](/dynamics365/business-central/dev-itpro/developer/devenv-subtype-codeunit-property) is set to **Upgrade**. An upgrade codeunit supports several system triggers on which you can add data upgrade code. These triggers are invoked when you run the data upgrade process on the new extension.

The upgrade codeunit becomes an integral part of the extension and may be modified as needed for later versions. You can have more than one upgrade codeunit. There's a set order to the sequence of the upgrade triggers, but  the execution order of the different codeunits isn't guaranteed. If you do use multiple upgrade units, make sure that they can run independently of each other.

### Upgrade triggers

The following table describes the upgrade triggers and lists them in the order in which they're invoked.

|Trigger |Description | Fails the upgrade on error |
|--------|------------|------------------------|
|OnCheckPreconditionsPerCompany() and OnCheckPreconditionsPerDatabase()| Used to check that certain requirements are met before the upgrade can be run.|Yes|
|OnUpgradePerCompany() and OnUpgradePerDatabase()|Used to do the actual upgrade.|Yes|
|OnValidateUpgradePerCompany() and OnValidateUpgradePerDatabase()|Used to check that the upgrade was successful.|Yes|

`PerCompany` triggers are run once for each company in the database, where each trigger is executed within its own system session for the company.

`PerDatabase` triggers are run once in the entire upgrade process, in a single system session that doesn't open any company.

> [!Note]
> These triggers are also available in upgrade codeunits for the base application, not just for extensions.

### Upgrade codeunit syntax

The following code illustrates the basic syntax and structure of an upgrade codeunit:

```AL
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

## Controlling when upgrade code runs

In most cases, it's important, that upgrade code isn't run more than once. There are a couple ways that you can control when upgrade code runs. You can either use extension version data or upgrade tags. These two methods are described in the sections follow. The method you choose will depend on the complexity of your solution. Use the following table as a guideline:


|Scenario|Version number|Upgrade tags|
|--------|--------------|-------------|
|Large application with many versions||x|
|Extension version changes frequently, for example more than once a year||x|
|Version is set manually|x|| 
|When checking whether it's a first-time installation. In this case, comparing with 0.0.0.0|x||
|Fixing a broken upgrade||x|


## Using extension version data to control upgrade code

Each extension version has a set of properties that contain information about the extension, including: `AppVersion`, `DataVersion`, `Dependencies`, `Id`, `Name`, and `Publisher`. This information can be useful when upgrading. For more information, see [JSON Files](devenv-json-files.md).

The `AppVersion` is one of the available properties and its value differs depending on the context of the code being run:

- Normal operation: `AppVersion` represents the value of the currently installed extension.
- Installation code: `AppVersion` represents the version of the extension you're trying to install.
- Upgrade code: `AppVersion` represents the version of the extension that you're upgrading to (in other words, the 'newer' version).

Another one of the more important properties is the `DataVersion` property, that represents the value of most recently installed/uninstalled/upgraded version of the extension, meaning that it reflects the most recent version of the data on the system, be that from the currently installed, or a previously uninstalled extension. The `DataVersion` property value differs depending on the context of the code being run:

- Normal operation: `DataVersion` represents the version of the currently installed extension, in which case it's identical to the `AppVersion` property.
- Installation code: 
    - Reinstallation (applying the same version): `DataVersion` represents the version of the extension you're trying to install (identical to the `AppVersion` property).
    - New installation: `DataVersion` represents the value of '0.0.0.0' that's used to indicate there's no data.
- Upgrade code:
    - The version of the extension you're upgrading from. Either what was last uninstalled, or what is currently installed.

All these properties are encapsulated in a `ModuleInfo` data type. You can access these properties through the `NAVApp.GetCurrentModuleInfo()` and `NAVApp.GetModuleInfo()` methods. For more information, see [NavApp Data Type](methods-auto/navapp/navapp-data-type.md).

### Upgrade codeunit example

This example uses the `OnCheckPreconditionsPerDatabase()` trigger to check whether the data version of the previous extension version is compatible for the upgrade before restoring the archived data of the old extension.

```AL
codeunit 50100 MyUpgradeCodeunit
{
    Subtype=Upgrade;

    trigger OnCheckPreconditionsPerDatabase();
    var
        myInfo : ModuleInfo;
    begin
        if NavApp.GetCurrentModuleInfo(myInfo) then
            if myInfo.DataVersion = Version.Create(1, 0, 0, 1) then
                error('The upgrade isn't compatible');
    end;

    trigger OnUpgradePerDatabase()
    begin
        NavApp.RestoreArchiveData(Database::"TableName");      
    end;
}
```

## Using upgrade tags to control upgrade code

Although you can control upgrade code by checking versions, this pattern becomes difficult with larger applications that have many versions. The risk of something going wrong increases. If your solution includes the Microsoft system application, another way is to use *upgrade tags*. Upgrade tags provide a more robust and resilient way of controlling the upgrade process. They provide a way to track upgrade methods have been run to prevent executing the same upgrade code twice. Tags can also be used to skip the upgrade methods for a specific company or to fix an upgrade that went wrong.


### Implementation behind upgrade tags

Upgrade tags are implemented as part the **Upgrade Tags** module of the system application. The module provides an API that you can code against to control your upgrade code.

> [!TIP]
> If you want to implement your own upgrade tagging functionality, or get a better understanding of the code behind implementation in the system application, see [Upgrade Tags](https://github.com/microsoft/ALAppExtensions/tree/master/Modules/System/Upgrade%20Tags) in the ALAppExtensions repository on GitHub.

The **Upgrade Tags**  module consists of several AL objects. In particular, it includes codeunit 9999 "Upgrade Tag" for creating and handling upgrade tags and table 9999 "Upgrade Tags" for storing them.

Codeunit 9999 "Upgrade Tag" includes the following methods:

| Method |Description|
|--------|-----------|
| `HasUpgradeTag(Tag: Code[250]; TagCompanyName: Code[30]): Boolean`|Verifies whether a specific upgrade tag exists. `Tag` is the code to check. `TagCompanyName` is the name of the company for which to check the existence of the tag. Returns `true` if the `Tag` with the given code exists.|
| `SetUpgradeTag(NewTag: Code[250])`|Specifies the tag to save.|
| `SetAllUpgradeTags()`|Sets all upgrade tags in a new company. This method is called from codeunit 2 "Company Initialize" in the base application. |
| `SetAllUpgradeTags(NewCompanyName: Code[30])`|Sets all upgrade tags in a new company. This method is called from report 357 "Copy Company" in the base application. |

The codeunit also publishes the following events:

| Event |Description|
|--------|-----------|
| `OnGetPerCompanyUpgradeTags(var PerCompanyUpgradeTags: List of [Code[250]])`|Subscribe to this event to register an upgrade tag for OnUpgradePerCompany upgrade method for a new company. `PerCompanyUpgradeTags` specifies a list of tags to insert. Tags that already exist won't be inserted.|
| `OnGetPerDatabaseUpgradeTags(var PerDatabaseUpgradeTags: List of [Code[250]])`|Subscribe to this event to register an upgrade tag for OnUpgradePerDatabase upgrade method for a new company. `PerDatabaseUpgradeTags` specifies a list of tags to insert. Tags that already exist won't be inserted.|

### How to use upgrade tags

The following steps provide the general pattern for using an upgrade tag on upgrade code.

> [!IMPORTANT]
> Use upgrade tags only for upgrade purposes only.

1. Use the following construct around the upgrade code to check for and add an upgrade tag.
        
    ```AL
    // Check whether upgrade tag exists
    if UpgradeTag.HasUpgradeTag(UpgradeTagValue) then
      exit;
    
    // Upgrade code
    
    // Add the new upgrade tag using SetUpgradeTag or SetAllUpgradeTags
    UpgradeTag.SetUpgradeTag(UpgradeTagValue); 
    ```

    You can use any value for the upgrade tag, but we recommend that you use the convention [CompanyPrefix]-[ID]-[Description]-[YYYYMMDD], for example, ABC-1234-MyExtensionUpgrade-20201206.
    
2. Add code to register the upgrade tag for new companies that might eventually be created.

    This step ensures that the upgrade code isn't run on the first upgrade because of a missing tag.

    To register the tag, subscribe to the `OnGetPerCompanyUpgradeTags` or `OnGetPerDatabaseUpgradeTags` events.

    ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(UpgradeTagValue);
    end;
    ```

    This step isn't necessary if the tag is added by calling the `SetAllUpgradeTags` method.

3. Add code to register the upgrade tag for first-time installations of the extension.

    The step ensures that the upgrade code isn't run on first upgrade because of missing tag.

    To register the tag, call the `SetUpgradeTag` method on the `OnInstallAppPerCompany` and `OnInstallAppPerDatabase` triggers in the extension's install codeunit.

    ```AL
    codeunit 50100 InstallCodeunit
    {
        Subtype=Install;
    
        trigger OnInstallAppPerCompany()
        var
            UpgradeTag: Codeunit "Upgrade Tag";
        begin
            if not UpgradeTag.HasUpgradeTag(UpgradeTagValue) then
                UpgradeTag.SetUpgradeTag(UpgradeTagValue);
        end;
    }
    ```

    > [!NOTE]
    > Instead of registering tags individually, call the `SetAllUpgradeTags` method as opposed to `SetUpgradeTag`. This will register automatically register new tags as they're added.

    For more information about extension install code, see [Writing Extension Install Code](devenv-extension-install-code.md).

### Design considerations

1. Keep tags simple by limiting nesting tags to two levels. Complicated if statements can lead to problems.
2. Implement additional safety checks to avoid data corruption, even though you're using upgrade tags. For example, when copying obsolete fields to new fields, make sure the new fields have a default or blank. This check adds safety if upgrade tags introduce data issues.

### Example

The following code is a simple example of an upgrade codeunit. For this example, the original extension extended the **Customer** table with a **Shoesize** field. In the new version of the extension, the **Shoesize** field has been removed [ObsoleteState](properties/devenv-obsoletestate-property.md)=removed), and replaced by a new field **ABC - Customer Shoesize**. The upgrade code will copy data from **Shoesize** field to the **ABC - Customer Shoesize**. An upgrade tag ensures that code doesn't run more than once, and data isn't overwritten on future upgrades. The example also uses a separate codeunit to define the upgrade tag so that they aren't hard-coded, but within methods.

```AL
codeunit 50100 "ABC Upgrade Shoe Size"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        ABCUpgradeTagDefinitions: Codeunit "ABC Upgrade Tag Definitions";
        UpgradeTagMgt: Codeunit "Upgrade Tag";
    begin

        // Check whether the tag has been used before, and if so, don't run upgrade code
        if UpgradeTagMgt.HasUpgradeTag(ABCUpgradeTagDefinitions.GetABCShoeSizeUpgradeTag()) then
            exit;

        // Run upgrade code
        UpgradeShoeSize();

        // Insert the upgrade tag in table 9999 "Upgrade Tags" for future reference
        UpgradeTagMgt.SetUpgradeTag(ABCUpgradeTagDefinitions.GetABCShoeSizeUpgradeTag());
    end;

    local procedure UpgradeShoeSize()
    var
        Customer: Record Customer;
    begin

        if not Customer.FindSet() then
            exit;

        repeat
            // Make sure that target field is blank because you're copying obsolete=removed field to new field
            // Additional safety check
            if Customer."ABC - Customer Shoesize" <> 0 then
                Error('ShoeSize must be blank, the value is already assigned');

            // Avoid blank modifies - it is a performance hit and slows down the upgrade
            if Customer."ABC - Customer Shoesize" <> Customer.Shoesize then begin
                Customer."ABC - Customer Shoesize" := Customer.Shoesize;
                Customer.Modify();
            end;
        until Customer.Next() = 0;
    end;
}

codeunit 50101 "ABC Upgrade Tag Definitions"
{
    // Register the new upgrade tag for new companies when they are created.
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure OnGetPerCompanyTags(var PerCompanyUpgradeTags: List of [Code[250]]);
    begin
        PerCompanyUpgradeTags.Add(GetABCShoeSizeUpgradeTag());
    end;

    // Use methods to avoid hard-coding the tags. It is easy to remove afterwards because it's compiler-driven.
    procedure GetABCShoeSizeUpgradeTag(): Text
    begin
        exit('ABC-1234-ShoeSizeUpgrade-20201125');
    end;

}
```

## Protecting sensitive code from running during upgrade

The extension might initiate code that you don't want to run during upgrade. The changes done to the data stored in the database will be rolled back. However, things like calls to external web services or physical printing can't be rolled back. Also, some code, like scheduling tasks, might throw an error and fail the upgrade.

For example, let's say the extension runs code that prints a check after a purchase invoice is posted for buying shoes. If the upgrade fails, the purchase invoice is rolled back. But the check will still be printed, unless you have implemented a mechanism to prevent printing. 

To avoid this situation, use the session `ExecutionContext`. Depending on the scenario, the system runs a session in a special context for a limited time, which can be either `Normal`, `Install`, `Uninstall`, or `Upgrade`. You get the `ExecutionContext` by calling the [GetExecutionContext method](methods-auto/session/session-getexecutioncontext-method.md). For example, referring the example for printing checks, you could add something like the following code to verify the ExecutionContent before printing the check:

```AL
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPurchInvHeaderInsert', '', false, false)]
local procedure PrintCheckWhenPurchasingShoes(var PurchHeader: Record "Purchase Header"; var PurchInvHeader: Record "Purch. Inv. Header")
begin
    // Check whether global context is upgrade or installation of extension
    if Session.GetExecutionContext() <> ExecutionContext::Normal then
        // Check whether code is triggered by the extension
        if Session.GetCurrentModuleExecutionContext() <> ExecutionContext::Normal then
            // Something is wrong, so you want to abort here because the code doesn't raise the EnqueuePrintingCheck trigger
            Error('Check can't be printed')
        else begin
            // Other code is invoking the upgrade, so use Job queue or similar mechanism to roll back if upgrade fails
            EnqueuePrintingCheck(PurchInvHeader);
            exit;
        end;

    CallWebServiceToPrintCheck(PurchInvHeader);
end;
```

## Running the upgrade for the new extension version

To upgrade to the new extension version, you use the [Sync-NavApp](/powershell/module/Microsoft.Dynamics.Nav.Apps.Management/Sync-NAVApp) and [Start-NAVAppDataUpgrade](/powershell/module/Microsoft.Dynamics.Nav.Apps.Management/Start-NAVAppDataUpgrade) cmdlets of the [!INCLUDE[adminshell](includes/adminshell.md)]. These cmdlets synchronize table schema changes in the extension with the SQL database and run the data upgrade code.

1.  Publish the new extension version. For simplicity, this example assumes the extension isn't signed, which isn't allowed with [!INCLUDE[d365fin_md](includes/d365fin_md.md)] and isn't recommended with an on-premise production environment.

    ```
    Publish-NAVApp -ServerInstance BC -Path .\ProswareStuff_1.7.1.0.app -SkipVerification
    ```
    
    This step validates the extension syntax against server instance, and stages it for synchronizing.

3.  Synchronize the new extension version with the database.

    ```
    Sync-NAVApp -ServerInstance BC -Name ProswareStuff -Version 1.7.1.0
    ```
    This step synchronizes the database with any table schema changes in the extension; it adds the tables from the extension to the tenant.

4.  Run a data upgrade.

    ```
    Start-NAVAppDataUpgrade -ServerInstance BC -Name ProswareStuff -Version 1.7.1.0
    ```
    This step runs the upgrade logic that is defined by the upgrade codeunits in the extension. This step will uninstall the current extension version and enable the new version instead.

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[How to: Publish and Install an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
[Converting Extensions V1 to Extensions V2](devenv-upgrade-v1-to-v2-overview.md)  
[Sample Extension](devenv-extension-example.md)  
[Analyzing Extension Upgrade Telemetry](../administration/telemetry-extension-update-trace.md)  
[Analyzing Extension Lifecycle Telemetry](../administration/telemetry-extension-lifecycle-trace.md)