---
title: "BLOB Data Type"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/07/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 09f7efd9-541f-4eae-b6e3-70576bfa0ca1
caps.latest.revision: 15
---
# BLOB Data Type
A binary large object (BLOB) is a complex data type. Variables of this data type differ from normal numeric and string variables in that BLOBs have a variable length.  

 The maximum size of a BLOB is 2 GB.  

## Remarks  
 Use BLOBs to store memos (text), pictures (bitmaps), or user-defined types.  

> [!NOTE]  
>  You cannot view text that is stored in BLOBs from the development environment.  

 You can read from and write to BLOBs by creating input and output streams, respectively. To do so, use [CREATEINSTREAM method (BLOB)](../methods/devenv-createinstream-method-blob.md) and [CREATEOUTSTREAM method (BLOB)](../methods/devenv-createoutstream-method-blob.md).  

 For more information, see [InStream and OutStream Data Types](devenv-instream-and-outstream-data-types.md).  

 To optimize performance, when you access a record that has a BLOB field, the data in the BLOB is not always read into memory. You must call the [CALCFIELDS method (Record)](../methods/devenv-calcfields-method-record.md) to read the BLOB into memory and calculate it. Then you can use the BLOB in AL code or display it in the application.  

 It is not supported to insert a BLOB field into a Variant.  

 It is not supported for a page to access a BLOB field from a table other than the SourceTable of the page.  

## Methods
The methods supported for the BLOB data type are:

[CREATEINSTREAM method (BLOB)](../methods/devenv-createinstream-method-blob.md)  
[CREATEOUTSTREAM method (BLOB)](../methods/devenv-createoutstream-method-blob.md)  
[EXPORT method (BLOB)](../methods/devenv-export-method-blob.md)  
[HASVALUE method (BLOB)](../methods/devenv-hasvalue-method-blob.md)   

## See Also  
[AL Data Types](devenv-al-data-types.md)  
[Variant Data Type](devenv-variant-data-type.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  