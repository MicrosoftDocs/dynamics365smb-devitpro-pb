---
title: "LEN Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 155e83e1-8d2c-4f5a-b9c1-69ffc985cb49
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# LEN Method (File)
Gets the length of an ASCII or binary file.  
  
## Syntax  
  
```  
  
Length := File.LEN  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Use this variable to refer to the file.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The length of the file in bytes.  
  
## Remarks  
 This method is often used with [POS Method \(File\)](devenv-POS-Method-File.md) and [SEEK Method \(File\)](devenv-SEEK-Method-File.md).  
  
## Example  
 The following example opens a text file that is named 'C:\\TestFolder\\TestFile.txt' and contains the text ‘Hello World’. The [SEEK Method \(File\)](devenv-SEEK-Method-File.md) sets a pointer to position 6 in the file. The [READ Method \(File\)](devenv-READ-Method-File.md) reads the file and stores the retrieved contents in the varString variable. The LEN method retrieves the length of the file and stores it the varLength variable. The text that is read starts from the position of the pointer, so the text ‘World’ and the length of 12 are displayed in the message box. The length of the file is not affected by the [SEEK Method \(File\)](devenv-SEEK-Method-File.md). This example assumes that you have created the text file that is named C:\\TestFolder\\TestFile.txt and contains the text ‘Hello World’. This example requires that you create the following global variables.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|Testfile|File|Not applicable|  
|varString|Text|200|  
|varLength|Integer|Not applicable|  
  
```  
Testfile.OPEN('C:\TestFolder\TestFile.txt');  
Testfile.SEEK(6);  
Testfile.READ(varString);  
varLength := Testfile.LEN;  
MESSAGE('The text is: %1. The length of the file is: %2', varString, varLength);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)