---
title: Barcode scanning in mobile app
description: Learn how to add bar code scanning capability to the Business Central mobile app.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: conceptual
ms.collection: get-started
ms.date: 03/27/2024
ms.custom: bap-template 
---

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->

<!--This template provides the basic structure of a concept article. See [Write a concept article](write-a-concept-article.md) in the contributor guide. To provide feedback on this template contact [bace feedback team](mailto:templateswg@microsoft.com).-->

<!--H1 - Required. This should match the title you entered in the metadata. Set expectations for what the content covers, so customers know the content meets their needs. Should NOT begin with a verb.-->

# Adding barcode scanning to the mobile app

> **APPLIES TO:** Business Central 2023 release wave 2 (version 23.0) and later; Business Central mobile app [version 4.0 or later](https://aka.ms/bcmobileapp).

Business Central offers native barcode scanning support in the mobile app and AL language, enabling developers to provide barcode scanning capability to users of the mobile app. Barcode scanning works on supported phones and tablets, either using the device's camera or a dedicated Android barcode scanner device.

## Supported scenarios

There are three different supported scenarios for adding barcode scanning to the mobile. The scenarios have varying levels of complexity. The approach you choose depends design needs, the scanner, and the device's operating system. The following table provides an overview. 

|Scenario|Description|Device camera| Dedicated scanner|iOS device|Android device|Online|On-premises|
|-|-|-|-|-|-|-|-|
|1: UI button on a field|The user scans a barcode by manually selecting a button next to a field|![Shows a checkbox indicating support](media/check.png)||![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)|
|2: Invoke from AL|Based on AL code, the barcode scanning capability is started when something happens, for example, a page opens, or the user selects a custom action on the page. |![Shows a checkbox indicating support](media/check.png)||![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)\*|![Shows a checkbox indicating support](media/check.png)|
|3: Integrate dedicated barcode scanner|Enable the use of professional hardware scanners.||![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)\*|![Shows a checkbox indicating support](media/check.png)|![Shows a checkbox indicating support](media/check.png)\*|![Shows a checkbox indicating support](media/check.png)|

\* Business Central 2024 release wave 1 (v24) and later

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

## Control add-in APIs and .NET-based APIs

Version 24 introduced barcode scanning APIs based on control add-ins​ to replace the .NET-based APIs. The control add-in APIs support scenarios 2 and 3 for both Business Central online and on-premises, unlike the .NET-based APIs that are only for on-premises. You can still use the .NET-based APIs but the control add-in APIs are the recommended way to implement barcode scanning capability going forward.

> [!IMPORTANT]
> With the control add-in APIs, there's no associated UI on the page, meaning no embedded iFrame or visual indicator. Also no scripting or styling functionality is provided.

## Requirements

- The field used for storing scanned barcodes is either [text](methods-auto/text/text-data-type.md) and [code](methods-auto/code/code-data-type.md) data type, which are the only two data types that support barcode scanning.
- Mobile device is using Business Central mobile app version 4.0 or later. To download the latest version, go to [https://aka.ms/bcmobileapp](https://aka.ms/bcmobileapp).
- Dedicated barcode scanners must be running Android 11 or later. 

## Scenario 1: Add a barcode scanning UI button on a field

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

## Scenario 2: Invoke barcode scanning programmatically from AL

### Invoke barcode scanning using control add-in API

The following code example shows how to invoke barcode scanning using the `CameraBarcodeScannerProviderAddIn` control add-in.

```al
page 50100 "Camera Barcode Scanner"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Camera Barcode Scanner Sample';

    layout
    {
        area(Content)
        {
            // Declare the user control based on the CameraBarcodeScannerProviderAddIn control add-in
            usercontrol(BarcodeControl; CameraBarcodeScannerProviderAddIn) // Step 1
            {
                ApplicationArea = All;

                // The ControlAddInReady event is raised when the control add-in is ready to be used. 
                trigger ControlAddInReady(IsSupported: Boolean)
                begin
                    // Set the CameraBarcodeScannerAvailable variable to the value of the IsSupported parameter
                    CameraBarcodeScannerAvailable := IsSupported; // Step 2
                end;

                // The BarcodeAvailable event is raised when a barcode is available.    
                trigger BarcodeAvailable(Barcode: Text; Format: Text)
                begin
                    Message(Barcode);// Step 4

                    // Continious scanning                    
                    // CurrPage.BarcodeControl.RequestBarcodeAsync(); // Step 5
                end;

                // The BarcodeFailure event is raised on a failure
                trigger BarcodeFailure(Reason: Enum BarcodeFailure)
                begin
                    case Reason of
                        Reason::Cancel:
                            Message('Canceled');
                        Reason::NoBarcode:
                            Message('No Barcode');
                        Reason::Error:
                            Message('Error');
                    end;
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ScanBarcode)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    // Request a barcode
                    CurrPage.BarcodeControl.RequestBarcodeAsync(); // Step 3
                end;
            }
        }
    }

    var
        CameraBarcodeScannerAvailable: Boolean;
}
```

[Inspect the CameraBarcodeScannerProviderAddIn API in BCApps GitHub repo](https://github.com/microsoft/BCApps/blob/main/src/System%20Application/App/ControlAddIns/src/CameraBarcodeScannerProviderAddIn.ControlAddIn.al).

### Invoke barcode scanning using .NET-based API (on-premises only)

The basic steps for implementing this scenario are:

1. Define the barcode scanner provider by declaring a `DotNet` variable `Microsoft.Dynamics.Nav.Client.Capabilities.CameraBarcodeScannerProvider`.
1. Verify the barcode scanner provider exists in context of the client. For example, if the user is working in the Business Central web client, this step returns false.  
1. Create the barcode scanner. For example, this step could inside a page action.
1. Call the camera action on the device.
1. Depending on whether the barcode is scanned successfully, call either the `BarcodeAvailable` or `BarcodeFailure` triggers.

This following code shows an example of how to start the barcode scanning when a page opens.

> [!TIP]
> For a detailed implementation as used in the Business Central base application, refer to source code of the **Item Tracking Lines** page (ItemTrackingLines.Page.al).

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

## Scenario 3: Integrate dedicated barcode scanners

This scenario enables the use of professional hardware barcode scanners, like Zebra or Datalogic, with the mobile app. The design is aimed at enhancing the efficiency of users, like warehouse employees, who need to scan many items in the span of a few seconds. While the user scans a series of items, the system processes the incoming barcodes. <!-- offering greater flexibility to developers.--> <!--It supports hardware barcode scanners, such as Zebra or Datalogic, that run on Android 11 and above. -->

A significant benefit of this scenario is that it allows for scanning barcodes and creating documents without the need for user interaction with the UI. When a barcode is scanned, the value is transmitted to the Business Central mobile app and then to the AL code. After AL intercepting an event from the Android device, AL code then processes the decoded barcode.

### Prepare barcode scanners

For barcode scanners to communicate with the Business Central mobile app, they must be configured to emit Android Intent messages for every scanned barcode. By default, the mobile app is programmed to listen for certain types of messages from the barcode scanners. To enable this communication, you need to adjust the scanner's settings according to the values outlined in the following table:

|Scanner setting|Value|
|-|-|
|Intent delivery mode|broadcast intent|
|Intent action |com.businesscentral.barcode.receive_barcode|
|Intent category|com.businesscentral.barcode.receive_category|
|Intent barcode string|com.businesscentral.receive_barcode.barcode_string|
|Intent barcode type|com.businesscentral.receive_barcode.barcode_format|

Consult the manufacturer's guidelines for your specific scanner to learn how to modify these settings. For example, if you're using a Datalogic scanner, you can follow the instructions at [Configuring the Barcode Scanners on Datalogic Terminals To Work With TSL® Mobile Apps](https://www.tsl.com/configuring-datalogic-terminals-to-work-with-tsl-mobile-apps/).
<!-- 

AL developers need to explicitly instruct Business Central app to listen for incoming barcodes. 

the Business Central app listens to these events from the barcode scanner:

private static final String DEFAULT_INTENT_ACTION = "com.businesscentral.barcode.receive_barcode";

private static final String DEFAULT_INTENT_CATEGORY = "com.businesscentral.barcode.receive_category";

private static final String DEFAULT_DATA_STRING = "com.businesscentral.receive_barcode.barcode_string";

private static final String DEFAULT_DATA_FORMAT = "com.businesscentral.receive_barcode.barcode_format"-->

### Add barcode scanner functionality using control add-in API

The following code example shows how to invoke barcode scanning using the `BarcodeScannerProviderAddIn` control add-in.


```al
page 50101 "Barcode Scanner"
{
    PageType = Card;
    ApplicationArea = All;
    Caption = 'Barcode Scanner Sample';

    layout
    {
        area(Content)
        {
            // Declare the user control based on the BarcodeScannerProviderAddIn control add-in.
            usercontrol(BarcodeControl; BarcodeScannerProviderAddIn) // Step 1
            {
                ApplicationArea = All;

                // The ControlAddInReady event is raised when the control add-in is ready to be used. 
                trigger ControlAddInReady(IsSupported: Boolean)
                begin
                    // If the barcode scanner is supported, request the barcode scanner.
                    if IsSupported then // Step 2
                        CurrPage.BarcodeControl.RequestBarcodeScannerAsync(); // Step 3
                end;

                // The BarcodeReceived event is raised when a barcode is received from the barcode scanner.
                trigger BarcodeReceived(Barcode: Text; Format: Text)
                begin
                    Message(Barcode); // Step 4
                end;
            }
        }
    }
}
```

[Inspect the BarcodeScannerProviderAddIn API Inspect in BCApps GitHub repo](https://github.com/microsoft/BCApps/blob/main/src/System%20Application/App/ControlAddIns/src/BarcodeScannerProviderAddIn.ControlAddIn.al).

### Add barcode scanner functionality using .NET-based API (on-premises only)

In AL an extension, you add code that instructs the mobile app to listen for scanned barcodes. Barcode scanning is set up per page, which means that multiple barcode providers can be registered. However, incoming scanned barcodes are always sent to the current page open in the mobile app.​

The basic steps for implementing this scenario are: 

1. Specify the barcode scanner provider by declaring a `DotNet` variable for `Microsoft.Dynamics.Nav.Client.Capabilities.BarcodeScannerProvider`.
1. Verify the barcode scanner provider exists in context of the client using the `BarcodeScannerProvider.IsAvailable` method. For example, if the user is working in the Business Central web client, this step returns false.  
1. Create the barcode scanner using the `BarcodeScannerProvider.Create()` method. For example, this step could be called from a page action.
1. Instruct the app to listen for barcodes using the `BarcodeScannerProvider.RequestBarcodeScannerAsync()` method.

```al
page 50105 "BarcodeScannerReceiver"
{
    Caption = 'BarcodeScannerReceiver';
    PageType = List;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
            }
        }
    }

    var
        [RunOnClient]
        [WithEvents]
        BarcodeScannerProvider: DotNet BarcodeScannerProvider; //Step 1

    trigger OnOpenPage()
    begin
        if not BarcodeScannerProvider.IsAvailable then begin // Step 2
            Message('BarcodeScannerProvider Not Available');
            exit;
        end;

        BarcodeScannerProvider := BarcodeScannerProvider.Create(); // Step 3
        BarcodeScannerProvider.RequestBarcodeScannerAsync(); // Step 4
    end;

    trigger BarcodeScannerProvider::BarcodeReceived(Barcode: Text; Format: Text) // Result
    begin
        Message(Barcode);
        exit;
    end;

}
```
