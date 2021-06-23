---
title: "File.Len Method"
description: "Gets the length of an ASCII or binary file."
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
# File.Len Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the length of an ASCII or binary file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
Length :=   File.Len()
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
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method is often used with [Pos Method \(File\)](../../methods-auto/file/file-pos-method.md) and [Seek Method \(File\)](../../methods-auto/file/file-Seek-method.md).  
  
## Example  

The following example opens a text file that is named 'C:\\TestFolder\\TestFile.txt' and contains the text ‘Hello World’. The [Seek Method \(File\)](file-seek-method.md) sets a pointer to position 6 in the file. The [Read Method \(File\)](file-read-method.md) reads the file and stores the retrieved contents in the varString variable. The LEN method retrieves the length of the file and stores it the varLength variable. The text that is read starts from the position of the pointer, so the text ‘World’ and the length of 12 are displayed in the message box. The length of the file is not affected by the [Seek Method \(File\)](file-Seek-method.md). This example assumes that you have created the text file that is named C:\\TestFolder\\TestFile.txt and contains the text ‘Hello World’. This example requires that you create the following global variables.  

 ```
 var
    Testfile: File;
    varString: Text[200];
    varLength: Integer;
begin
    Testfile.Open('C:\TestFolder\TestFile.txt');  
    Testfile.Seek(6);  
    Testfile.Read(varString);  
    varLength := Testfile.LEN;  
    Message('The text is: %1. The length of the file is: %2', varString, varLength);  
end;
```  
  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)