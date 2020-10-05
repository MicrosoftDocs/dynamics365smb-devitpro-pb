---
title: "OnAfterSetupPrinters Event"
description: Describe the OnAfterSetupPrinters Event in Business Central. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# OnAfterSetupPrinters Event

This article describes the OnAfterSetupPrinters event and the structure of the printer payload.

## Usage

Use the OnAfterSetupPrinters event to set up different printers that users can use to print reports. Users can set which printer to use on the **Printer Selections** page. By subscribing to this event, you create payloads for different printers. A payload specifies settings such as paper sizes, paper trays, and more. For more information about subscribing to this event, see [Developing Printer Extensions Overview](devenv-reports-printing.md).

## Publisher

Codeunit **44 ReportManagement**.

## Raised

The OnAfterSetupPrinters event is raised when you:

- Open a page that uses the virtual table **Printer** as its source is opened in the client.
- Select the lookup on the **Printer Name** field in page **64 Printer Selections**. This field is used for selecting a printer to use on a report.
- Select the **Print** or **Preview** action on the request page of a report that is set up to use a specific printer from the **Printer Selections** page.

## Syntax

<!--
```
[EventSubscriber(ObjectType::Codeunit, Codeunit::"ReportManagement", 'OnAfterSetupPrinters', '', true, true)]
procedure SetupPrinters(var Printers: Dictionary of [Text[250], JsonObject]);
```
-->
```
[IntegrationEvent(false, false)]
local procedure OnAfterSetupPrinters(var Printers: Dictionary of [Text[250], JsonObject]);
```

## Parameters

*Printers*

The *Printers* parameter is a [Dictionary of [Text, Text]](methods-auto/dictionary/dictionary-data-type.md) type. It includes a collection of key-value pairs that define different printer setups. The key specifies a name for the printer. The value is a JSON object that specifies various settings supported by the printer. The settings include information like the paper size, paper trays, default number of copies, and more. The JSON object is referred to as the *payload*.

## <a name="printpayload"></a>Printer payload

The payload consists of several attributes that are arranged in the following structure.

```json
{
    "version":,
    "description":,
    "duplex":,
    "color":,
    "defaultcopies":,
    "papertrays":  
    [
        {
            "papersourcekind":,
            "paperkind":,
            "units":,
            "height":,
            "width":,
            "landscape":
        }
    ]
}
```

- The `version` and `papertrays` attributes are mandatory.
- The `papertrays` attribute must contain at least one paper tray setup.
- Each individual paper tray setup is defined within brackets `{ }` and must include the attributes `papersourcekind` and `paperkind`.

Given this information, the minimum payload looks like this:

```json
{
    "version":1,
    "papertrays": 
    [
        {
            "papersourcekind":"Upper", 
            "paperkind":"A4"
        }
    ]
}
```

If the required attributes aren't provided, a general error similar to the following error occurs at runtime:

"The provided payload for printer 'My Printer' is not formatted correctly. Please update the payload and try again."

### Attributes

*version*

Currently, the only supported version for the payload is `1`. If the value is less than or greater than 1, an invalid payload version error like the following error is shown: 

"The payload version '2' is not valid for the printer 'My Printer'. The version must be a positive number not greater than 1. Please change the version and try again."

*description*

Specifies an alternative or friendly name for the printer. The value can include 250 characters. If the value is greater than 250, an invalid payload version error like the following error is shown:

"The description of the printer 'My Printer' exceeds the limit of 250 characters (current length: 300 characters). Please change the description and try again."

*duplex*

Specifies whether the printer supports duplex (double-sided) printing. `true` specifies that the printer supports duplex printing; `false` specifies that it doesn't.

> [!NOTE]
> `duplex` is currently not used and ignored at runtime.

*color attribute*

Specifies whether the printer supports color printing. `true` specifies that the printer supports color printing; `false` specifies that it doesn't.

> [!NOTE]
> `color` is currently not used and ignored at runtime. 

*defaultcopies*

Specifies the number of copies to print by default. The value must be a non-negative integer that isn't greater than 32767.

> [!NOTE]
> `defaultcopies` is currently not used and ignored at runtime.

If the value exceeds 32767, an error like the following error is shown:

"The provided payload for printer 'My Printer' is not formatted correctly. Please update the payload and try again."

If the value is less than 0, an error like the following error is shown:

"The value for the default copies parameter for the printer 'My Printer' must be a positive number. Please update the parameter and try again."

*papertrays*

Specifies a setup for one or more paper trays that the printer has. Each paper tray setup is defined within a set of brackets `{ }` and separated by a comma. A paper tray setup must contain a `papersourcekind` and `paperkind` attribute. Other attributes are optional.

There can be a maximum of 14 paper trays. The first defined paper tray in the list will be considered as the default paper tray.

If the `papertray` attribute is empty, an error like the following error occurs:

"The provided payload for printer 'My Printer' is not formatted correctly. Please update the payload and try again."

*papersourcekind*

Specifies a standard paper source for the paper tray. You can set the value to any of the 14 paper sources that are supported by .NET Framework. You can see the supported paper sources at [PaperSourceKind Enum](https://docs.microsoft.com/dotnet/api/system.drawing.printing.papersourcekind). You can either use the text representation (such as `AutomaticFeed` or the corresponding number (such as `7`).

The `papersourcekind` must be unique within the paper trays, meaning it cannot be used more than once in the list. If values for `papersourcekind` are not unique, an error like the following error occurs: 

"The printer 'My Printer' already has the paper source kind 'Upper'. Please change the paper source kind and try again."

*paperkind*

Specifies the paper sizes supported by the printer. You set the value to any standard paper kind that .NET Framework supports. You can see the supported paper kinds at [PaperKind Enum](https://docs.microsoft.com/dotnet/api/system.drawing.printing.paperkind). You can either use the text representation (such as `A4`) or the corresponding number (such as `9`).

If you use any value other than `Custom` or `0`, the system will automatically take care of the `height`, `width`, and `units` attributes. For example, if you specified that `paperkind` is `A4`, then the paper dimensions are 210 mm by 297 mm. In this case, if you provide values for the `height`, `width`, and `units` attributes, the values will be ignored.

If `paperkind` is set to `Custom` or `0`, then paper size is defined by the user in the client. However, you must provide proper values for `height` and `width` attributes; otherwise an error will occur. The values are used as the default values for the custom size. So if you don't set an attribute, then 0 is used, which isn't valid. Additionally, if the `paperkind` is `Custom` or `0`, you can also specify `units`attribute.

*units*

Specifies the units of measurement for values in `height` and `width` attributes. Valid values include:

- `HI` for hundredths of an inch. This value is the default value.
- `TI` for thousandths of an inch.
- `IN` for inches.
- `CM` for centimeters.
- `MM` for millimeters.
- `PC` for picas.
- `PT` for points.

If you provide a unit that isn't valid, the following error is shown:

"The provided payload for printer 'My Printer' is not formatted correctly. Please update the payload and try again."

*height* and *width*

Specifies the dimensions of the paper. Set these attributes only when the `paperkind` is set to `Custom`.

Valid values include positive integers up to 2147483647. If the provided value exceeds the limit, an error like the following error occurs:

"The provided payload for printer 'My Printer' is not formatted correctly. Please update the payload and try again."

If the value is less than 1, an error like the following error occurs:

"The paper 'height' must be a positive number (paper kind = 'Custom', paper source kind = 'Custom', printer = 'My Printer'). Please update the 'height' parameter and try again."

*landscape*

Specifies whether landscape orientation is supported. `true` specifies landscape orientation is supported; otherwise `false`.

## See Also

[Working With and Troubleshooting Payloads](devenv-reports-troubleshoot-printing.md)  
[Developing Printer Extensions Overview](devenv-reports-printing.md)  
[Creating a Printer Extension](devenv-reports-create-printer-extension.md)  
[Events in AL](devenv-events-in-al.md)   
[Publishing Events](devenv-publishing-events.md)   
[Raising Events](devenv-raising-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)  