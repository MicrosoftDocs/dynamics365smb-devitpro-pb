---
title: "Moving Custom Fields From Base Application to Extensions"
description: "DMoving Custom Fields From Base Application to Extensions"
author: jswymer
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
ROBOTS: NOINDEX
---

# Moving Custom Fields From the Base Application to an Extension

This article describes how to move a custom field, which was originally added directly to a base application table object, to an extension and migrate the data from the base application table to the table that is added by a table extension object.

To help explain the process, a simple example is used throughout this article. In this example, an integer data type field, named **ShoeSize**, was added the original **Customer** table object and **Customer Card** page object of the base application.

## Migrating data

The data migration can be handled by writing either install code or upgrade code, depending on whether the table extension object (and other related objects) is added by a new extension or existing extension. If the table extensions object is included in a new extension, then you write install code. If the table extension object is added to an existing extension, which has been previously published and installed, then you write upgrade code. The example used in this article adds the table extension object in a new extension, so install code is used.

For general information about install code and upgrade code, see [Writing Extension Install Code](devenv-extension-install-code.md) and [Upgrading Extensions](devenv-upgrading-extensions.md).

## Mark the custom field in base application table as being removed

In this task, you will mark the custom field in the base application table as being removed. This will not remove field or data from the database table. However, it will prevent others from referencing the custom field in code going forward, unless referenced from an upgrade codeunit.

1. In the app.json, increase the `version` of the base application.
        
2. Open the base application table object and set the `ObsoleteState` property to `Removed`.  

    For example, in the AL code of **Customer** base application table object, add the `ObsoleteState = Removed` property to the **ShoeSize** field.

    ```AL
    field(9008;"ShoeSize"; Integer)
    {
        DataClassification = CustomerContent;
        ObsoleteState = Removed;
        
    }
    ```
3. In the **Customer Card** page object, delete the **Shoe Size** field.

4. Build the base application extension package.

## Create a table extension object that adds a field to the base application table object

In this step, you will create a table extension object that includes a field that will replace the custom field in the base application table object.

1. Create an AL project in Visual Studio Code and add a dependency on the base application.
2. Create a table extension object that extends the base table object and add a field to the table extension object that will replace the custom field in the base application table.

    Give the field the same data type and length (if any) as the custom field in the base table you want to replace. You will have to assign the field a different ID than the custom field. This example adds a field named `ABC - ShoeSize` (for example, where `ABC` is your approved ISV prefix) and has the data type `integer`.
    
    ```AL
    tableextension 50101 CustTableExt extends Customer
    {
        fields
        {
            field(9009; "ABC – ShoeSize"; Integer)
            {
                DataClassification = CustomerContent;
            }
        }

    }
    ```

## Create a page extension object for displaying the new field

Because the **Customer Card** was originally modified to include a field for the **ShoeSize**, you create a page extension object that extends the **Customer Card** page with the new **ABC - ShoeSize** field, which will replace the original **ShoeSize** field.

1. In the AL project for the new extension, create a page extension object that extends the **Customer Card** base application object.
2. Add a field that will replace the custom field in the base application table.

    Add the field in the desired location within the page layout, in this case, it is added last. You can give the field the same caption as the original field. 

    
    ```AL
    pageextension 50102 Shoesize extends "Customer Card"
    {
        layout
        {
            addlast(General)
            {
                field("Shoe Size"; "ABC - ShoeSize")
                {
                    ApplicationArea = All;
                    Caption = 'Shoe Size';
    
                }
    
            }
        }
    
    }
    ```

## Create an install codeunit that copies existing data to the extension table

You need to somehow copy or move the data that is stored in the original **ShoeSize** field in the **Customer** base application table in the database to the new **ABC - ShoeSize** field of the extension. In this example, this is done by writing install code for the extension package. This involves creating an install type codeunit, and then adding code to one of its install triggers to migrate the data. For more information, see [Writing Extension Install Code](devenv-extension-install-code.md).

In this example, you will use the [VALIDATE method](methods-auto/record/record-validate-method.md) on the [OnInstallAppPerCompany trigger](triggers/codeunit/devenv-oninstallapppercompany-codeunit-trigger.md) to replicate data from the original **ShoeSize** field to the new **ABC - ShoeSize** field. When writing install code, it is important to add code to ensure that code will not run again if the extension is reinstalled for some reason. In this example, you only want to replicate the data found in the **ShoeSize** field on the initial installation of the extension. 

1. In the AL project for the new extension, create a codeunit object and set `SubType` property to `Install`.
2. Add the `OnInstallAppPerCompany()` and write code that checks whether this is a first-time installation of the extension.
    
    ```AL
    codeunit 50100 ShoeSize
    {
        Subtype = Install;
        var
    
            CustomerRec: Record Customer;
            AppInfo: ModuleInfo;
    
    
        trigger OnInstallAppPerCompany()
        begin
            NavApp.GetCurrentModuleInfo(myAppInfo);

            if AppInfo.DataVersion = Version.Create(0, 0, 0, 0) then // A 'DataVersion' of 0.0.0.0 indicates a 'fresh/new' install
                HandleFreshInstall
        end;
    }
    ```
3. Add a local method to the codeunit that iterates through the records of the **Customer** table and replicates data to the new field (**ABC - ShoeSize**). 

    ```AL
    local procedure HandleFreshInstall();
    begin
        if CustomerRec.FINDSET() then
            repeat

                CustomerRec.VALIDATE("ABC - ShoeSize", CustomerRec.ShoeSize);

                CustomerRec.MODIFY();

            until CustomerRec.Next = 0;

    end;
    ```

4. Build the extension package.


## Next steps

1. Publish the new base application version, then synchronize and run the data upgrade on tenants.
2. Publish the new extension package, then synchronize and install the new extension on tenants.
3. Permanently delete the custom field from the base application table (optional).

    You are not required to perform this step at this time. Complete these steps when you want to delete the original field from the database.

    1. Delete the original **ShoeSize** field from the **Customer** table of base application.
    2. Build and publish the new version of the base application.
    3. Synchronize the base application extension using the `-Mode ForceSync` parameter.

## See Also

[Publishing and Installing an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
[Upgrading Extensions](devenv-upgrading-extensions.md)
[Developing Extensions](devenv-dev-overview.md)  
[ObsoleteState Property](properties/devenv-obsoletestate-property.md)  

