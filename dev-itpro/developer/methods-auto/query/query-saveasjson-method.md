---
title: "Query.SaveAsJson(Integer, OutStream) Method"
description: "Saves the resulting data set of a query as an .json file."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Query.SaveAsJson(Integer, OutStream) Method
> **Version**: _Available or changed with runtime version 14.0._

Saves the resulting data set of a query as an .json file.


## Syntax
```AL
[Ok := ]  Query.SaveAsJson(Number: Integer, OutStream: OutStream)
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the query object that you want to save as an .json file. If the query that you specify does not exist, then a run-time error occurs.  

*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The stream that you want to save the query as Json to.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the SaveAsJson succeeded, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```al
procedure Test();
var
    result : Boolean;
    os: OutStream;
begin
    result := Query.SaveAsJson(10, os);
end;
```

## Related information
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)