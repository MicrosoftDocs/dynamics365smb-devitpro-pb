---
title: "System.GetCollectedErrors([Boolean]) Method"
description: "Gets all collected errors in the current collection scope."
ms.author: solsen
ms.custom: na
ms.date: 11/03/2021
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
# System.GetCollectedErrors([Boolean]) Method
> **Version**: _Available or changed with runtime version 8.0._

Gets all collected errors in the current collection scope.


## Syntax
```AL
Errors :=   System.GetCollectedErrors([Clear: Boolean])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*[Optional] Clear*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the errors will be cleared from the collection scope. **true** clears the errors. The default is **false**.  


## Return Value
*Errors*  
&emsp;Type: [List of [ErrorInfo]](../list/list-data-type.md)  
The collected errors in the current collection scope.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also

[Collecting Errors](../../devenv-error-collection.md)  
[System Data Type](system-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)