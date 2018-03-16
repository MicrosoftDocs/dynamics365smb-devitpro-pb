---
title: "InStream and OutStream Data Types"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d16b1998-7b14-4aca-9848-3882ca5a92f0
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---
# InStream and OutStream Data Types
Reads from or writes to files and BLOBs.  
  
## Remarks  
 The InStream (input stream) and OutStream (output stream) data types are generic stream objects that you can use to read from or write to files and BLOBs. <!-- In addition, the InStream and OutStream data types enable data to be read from and sent to [Automation Data Type](../../dynamics-nav/Automation-Data-Type.md) objects and [OCX Data Type](../../dynamics-nav/OCX-Data-Type.md) objects. The Microsoft XML DOM can read from an InStream object and write to an OutStream object. --> 
  
 You can define the internal structure of a stream as a flat stream of bytes. You can assign one stream to another. Reading from and writing to a stream occurs sequentially.  
  
 You can create a stream object by using the following methods:  
  
-   [CREATEINSTREAM method (BLOB)](../methods/devenv-createinstream-method-blob.md)  
  
-   [CREATEOUTSTREAM method (BLOB)](../methods/devenv-createoutstream-method-blob.md)  
  
-   [CREATEINSTREAM method (File)](../methods/devenv-createinstream-method-file.md)  
  
-   [CREATEOUTSTREAM method (File)](../methods/devenv-createoutstream-method-file.md)  
  
 You can use InStream in the following ways:  
  
-   [COPYSTREAM method](../methods/devenv-copystream-method.md)  
  
-   [InStream.READ method](../methods/devenv-instream.read-method.md)  
  
-   [InStream.EOS method](../methods/devenv-instream.eos-method.md)  
  
-   [InStream.READTEXT method](../methods/devenv-instream.readtext-method.md)  
  
 You can use OutStream in the following ways:  
  
-   [COPYSTREAM method](../methods/devenv-copystream-method.md)  
  
-   [OutStream.WRITE method](../methods/devenv-outstream-write-method.md)  
  
-   [OutStream.WRITETEXT method](../methods/devenv-outstream-writetext-method.md)

## See Also 
[AL Data Types](devenv-al-data-types.md)  