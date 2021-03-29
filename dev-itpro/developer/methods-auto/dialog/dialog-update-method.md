---
title: "Dialog.Update Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# Dialog.Update Method
> **Version**: _Available or changed with runtime version 1.0._

Updates the value of a '#'-or '@' field in the active window.


## Syntax
```
 Dialog.Update([Number: Integer] [, Value: Any])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Dialog*
&emsp;Type: [Dialog](dialog-data-type.md)
An instance of the [Dialog](dialog-data-type.md) data type.

*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Each '#' or '@' field has a specific number. The Number argument tells into which field the Value should be inserted. If you omit this parameter, then all '#' or '@' fields in the active window are updated.
        
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
This value or expression can be any simple AL data type such as Boolean, Option, Integer, Decimal, Date, Time, Text, and Code. If you omit this value, then the value from the variable in the OPEN method (Dialog)] call is used.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
  
Dialog windows that are opened by an object are closed when the object terminates.  
  
Dialog windows are automatically sized to hold the longest line of text and the total number of lines.  
  
We recommend the following guidelines:  
  
- Enter messages as text constants.  
  
- Write messages using active voice. For example, write “Processing items” instead of writing “Items are being processed.”  
  
- Align the \# field to the left with at least one space character between the text and the variable.

> [!NOTE]  
> With the [!INCLUDE[nav_windows_md](../../includes/nav_windows_md.md)], you can use @ characters instead of # characters for the *String* parameter to display the value as percentage and a progress indicator. The percentage value that is displayed is the percentage of the variable value from 0 to 9999. This is not supported in the [!INCLUDE[webclient](../../includes/webclient.md)].  

## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)