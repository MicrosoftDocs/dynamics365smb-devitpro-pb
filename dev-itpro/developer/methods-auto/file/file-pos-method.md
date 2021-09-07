---
title: "File.Pos() Method"
description: "Gets the current position of the file pointer in an ASCII or binary file."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# File.Pos() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current position of the file pointer in an ASCII or binary file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
Position :=   File.Pos()
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
*Position*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method is often used with [Len Method \(File\)](../../methods-auto/file/file-len-method.md) and [Seek Method \(File\)](../../methods-auto/file/file-seek-method.md).  
  
## Example

The following example opens a text file that is named C:\\TestFolder\\TestFile.txt. The [WriteMode Method \(File\)](../../methods-auto/file/file-writemode-method.md) enables the file to be open in write mode. The POS method retrieves the position of the file pointer and stores it in the Position variable. When the file is open, the position of the pointer is 0 because a pointer is not set. The [Seek Method \(File\)](../../methods-auto/file/file-seek-method.md) method sets a file pointer at position 5. After the [Seek Method \(File\)](../../methods-auto/file/file-seek-method.md) is executed, the POS method returns 5 as the file pointer position. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt.

```al
 var
    Testfile: File;
    Position: Integer;
begin
    File.WriteMode(true);  
    TestFile.Open('C:\TestFolder\TestFile.txt');  
    Position := TestFile.Pos;  
    Message('Pointer position before Seek: %1', Position);  
    Testfile.Seek(5);  
    Position := Testfile.POS;  
    Message('Pointer position after Seek: %1', Position);  
end;
```  

## See Also

[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)