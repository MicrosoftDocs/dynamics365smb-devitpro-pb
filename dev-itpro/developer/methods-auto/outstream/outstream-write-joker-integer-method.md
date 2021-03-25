---
title: "OutStream.Write Method"
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
# OutStream.Write Method
> **Version**: _Available or changed with runtime version 1.0._

Writes a specified number of bytes to the stream. Data is written in binary format.


## Syntax
```
[Written := ]  OutStream.Write(Value: Any [, Length: Integer])
```
## Parameters
*OutStream*
&emsp;Type: [OutStream](outstream-data-type.md)
An instance of the [OutStream](outstream-data-type.md) data type.

*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Contains the data to be written.
        
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of bytes to be written. In the case of data types other than string, code, and binary, if you specify a length that differs from the size of the variable, an error message is displayed.  


## Return Value
*Written*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The number of bytes that were written. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the optional return value, *Written*, is not specified and it was not possible to write all the data, an error message is displayed.  
  
 If the return value is present, you must verify that all the data was streamed.  
  
## Example  
  
```al
recBinaries.Find('-');  
recBinaries.Data.CreateOutstream(OutStream);  
OutStream.Write('Secretary');  
OutStream.Write('Alice');  
OutStream.Write('Hart');  
OutStream.Write(19960106D);  
recBinaries.Modify();  
```  
  

## See Also
[OutStream Data Type](outstream-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)