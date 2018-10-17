---
title: "ReadText Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# ReadText Method
Reads text from an InStream object.

## Syntax
```
[Read := ]  InStream.ReadText(var Variable: Text, [Length: Integer])
```
## Parameters
*InStream*  
&emsp;Type: [InStream](instream-data-type.md)  
An instance of the [InStream](instream-data-type.md) data type.  

*Variable*  
&emsp;Type: [Text](text-data-type.md)  
The variable that receives the characters that were read.  
*Length*  
&emsp;Type: [Integer](integer-data-type.md)  
The number of characters to be read. If you do not specify this parameter, the maximum length of the string is used.  


## Return Value
*Read*  
&emsp;Type: [Integer](integer-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
The number of characters that were read.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 READTEXT reads the specified number of bytes, the maximum length of the string, or until the end of the line.  
  
 Data is read in text format.  
  
 If you do not use the optional return value and the data being read is less than the length requested to be read, an error message is displayed.  
  
 If you use the return value, you must verify the validity of the data that has been read.  
  
## Example  
 This example shows how to use the InStream.READTEXT method. This example requires that you create the following variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|FileTest|File|  
|StreamInTest|InStream|  
|Int|Integer|  
|Txt|Text|  
  
```  
FileTest.OPEN('c:\XMLDocs\NewTest.txt');  
FileTest.CREATEINSTREAM(StreamInTest);  
// Starting a loop  
WHILE NOT (StreamInTest.EOS) DO BEGIN  
  Int := StreamInTest.READTEXT(Txt,100);  
  MESSAGE(Txt + '\Size: ' + FORMAT(Int));  
END;  
FileTest.CLOSE();  
```  
  

## See Also
[InStream Data Type](instream-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)