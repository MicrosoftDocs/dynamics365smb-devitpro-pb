---
title: "CreateOutStream Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# CreateOutStream Method
Creates an OutStream object for a file. This enables you to export or write data to the file.

## Syntax
```
 File.CreateOutStream(OutStream: OutStream)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*File*  
&emsp;Type: [File](file-data-type.md)  
An instance of the [File](file-data-type.md) data type.  

*OutStream*  
&emsp;Type: [OutStream](outstream-data-type.md)  
  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[File Data Type](file-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)