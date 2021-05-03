---
title: Create shipmentMethods
description: Creates a shipment method object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Create shipmentMethods
Create a shipment method object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/shipmentMethods
```
## Optional query parameters

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|Content-Type   |application/json          |

## Request body
In the request body, supply a JSON representation of a **shipmentMethods** object.

## Response
If successful, this method returns ```201 Created``` response code and a **shipmentMethods** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/shipmentMethods
Content-type: application/json

{
  "code": "PICKUP",
  "displayName": "Pickup at Location"  
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "id-value",
  "code": "PICKUP",
  "displayName": "Pickup at Location",
  "lastModifiedDateTime": "2017-03-15T02:20:57.09Z"
}
```



## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Shipment Methods](../resources/dynamics_shipmentmethods.md)  
[Get Shipment Methods](../api/dynamics_shipmentmethods_get.md)  
[Update Shipment Methods](../api/dynamics_shipmentmethods_update.md)  
[Delete Shipment Methods](../api/dynamics_shipmentmethods_delete.md)  