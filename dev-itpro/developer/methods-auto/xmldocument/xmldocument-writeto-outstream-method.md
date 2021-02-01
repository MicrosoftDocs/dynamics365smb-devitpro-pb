---
title: "XmlDocument.WriteTo Method"
ms.author: solsen
ms.custom: na
ms.date: 12/07/2020
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
# XmlDocument.WriteTo Method
> **Version**: _Available from runtime version 1.0._

Serializes and saves the current node to the given variable.


## Syntax
```
[Ok := ]  XmlDocument.WriteTo(OutStream: OutStream)
```
## Parameters
*XmlDocument*
&emsp;Type: [XmlDocument](xmldocument-data-type.md)
An instance of the [XmlDocument](xmldocument-data-type.md) data type.

*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The OutStream to which you want to save the serialized representation of the node.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Example

The following example illustrates how to create a Stream from a Blob and write to a Stream from an XML document.

```al
pageextension 50100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    var
        xmlDoc: XmlDocument;
        xmlDec: XmlDeclaration;
        xmlElem: XmlElement;
        xmlElem2: XmlElement;
        TempBlob: Record TempBlob Temporary;
        outStr: OutStream;
        inStr: InStream;
        TempFile: File;
        fileName: Text;
    begin
        xmlDoc := xmlDocument.Create();
        xmlDec := xmlDeclaration.Create('1.0', 'UTF-8', '');
        xmlDoc.SetDeclaration(xmlDec);

        xmlElem := xmlElement.Create('root');
        xmlElem.SetAttribute('release', '2.1');

        xmlElem2 := XmlElement.Create('FirstName');
        xmlElem2.Add(xmlText.Create('Max'));

        xmlElem.Add(xmlElem2);
        xmlDoc.Add(xmlElem);

        // Create an outStream from the Blob, notice the encoding.
        TempBlob.CreateOutStream(outStr, TextEncoding::UTF8);

        // Write the contents of the doc to the stream
        xmlDoc.WriteTo(outStr);

         // From the same Blob, that now contains the XML document, create an inStr
        TempBlob.CreateInStream(inStr, TextEncoding::UTF8);

        // Save the data of the InStream as a file.
        File.DownloadFromStream(inStr, 'Export', '', '', fileName);
    end;
}
```


## See Also
[XmlDocument Data Type](xmldocument-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)