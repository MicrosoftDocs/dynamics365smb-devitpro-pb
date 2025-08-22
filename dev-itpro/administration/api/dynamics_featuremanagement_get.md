---
title: (automation API) Get featureManagement
description: Gets a featureManagement object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/22/2025
ms.author: solsen
ms.reviewer: solsen
---

# (automation API) Get featureManagement

Gets a featureManagement object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).


```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **featureManagement** object.

## Response

If successful, this method returns a ```200 OK``` response code and a collection of **featureManagement** objects in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features
```

## Related information

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[Feature management](../api/dynamics_featuremanagement.md)  
[Deactivate feature](../api/dynamics_deactivate.md)  
[Activate feature](../api/dynamics_activate.md)
