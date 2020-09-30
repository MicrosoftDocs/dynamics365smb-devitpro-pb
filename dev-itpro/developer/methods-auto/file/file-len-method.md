---
title: "File.Len Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# File.Len Method
Gets the length of an ASCII or binary file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
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
 This method is often used with [POS Method \(File\)](../../methods-auto/file/file-pos-method.md) and [SEEK Method \(File\)](../../methods-auto/file/file-seek-method.md).  
  
## Example  
 The following example opens a text file that is named 'C:\\TestFolder\\TestFile.txt' and contains the text ‘Hello World’. The [SEEK Method \(File\)](../../methods/devenv-seek-method-file.md) sets a pointer to position 6 in the file. The [READ Method \(File\)](../../methods-auto/file/file-read-method.md) reads the file and stores the retrieved contents in the varString variable. The LEN method retrieves the length of the file and stores it the varLength variable. The text that is read starts from the position of the pointer, so the text ‘World’ and the length of 12 are displayed in the message box. The length of the file is not affected by the [SEEK Method \(File\)](../../methods-auto/file/file-seek-method.md). This example assumes that you have created the text file that is named C:\\TestFolder\\TestFile.txt and contains the text ‘Hello World’. This example requires that you create the following global variables.  

 ```
 var
    Testfile: File;
    varString: Text[200];
    varLength: Integer;
begin
    Testfile.OPEN('C:\TestFolder\TestFile.txt');  
    Testfile.SEEK(6);  
    Testfile.READ(varString);  
    varLength := Testfile.LEN;  
    MESSAGE('The text is: %1. The length of the file is: %2', varString, varLength);  
end;
```  
  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)