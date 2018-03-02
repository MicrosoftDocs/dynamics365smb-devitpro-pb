---
title: "CREATETEMPFILE Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e4b7bbcf-608a-406f-87ce-24ad045109b9
caps.latest.revision: 14
manager: edupont
---
# CREATETEMPFILE Function (File)
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
  
 Optionally, you can specify the encoding on the file. By specifying the text encoding, you ensure that all the language-specific characters are represented correctly in [!INCLUDE[navnow](includes/navnow_md.md)] when you read data and write data.  
  
 For more information, see [Text Encoding](Text-Encoding.md).  
  
## Remarks  
 You can use this function together with [NAME Function \(File\)](NAME-Function--File-.md) and [CLOSE Function \(File\)](CLOSE-Function--File-.md).  
  
## Example  
 This example creates a temporary file that has the text Hello and then deletes the file by using the File.CLOSE function. This example requires that you create the following variable.  
  
|Variable|DataType|  
|--------------|--------------|  
|FileName|File|  
  
```  
FileName.CREATETEMPFILE;  
FileName.WRITE('Hello');  
FileName.CLOSE;  
```  
  
## See Also  
 [File Data Type](File-Data-Type.md)   
 [Text Encoding](Text-Encoding.md)