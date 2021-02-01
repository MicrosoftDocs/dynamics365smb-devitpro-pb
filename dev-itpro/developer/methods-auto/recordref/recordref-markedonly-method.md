---
title: "RecordRef.MarkedOnly Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# RecordRef.MarkedOnly Method
> **Version**: _Available from runtime version 5.3._

Activates a special filter. After you use this function, your view of the table includes only records marked by this function.


## Syntax
```
[MarkedOnly := ]  RecordRef.MarkedOnly([MarkedOnly: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*MarkedOnly*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Activates a special filter.  


## Return Value
*MarkedOnly*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the special filter is being used; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)