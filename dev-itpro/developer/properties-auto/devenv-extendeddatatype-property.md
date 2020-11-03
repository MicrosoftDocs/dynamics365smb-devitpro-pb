---
title: "ExtendedDatatype Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExtendedDatatype Property
Sets the extended data type of a control.

## Applies to
-   Field
-   Page Field

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|None|TODO:Add documentation|
|PhoneNo|TODO:Add documentation|
|URL|TODO:Add documentation|
|EMail|TODO:Add documentation|
|Ratio|TODO:Add documentation|
|Masked|TODO:Add documentation|
|Person|TODO:Add documentation|
|RichText|RichText is for for formatting, like Bold and Italics|
|RichContent|RichContent is text containing things like: links, lists, bold text or italic text.|
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