---
title: "MediaSet.Item Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# MediaSet.Item Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the unique identifier (GUID) of a media object that is assigned to a MediaSet on a record.


## Syntax
```
MediaId :=   MediaSet.Item(Index: Integer)
```
## Parameters
*MediaSet*
&emsp;Type: [MediaSet](mediaset-data-type.md)
An instance of the [MediaSet](mediaset-data-type.md) data type.

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the index number that is assigned to the media object in the MediaSet.  


## Return Value
*MediaId*
&emsp;Type: [Guid](../guid/guid-data-type.md)
The unique identifier (GUID) of the media object.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
For an example of using the Item method, see this [example](../../methods-auto/mediaset/mediaset-insert-method.md).

## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)