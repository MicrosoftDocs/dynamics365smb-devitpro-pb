---
title: "CREATEINSTREAM Function (BLOB)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 71429124-96ba-49a5-bbd3-cdece8b1128e
caps.latest.revision: 13
manager: edupont
---
# CREATEINSTREAM Function (BLOB)
Creates an InStream object for a binary large object \(BLOB\). This enables you to read data from the BLOB.  
  
## Syntax  
  
```  
  
Blob.CreateInStream(Stream[,TextEncoding.value])  
```  
  
#### Parameters  
 *Blob*  
 Type: Variable  
  
 The BLOB variable for which you are creating the InStream object.  
  
 *Stream*  
 Type: InStream  
  
 The InStream object type that has been created.  
  
 *TextEncoding*  
 Value: **MsDos**, **UTF8**, **UTF16**, or **Windows**  
  
 Optionally, you can specify the encoding on the stream. By specifying the text encoding, you ensure that all the language-specific characters are represented correctly in [!INCLUDE[navnow](includes/navnow_md.md)] when you read data and write data. The following example illustrates how you can set the encoding to Windows when you create a stream for a BLOB field.  
  
```  
MyTable.MyBLOBfield.CREATEINSTREAM(MyStream, TextEncoding.WINDOWS)  
```  
  
 For more information, see [Text Encoding](Text-Encoding.md).  
  
## See Also  
 [BLOB Data Type](BLOB-Data-Type.md)   
 [InStream and OutStream Data Types](InStream-and-OutStream-Data-Types.md)   
 [Text Encoding](Text-Encoding.md)