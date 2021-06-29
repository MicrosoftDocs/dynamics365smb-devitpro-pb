---
title: "Media.ExportFile Method"
description: "Exports the media object (such as an image) that is currently used on record to a file on your computer or network. On the record, the media object is referenced in a Media data type field."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# Media.ExportFile Method
> **Version**: _Available or changed with runtime version 1.0._

Exports the media object (such as an image) that is currently used on record to a file on your computer or network. On the record, the media object is referenced in a Media data type field.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Result := ]  Media.ExportFile(Filename: String)
```
## Parameters
*Media*  
&emsp;Type: [Media](media-data-type.md)  
An instance of the [Media](media-data-type.md) data type.  

*Filename*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the full path and name of the file to create for the exported media.  


## Return Value
*[Optional] Result*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the media was successfully exported, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The exported media file will be of the same media type, such as JPEG \(.jpg\) or GIF \(.gif\), as it was when imported.  For more information about the media types, see [Supported Media Types](../../devenv-working-with-media-on-records.md#SupportedMediaTypes).  

 If a file with the same name as the exported file already exists in the target folder and the current session has write access on the file, the existing file will be automatically replaced by the new file. If the export fails, the existing file will be erased. 

## Example  
 This example uses the ExportFile method to export media objects that are used on records in a sample table that is named **My Items**. Each media object is exported to a separate file in a  folder on your computer.  

 The example assumes that the **My Items** table already exists. Also, the table contains a **Media** data type field that is named **Image**, and one or more records already include media. For information about importing media, see [ImportFile Method \(Media\)](../../methods-auto/media/media-importfile-method.md) or [ImportStream Method \(Media\)](../../methods-auto/media/media-importstream-instream-text-text-method.md).  

The code iterates over records in the **My Items** table. If a media object is referenced in the *Image* field, the media is exported to a file in the *C:\images* folder. The file is given a name in the format *ItemNN.jpg*, where *NN* is the number assigned to item record in the table, as specified by the **No.** field.

```  
 var
    myItemRec: Record "My Items";
    fileName: Text;
    count: Integer;
    Text000: Label '%1 media files were exported';
begin
    if myItemRec.FindFirst() then begin
        repeat begin 
            fileName := 'C:\images\' + 'Item' + Format(myItemRec."No.") + '.jpg';  
            if myItemRec.Image.ExportFile(fileName) then
                count := count + 1
        end until myItemRec.Next < 1;
        Message(Text000, count);  
    end;
end;
```  


## See Also
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)