---
title: "Query.SaveAsCsv Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Query.SaveAsCsv Method
> **Version**: _Available from runtime version 1.0._

Saves the resulting data set of a query as comma separated values (CSV)


## Syntax
```
[Ok := ]  Query.SaveAsCsv(OutStream: OutStream [, Format: Integer] [, FormatArgument: String])
```
## Parameters
*Query*
&emsp;Type: [Query](query-data-type.md)
An instance of the [Query](query-data-type.md) data type.

*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The stream that you want to save the query as CSV to.
        
*Format*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies whether the columns of the resulting data set are at fixed positions in the CSV file or separated only by a delimiter.
        
*FormatArgument*  
&emsp;Type: [String](../string/string-data-type.md)  
You set the FormatArgument parameter based on the setting of the Format parameter. If the Format parameter is set to 0, then the FormatArgument parameter specifies the starting position of each column in the data set. The value is a comma separated string of integers that includes an integer for every column. In a CSV file, each line is evenly divided into positions for holding characters. The first integer corresponds to the starting position of the first column, the second integer corresponds to the starting position of the second column, and so on.
          


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)