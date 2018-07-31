---
title: "CopyStream Method"
ms.author: solsen
ms.custom: na
ms.date: 07/31/2018
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
# CopyStream Method
Copies the information that is contained in an InStream to an OutStream.

## Syntax
```
[Ok := ]  System.CopyStream(OutStream: OutStream, InStream: InStream, [BytesToRead: Integer])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*OutStream*  
&emsp;Type: [OutStream](outstream-data-type.md)  
The OutStream object to which you will copy the information; the destination stream.  
*InStream*  
&emsp;Type: [InStream](instream-data-type.md)  
The InStream object from which you want to copy; the source stream.  
*BytesToRead*  
&emsp;Type: [Integer](integer-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example requires that you create the following variables.  

|Variable name|DataType|  
|-------------------|--------------|  
|F1|File|  
|F2|File|  
|InS|InStream|  
|OutS|OutStream|  

```  
F1.OPEN('c:\Test.txt');  
F1.CREATEINSTREAM(InS);  
F2.CREATE('c:\CopyTest.txt');  
F2.CREATEOUTSTREAM(OutS);  
COPYSTREAM(OutS,InS);  
F1.CLOSE();  
F2.CLOSE();  
```  


## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)