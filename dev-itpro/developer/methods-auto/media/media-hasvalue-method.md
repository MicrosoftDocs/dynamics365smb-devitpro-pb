---
title: "HasValue Method"
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
# HasValue Method
Checks whether a Media data type field in a record has been initialized with a media object and that the specified media object exists in the database.


## Syntax
```
HasValue :=   Media.HasValue()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*Media*  
&emsp;Type: [Media](media-data-type.md)  
An instance of the [Media](media-data-type.md) data type.  

## Return Value
*HasValue*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the Media data type field in a record has been initialized with a media object and the specified media object exists in the database, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)