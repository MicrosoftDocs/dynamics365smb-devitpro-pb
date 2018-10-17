---
title: "CreateInStream Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2018
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
# CreateInStream Method
Creates an InStream object for a file. This enables you to import or read data from the file.

## Syntax
```
 File.CreateInStream(InStream: InStream)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*File*  
&emsp;Type: [File](file-data-type.md)  
An instance of the [File](file-data-type.md) data type.  

*InStream*  
&emsp;Type: [InStream](instream-data-type.md)  
  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example imports data from an XML document to a table. The code uses the [OPEN Method \(File\)](devenv-OPEN-Method-File.md) to open the XML document named NewCustomer.xml from a folder named Import on the C drive. The [CREATEINSTREAM Method \(FILE\)](devenv-CREATEINSTREAM-Method-File.md) creates a data stream to get the data from the XML document into the table. The [IMPORT Method \(XMLport\)](devenv-IMPORT-Method-XMLport.md) then imports, parses the data, and adds it as a record to the table by using an XMLport \(50004\). The [CLOSE Method \(File\)](devenv-CLOSE-Method-File.md) then closes the data stream. This example assumes that you have created a NewCustomer.xml file in a folder that is named Import on the C drive and you have created an XMLport and given it ID 50004. This example requires that you create the following global variables.  

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
[File Data Type](file-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)