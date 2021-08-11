---
title: "File.CreateOutStream(OutStream) Method"
description: "Creates an OutStream object for a file."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# File.CreateOutStream(OutStream) Method
> **Version**: _Available or changed with runtime version 1.0._

Creates an OutStream object for a file. This enables you to export or write data to the file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 File.CreateOutStream(OutStream: OutStream)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*File*  
&emsp;Type: [File](file-data-type.md)  
An instance of the [File](file-data-type.md) data type.  

*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

The following example uses the CreateOUTSTREAM method to export data from a table to an XML document. The code uses the [Create Method \(File\)](../../methods-auto/file/file-create-method.md) to create an XML file that is named CustXmlFile.xml in a folder that is named xmlData on drive C. The [CreateOUTSTREAM Method \(File\)](../../methods-auto/file/file-createoutstream-method.md) opens a data stream to output the data from the table to the XML file. The [Export Method \(XMLport\)](../../methods-auto/xmlport/xmlport-export-method.md) then exports the data and saves it at the specified location. The [Close Method \(File\)](../../methods-auto/file/file-close-method.md) closes the data stream. This example assumes that you have created a folder named xmlData on drive C. 

```al
 var
    CustXmlFile: File;
    XmlStream: OutStream;
begin
    CustXmlFile.Create('C:\XmlData\Customer.xml');  
    CustXmlFile.CreateOUTSTREAM(XmlStream);  
    XMLPORT.Export(50002, XmlStream);  
    CustXmlFile.Close;  
end;

```  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)