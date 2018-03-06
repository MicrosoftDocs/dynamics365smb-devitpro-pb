---
title: "CLOSE Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fd9ff535-d12e-46d4-bda7-d120957e8b1c
caps.latest.revision: 8
---
# CLOSE Function (File)
Closes a file that has been opened by the [OPEN Function \(File\)](OPEN-Function--File-.md).  
  
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
 The following example determines whether the specified file exists. If it exists, the [WRITEMODE Function \(File\)](WRITEMODE-Function--File-.md) allows the file to be open for writing. The [OPEN Function \(File\)](OPEN-Function--File-.md) opens the file, the [WRITE Function \(File\)](WRITE-Function--File-.md) writes the text “Hello World” to the file, and then the CLOSE function closes the file. If the file does not exist, an error message is displayed. This example requires that you create the following variables in the **C/AL Globals** window. This example assumes that you have created the following file C:\\TestFolder\\TestFile2.txt.  
  
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
 [File Data Type](File-Data-Type.md)