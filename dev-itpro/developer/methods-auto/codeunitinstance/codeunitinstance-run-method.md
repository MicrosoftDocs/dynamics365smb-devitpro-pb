---
title: "Run Method"
description: "The CodeunitInstance Run Method in AL for Business Central"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Run Method
Loads and executes the unit of C/AL code that you specify.

## Syntax
```
[Ok := ]  Codeunit.Run(var Record: Table)
```
## Parameters
*Codeunit*  
&emsp;Type: [Codeunit](../codeunit/codeunit-data-type.md)  
An instance of the [Codeunit](../codeunit/codeunit-data-type.md) data type.  

*Record*  
&emsp;Type: [Table](../table/table-data-type.md)  
 A record from the table that is associated with the codeunit.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Codeunit Data Type](../codeunit/codeunit-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)