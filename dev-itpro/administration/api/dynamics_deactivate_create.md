---
title: (automation API) Create deactivate
description: Creates a deactivate object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/22/2025
ms.author: solsen
ms.reviewer: solsen
---

# (automation API) Create deactivate

Creates a deactivate object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE [prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).


```
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features({featureId})/Microsoft.NAV.deactivate
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of an **activate** object.

## Response

If successful, the request typically returns a "200" response. Use the [GET features](../resources/dynamics_featuremanagement.md) request to verify that the feature state has changed.

## Example

**Request**

Here is an example of the request.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features({featureId})/Microsoft.NAV.deactivate
Authorization: Bearer {token}
```

## Related information

[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  
[Feature management](../resources/dynamics_featuremanagement.md)  
[Deactivate feature](../resources/dynamics_deactivate.md)
