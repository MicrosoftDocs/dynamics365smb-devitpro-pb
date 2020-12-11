---
title: "Printing Reports"
description: Dynamics 365 Business Central supports different types of events including BusinessEvent, IntegrationEvent, Global and trigger events. 
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Handling the Print Action by Using OnAfterDocumentPrintReady Event

This article describes how to use the OnAfterSetupPrinters event to specify what happens when a user selects the Print action on a report. This article uses a simplified printer driver example for sending reports to an email printer. For a detailed email printer driver implementation, refer to the source code for the **Send To Email Printer** extension that included with Business Central.  

## Get Started

1. Create a codeunit to use for subscribing to the event.
2. Create a method that subscribes to OnAfterDocumentPrintReady event.

    At this point, your code should look something like this:
    
    ```
    codeunit 50102 HandlePrintAction
    {
        [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterDocumentPrintReady', '', true, true)]
        procedure OnDocumentPrintReady(ObjectType: Option "Report","Page"; ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean);
            var
                
            begin
                
            end;
    }
    ```

    For more information about subscribing to events, see[Subscribing to Events](devenv-subscribing-to-events.md). 
3. Now you can start adding code to the event subscriber method to handle report payload

## Add code to handle the print action

The event subscriber is passed the printer payload and combines it with report metadata, such as the ID to create the report payload. The content of the report itself is received as a stream object. You add code to define how and where to send the report payload for printing. In this example, it is sent as an email.

### About the object payload

The report object payload is a JSON object that includes several parameters and values arranged in a specific structure, as shown in the following example
```
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

The parameters can be read but not modified at runtime. For more information about the report payload, see [Report Payload Structure](devenv-onafterdocumentprintready-event.md#reportpayload).

### Adding code to handle the report object payload

The following codeunit sends a report by email to a printer when a user chooses **Print** from the request page of a report. This requires that the report has been assigned the printer on **Printer Selections** page.

```
codeunit 50109 SendReportByEmail
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

## See Also 

[Events in AL](devenv-events-in-al.md)  
[Publishing Events](devenv-publishing-events.md)  
[Raising Events](devenv-raising-events.md)  
[Subscribing to Events](devenv-subscribing-to-events.md)  
