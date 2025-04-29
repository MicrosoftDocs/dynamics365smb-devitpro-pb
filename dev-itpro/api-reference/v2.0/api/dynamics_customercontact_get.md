---
title: Get customerContacts
description: Gets a customer contact object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.date: 04/28/2025
ms.author: solsen
---

# Get customerContacts

Retrieves the properties and relationships of a customer contact object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/customerContacts({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **customerContact** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/customerContacts({id})
```
**Response**

Here's an example of the response.

```json
{
    "id": "CONT00123",
    "email": "john.smith@contoso.com",
    "firstName": "John",
    "lastName": "Smith",
    "professionalTitle": "Purchasing Manager",
    "customerId": "CUST1042",
    "customerName": "Contoso Ltd.",
    "primaryPhoneNumber": "+1 425-555-0174"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[customerContact](../resources/dynamics_customerContact.md)  
[DELETE customerContact](dynamics_customercontact_delete.md)  
[PATCH customerContact](dynamics_customercontact_update.md)
