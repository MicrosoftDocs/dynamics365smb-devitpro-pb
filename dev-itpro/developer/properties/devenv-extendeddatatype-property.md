---
title: "ExtendedDataType Property"
description: This topic describes the ExtendedDataType property options.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 05/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: eeccbef1-5908-4b08-b61d-3ddb1553c1dd
caps.latest.revision: 12
author: SusanneWindfeldPedersen
---

 

# ExtendedDataType Property
Sets the extended data type of a control.  
  
## Applies To  
  
-   Page Fields  
  
-   Table Fields  
  
## Remarks  
 The value of this property overrides the value of the table field and it converts a text field into the selected extended data type. 
   
 The property affects the layout and behavior of controls on a page. Use it to add an icon next to an input field to indicate whether the field relates to a telephone number, email address, or URL. This property applies validation to the field.

 Extended datatypes can only be used on specific field types according to the following table:

|Extended Data Type|Valid Field Types|Description|  
|-----|-----|----|
|None|Any|No conversion is applied.|
|Phone No.|Text, Code|When the field type is interpreted as a phone number, the client will show dial actions.|
|URL|Text, Code|When the field type is interpreted as a URL the text will be handled as a hyperlink. Pressing the hyperlink will open the URL using the systems default browser application.|
|Email|Text, Code|The text will be handled as a hyperlink and use the standard mail handler for actions.|
|Ratio|Integer, BigInteger, Decimal|The text is handled as a progress bar.|
|Masked|Any|Displays the value as dots. This will only have effect on fields, where the user can enter and display textual data (including numbers, time, date etc.)|
|Person|Media, MediaSet|This will show a customization of image rendering following the client’s person related style. The default is to show the person’s thumbnail picture in a circle.|
|Resource|Text, Code|The client will use the field content as a bitmap resource name from which it will load a brick icon.|

## See Also  
 [Properties](devenv-properties.md)