---
title: "Media.MediaId Method"
description: "Gets the unique identifier of a media object on a record."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Media.MediaId Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the unique identifier of a media object on a record.


## Syntax
```AL
MediaId :=   Media.MediaId()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*Media*  
&emsp;Type: [Media](media-data-type.md)  
An instance of the [Media](media-data-type.md) data type.  

## Return Value
*MediaId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The GUID of the Media object in the database.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 When a media is imported on the Media data type field of table record, the media is given a GUID and stored in the system table **2000000184 Tenant Media** of the application database. The GUID is then included in the **Media** data type field as a reference to the media in the database.  

## Example  
This example uses the MediaId method to get the GUID of the media object that is used on item number **1** in the a the table named **My Items**.  

The example assumes that  the **My Items** table already exists and has a **Media** data type field named **Image**.

```al
 var
    myItemRec: Record "My Items";
    imageID: GUID;
    Text000: Label 'Item %1 has a media object with the following ID: %2';
begin
    myItemRec.Get('1');  
    mediaGuid := myItemRec.Image.MediaId;  
    Message(Text000, myItemRec."No.", imageID);  
end;
```  

## See Also
[Media Data Type](media-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)