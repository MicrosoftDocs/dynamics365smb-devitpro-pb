---
title: "WRITEMODE Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 92eee96d-882c-43ab-8ba3-bc9e3905505e
caps.latest.revision: 11
---
# WRITEMODE Function (File)
Use this function before you use [OPEN Function \(File\)](OPEN-Function--File-.md) to set or test whether you can write to a file in later calls.  
  
## Syntax  
  
```  
  
[IsWritemode :=] File.WRITEMODE([SetWritemode])  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Use this variable to refer to the file.  
  
 *SetWritemode*  
 Type: Boolean  
  
 This variable is used to set the mode that the file will be opened in when File.OPEN is called.  
  
 **true** if the file is open for reading and writing; otherwise, **false**, if the file is open only for reading.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 The current setting of this option for the file.  
  
 **true** if you can read from and write to the file; otherwise, **false** if you can only read from the file.  
  
## Remarks  
 This function should be used before [OPEN Function \(File\)](OPEN-Function--File-.md) is used to open the file.  
  
## Example  
 The following example opens a file in write mode and writes text to the file. The [WRITEMODE Function \(FILE\)](WRITEMODE-Function--File-.md) allows the text file that is named C:/TestFolder/TestFile.txt for to be written to by setting *SetWritemode* parameter to **true**. The [WRITE Function \(File\)](WRITE-Function--File-.md) writes the text ‘Hello World’ to the text file. The [CLOSE Function \(File\)](CLOSE-Function--File-.md) closes the file after the file is written to. This example assumes that you have created a text file that is named C:/TestFolder/TestFile.txt. This example requires that you create the following variable in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|TestFile|File|  
  
```  
  
TestFile.WRITEMODE(TRUE);  
TestFile.OPEN('C:/TestFolder/TestFile.txt');  
TestFile.WRITE('Hello World’);  
TestFile.CLOSE;  
```  
  
## See Also  
 [File Data Type](File-Data-Type.md)