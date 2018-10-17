---
title: "ImportFile Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# ImportFile Method
Adds a media type, such as a JPEG image, from a file to a Media data type field of a record for displaying the media with the record in the client. The media file is imported to the application database, and a reference to the media is included in the Media data type field.

## Syntax
```
[ID := ]  Media.ImportFile(Filename: Text, Description: Text, [MimeType: Text])
```
## Parameters
*Media*  
&emsp;Type: [Media](media-data-type.md)  
An instance of the [Media](media-data-type.md) data type.  

*Filename*  
&emsp;Type: [Text](text-data-type.md)  
Specifies the full path and name of the media file to be added.
        
*Description*  
&emsp;Type: [Text](text-data-type.md)  
Specifies text that can be used in the client to describe the media.
        
*MimeType*  
&emsp;Type: [Text](text-data-type.md)  
Specifies the media content type. MIME type is used by browsers, and is an Internet standard to describe the contents of a file. The MimeType value must be a two-part string that consists of a type and subtype, such as image/jpeg or image/gif. If this parameter is not specified, the function will deduct the MIME type from the file extension. For example the MIME type for a .jpg file is image/jpeg.  


## Return Value
*ID*  
&emsp;Type: [Guid](guid-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
The unique ID that is assigned to the media object in the database. You can also get the ID by using the MediaId method.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)