---
title: "System.GetLastErrorText Method"
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
# System.GetLastErrorText Method
> **Version**: _Available or changed with runtime version 7.0._

Gets the last error that occurred in the debugger.


## Syntax
```
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
&emsp;Type: [String](../string/string-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)  