---
title: "CLOSE Method (File)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: fd9ff535-d12e-46d4-bda7-d120957e8b1c
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CLOSE Method (File)
Closes a file that has been opened by the [OPEN Method \(File\)](devenv-OPEN-Method-File.md).  
  
## Syntax  
  
```  
  
File.CLOSE  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Specifies the file.  
  
## Remarks  
 If the file is not open, a run-time error will occur.  
  
## Example  
 The following example determines whether the specified file exists. If it exists, the [WRITEMODE Method \(File\)](devenv-WRITEMODE-Method-File.md) allows the file to be open for writing. The [OPEN Method \(File\)](devenv-OPEN-Method-File.md) opens the file, the [WRITE Method \(File\)](devenv-WRITE-Method-File.md) writes the text “Hello World” to the file, and then the CLOSE method closes the file. If the file does not exist, an error message is displayed. This example requires that you create the following global variables. This example assumes that you have created the following file C:\\TestFolder\\TestFile2.txt.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|FileName|Text|  
|TestFile|File|  
  
```  
  
FileName := 'C:\TestFolder\TestFile2.txt';  
IF EXISTS(FileName) THEN BEGIN  
  TestFile.WRITEMODE(TRUE);  
  TestFile.OPEN(FileName);  
  TestFile.WRITE('Hello World');  
  TestFile.CLOSE;  
END  
ELSE  
MESSAGE('%1 does not exist.', FileName);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)