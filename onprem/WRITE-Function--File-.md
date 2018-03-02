---
title: "WRITE Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 423def02-ce02-460b-babe-4608b264c64c
caps.latest.revision: 13
---
# WRITE Function (File)
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
 You must call the [TEXTMODE Function \(File\)](TEXTMODE-Function--File-.md) before you call the WRITE function.  
  
 If [TEXTMODE Function \(File\)](TEXTMODE-Function--File-.md) is set to **true** and *Value* is an integer, then the integer is written as text, followed by a new line character.  
  
 If *Value* is a record, each field is separated by a tab character.  
  
 If [TEXTMODE Function \(File\)](TEXTMODE-Function--File-.md) is **false** and *Value* is an integer, an integer is written that is four bytes long.  
  
 MS-DOS encoding requires a different character set for each language. MS-DOS text is encoded to the internal Unicode data type by using the system locale language of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]. If you write to a file that uses MS-DOS encoding, then you must set the system locale language of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] to match the language of the data that you want to write to the file.  
  
 We recommend that you use the File data type for files that were created in earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 To read or write files in Unicode or in other formats, we recommend that you use .NET Framework interoperability and use the [System.IO Namespace](http://go.microsoft.com/fwlink/?LinkId=262250).  
  
## Example  
 The following example determines whether the specified file exists. If it exists, the [WRITEMODE Function \(File\)](WRITEMODE-Function--File-.md) allows the file to be open for writing. The [OPEN Function \(File\)](OPEN-Function--File-.md) opens the file, the [WRITE Function \(FILE\)](WRITE-Function--File-.md) writes the text “Hello World” to the file and then the [CLOSE Function \(File\)](CLOSE-Function--File-.md) closes the file. If the file does not exist, then an error message is displayed. This example assumes that you have created the following file: C:\\TestFolder\\TestFile.txt. This example requires that you create the following variables in the **C/AL Globals** window.  
  
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
 [File Data Type](File-Data-Type.md)   
 [TEXTMODE Function \(File\)](TEXTMODE-Function--File-.md)