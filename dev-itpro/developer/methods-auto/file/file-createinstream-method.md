---
title: "File.CreateInStream Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# File.CreateInStream Method
Creates an InStream object for a file. This enables you to import or read data from the file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

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
&emsp;Type: [InStream](../instream/instream-data-type.md)  
  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example imports data from an XML document to a table. The code uses the [OPEN Method \(File\)](../../methods-auto/file/file-open-method.md) to open the XML document named NewCustomer.xml from a folder named Import on the C drive. The [CREATEINSTREAM Method \(FILE\)](../../methods-auto/file/file-createinstream-method.md) creates a data stream to get the data from the XML document into the table. The [IMPORT Method \(XMLport\)](../../methods-auto/xmlport/xmlport-import-method.md) then imports, parses the data, and adds it as a record to the table by using an XMLport \(50004\). The [CLOSE Method \(File\)](../../methods-auto/file/file-close-method.md) then closes the data stream. This example assumes that you have created a NewCustomer.xml file in a folder that is named Import on the C drive and you have created an XMLport and given it ID 50004.
 
```
 var
    ImportXmlFile: File;
    XmlINStream: InStream;
begin
    ImportXmlFile.OPEN('C:\Import\NewCustomer.xml');  
    ImportXmlFile.CREATEINSTREAM(XmlINStream);  
    XMLPORT.IMPORT(50004, XmlINStream);  
    ImportXmlFile.CLOSE;  
end;

```  


## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)