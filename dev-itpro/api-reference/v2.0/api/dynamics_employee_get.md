---
title: Get employees | Microsoft Docs
description: Gets an employee object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get employees

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of an employee object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/employees({id})
```

## Request headers

|Header       |Value                     |
|-------------|--------------------------|
|Authorization|Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **employees** object in the response body.

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/employees({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
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

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[employee](../resources/dynamics_employee.md)    
[Delete employee](dynamics_employee_Delete.md)    
[Create employee](dynamics_employee_Create.md)    
[Update employee](dynamics_employee_Update.md)    
