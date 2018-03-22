---
title: "RENAME Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: db536d12-1c67-4db3-89dc-aa30d6794c30
caps.latest.revision: 12
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RENAME Method (File)
Renames an ASCII or binary file.  
  
## Syntax  
  
```  
  
[Ok :=]RENAME(OldName, NewName)  
```  
  
#### Parameters  
 *OldName*  
 Type: Text or Code.  
  
 The current name of the file that you want to change, including its path. When you enter the path, consider these shortcuts:  
  
-   You can omit the drive designation, if the file is located on the current drive.  
  
-   You can omit the full path, if the file is located in the current directory.  
  
-   You can enter only the subdirectory name, if the file is located in a subdirectory of the current directory.  
  
 *NewName*  
 Type: Text or Code  
  
 The new name that you want to assign to the file, including its path. When you enter the path, consider these shortcuts:  
  
-   You can omit the drive designation, if the file is located on the current drive.  
  
-   You can omit the full path, if the file is located in the current directory.  
  
-   You can enter only the subdirectory name, if the file is located in a subdirectory of the current directory.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If you omit this optional return value, a run-time error occurs when the file cannot be found. When you include the return value, it is assumed that you will handle any errors.  
  
 **true** if the file was renamed; otherwise, **false**.  
  
## Remarks  
 Typically the return value is **false** if the file does not exist, or if the file is a system or hidden file.  
  
## Example  
 The following example changes the name of a text file that is named Testfile.txt to NewTestFile.txt. The path of the file that is renamed is C:\\TestFolder\\Testfile.txt. The name and path are stored in the varOldFile variable. The new name and path of the file are stored the varNewfile variable. The RENAME method uses the variables to change the name of the file. This example assumes that you have created the following file on your computer: C:\\TestFolder\\Testfile.txt. This example requires that you create the following global variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|varOldfile|Text|  
|varNewfile|Text|  
  
```  
  
varOldfile := 'C:\TestFolder\Testfile.txt' ;  
varNewfile := 'C:\TestFolder\NewTestFile.txt';  
RENAME(varOldfile, varNewfile);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)