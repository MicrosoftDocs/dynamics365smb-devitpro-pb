---
title: "GETSTAMP Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: ea6f66fd-e3f2-47b2-b6bb-0cf084968c22
caps.latest.revision: 14
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETSTAMP Method (File)
Gets the exact time that a file was last written to.  
  
## Syntax  
  
```  
  
[Ok :=] GETSTAMP(Name, Date [, Time])  
```  
  
#### Parameters  
 *Name*  
 Type: Code or Text  
  
 The name of the file, including the path. When you enter the path, consider these shortcuts:  
  
-   You can omit the drive designation if the file is located on the current drive.  
  
-   You can omit the full path if the file is located in the current directory.  
  
-   You can enter only the subdirectory name if the file is located in a subdirectory of the current directory.  
  
 *Date*  
 Type: Date  
  
 The date that the file was last written to.  
  
 *Time*  
 Type: Time  
  
 \(Optional\) The time that the file was last written to.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If you omit this optional return value, then a run-time error occurs when the file cannot be found. When you include the return value, you must handle any errors. The return value can have these values:  
  
 **true** if the file exists and the method completes successfully; otherwise, **false**.  
  
## Example  
 The following example gets the date and time that a file was written to and displays the data in a message box. The code example assumes that you have created the file 'C:\\MyFolder\\MyText.txt'. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|varFileName|Text|  
|varDate|Date|  
|varTime|Time|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|This document was last written to on %1 at %2.|  
  
```  
varFileName := 'C:\MyFolder\MyText.txt';  
GETSTAMP(VarFileName, varDate, varTime);  
MESSAGE(Text000, varDate, varTime);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)