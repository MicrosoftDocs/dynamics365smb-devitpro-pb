---
title: "File.Trunc Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# File.Trunc Method
> **Version**: _Available or changed with runtime version 1.0._

Truncate an ASCII or binary file to the current position of the file pointer.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 File.Trunc()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.

## Parameters
*File*
&emsp;Type: [File](file-data-type.md)
An instance of the [File](file-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Typically, you use this method together with [Seek Method \(File\)](../../methods-auto/file/file-seek-method.md). Use File.Seek to position the pointer in the file and then use File.Trunc to truncate the file at that point.  
  
## Example

The following example sets a pointer at position 20 in a file and truncates the file at the pointer position. The [WriteMode Method \(File\)](../../methods-auto/file/file-writemode-method.md) allows the file that is named C:\\TestFolder\\TestFile.txt to open in write mode. The Seek method sets a pointer at position 20 in the file and then the [Trunc Method \(File\)](../../methods-auto/file/file-trunc-method.md) truncates the contents at the pointer position. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt. The file is then saved a truncated file. 
  
```al
 var
    TestFile: File;
begin
    TestFile.WriteMode(True);  
    TestFile.Open('C:\TestFolder\TestFile.txt');  
    TestFile.Seek(20);  
    TestFile.Trunc;  
end;
  
```  
  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)