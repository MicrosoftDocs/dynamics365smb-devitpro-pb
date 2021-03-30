---
title: "System.ImportStreamWithUrlAccess Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# System.ImportStreamWithUrlAccess Method
> **Version**: _Available or changed with runtime version 1.0._

Imports an object into a media container to be used in a temporary URL with a default expiration time.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
ID :=   System.ImportStreamWithUrlAccess(InStream: InStream, Filename: String [, MinutesToExpire: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
Input stream that contains the object to store as a media object.
        
*Filename*  
&emsp;Type: [String](../string/string-data-type.md)  
File name to associate with the created media object.
        
*MinutesToExpire*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Number of minutes after which the object will expire.  


## Return Value
*ID*
&emsp;Type: [Guid](../guid/guid-data-type.md)
The ID of the media container, if the import is successful.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)