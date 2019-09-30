---
title: "Moving Custom Fields From Base Application to Extensions"
description: "DMoving Custom Fields From Base Application to Extensions"
author: jswymer
ms.custom: na
ms.date: 09/13/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Moving Custom Fields From Base Application to Extensions

This article describes how to move a custom field, which was originally added directly to a base application table object, to an extension and migrate the data from the base application table to the table extension.

To help explain the process, a simple example is used throughout this article. In this example, an integer data type field, named **Shoesize**, was added the original **Customer** table object and **Customer Card** page object of the base application.

## Create a table extension object that adds a field to the base application table object

In this step, you will create an table extension object that includes a field that will replace the custom field in the base application table object.

1. Create an AL project in Visual Studio Code, and add a dependency on the base application.
2. Create a table extension object that extends the base table object, and add a field to the table extension object that will replace the custom field in the base application table.

    Give the field the same data type and length (if any) as the custom field in the base table you want to replace. Yuo will have to assign the field a different ID than the custom field. This example adds a field named `Shoesize2` and of the data type `integer`.
    
    ```
    tableextension 50101 CustTableExt extends Customer
    {
        fields
        {
            field(9008; Shoesize2; Integer)
            {
                DataClassification = ToBeClassified;
            }
        }

    }
    ```

## Create a page extension object for displaying the new field

Because the **Customer Card** was originally modified to include a field for the **Shoesize**, you create a page extension object that extends the **Customer Card** page with the new **Shoesize2** field, which will replace the original **Shoesize** field.

1. In the AL project for the new extension, create a page extension object that extends the **Customer Card** base application object.
2. Add a field that will replace the custom field in the base application table.

    Add the field in the desired location within the page layout, in this case, it is added last. You can give the field the same caption as the original field. 

    
    ```
    pageextension 50102 Shoesize extends "Customer Card"
    {
        layout
        {
            addlast(General)
            {
                field("Shoe Size 2"; Shoesize2)
                {
                    ApplicationArea = All;
                    Caption = 'Shoe Size';
    
                }
    
            }
        }
    
    }
    ```

## Create an install codeunit that copies existing data to the extension table

You need to somehow copy or move the data that is stored in the original **Shoesize** field in the **Customer** base application table in the database to the new **Shoesize2** field of the extension. In thi example, this is done by writing install code for the extension package. This involves creating an install type codeunit, and then adding code to one of its install triggers to migrate the data. For more information, see [Writing Extension Install Code](devenv-extension-install-code.md).

In this example, you will use the [VALIDATE method](methods-auto/record/record-validate-method.md) on the [OnInstallAppPerCompany trigger](triggers/devenv-oninstallapppercompany-trigger.md) to replicate data from the original **Shoesize** field to the new **Shoesize2** field. When writing install code, it is important to add code to ensure that code will not run again if the extension is reinstalled for some reason. In this example, you only want to replicate the data found in the **Shoesize** field on initial installation of the extension. 

1. In the AL project for the new extension, create a codeunit object and set `SubType` property to `Install`.
2. Add the `OnInstallAppPerCompany()` and write code tht checks whether this is a first-time installation of the extension.
    
    ```
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
    ```
3. Add a local method that iterates through the records of the **Customer** table
        local procedure HandleFreshInstall();
        begin
            if CustomerRec.FINDSET() then
                repeat
    
                    CustomerRec.VALIDATE("Shoesize2", CustomerRec.Shoesize);
    
                    CustomerRec.MODIFY();
    
                until CustomerRec.Next = 0;
    
        end;    
    }
    ```

4. Build the extension package.

## Obsolete/remove the custom field in base application

1. In the base application table object, mark the old field as obsolete.

    For example, in the AL code of **Customer** base application table object, add the `ObsoleteState = Removed` property to the **ShoeSize** field. 

2. In the **Customer Card** page object, delete the **Shoesize** field.

3. Build the base application extension package.

## Next steps

1. Publish, synchronize, and upgrade to the new base application version.
2. Publish, synchronize, and install the new extension package.
3. Delete the field from the base application table.

    You are not required to perform this step at this time. Complete these step when you want to delete the original field from the database. 

    1. Delete the original **Shoesize** from the **cusotmer** table of base application.
    2. Build and publish the new version of the base application.
    3. Synchronize the base application extension using the `-Mode Focreync` parameter.
    4. Run the data upgrade.    

## See Also

[Unpublishing and Uninstalling Extensions](devenv-unpublish-and-uninstall-extension-v2.md)  
[Developing Extensions](devenv-dev-overview.md)

