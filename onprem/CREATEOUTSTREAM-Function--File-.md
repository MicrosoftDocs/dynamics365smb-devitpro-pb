---
title: "CREATEOUTSTREAM Function (File)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ec9c0df4-30e3-4481-8710-6756178b4b19
caps.latest.revision: 14
---
# CREATEOUTSTREAM Function (File)
Creates an [OutStream](OutStream.md) object for a file. This enables you to export or write data to the file.  
  
## Syntax  
  
```  
  
File.CreateOutStream(Stream)  
```  
  
#### Parameters  
 *File*  
 Type: File  
  
 Use this variable to refer to the file.  
  
 *Stream*  
 The OutStream object type that has been created.  
  
 For more information, see [How to: Use Streams to Write to Text Files](How-to--Use-Streams-to-Write-to-Text-Files.md).  
  
## Example  
 The following example uses the CREATEOUTSTREAM function to export data from a table to an XML document. The code uses the [CREATE Function \(File\)](CREATE-Function--File-.md) to create an XML file that is named CustXmlFile.xml in a folder that is named xmlData on drive C. The [CREATEOUTSTREAM Function \(FILE\)](CREATEOUTSTREAM-Function--File-.md) opens a data stream to output the data from the table to the XML file. The [EXPORT Function \(XMLport\)](EXPORT-Function--XMLport-.md) then exports the data and saves it at the specified location. The [CLOSE Function \(File\)](CLOSE-Function--File-.md) closes the data stream. This example assumes that you have created a folder named xmlData on drive C. This example requires that you create the following variables in the **C/AL Globals** window.  
  
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
 [File Data Type](File-Data-Type.md)