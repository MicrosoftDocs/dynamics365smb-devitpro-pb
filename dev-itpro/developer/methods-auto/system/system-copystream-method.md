---
title: "System.CopyStream Method"
description: "Copies the information that is contained in an InStream to an OutStream."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# System.CopyStream Method
> **Version**: _Available or changed with runtime version 1.0._

Copies the information that is contained in an InStream to an OutStream.


## Syntax
```
[Ok := ]  System.CopyStream(OutStream: OutStream, InStream: InStream [, BytesToRead: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The OutStream object to which you will copy the information; the destination stream.
        
*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
The InStream object from which you want to copy; the source stream.
        
*BytesToRead*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  

```al
var
    F1: File;
    F2: File;
    InS: InStream;
    OutS: OutStream;
begin
    F1.Open('c:\Test.txt');  
    F1.CreateInStream(InS);  
    F2.Create('c:\CopyTest.txt');  
    F2.CreateOutStream(OutS);  
    CopyStream(OutS,InS);  
    F1.Close();  
    F2.Close();  
end;
```  

## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)