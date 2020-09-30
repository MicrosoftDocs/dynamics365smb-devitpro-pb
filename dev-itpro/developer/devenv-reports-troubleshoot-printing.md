---
title: "Troubleshooting Printing"
description: Dynamics 365 Business Central supports different types of events including BusinessEvent, IntegrationEvent, Global, and trigger events. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Working with and Troubleshooting Payloads

This article provides some tips and tricks for working with and troubleshooting the printer and report payloads.

## Troubleshooting printer payload errors

If a printer payload isn't valid, a runtime error occurs in the client when the OnAfterSetupPrinters event is raised. The details in the error message will depend on what action raised the OnAfterSetupPrinters event.

- If the error occurs from the **Printer Selections** page or the report request page, the following general error message appears:

    'The data provided by the extension for a printer's setup is invalid. Please contact the developer of the extension for further assistance.'

- If the error occurs when opening a page that uses the virtual table **Printer** as its source, then a more detailed message displays, depending on the cause.

Refer to the [Printer Payload](devenv-onaftersetupprinters-event.md#printpayload) to see the possible error messages and to help you identify and resolve these issues.

### Getting more information from the Windows Event Log

If you're running [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, you can use the Windows Event log get more information about printer payload issues than what appears in the client. With errors related to an incorrect payload format, a warning is also recorded in the Windows Event Log of the computer running the [!INCLUDE[server](../developer/includes/server.md)]. This warning provides more details than what is shown in the client. For example, let's say the client displays the following message:

'The provided payload for printer '{0}' isn't formatted correctly. Please update the payload and try again.'

Using event By Event Viewer, you would see a message like the following message:

```
Message The provided payload for printer '{0}' isn't formatted correctly. Details: Required property 'version' not found in JSON.
```

### Creating a printer selection page for testing

When a page that uses the **Printers** system table opens, the system raises the OnAfterSetupPrinters event the **Printers** system table. During development, it can be useful to create a page the uses this table as its source. Once you have the page, you can run it to quickly verify the printer payloads.

For example, the following code snippet creates a page that lists extension printer setups.

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

## Unpacking detailed views of the report payload

You might want to look at the views that are in the report payload. The following code snippet unpacks the views that are in a report payload into a message:

```
procedure DisplayFilterView(ObjectPayload: JsonObject) 
var 
    ViewSize: Integer; 
    i: Integer; 
    DataItemViews: JsonToken; 
    ViewToken: JsonToken; 
    ViewTableId: JsonToken; 
    ViewName: JsonToken; 
    ViewValue: JsonToken; 
begin 
    ObjectPayload.Get('filterviews', DataItemViews); 
        ViewSize := DataItemViews.AsArray().Count; 

        for i := 0 to (ViewSize - 1) do begin 
            DataItemViews.AsArray().Get(i, ViewToken); 
            ViewToken.AsObject().Get('name', ViewName); 
            ViewToken.AsObject().Get('tableid', ViewTableId); 
            ViewToken.AsObject().Get('view', ViewValue); 
            Message('Name = %1, tableid = %2, Value = %3', ViewName.AsValue().AsText(), ViewTableId.AsValue().AsText(), ViewValue.AsValue().AsText()); 
        end; 
end; 
```

## See Also  

[Developing Printer Extensions](devenv-reports-printing.md)  
[Create a Printer Extension](devenv-reports-create-printer-extension.md)  
[OnAfterDocumentPrintReady](devenv-onafterdocumentprintready-event.md)  
[OnAfterSetupPrinters](devenv-onaftersetupprinters-event.md)  