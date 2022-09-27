---
title: "DataTransfer.AddSourceFilter(Integer, Text [, Any,...]) Method"
description: "Adds a filter for the source table for the data transfer."
ms.author: solsen
ms.custom: na
ms.date: 08/11/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataTransfer.AddSourceFilter(Integer, Text [, Any,...]) Method
> **Version**: _Available or changed with runtime version 10.0._

Adds a filter for the source table for the data transfer.


## Syntax
```AL
 DataTransfer.AddSourceFilter(SourceField: Integer, String: Text [, Value: Any,...])
```
## Parameters
*DataTransfer*  
&emsp;Type: [DataTransfer](datatransfer-data-type.md)  
An instance of the [DataTransfer](datatransfer-data-type.md) data type.  

*SourceField*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The field in the source table to filter on.  

*String*  
&emsp;Type: [Text](../text/text-data-type.md)  

        The filter expression. A valid expression consists of alphanumeric characters and one or more of the following operators: \<, \>, \\, &, &#124;, and =. You can use replacement fields (%1, %2, and so on) to insert values at runtime.
        

*[Optional] Value*  
&emsp;Type: [Any](../any/any-data-type.md)  

        Replacement values to insert in replacement fields in the filter expression. The data type of Value must match the data type of Field.
        



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[DataTransfer Data Type](datatransfer-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)