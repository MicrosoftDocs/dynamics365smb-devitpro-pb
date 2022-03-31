---
title: "Report.ExcelLayout(Integer, InStream) Method"
description: "Gets the Excel layout that is used on a report and returns it as a data stream."
ms.author: solsen
ms.custom: na
ms.date: 03/17/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.ExcelLayout(Integer, InStream) Method
> **Version**: _Available or changed with runtime version 9.0._

Gets the Excel layout that is used on a report and returns it as a data stream.


## Syntax
```AL
[Ok := ]  Report.ExcelLayout(Number: Integer, InStream: InStream)
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  

        The ID of the report object for which you want to get the Excel layout.
        

*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
The variable in which to return the Excel layout.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)