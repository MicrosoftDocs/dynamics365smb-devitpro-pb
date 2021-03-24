---
title: "ExtendedDatatype Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExtendedDatatype Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the extended data type of a control.

## Applies to
-   Table Field
-   Page Field

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**None**|Default value. No conversion is applied.|
|**PhoneNo**|The client handles the field as a phone number and will display this as hyperlinked whenever the field is not editable. Activating the hyperlink will launch the default dialing app on your device.|
|**URL**|The client handles the field as a URL and the text will be displayed as hyperlinked whenever the field is not editable. Activating the hyperlink will open the URL using the default browser on your device.|
|**EMail**|The client handles the field as an email address and will display this as hyperlinked whenever the field is not editable. Activating the hyperlink will launch the default mail app on your device.|
|**Ratio**|The text is handled as a progress bar. This is not supported on the Web client.|
|**Masked**|Displays the value as dots. This will only have effect on fields, where the user can enter and display textual data (including numbers, time, date etc.)|
|**Person**|The client handles the field as media representing a person and will display this in the signature rounded styling. When the media field is empty, a silhouette of a person is shown.|
|**RichText**|RichText is for for formatting, like Bold and Italics|
|**RichContent**|RichContent is text containing things like: links, lists, bold text or italic text.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
ExtendedDatatype = EMail;
```
 
## Remarks

The property affects the layout and behavior of controls on a page. Use this, for example, to display a field as an email address.

By applying special meaning or semantics to a field, the value of the table field is converted to a text field of the new data type that may apply special validation, a different way of displaying the value or interacting with the field.

The value of this property on a page control overrides the same property on a table field.

## See Also

[Properties](devenv-properties.md)