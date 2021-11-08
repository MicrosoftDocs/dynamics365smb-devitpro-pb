---
title: "Working With Media on Records"
ms.author: solsen
description: Learn how to upload media, such as an image, to the database for displaying with records in the client. 
ms.custom: na
ms.date: 11/08/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
---

# Working With Media on Records

This article describes how you can upload media, such as an image, to the database for displaying with records in the client. There are two ways that you can upload media:  

- Use a BLOB data type  

  You add media to a BLOB data type field on the record. For more information, see [BLOB Data Type](methods-auto/blob/blob-data-type.md).

- Use a Media or MediaSet data type  

  This way enables you to store media in system tables of the database, and then reference the media from application records. For example, you can: 

    - Display media with records in list type pages, when the page is viewed in the **Tile** layout. For more information, see [Displaying Data as Tiles](devenv-lists-as-tiles.md).
    
    - Display media on a card type page for a record.
    - Display media in a report.
    
Using the [Media](methods-auto/media/media-data-type.md) or [MediaSet](methods-auto/mediaset/mediaset-data-type.md) data type provides better performance than using a BLOB data type and is more flexible in its design. With a BLOB data type, each time the media is rendered in the client, it's retrieved from the SQL database server, which requires extra bandwidth and affects performance. With the Media and MediaSet data types, the client uses media ID to cache the media data, which in turn improves the response time for rendering the media in the user interface.

## Using Media and Media Sets on records  

Table fields support two data types for adding media to records: **Media** and **MediaSet**. With these data types, you can import media directly from a file to a record, or media can be passed to the record in an InStream object. Imported media is stored as an object in the system table **2000000184 Tenant Media** of the tenant database. Each media object is assigned a unique identifier (ID).

## Media data type
The **Media** data type associates a record with a single media object. For example, you can use this data type to display an image with each record in a list type page.

If a media object is added to Media data type field, the field references the media object by its ID.

> [!NOTE]
> Starting with Business Central 2021 release wave 1, when importing Microsoft Word files (.docx), macro packages (VBA code) will automatically be removed from the file when stored in the database. If macros are needed for end-user scenarios, the macro must be in the Word template (.dotx) associated with the document being imported.

## MediaSet data type

The **MediaSet** data type associates a record with one or more media objects. This association enables you to set up a collection or catalog of media for a record. For example, you can use this data type to set up a slide show of images for a record in a card type page.

If a media object is added to **MediaSet** data type field, the media object is assigned to a media set in the system table **2000000183 Tenant Media Set**. The media set is assigned a unique identifier, which is then referenced from the field. The media set is created with the first file media object that you add on the record. Any other media objects for the record are then associated with the same media set.

### <a name="Indexing"></a>Indexing of media objects in a media set

A media set is an ordered list of media objects, determined by the order in which the media objects were added to the media set. This order can't be changed. To identify this order, each media object is assigned an index number, starting a 1. The first media added gets the index 1, the second media gets the index 2, and so on. If a media object is removed from the set, the list is reindexed.

> [!NOTE]  
> If a **MediaSet** data type field is used in a report object, then only the first associated media file is displayed in the generated report.

##  <a name="SupportedMediaTypes"></a> Supported Media (MIME) types

The media type, also referred to as the MIME (Multipurpose Internet Mail Extensions) type, is an Internet standard to describe the contents of a file. Internet browsers use the MIME type to determine how to handle the file. The Media and MediaSet datatypes support all recognized MIME types.

A MIME type is defined by two parts, the *type* and *subtype*, where the format is `type/subtype`. For example, the MIME type for a JPEG image is image/jpeg. There are several types, including image, application, audio, video, text, and more. Each MIME type is associated with one or more acceptable file extensions. The following table lists some of the more common MIME types and their file extensions. 

|  MIME type  |  File extension  |
|------------|--------------|
|image/bmp|bmp|
|image/jpeg|jpeg, jpg, jpe|
|image/gif|gif|
|application/msword|doc|
|application/octet-stream|json|
|application/vnd.openxmlformats-officedocument.wordprocessingml.document|docx|
|application/vnd.ms-excel|xls|
|application/vnd.openxmlformats-officedocument.spreadsheetml.sheet|xlsx|
|application/vnd.ms-powerpoint|ppt|
|application/vnd.openxmlformats-officedocument.presentationml.presentation|pptx|
|application/pdf|pdf|
|application/xml|xml|
|audio/mpeg |mp3 |
|audio/x-wav |wav |
|video/mp4  |mp4|
|video/x-msvideo|avi|
|text/html  |htm, html |
|text/plain   |txt |


> [!NOTE]  
> GIF type is not supported on reports. If you want to display an image on a report, use another supported type.
>
> Files with extensions that are not recognized are also supported and can be imported. These are stored as BLOBs (binary larger objects).

## General procedure for adding media to records  
The general procedure for setting up media on records is as follows:  

1. Obtain the media file or files that you want to use on the record.  

2. In AL, modify the table object to include a field that has the data type **Media** or **MediaSet**.  

3. Add AL code that imports the media on the field.  

    The **Media** and **MediaSet** data types support several methods that you can use to manage the media on records. See the next section for a complete list of methods with a link to more details, such as usage, parameters, and sample code.  

    For example, you can create a codeunit that calls one of the import methods. Or, add a page action that calls one of the methods.  

## AL methods

To get an overview of the methods that are related to the Media and MediaSet data types, see [Media Data Type](methods-auto/media/media-data-type.md) and [MediaSet Data Type](methods-auto/mediaset/mediaset-data-type.md).


## Automatic deletion of unused Media objects 

When a table record that contains a media object is deleted, the OnDelete trigger gets the media or media set's ID. It then uses the ID to look for other references to the media object from the same field index in the same table. If no other references are found, the media object is assumed to be unreferenced and it's deleted. The runtime won't look in all tables in the database to see if a media object is referenced elsewhere, because doing so would lower performance and result in costly SQL table scans. If media objects are to be shared between tables, they should be shared through a reference table or by sharing the media set field content as described in the next section. 

## Sharing Media objects between different tables

To maintain data integrity that's related to media object, it’s important to notice that the Media and MediaSet data types are complex data types, which are referenced by an ID. The ID is stored in the record field that contains the media object. If a simple copy operation is done to copy the media object from one media set field to another, the ID is copied to the new field. But the application doesn't know that the media object is referenced in two different fields, which causes issues when a row that contains the media ID is deleted.  

To avoid unintentionally deleting referenced media objects, media sharing should be done by using the INSERT method to insert the media (by its ID) into the new media set field. Using the INSERT method will create the correct (new) MediaSet records in the system tables. The media object in one field won't be deleted if the media object in the other field is deleted. 

### Example

This example copies a media set field called `MediaSetField` in table `mediaSourceTable` to a field in another table `mediaTargetTable`. The `FOR` loop will iterate all media objects in the source, and then insert their ID in the target field. 

```
for index := 1 to mediaSourceTable.MediaSetField.COUNT do 
  mediaTargetTable.MediaSetField.INSERT(mediaSourceTable.MediaSetField.ITEM(index)); 
MediaTargetTable.Modify(true);
```

This example will create a new media set that contains the shared media object references. When you delete the media set (by deleting the MediaTargetTable record), the runtime will detect that the media object is used in multiple media sets, so it won't delete the media objects. The media objects might eventually be deleted when the runtime can't find other references. 

> [!IMPORTANT]  
> The simple field copy statement `mediaTargetTable.MediaSetField := mediaSourceTable.MediaSetField;` can only be used if `mediaTargetTable`is declared as the same record subtype as `mediaSourceTable`, and the target and source field IDs are the same.  

## Changing an RDLC report to use Media fields instead of BLOB fields

This section describes how to change an RDLC report that displays a BITMAP image (`<MIMEType>image/bmp</MIMEType>`) from BLOB data type field to use Media fields instead. The change requires that you modify  the report object's AL code and the report layout's RDLC file.

### AL code changes

Media and MediaSet data types don't require CALCFIELDS to fetch data. So in the report AL triggers, remove the `CALCFIELDS` operation on the field that contains the image.

#### RDLC layout changes

An RDLC layout will typically use base64 conversion on the BITMAP image. However, the media data types don't require a base64 encoding. If a media field gets converted to a base 64 string, the report won't render the image, and the output will show a missing picture bitmap.

So in this case, you'll have to change the layout's .rdlc file to use a direct field reference to the media, without the base64 conversion. In the .rdlc file, the media reference is done in the `<Value></Value>` element of the `<Image></Image>` element.

For example, suppose an image's `<Value></Value>` element is expressed like the following example: 

```xml
<Value>=Convert.ToBase64String(Fields!CompanyInfo2Picture.Value)</Value>
```

To use a direct reference without the base64 conversion, change `<Value></Value>` element expression to:

```xml
<Value>=Fields!CompanyInfo2Picture.Value</Value>
```

## See Also

[BLOB Data Type](methods-auto/blob/blob-data-type.md)  
[Media Data Type](methods-auto/media/media-data-type.md)  
[MediaSet Data Type](methods-auto/mediaset/mediaset-data-type.md)  
