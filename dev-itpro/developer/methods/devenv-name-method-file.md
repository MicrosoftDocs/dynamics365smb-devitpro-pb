---
title: "NAME Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 0ca23c95-ae41-4a04-a90a-3f26b09355a9
caps.latest.revision: 8
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# NAME Method (File)
Gets the name of an ASCII or binary file.  
  
## Syntax  
  
```  
  
Name := File.NAME  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Use this variable to refer the file.  
  
## Property Value/Return Value  
 Type: Text or Code  
  
 This string contains the name of the file, including its path.  
  
## Remarks  
 You must use the [OPEN Method \(File\)](devenv-OPEN-Method-File.md) to open the file before you can use this method.  
  
## Example  
 The following example opens a text file that is named C:\\TestFolder\\TestFile.txt. The [NAME Method \(FILE\)](devenv-NAME-Method-File.md) retrieves the name and path of the text file and stores it in the varName variable. The value in the variable is displayed in a message box. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt. This example requires that you create the following global variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|TestFile|File|  
|varName|Text|  
  
```  
  
TestFile.OPEN('C:\TestFolder\TestFile.txt');  
varName := TestFile.NAME;  
MESSAGE('The name of the file is: %1',varName);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)