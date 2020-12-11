---
title: "HttpResponseMessage.IsBlockedByEnvironment Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# HttpResponseMessage.IsBlockedByEnvironment Method
> **Version**: _Available from runtime version 2.0._

Gets a value that indicates if the HTTP response is the result of the environment blocking an outgoing HTTP request.


## Syntax
```
IsBlockedByEnvironment :=   HttpResponseMessage.IsBlockedByEnvironment()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*HttpResponseMessage*
&emsp;Type: [HttpResponseMessage](httpresponsemessage-data-type.md)
An instance of the [HttpResponseMessage](httpresponsemessage-data-type.md) data type.

## Return Value
*IsBlockedByEnvironment*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the HTTP response is the result of the environment blocking an outgoing HTTP request, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpResponseMessage Data Type](httpresponsemessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)