---
title: "Media.ImportFile Method"
description: "Adds a media type, such as a JPEG image, from a file to a Media data type field of a record for displaying the media with the record in the client."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Media.ImportFile Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a media type, such as a JPEG image, from a file to a Media data type field of a record for displaying the media with the record in the client. The media file is imported to the application database, and a reference to the media is included in the Media data type field.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[ID := ]  Media.ImportFile(Filename: Text, Description: Text [, MimeType: Text])
```
## Parameters
*Media*  
&emsp;Type: [Media](media-data-type.md)  
An instance of the [Media](media-data-type.md) data type.  

*Filename*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the full path and name of the media file to be added.
        
*Description*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies text that can be used in the client to describe the media.
        
*[Optional] MimeType*  
&emsp;Type: [Text](../text/text-data-type.md)  
Specifies the media content type. MIME type is used by browsers, and is an Internet standard to describe the contents of a file. The MimeType value must be a two-part string that consists of a type and subtype, such as image/jpeg or image/gif. If this parameter is not specified, the function will deduct the MIME type from the file extension. For example the MIME type for a .jpg file is image/jpeg.  


## Return Value
*[Optional] ID*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The unique ID that is assigned to the media object in the database. You can also get the ID by using the MediaId method. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks
 You use this method to upload a media, which you want to associate with a record, to the database. For example, you can upload an JPEG image for a record in a table. When a media file is imported, it is assigned a unique identifier \(GUID\) and stored in the system table **2000000183 Tenant Media** of the application database. The GUID is then included in the **Media** data type field as a reference to the media file.

If you import a media file into a record that already has a media object, and a modify operation is performed, the original media object will be permanently deleted from the database. However, if there are other rows in the same table that reference the original media object from the same field index, the original media object is not deleted from the database. This behavior allows a row to be copied.

## Example
This example uses the ImportFile method to import a JPEG image from file to a record in a database table. After the image is imported, it can be displayed on a list page that uses the table, when the page is opened and viewed in a brick layout.

**Preparation:**

To support the example code that follows, create the following objects:

- A table that is named **My Items** and has the following characteristics (as a minimum):
  - An **Integer** data type field that has the name **No.**.

    This field is used to give an item a number.
  - A **Media** data type field that has the name **Image**.

    This is the field on which you will import the media file.
  - A field group that has the name **Brick** and includes the **No.** and **Image** fields.

      The field group is used to display the image on a page in the brick layout. For more information, see [Define fields for a drop-down control](../../devenv-field-groups.md).
- A page that is named **My Items** and has the following characteristics:

  -   List type page that uses the **My Items** table as its source.
  -   A repeater control that contains the fields of the **My Items** table.

      > [!NOTE]  
      > It is not necessary to include the **Media** data type field on the page.

  Use the page to add one or more items to the table, assigning each item a number like 1,2,3, and so on.

- JPEG image files for one or more items in the **My Items** table.
  -   Give each file a name that corresponds to an item number in the table, such as 1.jpg, 2.jpg, 3.jpg, and so on.
  -   Save the files in the *C:\images* folder on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)].

**Code:**

With the objects in place, you can add and run the following AL code to import the images. For this code example, create a codeunit and add the code to the **OnRun** trigger of the codeunit.

The example code iterates over records in the **My Items** table. For each record, it looks in the *C:\images* folder for a file whose name matches the **No.** field of the record. If there is a match, the file is imported and a message appears; otherwise, nothing happens.

```al
 var
    myItemRec: Record "My Items";
    fileName: Text;
    imageID: GUID;
    Text000: Label 'An image with the following ID has been imported on item %1: %2';
begin
    if myItemRec.FindFirst() then begin
        repeat begin
            fileName := 'C:\images\' + Format(myItemRec."No.") + '.jpg';
            if File.Exists(fileName) then begin
              imageID := myItemRec.Image.ImportFile(fileName, 'Demo image for item ' + Format(myItemRec."No."));
              myItemRec.Modify;
              Message(Text000, myItemRec."No.", imageID)
            end;
        end until myItemRec.Next < 1;
    end;
end;
```

## See Also
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)