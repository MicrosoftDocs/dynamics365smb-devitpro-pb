---
title: "NAME Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0ca23c95-ae41-4a04-a90a-3f26b09355a9
caps.latest.revision: 8
---
# NAME Function (File)
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
 You must use the [OPEN Function \(File\)](OPEN-Function--File-.md) to open the file before you can use this function.  
  
## Example  
 The following example opens a text file that is named C:\\TestFolder\\TestFile.txt. The [NAME Function \(FILE\)](NAME-Function--File-.md) retrieves the name and path of the text file and stores it in the varName variable. The value in the variable is displayed in a message box. This example assumes that you have created a text file named C:\\TestFolder\\TestFile.txt. This example requires that you create the following variables in the **C/AL Globals** window.  
  
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
 [File Data Type](File-Data-Type.md)