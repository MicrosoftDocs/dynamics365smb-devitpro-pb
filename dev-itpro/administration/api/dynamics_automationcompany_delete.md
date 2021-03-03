---
title: Delete automationCompany | Microsoft Docs
description: Deletes an automation company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/19/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Delete automationCompany

Deletes an automation company from [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).

```
DELETE /microsoft/automation/v2.0/companies({companyId})/automationCompanies({automationCompanyId})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **automationCompany**, the **automationCompany** will not be updated. |


## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the automationCompany. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/automationCompanies({automationCompanyId})
```

**Response**

Here is an example of the response. 
```json
HTTP/1.1 204 No Content
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[automationCompany](../resources/dynamics_automationCompany.md)
