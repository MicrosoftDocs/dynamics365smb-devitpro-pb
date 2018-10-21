---
title: "ImportStream Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ImportStream Method
Adds a media file, such as a JPEG image, from an InStream object to the MediaSet of record for displaying in the client. The media is imported to the database and included in a MediaSet for the record.

## Syntax
```
[ID := ]  MediaSet.ImportStream(Stream: InStream, Description: String, [MimeType: String])
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
The unique ID that is assigned to the MediaSet of the record.If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)