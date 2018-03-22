---
title: "EXPORT Method (XMLport)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f7a4a790-11a9-4dc3-a258-d0bd5dc3b5f1
caps.latest.revision: 9
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# EXPORT Method (XMLport)
Creates an XML data stream \(XML document\) and sends it to a chosen destination.  
  
## Syntax  
  
```  
  
[Ok :=] XMLPORT.EXPORT(Number, OutStream[, Record])  
```  
  
#### Parameters  
 *Number*  
 Type: Integer  
  
 The ID of the XMLport that you want to run.  
  
 Instead of the ID number, you can specify the name of the XMLport by using the following syntax: `XMLPORT.EXPORT(XMLPORT::CustomerXMLport, XmlStream)`. <!--Links For more information, see [Walkthrough: Exporting Data from Tables to XML Documents](Walkthrough--Exporting-Data-from-Tables-to-XML-Documents.md).-->  
  
 *OutStream*  
 Type: ISequentialStream  
  
 Where the XMLport object will write the XML data stream.  
  
 *Record*  
 Type: Record  
  
 The record to use in the XMLport. Any filters attached to the record will be used.  
  
 This parameter is optional. If this parameter is omitted, all records in the table are exported.  
  
## Example  
 The following example exports data from a table to an XML document. The code uses the [CREATE Method \(File\)](devenv-CREATE-Method-File.md) to create an XML file named CustXmlFile.xml in a folder named xmlData on the C drive. The [CREATEOUTSTREAM Method \(File\)](devenv-CREATEOUTSTREAM-Method-File.md) opens a data stream to output the data from the table to the XML file. The [EXPORT Method \(XMLPORT\)](devenv-EXPORT-Method-XMLport.md) then exports the data and saves it at the specified location. The [CLOSE Method \(File\)](devenv-CLOSE-Method-File.md) closes the data stream. This example assumes that you have created a folder named xmlData on the C drive. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustXmlFile|File|Not applicable|  
|XmlStream|OutStream|Not applicable|  
|varXmlPort|XMLport|50002<br /><br /> This inserts the name of the XMLport.|  
  
```  
  
CustXmlFile.CREATE('C:\XmlData\Customer.xml');  
CustXmlFile.CREATEOUTSTREAM(XmlStream);  
XMLPORT.EXPORT(50002, XmlStream);  
CustXmlFile.CLOSE;  
  
```  
  
## See Also  
 [XMLport Data Type](../datatypes/devenv-XMLport-Data-Type.md)   
 [XMLports object](../devenv-XMLport-object.md)  