---
title: "CREATETEMPFILE Method (File)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e4b7bbcf-608a-406f-87ce-24ad045109b9
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CREATETEMPFILE Method (File)
Creates a temporary file. This enables you to save data of any format to a temporary file. This file has a unique name and will be stored in a temporary file folder.  
  
## Syntax  
  
```  
  
File.CreateTempFile[(TextEncoding.value)]  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Use this variable to refer to the file.  
  
 *TextEncoding*  
 Value: **MsDos**, **UTF8**, **UTF16**, or **Windows**  
  
 Optionally, you can specify the encoding on the file. By specifying the [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md), you ensure that all the language-specific characters are represented correctly in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] when you read data and write data.  
  
 For more information, see [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md).  
  
## Remarks  
 You can use this method together with [NAME Method \(File\)](devenv-NAME-Method-File.md) and [CLOSE Method \(File\)](devenv-CLOSE-Method-File.md).  
  
## Example  
 This example creates a temporary file that has the text Hello and then deletes the file by using the File.CLOSE method. This example requires that you create the following variable.  
  
|Variable|DataType|  
|--------------|--------------|  
|FileName|File|  
  
```  
FileName.CREATETEMPFILE;  
FileName.WRITE('Hello');  
FileName.CLOSE;  
```  
  
## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)   
 [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md)