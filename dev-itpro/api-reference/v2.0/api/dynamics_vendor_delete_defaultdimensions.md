---
title: Delete vendor defaultDimensions  
description: Deletes the default dimensions of the vendor in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Delete vendor defaultDimensions

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Deletes the default dimensions of the vendor in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({companyId})/vendors({vendorId})/defaultDimensions({vendorId},{dimensionId})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **vendors**, the **vendors** will not be updated. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code and it deletes the default dimensions for the vendor and corresponding dimension.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({companyId})/vendors({vendorId})/defaultDimensions({vendorId},{dimensionId})
```

**Response** 

No Content.

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  

[Vendor](../resources/dynamics_vendor.md)  
[Create vendor defaultDimensions](dynamics_vendor_create_defaultdimensions.md)  
[Update vendor defaultDimensions](dynamics_vendor_update_defaultdimensions.md)  
[Get vendor defaultDimensions](dynamics_vendor_get_defaultdimensions.md)  
