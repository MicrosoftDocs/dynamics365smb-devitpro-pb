---
title: "ExportStream Method"
ms.author: solsen
ms.custom: na
ms.date: 02/22/2019
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
# ExportStream Method
Exports the current media object (such as a JPEG image) that is used on record to an OUTSTREAM object. The OUTSTREAM object can be created from a BLOB field, a FILE or from a .NET Framework interoperability object. In the record, the media is referenced in a Media data type field.


## Syntax
```
[Result := ]  Media.ExportStream(Stream: OutStream)
```
## Parameters
*Media*  
&emsp;Type: [Media](media-data-type.md)  
An instance of the [Media](media-data-type.md) data type.  

*Stream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The OutStream object that is created by the object that will receive the media content.  


## Return Value
*Result*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the media was successfully exported, otherwise **false**.If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)