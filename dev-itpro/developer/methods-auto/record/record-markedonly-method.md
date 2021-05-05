---
title: "Record.MarkedOnly Method"
ms.author: solsen
ms.custom: na
ms.date: 05/05/2021
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
# Record.MarkedOnly Method
> **Version**: _Available or changed with runtime version 1.0._

Activates a special filter. After you use this function, your view of the table includes only records marked by the Mark (Record) method.


## Syntax
```
[MarkedOnly := ]  Record.MarkedOnly([MarkedOnly: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*MarkedOnly*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Activates a special filter.  


## Return Value
*MarkedOnly*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the special filter is being used; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)