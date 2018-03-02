---
title: "CREATEOUTSTREAM Function (BLOB)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d643906e-0dc6-4e44-a33f-79beaf6c8b94
caps.latest.revision: 16
manager: edupont
---
# CREATEOUTSTREAM Function (BLOB)
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
  
 Optionally, you can specify the encoding on the stream. By specifying the text encoding, you ensure that all the language-specific characters are represented correctly in [!INCLUDE[navnow](includes/navnow_md.md)] when you read data and write data. The following example illustrates how you can set the encoding to Windows when you create a stream for a BLOB field.  
  
```  
MyTable.MyBLOBfield.CREATEOUTSTREAM(MyStream, TextEncoding.WINDOWS)  
```  
  
 For more information, see [Text Encoding](Text-Encoding.md).  
  
## See Also  
 [BLOB Data Type](BLOB-Data-Type.md)   
 [InStream and OutStream Data Types](InStream-and-OutStream-Data-Types.md)   
 [How to: Use Streams to Write to Text Files](How-to--Use-Streams-to-Write-to-Text-Files.md)   
 [Text Encoding](Text-Encoding.md)