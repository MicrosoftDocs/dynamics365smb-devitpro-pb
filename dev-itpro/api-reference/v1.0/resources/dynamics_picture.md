---
title: (v1.0) picture resource type
description: (v1.0) A picture object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# picture resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a picture in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. You can save the stream as an image directly.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                       | Return Type |Description                    |
|:-------------------------------------------------------------|:------------|:------------------------------|
|[GET picture](../api/dynamics_picture_get.md)      |picture|Gets a picture object.   |
|[POST picture](../api/dynamics_create_picture.md)  |picture|Creates a picture object.|
|[PATCH picture](../api/dynamics_picture_update.md) |picture|Updates a picture object.|
|[DELETE picture](../api/dynamics_picture_delete.md)|none         |Deletes a picture object.|


## Properties

| Property                    | Type    | Description                                             |
|:----------------------------|:--------|:--------------------------------------------------------|
| id                          | GUID    | ID of the entity that picture belongs to. Non-editable. |
| width                       | numeric | The picture width.                                      |
| height                      | numeric | The picture height.                                     |
| contentType                 | MIME    | Image type.                                             |
| content@odata.mediaEditLink |         | Link to upload raw image data                           |
| content@odata.mediaReadLink |         | Link to download raw image data                         |

## JSON representation

Here is a JSON representation of the resource.


```json
{
  "id": "d0e5d5da-795a-4924-b376-13665f794cdd",
  "width": 500,
  "height": 496,
  "contentType": "image\jpeg",
  "content@odata.mediaEditLink": "https:\\api.businesscentral.dynamics-tie.com\v1.0\api\beta\companies(55c438d0-2f5c-44a0-9965-20b4923d0bef)\items(d0e5d5da-795a-4924-b376-13665f794cdd)\picture(d0e5d5da-795a-4924-b376-13665f794cdd)\content",
  "content@odata.mediaReadLink": "https:\\api.businesscentral.dynamics-tie.com\v1.0\api\beta\companies(55c438d0-2f5c-44a0-9965-20b4923d0bef)\items(d0e5d5da-795a-4924-b376-13665f794cdd)\picture(d0e5d5da-795a-4924-b376-13665f794cdd)\content"
}
```

## See also

[Get Picture](../api/dynamics_picture_get.md)  
[Create Picture](../api/dynamics_create_picture.md)  
[Update Picture](../api/dynamics_picture_update.md)  
[Delete Picture](../api/dynamics_picture_delete.md)  