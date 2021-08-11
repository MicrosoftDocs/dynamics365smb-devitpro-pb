---
title: "MediaSet.ImportFile(String, String [, String]) Method"
description: "Adds a media, such as a JPEG image, to the MediaSet data type field of a record for displaying the media in the client."
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
# MediaSet.ImportFile(String, String [, String]) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a media, such as a JPEG image, to the MediaSet data type field of a record for displaying the media in the client. The media is imported to the database and included in a MediaSet for the record.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[ID := ]  MediaSet.ImportFile(Filename: String, Description: String [, MimeType: String])
```
## Parameters
*MediaSet*  
&emsp;Type: [MediaSet](mediaset-data-type.md)  
An instance of the [MediaSet](mediaset-data-type.md) data type.  

*Filename*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the full path and name of the media file to be imported.
        
*Description*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies text that can be used in the client to describe the media.
        
*[Optional] MimeType*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the media content type. MIME type is used by browsers, and is an Internet standard to describe the contents of a file. The MimeType value must be a two-part string that consists of a type and subtype, such as image/jpeg or image/gif. If this parameter is not specified, the function will deduct the MIME type from the file extension. For example the MIME type for a .jpg file is image/jpeg.
          


## Return Value
*[Optional] ID*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The unique ID that is assigned to the MediaSet of the record. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You use this method to upload a media file as part of a collection of media objects that you want to associate with a record. The method is similar to the [ImportFile Method \(Media\)](../../methods-auto/media/media-importfile-method.md) except that this method enables you to import multiple media files for the same record. For example, you can add multiple images for an item in table **27 Item**.

 When a media file is imported, a media object is created and stored in the system table **2000000181 Tenant Media** of the application database. The media object is assigned a unique identifier \(GUID\).

 In addition, the media object is assigned to a MediaSet which also has a specific GUID. This GUID is included in the MediaSet data type field as a reference to the media objects. The MediaSet and its GUID are created with the first media that is imported, and the information is stored in table **2000000183 Tenant Media Set**. All additional media objects for the record are then associated with the same MediaSet GUID.  

## Example  
This example uses the IMPORTFile method to add images to records in table **27 Item** of the [!INCLUDE[demolonglight_md](../../includes/demolonglight_md.md)].

In support of the example code, you alsmust complete these tasks:  

-   Create two sample image files that you want to use on item no. 1000 in table **27 Item**.

    Save the images as JPEG type, and give them the names 1000-v1.jpg and  1000-v2.jpg. Save the files in the *C:\images* folder on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance.

-   Verify that table **27 Item** has a field that is called **Picture** and has the data type **MediaSet**.

    This is field on which you will add the images. If the field is not present, then add it.

With these tasks in place, you can add the following AL code for importing the images. For this code example, create a codeunit, and add the code to the **OnRun** trigger.  

```al
 var
    itemRec: Record Item;
    count: Integer;
    mediasetId: GUID;
    Text000: Label 'The files have been imported. Item %1 has %2 pictures in MediaSet: %3';
begin
    itemRec.Get('1000');
    itemRec.Picture.ImportFile('C:\images\1000-v1.jpg', 'Demo image for item ' + Format(itemRec."No."));
    itemRec.Picture.ImportFile('C:\images\1000-v2.jpg', 'Demo image for item ' + Format(itemRec."No."));
    count := (itemRec.Picture.Count);
    mediasetId := itemRec.Picture.MediaId;  
    Message(Text000,itemRec."No.", count, mediasetId);   
end;
```  
If you run system table **2000000181 Tenant Media**, you should see the new images in the list.

## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)