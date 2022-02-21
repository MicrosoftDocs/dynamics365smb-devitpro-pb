---
title: Get itemLedgerEntries
description: Gets an item ledger entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/24/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get itemLedgerEntries

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieves the properties and relationships of an item ledger entry object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/itemLedgerEntries({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **itemLedgerEntry** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/itemLedgerEntries({id})
```

**Response**

Here is an example of the response.

```json
{
"@odata.etag": "W/\"JzQ0O2ZyaTlPVmR6WUxDOEJyMExqOER1WXgxR0IvanErd0t4WXM0ckpzY20xSkU9MTswMDsn\"",
"id": "44a76d24-52ff-eb11-bb76-000d3a220646",
"entryNumber": 1,
"itemNumber": "1100",
"postingDate": "2022-06-01",
"entryType": "Positive_x0020_Adjmt_x002E_",
"sourceNumber": "",
"sourceType": "_x0020_",
"documentNumber": "START-MANF",
"documentType": "_x0020_",
"description": "",
"quantity": 200,
"salesAmountActual": 0,
"costAmountActual": 25934.2,
"lastModifiedDateTime": "2021-08-17T11:57:21.73Z"
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[itemLedgerEntry](../resources/dynamics_itemLedgerEntry.md)  
