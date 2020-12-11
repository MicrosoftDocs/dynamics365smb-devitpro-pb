---
title: "File.Write Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# File.Write Method
> **Version**: _Available from runtime version 1.0._

Writes to an MS-DOS encoded file or binary file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 File.Write(Value: Code)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*File*
&emsp;Type: [File](file-data-type.md)
An instance of the [File](file-data-type.md) data type.

*Value*  
&emsp;Type: [Code](../code/code-data-type.md)  
The data that you want to write to the file.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You must call the [TEXTMODE Method \(File\)](../../methods-auto/file/file-textmode-method.md) before you call the WRITE method.  
  
 If [TEXTMODE Method \(File\)](../../methods-auto/file/file-textmode-method.md) is set to **true** and *Value* is an integer, then the integer is written as text, followed by a new line character.  
  
 If *Value* is a record, each field is separated by a tab character.  
  
 If [TEXTMODE Method \(File\)](../../methods-auto/file/file-textmode-method.md) is **false** and *Value* is an integer, an integer is written that is four bytes long.  
  
 MS-DOS encoding requires a different character set for each language. MS-DOS text is encoded to the internal Unicode data type by using the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)]. If you write to a file that uses MS-DOS encoding, then you must set the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] to match the language of the data that you want to write to the file.  
  
 We recommend that you use the File data type for files that were created in earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)].  
  
 To read or write files in Unicode or in other formats, we recommend that you use .NET Framework interoperability and use the [System.IO Namespace](https://go.microsoft.com/fwlink/?LinkId=262250).  
  
## Example  
 The following example determines whether the specified file exists. If it exists, the [WRITEMODE Method \(File\)](../../methods-auto/file/file-writemode-method.md) allows the file to be open for writing. The [OPEN Method \(File\)](../../methods-auto/file/file-open-method.md) opens the file, the [WRITE Method \(FILE\)](../../methods/devenv-write-method-file.md) writes the text “Hello World” to the file and then the [CLOSE Method \(File\)](../../methods-auto/file/file-close-method.md) closes the file. If the file does not exist, then an error message is displayed. This example assumes that you have created the following file: C:\\TestFolder\\TestFile.txt. This example requires that you create the following global variables.  
  
  ```
 var
    FileName: Text;
    TestFile: File;
    Cde: Code;
begin
    FileName := 'C:\TestFolder\TestFile.txt';  
    if EXISTS(FileName) then begin
      TestFile.WRITEMODE(TRUE);  
      TestFile.OPEN(FileName);  
      TestFile.WRITE(Cde);  
      TestFile.CLOSE;  
    end else 
      MESSAGE('%1 does not exit.', FileName);
end;
```  
  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)