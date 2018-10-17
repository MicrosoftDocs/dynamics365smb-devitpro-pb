---
title: "MediaId Method"
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
# MediaId Method
Gets the unique identifier that is assigned to a MediaSet of a record. The MediaSet is a collection of media objects that are used on the record that can be displayed in the client.

## Syntax
```
MediaId :=   MediaSet.MediaId()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*MediaSet*  
&emsp;Type: [MediaSet](mediaset-data-type.md)  
An instance of the [MediaSet](mediaset-data-type.md) data type.  

## Return Value
*MediaId*  
&emsp;Type: [Guid](guid-data-type.md)  
The GUID of MediaSet on the record.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)