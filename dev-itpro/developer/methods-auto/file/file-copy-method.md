---
title: "File.Copy Method"
description: "Copies a file."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# File.Copy Method
> **Version**: _Available or changed with runtime version 1.0._

Copies a file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  File.Copy(FromName: String, ToName: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*FromName*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the file that you want to make a copy of, including its path. When you enter the path, consider these shortcuts:
-   You can omit the drive designation if the file is located on the current drive.
-   You can omit the full path if the file is located in the current directory.
-   You can enter only the subdirectory name if the file is located in a subdirectory of the current directory.
          
*ToName*  
&emsp;Type: [String](../string/string-data-type.md)  
The name that you want to assign to the copy that includes its path. When you enter the path, consider these shortcuts:
-   You can omit the drive designation if the file is located on the current drive.
-   You can omit the full path if the file is located in the current directory.
-   You can enter only the subdirectory name if the file is located in a subdirectory of the current directory.
          


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you do not use the return value and the file cannot be copied, a run-time error will occur. If you do include the return value in your code, you must handle any errors yourself.  
  
## Example
 
The following example copies a file that is named OldFile from a folder that is named Old on drive C to a folder that is named New. If the file is copied, a message is displayed and the program continues. Otherwise, an error occurs. This example assumes that you have created the following file 'c:\\Old\\' OldFile.  

```al
 var
    OldFile: Text;
    NewFile: Text;
begin
    OldFile := 'old.txt';  
    NewFile := 'new.txt';  
    if File.Copy('c:\Old\' + OldFile, 'c:\New\' + NewFile) then  
      // Continue your program.  
      Message('The file was copied.');  
    else  
      // Handle the error.  
      Message('The file was not copied.');  
end;
```
  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)