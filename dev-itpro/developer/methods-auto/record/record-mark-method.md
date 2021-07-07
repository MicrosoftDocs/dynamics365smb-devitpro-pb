---
title: "Record.Mark([Boolean]) Method"
description: "Marks a record."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Record.Mark([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Marks a record. You can also use this method to determine whether a record is marked.


## Syntax
```AL
[Marked := ]  Record.Mark([Mark: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] Mark*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if a record is marked.  


## Return Value
*[Optional] Marked*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the record is marked; otherwise, **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You can use the [MarkedOnly (Record) Method](record-markedonly-method.md) to activate a special filter where your view of the table includes only records marked by the **Mark (Record)** method.

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)