---
title: "Creating a Printer Extension"
description: Describes how to create an extension that sets up cloud printers. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Creating a Printer Extension

This article describes how to use the  [OnAfterSetupPrinters](devenv-onaftersetupprinters-event.md) and [OnAfterDocumentPrintReady](devenv-onafterdocumentprintready-event.md) events to set up different printers for reports.

## Overview

This article uses a simplified printer extension example for sending reports to an email printer. The example creates a printer extension that sets up a single email printer. Users can then assign the printer to reports from the **Printer Selections** page in the client. In this article, you will:

- Create two codeunits, one that subscribes to the OnAfterSetupPrinters event and another that subscribes to the OnAfterDocumentPrintReady event.
- Use the **SMTP Mail** and **Mail Management** codeunits that are part of the base application for sending the report via email.

<!--
> [!TIP]
> For a detailed email printer extension implementation, refer to the source code for the **Send To Email Printer** extension that included with Business Central.
-->
## Set up printers using the OnAfterSetupPrinters event

This section describes how to use the OnAfterSetupPrinters event to set up a printer. When completed, users can select the printer from on the **Printer Selections** page.

### Getting started 

1. Create an AL project for the printer extension.

    See [Getting Started with AL](devenv-get-started.md).

2. Create a codeunit to use for subscribing to the OnAfterSetupPrinters event.

2. Create a method that subscribes to the OnAfterSetupPrinters event.

    At this point, your code would look something like this:
    
    ```AL
    codeunit 50100 SetupPrinter
    {
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterSetupPrinters', '', true, true)]
        procedure OnSetupPrinters(var Printers: Dictionary of [Text[250], JsonObject]);
        var
            
        begin
            
        end;
    }

    ```

    For more information about subscribing to events, see [Subscribing to Events](devenv-subscribing-to-events.md). 
3. Now you can start adding code to the event subscriber method to create the printer payloads.

    In this example, you set up a printer named 'My Printer' that has two paper trays: A4 and Custom. There are two ways of setting values for a payload JSON object. You can add properties (key-value pairs) by using the Add method, as shown in the example. Or, you can use the ReadFrom method to read the JSON data from the string into a JsonObject variable (see [Using ReadFrom to create the payload](#readfrom)).  

    ```AL
    codeunit 50100 SetupPrinter
    {
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterSetupPrinters', '', true, true)]
        procedure OnSetupPrinters(var Printers: Dictionary of [Text[250], JsonObject]);
        var
            Payload: JsonObject;
            PaperTrays: JsonArray;
            PaperTrayA4: JsonObject;
            PaperTrayCustom: JsonObject;
        begin
            // Step 1: Create the paper trays
            PaperTrayA4.Add('papersourcekind', 'Upper');
            PaperTrayA4.Add('paperkind', 'A4');
    
            PaperTrayCustom.Add('papersourcekind', 'Custom');
            PaperTrayCustom.Add('paperkind', 'Custom');
            PaperTrayCustom.Add('width', 236);
            PaperTrayCustom.Add('height', 322);
            PaperTrayCustom.Add('units', 'mm');
    
            // Step 2: Add the paper trays to the list of paper trays
            PaperTrays.Add(PaperTrayA4);
            PaperTrays.Add(PaperTrayCustom);
    
            // Step 3: Add the required parameters for the payload
            Payload.Add('version', 1);
            Payload.Add('papertrays', PaperTrays);
    
            // Step 4: Add the printer to the dictionary
            Printers.Add('My Printer', Payload);
        end;
    }

    ```
4. At this point, you can compile your project, and publish/install the extension on the tenant to test the payload.

    Open the **Printer Selections** page in the client. You should see **My Printer** as an option in the **Printer Name** field. If there are errors with payload, you'll get an error when you try to open the **Printer Name** field. For more information, see [Troubleshooting Printer Payload Errors](devenv-reports-troubleshoot-printing.md). 

  
### About the printer payload

The event subscriber method has one parameter, which is a dictionary of printers. The key is a name of the printer. The value is a JSON object that is referred to as the payload. The payload specifies information about a specific printer. The payload includes several attributes in the following structure:

```json
{
    "version": 1,
    "description":[default=""],
    "duplex":[default=false],
    "color":[default=false],
    "defaultcopies":[default=1],
    "papertrays":  
    [
        {
            "papersourcekind":'Upper' | 1, 
            "paperkind":'A4' | 9,
            "units":[default='HI'],
            "height":[default=0],
            "width":[default=0],
            "landscape":[default=false]
        }
    ]
}
```

There are few required attributes, such as `version` and `papertrays`. The `papertrays` attribute must contain at least one paper tray setup, which in turn must include the attributes `papersourcekind` and `paperkind`. For more information about the attributes, see [Printer Payload](devenv-onaftersetupprinters-event.md#printpayload).

### <a name="readfrom"></a>Using the ReadFrom method to create the payload

The following example illustrates how to create a payload by using the ReadFrom method.

```AL
codeunit 50101 SetupPrinter2
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterSetupPrinters', '', true, true)]
    procedure SetupPrinters(var Printers: Dictionary of [Text[250], JsonObject]);
    var
        Payload: JsonObject;
    begin
        // Step 1: Read the payload from the text
        Payload.ReadFrom('{"version":1,"papertrays":[{"papersourcekind":"Upper","paperkind":"A4"},{"papersourcekind":"Custom","paperkind":"Custom","width":236,"height":322,"units":"mm"}]}');
 
        // Step 2: Add the printer to the dictionary
        Printers.Add('My Printer', Payload);
    end;
}
```

### Select the paper tray

A printer can have several paper trays. If a report doesn't specify which paper tray to use or the specified paper tray isn't present in the printer's setup, a default paper tray is used. The default paper tray is the first one defined in the `papertrays` list.

You can change the paper tray for an existing report by subscribing to the `OnAfterGetPaperTrayForReport` event and setting a value for a `DefaultPage` parameter.

```AL
[EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterGetPaperTrayForReport', '', true, true)]
procedure GetPaperTrayForReport(ReportID: Integer; var FirstPage: Integer; var DefaultPage: Integer; var LastPage: Integer)
```

As an alternative, if you're creating a new report, you can set a paper tray by specifying PaperSourceDefaultPage property.

```AL
report 50103 MyReport
{
    PaperSourceDefaultPage = Upper;
            ...
}
```
<!--
### Printer Selection page

The following example creates a page that lists printer setups. The page uses the virtual table **Printers** as its source.

```
page 50103 AllPrinters
{
    PageType = List;
    SourceTable = Printer;

    layout
    {
        area(content)
        {
            repeater(Control)
            {
                field(Name; Name)
                {
                }
            }
        }
    }
}
```
-->

<!--
### Troubleshooting and testing printer payloads

If a printer setup is not formatted correctly, a runtime error is shown in the client when the OnAfterSetupPrinters event is raised. The details in the error message will depend on what user action raised the OnAfterSetupPrinters event.

- Opening a page that uses the virtual table **Printer** as its source.

    In this case, you will get an error message that specifically identifies the cause.

- Accessing the **Printer Name** field for selecting a printer for a report on the page **64 Printer Selections** in the base application.
- Selecting **Print** from the request page of a report that is set up to use a specific printer from the **Printer Selections** page.

    For these last two scenarios, the following general error message is shown in the client:
    
    "The data provided by the extension for a printer's setup is invalid. Please contact the developer of the extension for further assistance."

For errors that are related to serializing the payload JsonObject (for example, a required attribute is not provided or a given value exceeds the limits), an error about an incorrectly formatted payload is shown:

"The provided payload for printer 'My Printer' is not formatted correctly. Please update the payload and try again."

More details about the actual error are logged in the telemetry and the event log. So, for example, by using Event Viewer, you can see more information about the cause of the error. For example:

```
Message The provided payload for printer 'My Printer' is not formatted correctly. Details: Required property 'version' not found in JSON.
```

The provided payload for printer 'My Printer' is not formatted correctly.

#### Creating a printer selection page for testing

The payloads are verified when the OnAfterSetupPrinters event gets raised from a page that accesses the **Printers** system table. <!--providing detailed messages about errors with the payloads. Therefore, during development, it can be useful to create a page the uses the **Printers** table as its source.

For example, the following creates a page that lists printer setups.

```
page 50101 MyPrinterList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Printer;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(ID; ID)
                {
                    ApplicationArea = All;

                }

                field(Payload; Payload)
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}
```
-->
## Handle print using the OnAfterDocumentPrintReady event

This section describes how to subscribe to the OnAfterDocumentPrintReady event. You subscribe to the OnAfterDocumentPrintReady event to define what happens when a user chooses to print a report. The event subscriber specifies how and where to send the report.

### Getting started

1. Create a codeunit to use for subscribing to the OnAfterDocumentPrintReady event.
2. Create a method that subscribes to OnAfterDocumentPrintReady event.

    At this point, your code would look something like this:
    
    ```AL
    codeunit 50102 HandlePrintAction
    {
        [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterDocumentPrintReady', '', true, true)]
        procedure OnDocumentPrintReady(ObjectType: Option "Report","Page"; ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean);
        var
            
        begin
            
        end;
    }
    ```

    For more information about subscribing to events, see [Subscribing to Events](devenv-subscribing-to-events.md). 
3. Now you can start adding code to the event subscriber method to handle the report payload and send the report.

    The following code sends a report by email to the printer that is named 'My Printer'. In this example, the printer's email address is 'myprinterb@businesscentral.onmicrosoft.com'.

    <!--
    ```
    codeunit 50102 SendReportByEmail
    {
        [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterDocumentPrintReady', '', true, true)]
        procedure OnDocumentPrintReady(ObjectType: Option "Report","Page"; ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean);
        var
            SMTPMailSetup: Record "SMTP Mail Setup";
            SMTPMail: Codeunit "SMTP Mail";
            Receivers: List of [Text];
            PrinterNameToken: JsonToken;
            PrinterName: Text;
            ObjectNameToken: JsonToken;
            ObjectName: Text;
            DocumentTypeToken: JsonToken;
            DocumentTypeParts: List of [Text];
            FileExtension: Text;
        begin
            // Step 1: Make sure code only runs for reports
            if ObjectType = ObjectType::Report then begin
    
                // Step 2: Get report object payload information
                ObjectPayload.Get('printername', PrinterNameToken);
                PrinterName := PrinterNameToken.AsValue().AsText();
                if PrinterName = 'My Printer' then begin
                    ObjectPayload.Get('objectname', ObjectNameToken);
                    ObjectName := ObjectNameToken.AsValue().AsText();
                    ObjectPayload.Get('documenttype', DocumentTypeToken);
    
                    // Step 3: Build the email message
                    DocumentTypeParts := DocumentTypeToken.AsValue().AsText().Split('/');
                    FileExtension := DocumentTypeParts.Get(DocumentTypeParts.Count);
                    Receivers.Add('Receiver@test.com');
                    SMTPMailSetup.GetSetup;
                    SMTPMail.CreateMessage('Sender', 'Sender@test.com', Receivers, 'Title', 'Message');
                    SMTPMail.AddAttachmentStream(DocumentStream, ObjectName + '.' + FileExtension);
    
                    // Step 4: Send the email for print
                    SMTPMail.Send;
                    Success := true;
                    exit;
                end;
            end;
        end;
    }
    ```
    -->
    ```AL
    codeunit 50101 SendReportByEmail
    {
        [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterDocumentPrintReady', '', true, true)]
        procedure OnDocumentPrintReady(ObjectType: Option "Report","Page"; ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean);
        var
            SMTPMail: Codeunit "SMTP Mail";
            PrinterNameToken: JsonToken;
            PrinterName: Text;
            ObjectNameToken: JsonToken;
            ObjectName: Text;
            DocumentTypeToken: JsonToken;
            DocumentTypeParts: List of [Text];
            FileExtension: Text;
            MailManagement: Codeunit "Mail Management";
            SendFrom: Text;
            FileName: Text;
            Recipients: List of [Text];
        begin
            begin
                // Step 1: Before doing anything, it is important to check the current Success value
                if Success then
                    exit;

                // Step 2: Make sure code only runs for reports
                if ObjectType = ObjectType::Report then begin

                    // Step 3: Get report object payload information
                    ObjectPayload.Get('printername', PrinterNameToken);
                    PrinterName := PrinterNameToken.AsValue().AsText();
                    if PrinterName = 'My Printer' then begin
                        ObjectPayload.Get('objectname', ObjectNameToken);
                        ObjectName := ObjectNameToken.AsValue().AsText();
                        ObjectPayload.Get('documenttype', DocumentTypeToken);

                        // Step 4: Build the email message
                        DocumentTypeParts := DocumentTypeToken.AsValue().AsText().Split('/');
                        FileExtension := DocumentTypeParts.Get(DocumentTypeParts.Count);
                        Recipients.Add('myprinterb@businesscentral.onmicrosoft.com');
                        SendFrom := MailManagement.GetSenderEmailAddress();
                        SMTPMail.CreateMessage('Sender', SendFrom, Recipients, 'Hello this is your report', 'Please take a look');
                        SMTPMail.AddAttachmentStream(DocumentStream, ObjectName + '.' + FileExtension);

                        // Step 5: Send the email for print
                        SMTPMail.Send;
                        Success := true;
                        exit;
                    end;
                end;
            end;
        end;
    }
    ```

4. At this point, you can compile and publish/install the extension on a tenant to test.

    First, make sure that SMTP email is set up on the tenant (see [Set Up Email](/dynamics365/business-central/admin-how-setup-email) in the Application Help).
    
    Then, on the **Printer Selections** page, set a report to use 'My Printer', and then run and print the report.

### About the report payload

The event subscriber receives the printer payload and combines it with the report metadata, like the report's ID. This combination is the report payload. The content of the report itself is received as a stream object. You add code to define how and where to send the report payload for printing. In this example, it's sent as an email.

The report object payload is a JSON object that includes several parameters and values arranged in a specific structure, as shown in the following example
```json
{
    "filterviews":
    [
        {"name":"Header","tableid":112,"view":"VERSION(1) SORTING(Field3) WHERE(Field3=1(103027))"},
        {"name":"Line","tableid":113,"view":"VERSION(1) SORTING(Field3,Field4) WHERE(Field4=1(0..10000))"},
        {"name":"ShipmentLine","tableid":7190,"view":"VERSION(1) SORTING(Field1,Field2,Field3) WHERE(Field2=1(10000))"}
    ],
    "version":1,
    "objectname":"Standard Sales - Invoice",
    "objectid":1306,
    "documenttype":"application/pdf",
    "invokedby":"00000000-0000-0000-0000-000000000001",
    "invokeddatetime":"2020-01-17T15:33:52.48+01:00",
    "companyname":"CRONUS International Ltd.",
    "printername":"My Printer",
    "duplex":false,
    "color":false,
    "defaultcopies":1,
    "papertray":
    {
        "papersourcekind":257,
        "paperkind":0,
        "landscape":false,
        "units":0,
        "height":1268,
        "width":929
    }
}
```

The parameters can be read but not modified at runtime. For more information about the report payload, see [Report Payload](devenv-onafterdocumentprintready-event.md#reportpayload).

## See Also  

[Working With and Troubleshooting Payloads](devenv-reports-troubleshoot-printing.md)  
[Developing Printer Extensions Overview](devenv-reports-printing.md)  
[Events in AL](devenv-events-in-al.md)   
[Publishing Events](devenv-publishing-events.md)   
[Raising Events](devenv-raising-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)  
