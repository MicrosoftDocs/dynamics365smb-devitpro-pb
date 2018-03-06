---
title: "SEEK Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8d315735-36ed-4d78-b00c-786785293293
caps.latest.revision: 7
manager: edupont
---
# SEEK Function (File)
Sets a file pointer to a new position in an ASCII or binary file.  
  
## Syntax  
  
```  
  
File.SEEK(Position)  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 The file in which to set the pointer.  
  
 *Position*  
 Type: Integer  
  
 The position at which to set the pointer.  
  
## Remarks  
 This function is often used with [POS Function \(File\)](POS-Function--File-.md) and [LEN Function \(File\)](LEN-Function--File-.md).  
  
## Example  
 The following example sets a pointer at position 20 in a file and truncates the file at the pointer position. The [WRITEMODE Function \(File\)](WRITEMODE-Function--File-.md) enables a file named C:\\TestFolder\\TestFile.txt to open in write mode. The SEEK function sets a pointer at position 20 in the file and then the [TRUNC Function \(File\)](TRUNC-Function--File-.md) truncates the contents of the file at the pointer position. This example assumes that you have created the text file C:\\TestFolder\\TestFile.txt.This example requires that you create the following variable in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|TestFile|File|  
  
```  
  
TestFile.WRITEMODE(TRUE);  
TestFile.OPEN('C:\TestFolder\TestFile.txt');  
TestFile.SEEK(20);  
TestFile.TRUNC;  
  
```  
  
## See Also  
 [File Data Type](File-Data-Type.md)