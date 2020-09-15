---
title: "MediaSet.ImportStream Method"
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
# MediaSet.ImportStream Method
Adds a media file, such as a JPEG image, from an InStream object to the MediaSet of record for displaying in the client. The media is imported to the database and included in a MediaSet for the record.


## Syntax
```
[ID := ]  MediaSet.ImportStream(Stream: InStream, Description: String [, MimeType: String])
```
## Parameters
*MediaSet*  
&emsp;Type: [MediaSet](mediaset-data-type.md)  
An instance of the [MediaSet](mediaset-data-type.md) data type.  

*Stream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
Specifies the InStream object that contains the media that you want to use on the record.
        
*Description*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies text that can be used in the client to describe the media files.
        
*MimeType*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the media content type. MIME type is used by browsers, and is an Internet standard to describe the contents of a file. The MimeType value must be a two-part string that consists of a type and subtype, such as image/jpeg or image/gif. If this parameter is not specified, the function will deduct the MIME type from the file extension. For example the MIME type for a .jpg file is image/jpeg.
          


## Return Value
*ID*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The unique ID that is assigned to the MediaSet of the record. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can use this method to upload media that you want to associate with a record to the database. For example, you can upload media to items in table **27 Item**. The method is similar to the [ImportStream Method \(Media\)](../../methods-auto/media/media-importstream-instream-text-text-method.md) except that this method enables you to import multiple media objects on the same record.  

When a media is imported, it is assigned a unique identifier \(GUID\) and stored in the system table **2000000181 Tenant Media** of the application database.

In addition, the media object is assigned to a MediaSet which also has a specific GUID. This GUID is included in the MediaSet data type field as a reference to the media objects. The MediaSet and its GUID are created with the first media that is imported, and the information is stored in table **2000000183 Tenant Media Set**. All additional media objects for the record are then associated with the same MediaSet GUID.

## Example  
 This example uses the IMPORTSTREAM method to add images to records in table **27 Item** of the [!INCLUDE[demolonglight_md](../../includes/demolonglight_md.md)].

 To support the example code that follows, you also have to complete these tasks:  

- Create two sample image files that you want to use on item no. 1000 in table **27 Item**.

  Save the images as JPEG type, and give them the names 1000-v1.jpg and  1000-v2.jpg. Save the files in the *C:\images* folder on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance.

- Verify that table **27 Item** has a field that is called **Picture** and has the data type **MediaSet**.

  This is field on which you will add the images. If the field is not present, then add it.

With these tasks in place, you can add and run the following AL code to import the images. For this code example, create a codeunit and add the code to the OnRun trigger.  

```
 var
    itemRec: Record Item;
    count: Integer;
    fileName: Text;
    inStreamObject: InStream;
    importFile: File;
    mediasetId: GUID;
    Text000: Label 'The files have been imported. Item %1 has %2 pictures in MediaSet: %3';
begin
    itemRec.Get('1000');
    
    fileName := 'C:\images\1000-v1.jpg';
    importFile.Open(fileName);  
    importFile.CreateInStream(inStreamObject);  
    itemRec.Picture.ImportStream(inStreamObject, 'Demo image for item ' + Format(itemRec."No."));  
    itemRec.Modify;  
    importFile.Close;  
    
    fileName := 'C:\images\1000-v2.jpg';
    importFile.Open(fileName);  
    importFile.CreateInStream(inStreamObject);  
    itemRec.Picture.ImportStream(inStreamObject, 'Demo image for item ' + FORMAT(itemRec."No."));  
    itemRec.Modify;  
    importFile.Close;
    
    count := (itemRec.Picture.Count);
    mediasetId := itemRec.Picture.MediaId;  
    Message(Text000,itemRec."No.",count,mediasetId);  
end;
```  

If you run system table **2000000181 Tenant Media**, you should see the new images in the list.
## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)