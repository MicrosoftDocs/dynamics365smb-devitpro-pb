---
title: InStream and OutStream Data Types
description: The InStream is an input stream and OutStream is an output stream, these data types are generic stream objects to read from or write to files and BLOBs. 
ms.custom: na
ms.date: 10/27/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d16b1998-7b14-4aca-9848-3882ca5a92f0
caps.latest.revision: 9
---
# InStream and OutStream Data Types in Dynamics NAV
Reads from or writes to files and BLOBs.  
  
## Remarks  
 The InStream \(input stream\) and OutStream \(output stream\) data types are generic stream objects that you can use to read from or write to files and BLOBs. In addition, the InStream and OutStream data types enable data to be read from and sent to [Automation Data Type](Automation-Data-Type.md) objects and [OCX Data Type](OCX-Data-Type.md) objects. The Microsoft XML DOM can read from an InStream object and write to an OutStream object.  
  
 You can define the internal structure of a stream as a flat stream of bytes. You can assign one stream to another. Reading from and writing to a stream occurs sequentially.  
  
 You can create a stream object by using the following functions:  
  
-   [CREATEINSTREAM Function \(BLOB\)](CREATEINSTREAM-Function--BLOB-.md)  
  
-   [CREATEOUTSTREAM Function \(BLOB\)](CREATEOUTSTREAM-Function--BLOB-.md)  
  
-   [CREATEINSTREAM Function \(File\)](CREATEINSTREAM-Function--File-.md)  
  
-   [CREATEOUTSTREAM Function \(File\)](CREATEOUTSTREAM-Function--File-.md)  
  
 You can use InStream in the following ways:  
  
-   [COPYSTREAM Function](COPYSTREAM-Function.md)  
  
-   [InStream.READ Function](InStream.READ-Function.md)  
  
-   [InStream.EOS Function](InStream.EOS-Function.md)  
  
-   [InStream.READTEXT Function](InStream.READTEXT-Function.md)  
  
 You can use OutStream in the following ways:  
  
-   [COPYSTREAM Function](COPYSTREAM-Function.md)  
  
-   [OutStream.WRITE Function](OutStream-WRITE-Function.md)  
  
-   [OutStream.WRITETEXT Function](OutStream-WRITETEXT-Function.md)