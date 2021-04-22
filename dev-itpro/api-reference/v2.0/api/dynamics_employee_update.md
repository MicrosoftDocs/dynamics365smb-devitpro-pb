---
title: Update employees | Microsoft Docs
description: Updates an employee object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update employees

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of an employee object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
PATCH businesscentralPrefix/companies({id})/employees({id})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|Content-Type   |application/json.         |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **employees**, the **employees** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **employees** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/employees({id})
Content-type: application/json

{
  "givenName": "Anthony",
  "phoneNumber": "0678-8712-3455"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
Content-type: application/json

{
    "id": "258bb9c0-44e3-ea11-bb43-000d3a2feca1",
    "number": "AH",
    "displayName": "Anthony Hill",
    "givenName": "Anthony",
    "middleName": "",
    "surname": "Hill",
    "jobTitle": "Secretary",
    "addressLine1": "677 Fifth Avenue",
    "addressLine2": "",
    "city": "",
    "state": "",
    "country": "",
    "postalCode": "",
    "phoneNumber": "0678-8712-3455",
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
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[employee](../resources/dynamics_employee.md)    
[Get employee](dynamics_employee_Get.md)    
[Delete employee](dynamics_employee_Delete.md)    
[Create employee](dynamics_employee_Create.md)    
