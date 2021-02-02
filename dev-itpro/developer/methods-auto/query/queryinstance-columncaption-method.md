---
title: "Query.ColumnCaption Method"
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
# Query.ColumnCaption Method
> **Version**: _Available from runtime version 1.0._

Returns the current caption of a query column as a text string.


## Syntax
```
Caption :=   Query.ColumnCaption(Column: Any)
```
## Parameters
*Query*
&emsp;Type: [Query](query-data-type.md)
An instance of the [Query](query-data-type.md) data type.

*Column*  
&emsp;Type: [Any](../any/any-data-type.md)  
Refers to the name of the query column. The name of a query column is specified by the Name Property.  


## Return Value
*Caption*
&emsp;Type: [String](../string/string-data-type.md)
The query column caption.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)