---
title: "File.Create Method"
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
# File.Create Method
Creates an Automation object.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  File.Create(Name: String [, Encoding: TextEncoding])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*File*  
&emsp;Type: [File](file-data-type.md)  
An instance of the [File](file-data-type.md) data type.  

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
  
*Encoding*  
&emsp;Type: [TextEncoding](../textencoding/textencoding-option.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the [TEXTMODE Method \(File\)](../../methods-auto/file/file-textmode-method.md) returns **true** and you read or write to the file, text is put in the buffer.  
  
 If the [TEXTMODE Method \(File\)](../../methods-auto/file/file-textmode-method.md) method returns **false**, binary information is put in the buffer.  
  
 If you call CREATE on a File variable that refers to an open file, the method does not automatically close the existing file and create the new file. You must explicitly call the [CLOSE Method \(File\)](../../methods-auto/file/file-close-method.md) to close the existing file. Otherwise, a run-time error occurs.  
  
## Example  
 The following example creates a file that is named TestFile.txt in the path C:\\TestFolder\\. The TestFile variable stores the file and path that is created. If the file is created, a message that states that the file is created is displayed. Otherwise, an error message is displayed. This example requires that you create the following global variable.  

```
 var
    TestFile: File;
begin
    if TestFile.CREATE('C:\TestFolder\TestFile.txt') then begin  
      MESSAGE('%1 is created', TestFile.NAME);  
    end else  
    ERROR('The file could not be created');  
end;
```  
  
## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)