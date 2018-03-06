---
title: "WRITE Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 423def02-ce02-460b-babe-4608b264c64c
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# WRITE Method (File)
Writes to an MS-DOS encoded file or binary file.  
  
## Syntax  
  
```  
  
File.WRITE(Value)  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 The file to write to.  
  
 *Value*  
 Type: all simple data types, and records  
  
 The data that you want to write to the file.  
  
## Remarks  
 You must call the [TEXTMODE Method \(File\)](devenv-TEXTMODE-Method-File.md) before you call the WRITE method.  
  
 If [TEXTMODE Method \(File\)](devenv-TEXTMODE-Method-File.md) is set to **true** and *Value* is an integer, then the integer is written as text, followed by a new line character.  
  
 If *Value* is a record, each field is separated by a tab character.  
  
 If [TEXTMODE Method \(File\)](devenv-TEXTMODE-Method-File.md) is **false** and *Value* is an integer, an integer is written that is four bytes long.  
  
 MS-DOS encoding requires a different character set for each language. MS-DOS text is encoded to the internal Unicode data type by using the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. If you write to a file that uses MS-DOS encoding, then you must set the system locale language of the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] to match the language of the data that you want to write to the file.  
  
 We recommend that you use the File data type for files that were created in earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)].  
  
 To read or write files in Unicode or in other formats, we recommend that you use .NET Framework interoperability and use the [System.IO Namespace](http://go.microsoft.com/fwlink/?LinkId=262250).  
  
## Example  
 The following example determines whether the specified file exists. If it exists, the [WRITEMODE Method \(File\)](devenv-WRITEMODE-Method-File.md) allows the file to be open for writing. The [OPEN Method \(File\)](devenv-OPEN-Method-File.md) opens the file, the [WRITE Method \(FILE\)](devenv-WRITE-Method-File.md) writes the text “Hello World” to the file and then the [CLOSE Method \(File\)](devenv-CLOSE-Method-File.md) closes the file. If the file does not exist, then an error message is displayed. This example assumes that you have created the following file: C:\\TestFolder\\TestFile.txt. This example requires that you create the following global variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|FileName|Text|  
|TestFile|File|  
  
```  
FileName := 'C:\TestFolder\TestFile.txt';  
IF EXISTS(FileName) THEN BEGIN  
  TestFile.WRITEMODE(TRUE);  
  TestFile.OPEN(FileName);  
  TestFile.WRITE('Hello World');  
  TestFile.CLOSE;  
END  
ELSE  
  MESSAGE('%1 does not exit.', FileName);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)   
 [TEXTMODE Method \(File\)](devenv-TEXTMODE-Method-File.md)