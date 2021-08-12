---
title: "Query.ColumnName(Any) Method"
description: "Returns the name of a query column as a text string."
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
# Query.ColumnName(Any) Method
> **Version**: _Available or changed with runtime version 1.0._

Returns the name of a query column as a text string.


## Syntax
```AL
Name :=   Query.ColumnName(Column: Any)
```
## Parameters
*Query*  
&emsp;Type: [Query](query-data-type.md)  
An instance of the [Query](query-data-type.md) data type.  

*Column*  
&emsp;Type: [Any](../any/any-data-type.md)  
Refers to the name of the query column. The name of a query column is specified by the Name Property.  


## Return Value
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The query column name.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)