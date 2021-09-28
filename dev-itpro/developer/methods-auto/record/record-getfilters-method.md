---
title: "Record.GetFilters() Method"
description: "Gets a string that contains a list of the filters within the current filter group for all fields in a record."
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
# Record.GetFilters() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a string that contains a list of the filters within the current filter group for all fields in a record. In addition, this method also returns the state of the MARKEDONLY method (Record).


## Syntax
```AL
String :=   Record.GetFilters()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)