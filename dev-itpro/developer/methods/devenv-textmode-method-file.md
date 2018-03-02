---
title: "TEXTMODE Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 783b903e-a1a4-420f-9004-44ab1830c3c7
caps.latest.revision: 14
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TEXTMODE Method (File)
Sets whether a file should be opened as an ASCII file or a binary file. Gets the current setting of this option for a file.  
  
## Syntax  
  
```  
  
[IsTextmode := File.TEXTMODE([SetTextmode])  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Specifies the file.  
  
 *SetTextmode*  
 Type: Boolean  
  
 Specifies the mode in which the file will be opened when File.OPEN is called.  
  
 If *SetTextmode* is **true**, the file will be opened as an ASCII file. If *SetTextmode* is **false**, the file will be opened as a binary file.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 The current setting of this option for the file.  
  
 **true** if the file will be opened as an ASCII file; otherwise, **false** if the file will be opened as a binary file.  
  
## Remarks  
 This method should be used before File.OPEN is used to open the file. If you use this method on a file that is already open, then an error occurs.  
  
## Example  
 The following example sets the TEXTMODE to **true** when the file is open for writing. This means the file contents will be written to a text file that is named 'C:\\TestFolder\\TestFile.txt' by using ASCII characters. The [WRITEMODE Method \(File\)](devenv-WRITEMODE-Method-File.md) and the [OPEN Method \(File\)](devenv-OPEN-Method-File.md) open the file for writing and the text ‘Hello World’ is written. The [CLOSE Method \(File\)](devenv-CLOSE-Method-File.md) closes the file after the file is written to. This example requires that you create the following global variable. This example assumes that you have created a text file that is named C:\\TestFolder\\TestFile.txt.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|TestFile|File|  
  
```  
TestFile.TEXTMODE(TRUE);  
TestFile.WRITEMODE(TRUE);  
TestFile.OPEN('C:\TestFolder\TestFile.txt');  
TestFile.WRITE('Hello World');  
TestFile.CLOSE;  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)