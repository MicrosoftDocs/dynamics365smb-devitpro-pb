---
title: "InStream.Read Method"
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
# InStream.Read Method
> **Version**: _Available from runtime version 1.0._

Reads a specified number of bytes from an InStream object. Data is read in binary format.


## Syntax
```
[Read := ]  InStream.Read(var Variable: Char [, Length: Integer])
```
## Parameters
*InStream*
&emsp;Type: [InStream](instream-data-type.md)
An instance of the [InStream](instream-data-type.md) data type.

*Variable*  
&emsp;Type: [Char](../char/char-data-type.md)  
  
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Describes the number of characters to be read. If you do not specify Length, the size of the variable is used. In the case of data types other than string, code, and binary, if you specify a length that differs from the size of the variable, you receive an error message.  


## Return Value
*Read*
&emsp;Type: [Integer](../integer/integer-data-type.md)
 If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
READ reads until the specified length or a zero byte. For more information about how zero bytes and line endings are read, see [WRITE, WRITETEXT, READ, and READTEXT Method Behavior Regarding Line Endings and Zero Terminators](../../devenv-write-read-methods-line-break-behavior.md).
  
If the optional return value \(*READ*\) is not present and the data being read is less than the length requested to be read, then you receive an error message.  
  
If the return value is present, then you must verify the validity of the data that has been read.  
  
## Example  
 The following example shows how to use the **Instream.READ** method to read data in binary format. The **FIND** method finds the first record from the **Company Information** table. The **CALCFIELDS** method retrieves the **Picture** field, which is a BLOB field. The **CREATEINSTREAM** method uses the recBinaries variable to create an InStream object that is named varInstream. The **varInstream.READ** method then reads three characters from the varInstream variable and stores the binary data in the varChars variable. The number of characters that is read is stored in the numChars variable. The binary data and the number of characters that is read are displayed in a message box. 

  
```
 var
    recBinaries: Record "Company Information";
    varInstream: Instream;
    varChars: Text[50];
    numChars: Integer;
    Text000: Label 'Number of characters read: %1. Characters read: %2.';
begin
    recBinaries.FIND('-');  
    recBinaries.CALCFIELDS(recBinaries.Picture);  
    recBinaries.Picture.CREATEINSTREAM(varInstream);  
    numChars := varInstream.READ(varChars,3);  
    Message(Text000, numChars, varChars);  
end;
```  
  

## See Also
[InStream Data Type](instream-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)