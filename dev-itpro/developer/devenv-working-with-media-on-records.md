---
title: "Working With Media on Records"
ms.custom: na
ms.date: 12/01/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: SusanneWindfeldPedersen
---
# Working With Media on Records
This topic describes how you can upload media, such as an image, to the database for displaying with records in the client. There are two ways that you can do this:  

-   Use a BLOB data type  

     You add media to a BLOB data type field on the record.  For more information, see [BLOB Data Type](datatypes/devenv-BLOB-Data-Type.md).

-   Use a Media or MediaSet data type  

    This way enables you to store media in system tables of the database, and then reference the media from application records. <!--NAV For applications that are developed for the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)], y--> For example, you can: 
    -   Display media with records in list type pages, when the page is viewed in the Brick layout.  
    -   Display media on a card type page for a record.
    -   Display media in a report.

Using the Media or MediaSet data type provides better performance than using a BLOB data type and is more flexible in its design. With a BLOB data type, each time the media is rendered in the client, it is retrieved from the SQL database server, which requires extra bandwidth and affects performance. With the Media and MediaSet data types, the client uses media ID to cache the media data, which in turn improves the response time for rendering the media in the user interface.  

## Using Media and Media Sets on Records  
Table fields support two data types for adding media to records: **Media** and **MediaSet**. With these data types, you can import media directly from a file to a record, or media can be passed to the record in an InStream object. Imported media is stored as an object in the system table **2000000184 Tenant Media** of the application database. Each media object is assigned a unique identifier \(ID\).

## Media data type
The **Media** data type associates a record with a single media object. For example, you can use this data type to display an image with each record in a list type page.

If a media object is added to Media data type field, the field references the media object by its ID.

## MediaSet data type
The **MediaSet** data type associates a record with one or more media objects. This enables you to set up a collection or catalog of media for a record. For example, you can use this data type to set up a slide show of images for a record in a card type page.

If a media object is added to **MediaSet** data type field, the media object is assigned to a media set in the system table **2000000183 Tenant Media Set**. The media set is assigned a unique identifier, which is then referenced from the field. The media set is created with the first file media object that you add on the record. Any additional media objects for the record are then associated with the same media set.

### <a name="Indexing"></a>Indexing of media objects in a media set
A media set is an ordered list of media objects, determined by the order in which the media objects were added to the media set. This order cannot be changed. To identify this order, each media object is assigned an index number, starting a 1. This means that the first media added gets the index 1, the second media gets the index 2, and so on. If a media object is removed from the set, the list is re-indexed accordingly.

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
|application/vnd.openxmlformats-officedocument.wordprocessingml.document|docx|
|application/vnd.ms-excel|xls|
|application/vnd.openxmlformats-officedocument.spreadsheetml.sheet|xlsx|
|application/vnd.ms-powerpoint|ppt|
|application/vnd.openxmlformats-officedocument.presentationml.presentation|pptx|
|application/pdf|pdf|
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

## General procedure for adding Media to Records  
The general procedure for setting up media on records is as follows:  

1.  Obtain the media file or files that you want to use on the record.  

2.  <!--NAV In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]-->In AL, modify the table object to include a field that has the data type **Media** or **MediaSet**.  

3.  Add AL code that imports the media on the field.  

    The **Media** and **MediaSet** data types support several methods that you can use to manage the media on records. See the next section for a complete list of methods with a link to more details, such as usage, parameters and sample code.  

    For example, you can create a codeunit that calls one of the import methods, or add a page action that calls one of the methods.  

## AL methods  
The following table provides an overview of the methods that are related to the Media and MediaSet data types.  

**Media data type**

|  Method  |  Description  |
|------------|--------------|
|[IMPORTFILE Method (Media)](methods/devenv-IMPORTFILE-Method-media.md)|Adds media from a file to a record. The imported media object is stored in the application database.|
|[IMPORTSTREAM Method (Media)](methods/devenv-IMPORTSTREAM-Method-media.md)|Adds a media from an InStream object to a record. The imported media object is stored in the application database.|  
|[HASVALUE Method (Media)](methods/devenv-HASVALUE-Method-media.md)|Detects whether a record has a media object in the **Media** data type field.|
|[MEDIAID Method (Media)](methods/devenv-MEDIAID-Method-media.md)|Gets the unique identifier (GUID) that is assigned to the media object in the application database.|  
|[EXPORTFILE Method (Media)](methods/devenv-EXPORTFILE-Method-media.md)|Exports a media object from a record to a file.|  
|[EXPORTSTREAM Method (Media)](methods/devenv-EXPORTSTREAM-Method-media.md)|Exports a media object from a record to an OutStream object.|  

**MediaSet data type**

|  Method  |  Description |
|----------|--------------|
|[EXPORTFILE Method (MediaSet)](methods/devenv-EXPORTFILE-Method-MediaSet.md)|Exports the media objects that included in a media set to individual files.|
|[IMPORTFILE Method (MediaSet)](methods/devenv-IMPORTFILE-method-mediaset.md)|Adds media from a file to a record, and assigns the imported media object to a media set. The media object is stored in the application database.|  
|[IMPORTSTREAM Method (MediaSet)](methods/devenv-IMPORTSTREAM-method-mediaset.md)|Adds media from an InStream object to a record. The imported media object is stored in the application database.|  
|[INSERT Method (MediaSet)](methods/devenv-insert-method-mediaset.md)|Adds a media object that already exists in the database to a MediaSet of a record.|
|[MEDIAID Method (MediaSet)](methods/devenv-MEDIAID-method-mediaset.md)|Gets the unique identifier (GUID) that is assigned to the media set on a record.|
|[COUNT Method (MediaSet)](methods/devenv-COUNT-method-mediaset.md)|Gets the total number of media objects that are included in the media set on a record.|  

## Automatic deletion of unused Media objects 
When a table record that contains a media object is deleted, the OnDelete trigger gets the media or media set's ID, and uses the ID to look for other references to the media object from the same field index in the same table. If no other references are found, the media object is assumed to be unreferenced and it is deleted. The runtime will not look in all tables in the database to see if a media object is referenced elsewhere, because doing this would decrease performance and result in costly SQL table scans. If media objects are to be shared between tables, they should be shared through a reference table or by sharing the media set field content as described in the next section. 

## Sharing Media objects between different tables 
To maintain data integrity related to media object, it’s important to notice that the Media and MediaSet data types are complex data types that are referenced by an ID. The ID is stored in the record field that contains the media object. If a simple copy operation is performed to copy the media object from one media set field to to another, the ID is copied to the new field. However, the application does not know that the media object is referenced in two different fields, which causes issues when a row that contains the media ID is deleted.  

To avoid unintentionally deleting referenced media objects, media sharing should be done by using the INSERT method to insert the media (by its ID) into the new media set field. This will create the correct (new) MediaSet records in the system tables, which means that the media object in one field will not be deleted if media object in the other field is deleted. 

### Example 
This example copies a media set field called `MediaSetField` in table `mediaSourceTable` to a field in another table `mediaTargetTable`. The `FOR` loop will iterate all media objects in the source, and then insert their ID in the target field. 

```
FOR index := 1 TO mediaSourceTable.MediaSetField.COUNT DO 
  mediaTargetTable.MediaSetField.INSERT(mediaSourceTable.MediaSetField.ITEM(index)); 
MediaTargetTable.Modify(true);
```

This will create a new media set that contains the shared media object references. When you delete the media set (by deleting the MediaTargetTable record), the runtime will detect that the media object is used in multiple media sets, and therefore will not delete the media objects. The media objects might eventually be deleted when the runtime cannot find other references. 

> [!IMPORTANT]  
> The simple field copy statement `mediaTargetTable.MediaSetField := mediaSourceTable.MediaSetField;` can only be used if `mediaTargetTable`is declared as the same record subtype as `mediaSourceTable`, and the target and source field IDs are the same.  


## See Also  
 [Media Data Type](datatypes/devenv-Media-Data-Type.md)   
 [MediaSet Data Type](datatypes/devenv-MediaSet-Data-Type.md)  
