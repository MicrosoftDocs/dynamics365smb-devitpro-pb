---
title: "ErrorInfo.SystemId([Guid]) Method"
description: "Specifies the system ID of the record that the error relates to."
ms.author: solsen
ms.custom: na
ms.date: 08/24/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.SystemId([Guid]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the system ID of the record that the error relates to.


## Syntax
```AL
[SystemId := ]  ErrorInfo.SystemId([SystemId: Guid])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] SystemId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The system ID of the ErrorInfo  


## Return Value
*[Optional] SystemId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The current system ID of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[ErrorInfo Data Type](errorinfo-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)