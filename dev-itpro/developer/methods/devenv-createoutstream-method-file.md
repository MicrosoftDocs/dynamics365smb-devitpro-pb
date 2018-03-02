---
title: "CREATEOUTSTREAM Method (File)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: ec9c0df4-30e3-4481-8710-6756178b4b19
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CREATEOUTSTREAM Method (File)
Creates an OutStream object for a file. This enables you to export or write data to the file.  

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

 <!--Links For more information, see [How to: Use Streams to Write to Text Files](How-to--Use-Streams-to-Write-to-Text-Files.md).  -->

## Example  
 The following example uses the CREATEOUTSTREAM method to export data from a table to an XML document. The code uses the [CREATE Method \(File\)](devenv-CREATE-Method-File.md) to create an XML file that is named CustXmlFile.xml in a folder that is named xmlData on drive C. The [CREATEOUTSTREAM Method \(FILE\)](devenv-CREATEOUTSTREAM-Method-File.md) opens a data stream to output the data from the table to the XML file. The [EXPORT Method \(XMLport\)](devenv-EXPORT-Method-XMLport.md) then exports the data and saves it at the specified location. The [CLOSE Method \(File\)](devenv-CLOSE-Method-File.md) closes the data stream. This example assumes that you have created a folder named xmlData on drive C. This example requires that you create the following global variables.  

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
 [File Data Type](../datatypes/devenv-File-Data-Type.md)
