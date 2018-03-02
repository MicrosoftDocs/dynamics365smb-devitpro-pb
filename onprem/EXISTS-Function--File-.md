---
title: "EXISTS Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: aa5edf16-0e5e-4bd2-bd8b-e7e6f3da3f3c
caps.latest.revision: 12
---
# EXISTS Function (File)
Determines whether a file exists.  
  
## Syntax  
  
```  
  
[Ok :=] EXISTS(Name)  
```  
  
#### Parameters  
 *Name*  
 Type: Text or code  
  
 The name of the file that you want to check. This includes the path. When you enter the path, consider these shortcuts:  
  
-   You can omit the drive designation if the file is located on the current drive.  
  
-   You can omit the full path if the file is located in the current directory.  
  
-   You can enter only the subdirectory name if the file is located in a subdirectory of the current directory.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 This return value shows whether the file exists.  
  
 **true** if the file exists; otherwise, **false**.  
  
## Example  
 The following example uses the EXISTS function to determine whether the specified file exists. If the file exists, then the [WRITEMODE Function \(File\)](WRITEMODE-Function--File-.md) allows the file to be open for writing. The [OPEN Function \(File\)](OPEN-Function--File-.md) opens the file, the [WRITE Function \(File\)](WRITE-Function--File-.md) writes the text “Hello World” to the file, and then the [CLOSE Function \(File\)](CLOSE-Function--File-.md) function closes the file. If the file does not exist, an error message is displayed. This example requires that you create the following variables in the **C/AL Globals** window. This example assumes that you have created the following file C:\\TestFolder\\TestFile2.txt.  
  
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