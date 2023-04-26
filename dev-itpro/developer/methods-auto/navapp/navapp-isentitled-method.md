---
title: "NavApp.IsEntitled(Text [, Guid]) Method"
description: "Determines if the current user is entitled to a specific entitlement id for the application."
ms.author: solsen
ms.custom: na
ms.date: 02/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp.IsEntitled(Text [, Guid]) Method
> **Version**: _Available or changed with runtime version 10.2._

Determines if the current user is entitled to a specific entitlement id for the application.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  NavApp.IsEntitled(Id: Text [, AppId: Guid])
```
## Parameters
*Id*  
&emsp;Type: [Text](../text/text-data-type.md)  
A value containing the entitlement id to search for.  

*[Optional] AppId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The ID of the application for which to retrieve information, defaults to the current application.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true* if the current user is entitled to the specified entitlement, oterwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[NavApp Data Type](navapp-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)