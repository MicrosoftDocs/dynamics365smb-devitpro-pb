---
title: Get apicategoryroutes
description: Gets an apicategoryroutes object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.date: 04/28/2025
ms.author: solsen
---

# Get apicategoryroutes

Retrieves the properties and relationships of an apicategoryroutes object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/apicategoryroutes({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **apicategoryroutes** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/apicategoryroutes({id})
```

**Response**

Here's an example of the response.


```json
{
    "route" : "",
    "publisher" : "",
    "group" : "",
    "version" : ""
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[apicategoryroutes](../resources/dynamics_apicategoryroutes.md)  
