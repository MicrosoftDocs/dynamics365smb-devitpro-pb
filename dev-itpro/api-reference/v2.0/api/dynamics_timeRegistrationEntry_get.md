---
title: Get timeRegistrationEntries | Microsoft Docs
description: Gets timeRegistrationEntries object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get timeRegistrationEntries

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of an timeRegistrationEntries object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({companyId})/timeRegistrationEntries({timeregistrationId})
GET businesscentralPrefix/companies({companyId})/employees({employeeId})/timeRegistrationEntries({timeregistrationId})
```

> [!NOTE]  
> Please note the $filter applied to timeRegistrationEntries API. The filter is applied to get timeRegistrationEntries for a specific employee. 


## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **timeRegistrationEntries** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})timeRegistrationEntries?$filter=employeeId eq {employeeId}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

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

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  

[Error Codes](../dynamics_error_codes.md)  
[timeRegistrationEntries](../resources/dynamics_timeRegistrationEntry.md)  
[Get timeRegistrationEntries](dynamics_timeRegistrationEntry_get.md)  
[Post timeRegistrationEntries](dynamics_timeRegistrationEntry_create.md)  
[Delete timeRegistrationEntries](dynamics_timeRegistrationEntry_delete.md)  
