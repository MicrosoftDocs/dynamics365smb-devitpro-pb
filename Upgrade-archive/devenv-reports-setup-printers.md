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
# Setting Up Printers by Using the OnAfterSetupPrinters event

This article describes how to use the OnAfterSetupPrinters event to set up different printers that users can select from for printing reports.

## Get Started

1. Create a codeunit to use for subscribing to the event
2. Create a method that subscribes to OnAfterSetupPrinters event.

    At this point, your code would look something like this:
    
    ```
    codeunit 50100 SetupPrinter
    {
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterSetupPrinters', '', true, true)]
        procedure SetupPrinters(var Printers: Dictionary of [Text[250], JsonObject]);
            var
                
            begin
                
            end;
    }

    ```

    For more information about subscribing to events, see[Subscribing to Events](devenv-subscribing-to-events.md). 
3. Now you can start adding code to the event subscriber method to create the printer payloads.

## Create the printer payload

The event subscriber method has one parameter which is a dictionary of printers. The key is a name of the printer. The value is a JSON object, called the payload. The payload specifies information about a specific printer. The payload includes several attributes in the following structure:

```
{
    "version":[default=0],
    "description":,
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

<!--
The `version` and `papertrays` attributes are mandatory. The `papertrays` attribute must contain at least one paper tray setup, which in turn must include the attributes `papersourcekind` and `paperkind`. -->

For more details about the attributes, see [Payload Structure](devenv-onaftersetupprinters-event.md#printpayload).

There are two ways of setting values for a payload JSON object. You can either add properties (key-value pairs) by using the Add method or by using the ReadFrom method to read the JSON data from the string into a JsonObject variable.

### Using the Add method

The following example illustrates how to create a payload by using the Add method. This example sets up a printer named My Printer with two paper trays: A4 and Custom.

```
codeunit 50100 SetupPrinter
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterSetupPrinters', '', true, true)]
    procedure SetupPrinters(var Printers: Dictionary of [Text[250], JsonObject]);
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
        Payload.Add('defaultcopies', 2);
        Payload.Add('papertrays', PaperTrays);

        // Step 4: Add the printer to the dictionary
        Printers.Add('My Printer', Payload);
    end;
}
```

### Using the ReadFrom method

The following example illustrates how to create a payload by using the ReadFrom method.

```
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

### Mains points about the payload

- Required attributes for a printer include:
    - `version` (currently, the only supported value is 1)
    - `papertrays`
- There must be at least one paper tray
- Required attributes for a paper tray include:
    - `papersourcekind`
    - `paperkind`
- There cannot be more than one `papersourcekind` with the same value in a paper tray
- The first paper tray defined in the `papertrays` list is the default paper tray
- If the `paperkind` attribute is set to `Custom`or `0`, the `width` and `height` attributes are required.

## Select the paper tray

If a printer has several paper trays and a report does not specify which paper tray to use or the specified paper tray is not present in the printer’s setup, then a default paper tray is used. The default paper tray is the first one defined in the list.

A paper tray for an already existing report can be changed by subscribing to the event GetPaperTrayForReport and setting a value for a DefaultPage parameter.

```
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'GetPaperTrayForReport', '', true, true)]
procedure GetPaperTrayForReport(ReportID: Integer; var FirstPage: Integer; var DefaultPage: Integer; var LastPage: Integer)
```

Alternatively, if you are creating a new report, you can set a paper tray by specifying PaperSourceDefaultPage property.

```
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

## Troubleshooting Pinter Setup Payload Errors

If a printer setup is not formatted correctly, a runtime error is shown in the client when the OnAfterSetupPrinters event is raised. The details in the error message will depend on what user action raised the OnAfterSetupPrinters event.

- Opening a page that uses the virtual table **Printer** as its source.

    In this case, you will get an error message that specifically identifies the cause.

- Accessing the **Printer Name** field for selecting a printer for a report on the page **64 Printer Selections** in the base application.
- Selecting **Print** from the request page of a report that is set up to use a specific printer from the **Printer Selections** page.

    For these last two scenarios, the following general error message is shown in the client:
    
    "The data provided by the extension for a printer's setup is invalid. Please contact the developer of the extension for further assistance."

For errors that are related to serializing the payload JsonObject (for example, a required attribute is not provided or a given value exceeds the limits), an error about an incorrectly formatted payload is shown:

"The provided payload for printer '{0}' is not formatted correctly. Please update the payload and try again."

More details about the actual error are logged in the telemetry and the event log. So, for example, by using Event Viewer, you can see more information about the cause of the error. For example:

```
Message The provided payload for printer '{0}' is not formatted correctly. Details: Required property 'version' not found in JSON.
```

The provided payload for printer '{0}' is not formatted correctly.

### Creating a printer selection page for testing

The payloads are verified when the OnAfterSetupPrinters event gets raised from a page that accesses the **Printers** system table, providing detailed messages about errors with the payloads. Therefore, during development, it can be useful to create a page the uses the **Printers** table as its source. This enables you to quickly run the page to verify the payloads. 

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

## See Also  

[Troubleshooting Email Printing](devenv-report-troubleshooting-printing.md)  
 [Events in AL](devenv-events-in-al.md)   
 [Publishing Events](devenv-publishing-events.md)   
 [Raising Events](devenv-raising-events.md)   
 [Subscribing to Events](devenv-subscribing-to-events.md)  