---
title: "InStream.ReadText Method"
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
# InStream.ReadText Method
> **Version**: _Available from runtime version 1.0._

Reads text from an InStream object.


## Syntax
```
[Read := ]  InStream.ReadText(var Variable: Text [, Length: Integer])
```
## Parameters
*InStream*
&emsp;Type: [InStream](instream-data-type.md)
An instance of the [InStream](instream-data-type.md) data type.

*Variable*  
&emsp;Type: [Text](../text/text-data-type.md)  
The variable that receives the characters that were read.  
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters to be read. If you do not specify this parameter, the maximum length of the string is used.  


## Return Value
*Read*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The number of characters that were read. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

ReadText reads the until the specified number of bytes, the maximum length of the string, a zero byte, or until the end of the line. For more information about how zero bytes and line endings are read, see [Write, WriteText, Read, and ReadText Method Behavior Regarding Line Endings and Zero Terminators](../../devenv-write-read-methods-line-break-behavior.md).
  
Data is read in text format.  

If you do not use the optional return value and the data being read is less than the length requested to be read, an error message is displayed.  
  
If you use the return value, you must verify the validity of the data that has been read.  
  
## Example  

```
 var
    FileTest: File;
    StreamInTest: Instream;
    Txt: Text;
    Int: Integer;
begin
    FileTest.OPEN('c:\XMLDocs\NewTest.txt');  
    FileTest.CreateInStream(StreamInTest);  
    // Starting a loop  
    while not (StreamInTest.EOS) do begin 
      Int := StreamInTest.ReadText(Txt,100);  
      Message(Txt + '\Size: ' + FORMAT(Int));  
    end;  
    FileTest.Close();  
end;
```  


## See Also
[InStream Data Type](instream-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)