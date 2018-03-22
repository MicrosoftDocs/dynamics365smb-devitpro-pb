---
title: "TRUNC Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1b634423-307e-424e-bce5-c7fe5c87331a
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TRUNC Method (File)
Truncate an ASCII or binary file to the current position of the file pointer.  
  
## Syntax  
  
```  
  
File.TRUNC  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Use this variable to refer to the file.  
  
## Remarks  
 Typically, you use this method together with [SEEK Method \(File\)](devenv-SEEK-Method-File.md). Use File.SEEK to position the pointer in the file and then use File.TRUNC to truncate the file at that point.  
  
## Example  
 The following example sets a pointer at position 20 in a file and truncates the file at the pointer position. The [WRITEMODE Method \(File\)](devenv-WRITEMODE-Method-File.md) allows the file that is named C:\\TestFolder\\TestFile.txt to open in write mode. The SEEK method sets a pointer at position 20 in the file and then the [TRUNC Method \(FILE\)](devenv-TRUNC-Method-File.md) truncates the contents at the pointer position. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt. The file is then saved a truncated file. This example requires that you create the following global variable.  
  
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