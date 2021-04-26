---
title: Get applyVendorEntries  
description: Gets an apply vendor entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get applyVendorEntries

Retrieves the properties and relationships of an apply vendor entry object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/applyVendorEntries({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **applyVendorEntry** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/applyVendorEntries({id})
```

**Response**
Here is an example of the response.


```json
{
    "id" : "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "applied" : true,
    "appliesToId" : "1e8cb9c0-44e3-ea11-bb43-000d3a2feca1",
    "postingDate" : "2020-10-05",
    "documentType" : "Invoice",
    "documentNumber" : "2001",
    "externalDocumentNumber" : "2001",
    "vendorNumber" : "10000",
    "vendorName" : "First Up Consultants",
    "description" : "",
    "remainingAmount" : 0
}
```

## Remarks

This resource type requires [!INCLUDE[prod_short](../../../includes/prod_short.md)] version 18.0.

## See Also

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[applyVendorEntry](../resources/dynamics_applyVendorEntry.md)  
[PATCH applyVendorEntry](dynamics_applyvendorentry_update.md)  
