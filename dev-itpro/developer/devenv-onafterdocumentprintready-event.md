---
title: "OnAfterDocumentPrintReady Event"
description: Describe the OnAfterDocumentPrintReady Event in Business Central.  
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# OnAfterDocumentPrintReady Event

This article describes the syntax of the OnAfterDocumentPrintReady event and the attributes of the report payload.

## Usage

Use the OnAfterDocumentSetupPrinters event to specify what happens when the user selects the **Print** action on a report request page. The `OnAfterDocumentPrintReady` event is used to send a report to a target extension printer. For more information about subscribing to this event, see [Developing Printer Extensions Overview](devenv-reports-printing.md). 

## Publisher

Codeunit **44 ReportManagement**.

## Raised

When a user selects the print action on a report request page

## Syntax

```
IntegrationEvent(false, false)]
local procedure OnAfterDocumentPrintReady(ObjectType: Option "Report","Page"; ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean);
```

## Parameters

*ObjectType*

Type: [Enum](methods-auto/enum/enum-data-type.md)

The object to run. Currently only `report` is supported. 

*ObjectID*

Type: [Integer](methods-auto/integer/integer-data-type.md)

The ID of the report object to be run.

*ObjectPayload*

Type: [JsonObject](methods-auto/jsonobject/jsonobject-data-type.md)

Instance of the report payload. For more information, see [Report payload structure](#reportpayload).

*DocumentStream*

Type: [InStream](methods-auto/instream/instream-data-type.md)

A stream object that contains a .pdf file of the report to be printed.

*Success*

Type: [Boolean](methods-auto/boolean/boolean-data-type.md)

Specifies whether the extension handled the print action successfully.

## <a name="reportpayload"></a>Report payload

The report payload is a combination of data from the printer payload and the report object. The payload consists of several attributes and has the following structure.

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

<!--
{
    "filterviews": 
    [ 
        { 
            "name":"[DATA_ITEM_NAME]", 
            "tableid":"[TABLE_ID]", 
            "view":"[FILTER_VIEW]" 
        } 
    ],
    "version":1,   
    "objectname":"[OBJECT_NAME]", 
    "objectid":[REPORT_ID], 
    "documenttype":"[MIME_TYPE]", 
    "invokedby":"[SESSION_USER_ID]", 
    "invokeddatetime":"[CLENT_LOCAL_DATETIME]", // for example, "2019-10-22T22:25:54.338+02:00"
    "printername":"My Printer", 
    "companyname":"[COMPANY_NAME]", 
    "duplex":[default=false], 
    "color":[default=false], 
    "defaultcopies":[default=1], 
    "papertray": 
       { 
            "papersourcekind":"Upper" | 1, 
            "paperkind":"A4" | 9,
            "landscape":[default=false] 
            "units":[default="HI"], 
            "height":[default=0], 
            "width":[default=0]
        } 
} 
 
```
-->
### Attributes

*objectname*

Specifies the name of the object.

*objectid*

Specifies the ID of the object.

*documenttype*

Specifies the MIME type of the document. Currently only `application/pdf` is supported. 

*documeninvokedby*

Specifies the ID of the user who invoked the print action.  

*invokeddatetime*

Specifies the date and time that the print action was invoked, for example, 2019-10-22T22:25:54.338+02:00. The value is the date and time on the client machine.  

*companyname*

Specifies the Business Central company.

*version*

Specifies the version of the printer setup in the payload. Currently, the only supported version for the payload is `1`.

*duplex*

Specifies whether to use duplex (2-sided) printing. `true` specifies duplex printing; otherwise `false`.

> [!NOTE]
>  `duplex` is currently not used and ignored at runtime.

*color*

Specifies whether color printing is set.  `true` specifies color printing; otherwise `false`. 

> [!NOTE]
> `color` is currently not used and ignored at runtime.


*defaultcopies*

Specifies the number of copies to print by default. The default is `1`.

> [!NOTE]
>  `defaultcopies` is currently not used and ignored at runtime.

*filterviews*

Specifies views that are used on the document.

*name*

Specifies the name of data item that the filter view applies to.

*tableid*

Specifies ID of the table for the view.

*view*

Specifies the name of the view.

*papertray*

Specifies the paper tray settings from the [printer payload](devenv-onaftersetupprinters-event.md#printpayload).

*papersourcekind*

Specifies a standard paper source for the paper tray. The value can be either the text representation (such as `AutomaticFeed`) or the corresponding number (such as `7`).

*paperkind*

Specifies the paper size. The value can be either the text representation (such as `A4`) or the corresponding number (such as `9`).

*landscape*

Specifies whether landscape orientation is used. `true` specifies landscape orientation; otherwise `false`.

*units*

Specifies the units of measurement for values in  `height` and `width` attributes. Valid values include:

- `HI` for hundredths of an inch (default value).
- `TI` for thousandths of an inch.
- `IN` for inches.
- `CM` for centimeters.
- `MM` for millimeters.
- `PC` for picas.
- `PT` for points.

*height*

Specifies the height of the paper. The values include positive integers up to 2,147,483,647.

*width*

Specifies the width of the paper. The values include positive integers up to 2,147,483,647.

  
## See Also

[Working With and Troubleshooting Payloads](devenv-reports-troubleshoot-printing.md)  
[Developing Printer Extensions Overview](devenv-reports-printing.md)  
[Creating a Printer Extension](devenv-reports-create-printer-extension.md)  
[Events in AL](devenv-events-in-al.md)   
[Publishing Events](devenv-publishing-events.md)   
[Raising Events](devenv-raising-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)  