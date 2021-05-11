---
title: "Dialog.Error Method"
description: "Displays an error message and ends the execution of AL code."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Dialog.Error Method
> **Version**: _Available or changed with runtime version 1.0._

Displays an error message and ends the execution of AL code.


## Syntax
```
 Dialog.Error(Message: String [, Value: Any,...])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Message*  
&emsp;Type: [String](../string/string-data-type.md)  
This string contains the text of the error message you want to display to the user. Use percent signs (%) or number signs (#) to insert variable values into the string. Place the percent or number signs where you want to substitute the variable value. The string can be a text constant that is enabled for multilanguage functionality.
        
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Any variable or expression to be inserted in String. You can insert up to 10 values. For '#'-type fields, the value is truncated according to the total number of number-sign characters in String. For '%'-type fields, the full length of the value is printed.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)