---
title: "File.Erase Method"
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
# File.Erase Method
> **Version**: _Available or changed with runtime version 1.0._

Deletes a file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  File.Erase(Name: String)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the file that you want to delete, including the path. When you enter the path, consider these shortcuts:
-   You can omit the drive designation if the file is located on the current drive.
-   You can omit the full path if the file is located in the current directory.
-   You can enter only the subdirectory name if the file is located in a subdirectory of the current directory.
          


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

If the user who runs this method does not have the required permission to delete the file or if the file is read-only, then the file is not deleted.  
  
## Example

The following example deletes the file that is named C:\\TestFolder\\NewTestFile.txt.This example assumes that you have created the file on your computer.  
  
```al
Erase('C:\TestFolder\NewTestFile.txt');  
```  

## See Also

[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)