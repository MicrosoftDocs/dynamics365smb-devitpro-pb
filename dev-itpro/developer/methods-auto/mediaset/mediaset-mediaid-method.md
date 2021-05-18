---
title: "MediaSet.MediaId Method"
description: "Gets the unique identifier that is assigned to a MediaSet of a record. The MediaSet is a collection of media objects that are used on the record that can be displayed in the client."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# MediaSet.MediaId Method
> **Version**: _Available or changed with runtime version 1.0._

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
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The GUID of MediaSet on the record.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
When you import media on a table record by using either the [ImportFile Method \(MediaSet\)](../../methods-auto/mediaset/mediaset-importfile-method.md) or [ImportStream Method \(MediaSet\)](../../methods-auto/mediaset/mediaset-importstream-method.md), the media is assigned to a MediaSet GUID in the system table **2000000183 Tenant Media Set** of the application database. You can use the MediaId method to retrieve the MediaSet GUID. Note that the imported media object is also assigned a GUID. To get the media object's GUID, you can use the [MediaId Method \(Media\)](../../methods-auto/media/media-mediaid-method.md).  

## Example  
This example is gets the GUID of the MediaSet that is used on item No. 1000 in the **Item** table. The field in the **Item** table that is used for the MediaSet data type is **Picture**.  

```al
 var
    item: Record Item;
    mediasetId: GUID;
    Text000: Label 'The GUID of the MediaSet is: %1';
begin
    item.Get('1000');  
    mediasetId := item.Picture.MediaId;  
    Message(Text000, mediasetId);  
end;
``` 

## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)