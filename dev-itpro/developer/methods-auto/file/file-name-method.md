---
title: "File.Name Method"
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
# File.Name Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the name of an ASCII or binary file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
Name :=   File.Name()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.

## Parameters
*File*
&emsp;Type: [File](file-data-type.md)
An instance of the [File](file-data-type.md) data type.

## Return Value
*Name*
&emsp;Type: [String](../string/string-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You must use the [Open Method \(File\)](../../methods-auto/file/file-open-method.md) to open the file before you can use this method.  
  
## Example  

The following example opens a text file that is named C:\\TestFolder\\TestFile.txt. The [Name Method \(File\)](../../methods-auto/file/file-name-method.md) retrieves the name and path of the text file and stores it in the varName variable. The value in the variable is displayed in a message box. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt.

 ```
 var
    Testfile: File;
    varName: Text;
begin
    TestFile.Open('C:\TestFolder\TestFile.txt');  
    varName := TestFile.Name;  
    Message('The name of the file is: %1',varName);  
end;
```  
  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)