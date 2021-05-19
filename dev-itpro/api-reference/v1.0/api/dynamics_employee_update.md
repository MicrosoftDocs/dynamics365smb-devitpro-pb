---
title: (v1.0) Update employees
description: (v1.0) Updates an employee object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Update employees
Update the properties of an employee object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

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
PATCH https://{businesscentralPrefix}/api/v1.0/companies({id})/employees({id})
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
  "id": "id-value",
  "number": "AH",
  "displayName": "Anthony Hill",
  "givenName": "Anthony",
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
  "phoneNumber": "0678-8712-3455",
  "mobilePhone": "4564-4564-7831",
  "email": "",
  "personalEmail": "ah@cronus-demosite.com",
  "employmentDate": "2001-06-01",
  "terminationDate": "0001-01-01",
  "status": "Active",
  "birthDate": "1973-12-12",
  "picture@odata.mediaReadLink": "https://api.financials.dynamics.com/v1.0/api/v1.0/companies({id})/employees({id})/picture",
  "lastModifiedDateTime": "2017-03-16T14:57:19.497Z" 
}
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  



[Error Codes](../dynamics_error_codes.md)  
[Employee](../resources/dynamics_employee.md)  
[Get Employee](../api/dynamics_employee_get.md)  
[Post Employee](../api/dynamics_create_employee.md)  
[Delete Employee](../api/dynamics_employee_delete.md)  
