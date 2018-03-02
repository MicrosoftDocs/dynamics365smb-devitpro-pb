---
title: "IMPORT Function (XMLport)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 61f13caf-681c-4ec0-8f03-021074e7c4dc
caps.latest.revision: 12
---
# IMPORT Function (XMLport)
Reads and parses an incoming XML data stream \(XML document\).  
  
## Syntax  
  
```  
  
[Ok :=] XMLPORT.IMPORT(Number, InStream[, Record])  
```  
  
#### Parameters  
 *Number*  
 Type: Integer  
  
 The ID of the XMLport that you want to run.  
  
 If the XMLport that you specify does not exist, a run-time error occurs.  
  
 *InStream*  
 Type: ISequentialStream  
  
 The source from which the import XMLport object will read the XML data stream.  
  
 *Record*  
 Type: Record  
  
 The record to use in the XMLport. Any filters that are attached to the record will be used.  
  
 This parameter is optional. If this parameter is omitted, all records in the table are imported.  
  
 For example, you can use this parameter to change the values of properties such as FieldSeparator or TextEncoding, depending on each record that is imported.  
  
## Example  
 The following example imports data from an XML document to a table. The code uses the [OPEN Function \(File\)](OPEN-Function--File-.md) to open the XML document named NewCustomer.xml from a folder named Import on the C: drive. The [CREATEINSTREAM Function \(File\)](CREATEINSTREAM-Function--File-.md) creates a data stream to get the data from the XML document to the table. The [IMPORT Function \(XMLPORT\)](IMPORT-Function--XMLport-.md) then imports, parses the data and adds it as a record to the table by using an XMLport \(50004\). The [CLOSE Function \(File\)](CLOSE-Function--File-.md) then closes the data stream. This example assumes that you have created a NewCustomer.xml file in a folder named Import on the C drive and you have created an XMLport and given it ID 50004. This example requires that you create the following variables in the **C/AL Globals** window.  
  
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
 [XMLport Data Type](XMLport-Data-Type.md)   
 [XMLport Walkthroughs](XMLport-Walkthroughs.md)