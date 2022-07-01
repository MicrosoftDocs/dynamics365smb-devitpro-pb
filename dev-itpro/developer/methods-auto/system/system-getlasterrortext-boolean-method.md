---
title: "System.GetLastErrorText(Boolean) Method"
description: "Gets the last error that occurred in the debugger."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.GetLastErrorText(Boolean) Method
> **Version**: _Available or changed with runtime version 7.0._

Gets the last error that occurred in the debugger.


## Syntax
```AL
String :=   System.GetLastErrorText(ExcludeCustomerContent: Boolean)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*ExcludeCustomerContent*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Exclude sensitive data, such as primary key values, from the error message.  


## Return Value
*String*  
&emsp;Type: [Text](../text/text-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you call the GetLastErrorText method immediately after you call the ClearLastError method, then an empty string is returned.  

The result of the [GetLastErrorCode Method](../../methods-auto/system/system-getlasterrorcode-method.md) is not translated into the local language. The result of the GetLastErrorText method is translated into the local language.  

## See Also
[System Data Type](system-data-type.md)
[Get Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)