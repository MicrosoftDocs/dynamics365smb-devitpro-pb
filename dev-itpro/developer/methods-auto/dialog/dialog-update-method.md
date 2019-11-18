---
title: "Update Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2019
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
# Update Method
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



## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)