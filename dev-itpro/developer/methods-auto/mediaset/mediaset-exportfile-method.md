---
title: "MediaSet.ExportFile Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# MediaSet.ExportFile Method
> **Version**: _Available or changed with runtime version 1.0._

Exports the media objects in the current media set of a record to individual files on your computer or network. In the record, the media set is referenced in a MediaSet data type field.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Count := ]  MediaSet.ExportFile(FilenamePrefix: String)
```
## Parameters
*MediaSet*
&emsp;Type: [MediaSet](mediaset-data-type.md)
An instance of the [MediaSet](mediaset-data-type.md) data type.

*FilenamePrefix*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the location and name of the exported media files. Each exported media file is given a name that consists of a prefix that you specify, plus an index number that is automatically assigned. The file name has the format prefix-index.type, for example, Image-1.jpg, Image-2.jpg, and Image-3.jpg. To set the parameter value, use the format: path\\prefix.type.
-   path is the folder path where you want to store the files.
-   prefix is the text that you want before the index number.
-   type is the media type extension.
          


## Return Value
*Count*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The number of exported elements. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The exported media files will be of the same media file type as when they were imported. For more information about the media types, see [Supported Media Types](../../devenv-working-with-media-on-records.md#SupportedMediaTypes).

The method has the following behavior:  

-   If a file that has the same name as the exported file already is located in the target folder and the current session has write access on the file, the existing file will be automatically replaced by the new file.  

-   If the export fails, the existing file will be erased.  

-   If a media in the media set cannot be found in the database, no file will be generated for this object.  

## Example  
This example first imports two media files \(JPEG image files\) from a local folder to the media set of a record in the table **27 Item** of the [!INCLUDE[demolonglight_md](../../includes/demolonglight_md.md)]. Then, using the EXPORTFile method, the media objects are exported to files again in another local folder.

For using media sets on records, the **Item** table includes a **MediaSet** data type field that is named **Picture**.  

 The code imports the JPEG image files \(.jpg\) from the folder *C:\images* to record *1000* in the **Item** table, and then exports the media files to the folder *C:\images\export*.  

```al
var
    itemRec: Record Item;
    count: Boolean;
    Text000: Label '%1 media files were exported.';
begin
    // Import image files the C:\images folder.  
    itemRec.Get('1000');
    itemRec.Picture.ImportFile('C:\images\1000-v1.jpg', 'Demo image for item ' + Format(itemRec."No."));
    itemRec.Picture.ImportFile('C:\images\1000-v2.jpg', 'Demo image for item ' + Format(itemRec."No."));
    itemRec.Modify;
    Commit;
    
    // Export the MediaSet to two separate image files in the c:\images\export folder.  
    itemRec.Get('1000');
    count := itemRec.Picture.ExportFile('C:\images\export\' + 'Item1000Image.jpg');   
    Message('%1 files exported.', count);
end;
```  

## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)