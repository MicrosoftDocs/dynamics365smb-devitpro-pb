---
title: (v1.0) Get customerFinancialDetails
description: (v1.0) Gets customerFinancialDetails in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Get customerFinancialDetails (v1.0)
Retrieve the properties and relationships of a customerFinancialDetails object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).s

```
GET businesscentralPrefix/companies({id})/customerFinancialDetails
GET businesscentralPrefix/companies({id})/customers?$expand=customerFinancialDetails
GET businesscentralPrefix/companies({id})/customers({customerId})?$expand=customerFinancialDetails
```

## Request headers (v1.0)

|Header       |Value                    |
|-------------|-------------------------|
|Authorization|Bearer {token}. Required.|

## Request body (v1.0)
Do not supply a request body for this method.

## Response (v1.0)
If successful, this method returns a ```200 OK``` response code and an **customerFinancialDetails** object in the response body.

## Example (v1.0)

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/customerFinancialDetails
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
    {
        "id": "50168e70-ec57-45cf-86d4-3d850e361606",
        "number": "50000",
        "balance": 8836.8,
        "totalSalesExcludingTax": 81049,
        "overdueAmount": 5754.96
    }  
```


## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Error Codes](../dynamics_error_codes.md)  
[customerFinancialDetails resource](../resources/dynamics_customerFinancialDetails.md)  