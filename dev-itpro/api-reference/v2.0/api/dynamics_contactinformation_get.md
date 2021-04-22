---
title: Get contactInformation | Microsoft Docs
description: Gets a contact information object in Dynamics 365 Business Central.
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
# Get contactInformation

Retrieves the properties and relationships of a contact information object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/contactInformation({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **contactInformation** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/contactInformation({id})
```

**Response**
Here is an example of the response.

```json
{
    "contactId" : "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "contactNumber" : "108001",
    "contactName" : "Adatum Corporation",
    "contactType" : "Company",
    "relatedId" : "f2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "relatedType" : "Customer"
}
```

## Remarks

This resource type requires [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] version 18.0.

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[contactInformation](../resources/dynamics_contactInformation.md)  
