---
title: "ImportFile Method"
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
# ImportFile Method
Adds a media, such as a JPEG image, to the MediaSet data type field of a record for displaying the media in the client. The media is imported to the database and included in a MediaSet for the record.

## Syntax
```
[ID := ]  MediaSet.ImportFile(Filename: String, Description: String, [MimeType: String])
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