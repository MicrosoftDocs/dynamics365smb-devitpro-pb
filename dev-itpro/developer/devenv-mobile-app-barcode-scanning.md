---
title: Barcode scanning in mobile app
description: Learn how to add bar code scanning capability to the Business Central mobile app 
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: conceptual
ms.collection: get-started
ms.date: 10/05/2023
ms.custom: bap-template 
ms-service: dynamics365-business-central
---

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->

<!--This template provides the basic structure of a concept article. See [Write a concept article](write-a-concept-article.md) in the contributor guide. To provide feedback on this template contact [bace feedback team](mailto:templateswg@microsoft.com).-->

<!--H1 - Required. This should match the title you entered in the metadata. Set expectations for what the content covers, so customers know the content meets their needs. Should NOT begin with a verb.-->

# Adding barcode scanning to the mobile app

> **APPLIES TO:** Business Central 2023 release wave 2 (version 23.1) and later update 23.1[!INCLUDE[2023-releasewave2](../includes/2023-releasewave2.md)] update 23.1

Business Central offers native barcode scanning support in the mobile app and AL language, enabling developers to provide barcode scanning capability to users of the mobile app. Barcode scanning works on supported phones and tablets, either using the device's camera or a dedicated Android barcode scanner device.

## Supported scenarios

There are three different supported scenarios for adding barcode scanning to the mobile. The scenarios have varying levels of complexity. The approach you choose depends design needs, the scanner, and the device's operating system. The following table provides an overview. 

|Scenario|Description|Device camera| Dedicated scanner|iOS device|Android device|
|-|-|-|-|-|-|
|UI button on a field|The user scans a barcode by manually selecting a button next to a field|![Shows a checkbox indicating support](media/check.png)||![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)|
|AL action|An operation or action, like when the page opens, triggers the barcode scanner.|![Shows a checkbox indicating support](media/check.png)||![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)|
|Barcode event |events||![Shows a checkbox indicating support](media/check.png)||![Shows a checkbox indicating support](media/check.png)|

## Supported barcodes

The barcode scanning capability supports several of the most common 1D and 2D barcode formats, including:​

- QR code​
- Data Matrix​
- UPC A​
- UPC E​
- EAN 8​
- EAN 13​
- Code 39​
- Code 93​
- Code 128​
- Codabar​*
- ITF​
- RSS14​*
- RSS Expanded​*
- PDF 417​
- AZTEC​

\* Not supported on iOS devices

## Requirements

- The field used for storing scanned barcodes is either [text](methods-auto/text/text-data-type) and [code](methods-auto/code/code-data-type) data type, which are the only two data types that support barcode scanning.

- Business Central mobile app version 4.0 or later


## Scenario 1: Add a barcode scanning button on a field

The simplest way to provide barcode scanning capability in the mobile app is by adding a barcode scanning button on a field that starts the barcode scanner capability of the device's camera. 

![Shows the barcode scanning button an an item card](media/barcode-scanning-button.png)

This scanning is highly efficient and responsive. Once a barcode is scanned, its value is entered in the field on the page, and the focus moves to the next quick-entry field on the page. 


To enable the barcode scanning button on a field, set the [ExtendedDatatype](properties/devenv-extendeddatatype-property.md) property to `Barcode`. You can set ExtendedDatatype on either the field in the table or page. The property instructs  the mobile client to display the barcode button when the page is opened on a supported device.

The following code shows an example that adds a field with a barcode scanning button to the **Item** card page.


```al
pageextension 50101 ItemBarcode extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Barcode"; Rec.GTIN)
            {
                Caption = 'Barcode';
                ExtendedDatatype = Barcode;
            }
        }
    }
}
```

## Scenario 2: Trigger from AL logic

You can trigger the barcode scanning UI via an AL-based operation to start it start from a button, link, or some other semi-automated logic (for instance, when a page is opened). This scenario uses the same camera-based scanning technology as scenario 1 and returns the scanned barcode value to AL code for further processing.

The basic steps for implementing this scenario are: 

1. Define the barcode scanner provider by declaring a variable for the CameraBarcodeScannerProvider.
1. Verify the barcode scanner provider exists in context of the client. For example, if the user is working in the Business Central web client, this step returns false.  
1. Create the barcode scanner. For example, this step could inside a page action.
1. Call the camera action on the device.
1. Depending on whether the barcode is scanned successfully, call either the BarcodeAvailable or BarcodeFailure triggers.
   


This following code shows an example of how to start the barcode scanning when a page opens.


> [!TIP]
> For a detailed implementation in the Business Central base application, refer to source code of the **Item Tracking Lines** page (ItemTrackingLines.Page.al).

```al
page 50100 "MyALPage"
{
    Caption = 'MyPage';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
        }
    }

    var
        [RunOnClient]
        [WithEvents]
        CameraBarcodeScannerProvider: DotNet CameraBarcodeScannerProvider; // Step 1

    trigger OnOpenPage()
    begin
        if not CameraBarcodeScannerProvider.IsAvailable then begin // Step 2
            Message('Not available');
            exit;
        end;

        CameraBarcodeScannerProvider := CameraBarcodeScannerProvider.Create(); // Step 3
        CameraBarcodeScannerProvider.RequestBarcodeAsync(); // Step 4
    end;

    trigger CameraBarcodeScannerProvider::BarcodeAvailable(Barcode: Text; Format: Text) // Step 5
    begin
        Message(Barcode);
        exit;
    end;


    trigger CameraBarcodeScannerProvider::BarcodeFailure(failure: DotNet "CameraBarcodeScannerProviderFailure") // Step 5
    begin 
        if failure = failure.Cancel then
            Message('Cancelled');
        exit;

        if failure = failure.NoBarcode then
            Message('NoBarcode');
        exit;

        if failure = failure.Error then
            Message('Error');
        exit;
    end;
}
```

## Scenario 3: Use a barcode event for barcode scanning device

This scenario targets professional hardware devices, typically with laser-based barcode scanners, offering greater flexibility to developers. It only supports hardware barcode scanners, such as Zebra or Datalogic, running Android 11 and above.
It's designed for warehouse employees who scan multiple items in the in a short span of time, evens seconds. It supports scanning any number of items while AL processes the incoming barcodes​. 

When the scanner scans a barcode, the value is sent to the Business Central mobile app and then to AL code. In other words, AL code intercepts an event from an Android device and processes the decoded barcode. Additionally, this scenario supports scanning barcodes and building up a document without interacting with any UI.

Instruct the 




