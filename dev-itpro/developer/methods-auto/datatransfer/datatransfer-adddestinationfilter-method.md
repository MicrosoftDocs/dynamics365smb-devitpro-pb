---
title: "DataTransfer.AddDestinationFilter(Integer, Text [, Any,...]) Method"
description: "Adds a filter for the destination table for the data transfer."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataTransfer.AddDestinationFilter(Integer, Text [, Any,...]) Method
> **Version**: _Available or changed with runtime version 17.0._

Adds a filter for the destination table for the data transfer.


## Syntax
```AL
 DataTransfer.AddDestinationFilter(DestinationField: Integer, String: Text [, Value: Any,...])
```
## Parameters
*DataTransfer*  
&emsp;Type: [DataTransfer](datatransfer-data-type.md)  
An instance of the [DataTransfer](datatransfer-data-type.md) data type.  

*DestinationField*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The field in the destination table to filter on.  

*String*  
&emsp;Type: [Text](../text/text-data-type.md)  
The filter expression. A valid expression consists of alphanumeric characters and one or more of the following operators: \<, \>, \\, &, &#124;, and =. You can use replacement fields (%1, %2, and so on) to insert values at runtime.  

*[Optional] Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Replacement values to insert in replacement fields in the filter expression. The data type of Value must match the data type of Field.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[DataTransfer data type](datatransfer-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)