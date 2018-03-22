---
title: "SEEK Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8d315735-36ed-4d78-b00c-786785293293
caps.latest.revision: 7
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SEEK Method (File)
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
 This method is often used with [POS Method \(File\)](devenv-POS-Method-File.md) and [LEN Method \(File\)](devenv-LEN-Method-File.md).  
  
## Example  
 The following example sets a pointer at position 20 in a file and truncates the file at the pointer position. The [WRITEMODE Method \(File\)](devenv-WRITEMODE-Method-File.md) enables a file named C:\\TestFolder\\TestFile.txt to open in write mode. The SEEK method sets a pointer at position 20 in the file and then the [TRUNC Method \(File\)](devenv-TRUNC-Method-File.md) truncates the contents of the file at the pointer position. This example assumes that you have created the text file C:\\TestFolder\\TestFile.txt.This example requires that you create the following global variable.  
  
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
 [File Data Type](../datatypes/devenv-File-Data-Type.md)