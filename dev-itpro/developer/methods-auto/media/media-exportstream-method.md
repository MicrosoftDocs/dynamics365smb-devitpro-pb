---
title: "Media.ExportStream(OutStream) Method"
description: "Exports the current media object (such as a JPEG image) that is used on record to an OUTSTREAM object."
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
# Media.ExportStream(OutStream) Method
> **Version**: _Available or changed with runtime version 1.0._

Exports the current media object (such as a JPEG image) that is used on record to an OUTSTREAM object. The OUTSTREAM object can be created from a BLOB field, a FILE or from a .NET Framework interoperability object. In the record, the media is referenced in a Media data type field.


## Syntax
```AL
[Result := ]  Media.ExportStream(Stream: OutStream)
```
## Parameters
*Media*  
&emsp;Type: [Media](media-data-type.md)  
An instance of the [Media](media-data-type.md) data type.  

*Stream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The OutStream object that is created by the object that will receive the media content.  


## Return Value
*[Optional] Result*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the media was successfully exported, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example uses the ExportStream to iterate over a sample table named **My Items** table and export any media that is used on records to an OutStream that is created on a file object.  

 This example assumes that the **My Item** table contains a **Media** data type field that is named **Image**, and that you have already imported some media on records. For information about importing media, see [ImportFile Method \(Media\)](../../methods-auto/media/media-importfile-method.md) or [ImportStream Method \(Media\)](../../methods-auto/media/media-importstream-instream-text-text-method.md).  

```al
 var
    myItemRec: Record "My Items";
    fileName: Text;
    count: Integer;
    exportFile: File;
    dataOutStream: OutStream;
    Text000: Label '%1 media files were exported';
begin
    if myItemRec.FindFirst() then begin  
        repeat begin
            if myItemRec.Image.HasValue then begin
              fileName := 'C:\images\export\' + 'ItemPictureFromStream' + Format(myItemRec."No.") + '.jpg';  
              exportFile.Create(fileName);  
              exportFile.CreateOutstream(dataOutStream);
              myItemRec.Image.ExportStream(dataOutStream);
              count := count + 1;  
              exportFile.Close;
            end;
        end until myItemRec.Next < 1;
        Message(Text000, count);
    end;  
end;
    
```  

## See Also
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)