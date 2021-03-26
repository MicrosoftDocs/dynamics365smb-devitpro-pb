---
title: "Record.GetAscending Method"
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
# Record.GetAscending Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the sort order for the records returned. You can use GETASCENDING to identify the sort order of the specified field because fields can be sorted in ascending or descending order. For example, you can read data from an ODATA web service where the data is sorted in ascending order on the Name field but in descending order on the City field.


## Syntax
```
IsAscending :=   Record.GetAscending(Field: Any)
```
## Parameters
*Record*
&emsp;Type: [Record](record-data-type.md)
An instance of the [Record](record-data-type.md) data type.

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to get the sort order for.
        


## Return Value
*IsAscending*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)