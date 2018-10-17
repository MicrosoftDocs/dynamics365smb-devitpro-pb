---
title: "Insert Method"
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
# Insert Method
Adds a media object that already exists in the database to a MediaSet of a record.

## Syntax
```
[Result := ]  MediaSet.Insert(MediaId: Guid)
```
## Parameters
*MediaSet*  
&emsp;Type: [MediaSet](mediaset-data-type.md)  
An instance of the [MediaSet](mediaset-data-type.md) data type.  

*MediaId*  
&emsp;Type: [Guid](guid-data-type.md)  
Specifies the unique ID that is assigned to the media object that you want to insert. Existing media objects are stored in the system table 2000000184 Tenant Media of the application database. There are different ways of obtaining the GUID of a media object. You could identify the media object ID by looking in the table. Or programmatically, you can use either the Item function on a MediaSet data type field of a record or the MEDIAID function on Media data type field of a record.
          


## Return Value
*Result*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the media is successfully added to the MediaSet, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)