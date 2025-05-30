---
title: CREATE bankAccounts  
description: Creates a bankAccount object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create bankAccounts

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a bankAccount object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/bankAccounts
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body
In the request body, supply a JSON representation of **bankAccounts** object.

## Response
If successful, this method returns ```201 Created``` response code and a **bankAccounts** object in the response body.

## Example

**Request**

Here's an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/bankAccounts
Content-type: application/json

{
    "number": "NBL",
    "displayName": "New Bank of London"
}
```

**Response**

Here's an example of the response. 

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "26049aad-bde4-ea11-bbf2-00155df3a615",
    "number": "NBL",
    "displayName": "New Bank of London"
}
```

## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[bankaccount](../resources/dynamics_bankaccount.md)    
[Get bankaccount](dynamics_bankaccount_Get.md)    
[Delete bankaccount](dynamics_bankaccount_Delete.md)    
[Update bankaccount](dynamics_bankaccount_Update.md)    
