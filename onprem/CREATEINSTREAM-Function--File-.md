---
title: "CREATEINSTREAM Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4703bba6-70af-49a6-9700-033b24adfb7a
caps.latest.revision: 15
manager: edupont
---
# CREATEINSTREAM Function (File)
Creates an [InStream](InStream.md) object for a file. This enables you to import or read data from the file.  
  
## Syntax  
  
```  
  
File.CreateInStream(Stream)  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 The file that you want to create the [InStream](InStream.md) object for.  
  
 *Stream*  
 The [InStream](InStream.md) object that will be used to read or write the data to the file.  
  
## Example  
 The following example imports data from an XML document to a table. The code uses the [OPEN Function \(File\)](OPEN-Function--File-.md) to open the XML document named NewCustomer.xml from a folder named Import on the C drive. The [CREATEINSTREAM Function \(FILE\)](CREATEINSTREAM-Function--File-.md) creates a data stream to get the data from the XML document into the table. The [IMPORT Function \(XMLport\)](IMPORT-Function--XMLport-.md) then imports, parses the data, and adds it as a record to the table by using an XMLport \(50004\). The [CLOSE Function \(File\)](CLOSE-Function--File-.md) then closes the data stream. This example assumes that you have created a NewCustomer.xml file in a folder that is named Import on the C drive and you have created an XMLport and given it ID 50004. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|ImportXmlFile|File|  
|XmlINStream|InStream|  
  
```  
  
ImportXmlFile.OPEN('C:\Import\NewCustomer.xml');  
ImportXmlFile.CREATEINSTREAM(XmlINStream);  
XMLPORT.IMPORT(50004, XmlINStream);  
ImportXmlFile.CLOSE;  
  
```  
  
## See Also  
 [File Data Type](File-Data-Type.md)