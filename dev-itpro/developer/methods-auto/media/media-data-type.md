---
title: "Media Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/09/2020
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
# Media Data Type
> **Version**: _Available from runtime version 1.0._

Encapsulates media files, such as image .jpg and .png files, in application database tables. The Media data type can be used as a table field data type, but cannot be used as a variable or parameter. The Media data type enables you to import a media file to the application database and reference the file from records, making it possible to display the media file in the client user interface. You can also export media from the database to files and streams.



The following methods are available on instances of the Media data type.

|Method name|Description|
|-----------|-----------|
|[ExportFile(String)](media-exportfile-method.md)|Exports the media object (such as an image) that is currently used on record to a file on your computer or network. On the record, the media object is referenced in a Media data type field.|
|[ExportStream(OutStream)](media-exportstream-method.md)|Exports the current media object (such as a JPEG image) that is used on record to an OUTSTREAM object. The OUTSTREAM object can be created from a BLOB field, a File or from a .NET Framework interoperability object. In the record, the media is referenced in a Media data type field.|
|[HasValue()](media-hasvalue-method.md)|Checks whether a Media data type field in a record has been initialized with a media object and that the specified media object exists in the database.|
|[ImportFile(Text, Text [, Text])](media-importfile-method.md)|Adds a media type, such as a JPEG image, from a file to a Media data type field of a record for displaying the media with the record in the client. The media file is imported to the application database, and a reference to the media is included in the Media data type field.|
|[ImportStream(InStream, Text [, Text])](media-importstream-instream-text-text-method.md)|Adds a media type (MIME), such as jpeg image, from an InStream object to a Media data type field of a record for displaying the media in the client. The media file is imported to the application database and a reference to the media is included in the Media data type field.|
|[ImportStream(InStream, Text, Text, Text)](media-importstream-instream-text-text-text-method.md)|Adds a media type (MIME), such as jpeg image, from an InStream object to a Media data type field of a record for displaying the media in the client. The media file is imported to the application database and a reference to the media is included in the Media data type field.|
|[MediaId()](media-mediaid-method.md)|Gets the unique identifier of a media object on a record.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]
> Starting with Business Central 2021 release wave 1, when importing Microsoft Word files (.docx), macro packages (VBA code) will automatically be removed from the file when stored in the database. If macros are needed for end-user scenarios, the macro must be in the Word template (.dotx) associated with the document being imported.


## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[Working With Media on Records](../../devenv-working-with-media-on-records.md)