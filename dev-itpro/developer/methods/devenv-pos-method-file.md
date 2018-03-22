---
title: "POS Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: eddb80ee-90a1-4657-a55f-b531bc363270
caps.latest.revision: 7
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# POS Method (File)
Gets the current position of the file pointer in an ASCII or binary file.  
  
## Syntax  
  
```  
  
Position := File.POS  
```  
  
#### Parameters  
 *File*  
 Type: file  
  
 Use this variable to refer to the file.  
  
## Property Value/Return Value  
 Type: Integer  
  
 This show the current position of the file pointer in bytes.  
  
## Remarks  
 This method is often used with [LEN Method \(File\)](devenv-LEN-Method-File.md) and [SEEK Method \(File\)](devenv-SEEK-Method-File.md).  
  
## Example  
 The following example opens a text file that is named C:\\TestFolder\\TestFile.txt. The [WRITEMODE Method \(File\)](devenv-WRITEMODE-Method-File.md) enables the file to be open in write mode. The POS method retrieves the position of the file pointer and stores it in the Position variable. When the file is open, the position of the pointer is 0 because a pointer is not set. The [SEEK Method \(File\)](devenv-SEEK-Method-File.md) method sets a file pointer at position 5. After the [SEEK Method \(File\)](devenv-SEEK-Method-File.md) is executed, the POS method returns 5 as the file pointer position. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt. This example requires that you create the following global variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|TestFile|File|  
|Position|Integer|  
  
```  
  
TestFile.WRITEMODE(TRUE);  
TestFile.OPEN('C:\TestFolder\TestFile.txt');  
Position := TestFile.POS;  
MESSAGE('Pointer position before SEEK: %1', Position);  
Testfile.SEEK(5);  
Position := Testfile.POS;  
MESSAGE('Pointer position after SEEK: %1', Position);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)