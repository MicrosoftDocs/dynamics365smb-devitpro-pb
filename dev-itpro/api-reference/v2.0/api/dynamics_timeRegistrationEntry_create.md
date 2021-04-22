---
title: Create timeRegistrationEntry | Microsoft Docs
description: Creates a attachment object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create timeRegistrationEntry

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Creates a timeRegistrationEntry in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({companyId})/timeRegistrationEntries({timeregistrationId})
POST businesscentralPrefix/companies({companyId})/employees({employeeId})/timeRegistrationEntries({timeregistrationId})
```

## Request headers

|Header        |Value                     |
|--------------|--------------------------|
|Authorization |Bearer {token}. Required. |
|Content-Type  |application/json          |

## Request body
In the request body, supply a JSON representation of a **timeRegistrationEntries** object.

## Response
If successful, this method returns ```201 Created``` response code and a **timeRegistrationEntries** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/timeRegistrationEntries
Content-type: application/json
```json
{
    "id": "1a8b1fec-c0e3-ea11-aa60-000d3ad7cacb",
    "employeeId": "258bb9c0-44e3-ea11-bb43-000d3a2feca1",
    "employeeNumber": "AH",
    "jobId": "00000000-0000-0000-0000-000000000000",
    "jobNumber": "",
    "jobTaskNumber": "",
    "absence": "",
    "lineNumber": 10000,
    "date": "2019-02-02",
    "quantity": 5,
    "status": "Open",
    "unitOfMeasureId": "56a6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "HOUR",
    "lastModfiedDateTime": "2020-08-21T15:13:58.87Z"
}
```
*EmployeeId* can be used instead of *employeeNumber*.


**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "1a8b1fec-c0e3-ea11-aa60-000d3ad7cacb",
    "employeeId": "258bb9c0-44e3-ea11-bb43-000d3a2feca1",
    "employeeNumber": "AH",
    "jobId": "00000000-0000-0000-0000-000000000000",
    "jobNumber": "",
    "jobTaskNumber": "",
    "absence": "",
    "lineNumber": 10000,
    "date": "2019-02-02",
    "quantity": 5,
    "status": "Open",
    "unitOfMeasureId": "56a6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "HOUR",
    "lastModfiedDateTime": "2020-08-21T15:13:58.87Z"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[Error Codes](../dynamics_error_codes.md)  
[timeRegistrationEntries](../resources/dynamics_timeRegistrationEntry.md)  
[Get timeRegistrationEntries](dynamics_timeRegistrationEntry_get.md)  
[Patch timeRegistrationEntries](dynamics_timeRegistrationEntry_update.md)  
[Delete timeRegistrationEntries](dynamics_timeRegistrationEntry_delete.md)  
