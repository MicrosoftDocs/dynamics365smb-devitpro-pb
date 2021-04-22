---
title: Create employees | Microsoft Docs
description: Creates an employee object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create employees

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Create an employee object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/employees
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |

## Request body
In the request body, supply a JSON representation of an **employees** object.

## Response
If successful, this method returns ```201 Created``` response code and an **employees** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/employees
Content-type: application/json

{
    "id": "258bb9c0-44e3-ea11-bb43-000d3a2feca1",
    "number": "AH",
    "displayName": "Annette Hill",
    "givenName": "Annette",
    "middleName": "",
    "surname": "Hill",
    "jobTitle": "Secretary",
    "addressLine1": "677 Fifth Avenue",
    "addressLine2": "",
    "city": "",
    "state": "",
    "country": "",
    "postalCode": "",
    "phoneNumber": "4465-4899-4643",
    "mobilePhone": "4564-4564-7831",
    "email": "",
    "personalEmail": "ah@contoso.com",
    "employmentDate": "2001-06-01",
    "terminationDate": "0001-01-01",
    "status": "Active",
    "birthDate": "1973-12-12",
    "statisticsGroupCode": "",
    "lastModifiedDateTime": "2020-08-21T00:25:17.623Z"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
  "id": "id-value",
  "number": "AH",
  "displayName": "Annette Hill",
  "givenName": "Annette",
  "middleName": "",
  "surname": "Hill",
  "jobTitle": "Secretary",
  "address": {
    "street": "677 Fifth Avenue",
    "city": "New York",
    "state": "",
    "countryLetterCode": "",
    "postalCode": "10022"
  },
  "phoneNumber": "4465-4899-4643",
  "mobilePhone": "4564-4564-7831",
  "email": "",
  "personalEmail": "ah@contoso.com",
  "employmentDate": "2001-06-01",
  "terminationDate": "0001-01-01",
  "status": "Active",
  "birthDate": "1973-12-12",
  "picture@odata.mediaReadLink": "https://api.financials.dynamics.com/v2.0/api/v2.0/companies({id})/employees({id})/picture",
  "lastModifiedDateTime": "2017-03-16T14:57:19.497Z" 
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[employee](../resources/dynamics_employee.md)    
[Get employee](dynamics_employee_Get.md)    
[Delete employee](dynamics_employee_Delete.md)    
[Update employee](dynamics_employee_Update.md)    
