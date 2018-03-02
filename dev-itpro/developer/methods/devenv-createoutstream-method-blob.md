---
title: "CREATEOUTSTREAM Method (BLOB)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d643906e-0dc6-4e44-a33f-79beaf6c8b94
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CREATEOUTSTREAM Method (BLOB)
Creates an OutStream object for a binary large object \(BLOB\). This enables you to write data to the BLOB.  
  
## Syntax  
  
```  
  
Blob.CreateOutStream(Stream [,TextEncoding.value])  
```  
  
#### Parameters  
 *Blob*  
 Type: Variable  
  
 The BLOB variable for which you are creating the OutStream object.  
  
 *Stream*  
 Type: OutStream  
  
 The OutStream object type that has been created.  
  
 *TextEncoding*  
 Value: **MsDos**, **UTF8**, **UTF16**, or **Windows**  
  
 Optionally, you can specify the encoding on the stream. By specifying the [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md), you ensure that all the language-specific characters are represented correctly in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] when you read data and write data. The following example illustrates how you can set the encoding to Windows when you create a stream for a BLOB field.  
  
```  
MyTable.MyBLOBfield.CREATEOUTSTREAM(MyStream, TextEncoding.WINDOWS)  
```  
  
 For more information, see [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md).  
  
## See Also  
 [BLOB Data Type](../datatypes/devenv-BLOB-Data-Type.md)   
 [InStream and OutStream Data Types](../datatypes/devenv-InStream-and-OutStream-Data-Types.md)   
 <!--Links [How to: Use Streams to Write to Text Files](How-to--Use-Streams-to-Write-to-Text-Files.md)-->  
 [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md)