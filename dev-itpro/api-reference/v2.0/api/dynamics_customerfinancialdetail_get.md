---
title: GET customerFinancialDetails  
description: Gets a customerFinancialDetail object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get customerFinancialDetails

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a customerFinancialDetails object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).s

```
GET businesscentralPrefix/companies({id})/customerFinancialDetails
GET businesscentralPrefix/companies({id})/customers?$expand=customerFinancialDetail
GET businesscentralPrefix/companies({id})/customers({customerId})?$expand=customerFinancialDetail
```

## Request headers

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **customerFinancialDetails** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/customerFinancialDetails
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
    {
        "id": "52f556f8-e0e4-ea11-9305-000d3a482952",
        "number": "GL00000000",
        "balance": 0,
        "totalSalesExcludingTax": 0,
        "overdueAmount": 0
    }  
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[customerfinancialdetail](../resources/dynamics_customerfinancialdetail.md)    
