---
title: Create timeRegistrationEntry | Microsoft Docs
description: Creates a attachment object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Create timeRegistrationEntry
Creates a timeRegistrationEntry in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. 

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/timeRegistrationEntries
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
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/timeRegistrationEntries
Content-type: application/json
```json
{
	"employeeNumber" : "RL",
	"quantity": 2,
	"date" : "2019-01-01"
}
```
*EmployeeId* can be used instead of *employeeNumber*.


**Response**

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "b669a254-240a-4057-bdf9-5d6196a63dd4",
    "employeeId": "dd6ce54a-d14f-40dc-a10d-1d4d18758c76",
    "employeeNumber": "RL",
    "lineNumber": 10000,
    "date": "2019-01-01",
    "quantity": 2,
    "status": "Open",
    "unitOfMeasureId": "a7ec16cb-014f-446a-a084-bc31d5d7e742",
    "lastModfiedDateTime": "2019-03-25T14:12:08.43Z",
    "unitOfMeasure": {
        "code": "HOUR",
        "displayName": "Hour",
        "symbol": null,
        "unitConversion": null
    }
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[Error Codes](../dynamics_error_codes.md)  
[timeRegistrationEntries](../resources/dynamics_timeRegistrationEntry.md)  
[Get timeRegistrationEntries](../api/dynamics_timeRegistrationEntry_get.md)  
[Post timeRegistrationEntries](../api/dynamics_timeRegistrationEntry_create.md)  
[Patch timeRegistrationEntries](../api/dynamics_timeRegistrationEntry_update.md)  
[Delete timeRegistrationEntries](../api/dynamics_timeRegistrationEntry_delete.md)  
