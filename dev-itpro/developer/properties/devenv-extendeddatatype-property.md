---
title: "ExtendedDataType Property"
description: This topic describes the ExtendedDataType property options.
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# ExtendedDataType Property
Sets the extended data type of a field.  
  
## Applies To  
  
- Page Fields  
  
- Table Fields  

## Syntax
```
ExtendedDatatype = EMail;
```
 
## Remarks  
The property affects the layout and behavior of controls on a page. Use this, for example, to display a field as an email address.

By applying special meaning or semantics to a field, the value of the table field is converted to a text field of the new data type that may apply special validation, a different way of displaying the value or interacting with the field.

The value of this property on a page control overrides the same property on a table field.

Extended data types can only be used on specific field types according to the following table:

|Extended Data Type|Valid Field Types|Description|  
|------------------|-----------------|-----------|
|None              |Any              |Default value. No conversion is applied.|
|Phone No.         |Text, Code       |The client handles the field as a phone number and will display this as hyperlinked whenever the field is not editable. Activating the hyperlink will launch the default dialing app on your device.|
|URL               |Text, Code       |The client handles the field as a URL and the text will be displayed as hyperlinked whenever the field is not editable. Activating the hyperlink will open the URL using the default browser on your device.|
|Email             |Text, Code       |The client handles the field as an email address and will display this as hyperlinked whenever the field is not editable. Activating the hyperlink will launch the default mail app on your device.|
|Ratio             |Integer, BigInteger, Decimal|The text is handled as a progress bar. This is not supported on the Web client.|
|Masked            |Any|Displays the value as dots. This will only have effect on fields, where the user can enter and display textual data (including numbers, time, date etc.)|
|Person            |Media, MediaSet  |The client handles the field as media representing a person and will display this in the signature rounded styling. When the media field is empty, a silhouette of a person is shown.|
|Resource          |Text, Code|The client will use the field content as a bitmap resource name from which it will load a brick icon.|

## See Also  
 [Properties](devenv-properties.md)