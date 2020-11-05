---
title: "OutStream.Write Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# OutStream.Write Method
Writes a specified number of bytes to the stream. Data is written in binary format.


## Syntax
```
[Written := ]  OutStream.Write(Value: BigInteger [, Length: Integer])
```
## Parameters
*OutStream*  
&emsp;Type: [OutStream](outstream-data-type.md)  
An instance of the [OutStream](outstream-data-type.md) data type.  

*Value*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
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
WRITE adds a zero byte at the end of the stream. This is differs from WRITETEXT, which does not. For more information about how zero bytes and line endings are written and read, see [WRITE, WRITETEXT, READ, and READTEXT Method Behavior Regarding Line Endings and Zero Terminators](../../devenv-write-read-methods-line-break-behavior.md).

 If the optional return value, *Written*, is not specified and it was not possible to write all the data, an error message is displayed.  
  
 If the return value is present, you must verify that all the data was streamed.  
  
## Example  
  
```  
recBinaries.FIND('-');  
recBinaries.Data.CREATEOUTSTREAM(OutStream);  
OutStream.WRITE('Secretary');  
OutStream.WRITE('Alice');  
OutStream.WRITE('Hart');  
OutStream.WRITE(19960106D);  
recBinaries.MODIFY();  
```  
  
## See Also
[OutStream Data Type](outstream-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)