---
title: "SETSTAMP Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4fed0863-e6a1-4bb6-9291-05c527cc652e
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETSTAMP Method (File)
Sets a timestamp for a file.  
  
## Syntax  
  
```  
  
[Ok :=]SETSTAMP(Name, Date [, Time])  
```  
  
#### Parameters  
 *Name*  
 Type: Text or Code.  
  
 The name of the file, including its path. When you enter the path, keep in mind these shortcuts:  
  
-   You can omit the drive designation, if the file is located on the current drive.  
  
-   You can omit the full path, if the file is located in the current directory.  
  
-   You can enter only the subdirectory name, if the file is located in a subdirectory of the current directory.  
  
 *Date*  
 Type: Date  
  
 The date that you want stamped on the file.  
  
 *Time*  
 Type: Time  
  
 The time that you want stamped on the file.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If you omit this optional return value, a run-time error occurs if the file cannot be found. When you include the return value, you must handle any errors.  
  
 **true** if the timestamp was set; otherwise, **false**.  
  
## Example  
 The following example sets timestamp for that a file that is named varFileName. The date and time are set to the current date and on your computer respectively. The code example assumes that you have created the following file: 'C:\\MyFolder\\MyText.txt'. The following example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|varFileName|Text|  
|varDate|Date|  
|varTime|Time|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The timestamp for this file is Date: %1 Time: %2.|  
  
```  
  
VarFileName := 'C:\MyFolder\MyText.txt';  
varDate := TODAY;  
varTime := TIME;  
SETSTAMP(VarFileName, varDate, varTime);  
MESSAGE(Text000, varDate, varTime);  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)