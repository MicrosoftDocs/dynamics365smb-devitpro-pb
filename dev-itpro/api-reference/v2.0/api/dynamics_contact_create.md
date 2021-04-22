---
title: Create contacts  
description: Creates a contact object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create contacts

Creates a contact in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/contacts({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **contact**, the **contact** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **contact** object.

## Response

If successful, this method returns ```201 Created``` response code and a **contact** object in the response body.


## Example

**Request**

Here is an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/contacts({id})
Content-type: application/json
{
    "id" : "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "number" : "108001",
    "type" : "Company",
    "displayName": "CRONUS USA, Inc.",
    "companyNumber" : "17806",
    "companyName" : "CRONUS US",
    "businessRelation" : "Vendor",
    "addressLine1": "7122 South Ashford Street",
    "addressLine2": "Westminster",
    "city": "Atlanta",
    "state": "GA",
    "country": "US",
    "postalCode": "31772",
    "phoneNumber": "+1 425 555 0100",
    "mobilePhoneNumber" : "",
    "email" : "ah@contoso.com",
    "website" : "",
    "searchName" : "",
    "privacyBlocked" : true,
    "lastInteractionDate" : "2021-06-01",
    "lastModifiedDateTime" : "2021-06-01"
}
```

**Response**
Here is an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id" : "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "number" : "108001",
    "type" : "Company",
    "displayName": "CRONUS USA, Inc.",
    "companyNumber" : "17806",
    "companyName" : "CRONUS US",
    "businessRelation" : "Vendor",
    "addressLine1": "7122 South Ashford Street",
    "addressLine2": "Westminster",
    "city": "Atlanta",
    "state": "GA",
    "country": "US",
    "postalCode": "31772",
    "phoneNumber": "+1 425 555 0100",
    "mobilePhoneNumber" : "",
    "email" : "ah@contoso.com",
    "website" : "",
    "searchName" : "",
    "privacyBlocked" : true,
    "lastInteractionDate" : "2021-06-01",
    "lastModifiedDateTime" : "2021-06-01"
}
```
## Remarks

This resource type requires [!INCLUDE[prod_short](../../../includes/prod_short.md)] version 18.0.

## See Also

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[contact](../resources/dynamics_contact.md)  
[GET contact](dynamics_contact_get.md)  
[DELETE contact](dynamics_contact_delete.md)  
[PATCH contact](dynamics_contact_update.md)  
