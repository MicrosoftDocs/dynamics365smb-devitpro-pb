---
title: Update customerContacts
description: Updates a  customer contact object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
---

# Update customerContacts

Updates the properties of a customer contact object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/customerContacts({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided doesn't match the current tag on the **customerContact**, the **customer contact** won't be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that aren't included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **customerContact** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/customerContacts({id})
Content-type: application/json
{
    "id": "CONT00123",
    "email": "john.smith@contoso.com",
    "professionalTitle": "Senior Purchasing Manager"
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id": "CONT00123",
    "email": "john.smith@contoso.com",
    "firstName": "John",
    "lastName": "Smith",
    "professionalTitle": "Senior Purchasing Manager",
    "customerId": "CUST1042",
    "customerName": "Contoso Ltd.",
    "primaryPhoneNumber": "+1 425-555-0174"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[customerContact](../resources/dynamics_customerContact.md)  
[GET customerContact](dynamics_customercontact_get.md)  
[DELETE customerContact](dynamics_customercontact_delete.md)  
[GET customerContact](dynamics_customercontact_get.md)
