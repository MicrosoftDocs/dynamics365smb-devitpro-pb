---
title: Delete contacts | Microsoft Docs
description: Deletes a contact object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/26/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Delete contacts

Deletes a contact from [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
DELETE businesscentralPrefix/companies({id})/contacts({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **contact**, the **contact** will not be updated. |


## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the contact. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/contacts({id})
```

**Response**

Here is an example of the response.

```json
HTTP/1.1 204 No Content
```

## Remarks

This resource type requires [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] version 18.0.

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[contact](../resources/dynamics_contact.md)  
[GET contact](dynamics_contact_get.md)  
[POST contact](dynamics_contact_create.md)  
[PATCH contact](dynamics_contact_update.md)  
