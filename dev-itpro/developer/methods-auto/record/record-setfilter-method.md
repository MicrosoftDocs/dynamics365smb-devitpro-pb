---
title: "SetFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 08/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SetFilter Method
Assigns a filter to a field that you specify.


## Syntax
```
 Record.SetFilter(Field: Any, String: String [, Value: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to filter.
          
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The filter expression. A valid expression consists of alphanumeric characters and one or more of the following operators: \<, >, \, &, &#124;, and =. You can use replacement fields (%1, %2, and so on) to insert values at run-time.
          
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Replacement values to insert in replacement fields in the filter expression. The data type of Value must match the data type of Field.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

`SetFilter` does not filter for empty values. For example, if you set `MyRecord.SetFilter(MyTextField, '');` no filter is applied.

## See Also

[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)