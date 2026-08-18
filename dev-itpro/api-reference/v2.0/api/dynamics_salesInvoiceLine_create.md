---
title: Create salesInvoiceLines  
description: Creates a sales invoice line object in Dynamics 365 Business Central. 
 
author: SusanneWindfeldPedersen

ms.topic: reference
ms.devlang: al
ms.date: 08/17/2026
ms.author: solsen
ms.reviewer: solsen
---

# Create salesInvoiceLines

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a sales invoice line object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesInvoices({id})/salesInvoiceLines
POST businesscentralPrefix/companies({id})/salesInvoiceLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body
In the request body, supply a JSON representation of a **salesInvoiceLines** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesInvoiceLines** object in the response body.

## Example

**Request**

Here's an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesInvoices({id})/salesInvoiceLines
Content-type: application/json

{
  "itemId": "02a6738a-44e3-ea11-bb43-000d3a2feca1",
  "lineType": "Item",
  "lineObjectNumber": "1928-S",
  "description": "AMSTERDAM Lamp",
  "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
  "unitOfMeasureCode": "PCS",
  "unitPrice": 54.9,
  "quantity": 3,
  "discountAmount": 0,
  "discountPercent": 0,
  "taxCode": "FURNITURE",
  "shipmentDate": "2020-08-21",
  "itemVariantId": "00000000-0000-0000-0000-000000000000"
}
```

**Response**

Here's an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "238cb9c0-44e3-ea11-bb43-000d3a2feca1",
    "documentId": "9e0f5c9c-44e3-ea11-bb43-000d3a2feca1",
    "sequence": 10000,
    "itemId": "02a6738a-44e3-ea11-bb43-000d3a2feca1",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1928-S",
    "description": "AMSTERDAM Lamp",
    "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "PCS",
    "unitPrice": 54.9,
    "quantity": 3,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 164.7,
    "taxCode": "FURNITURE",
    "taxPercent": 5,
    "totalTaxAmount": 8.24,
    "amountIncludingTax": 172.94,
    "invoiceDiscountAllocation": 0,
    "netAmount": 164.7,
    "netTaxAmount": 8.24,
    "netAmountIncludingTax": 172.94,
    "shipmentDate": "2020-08-21",
    "itemVariantId": "00000000-0000-0000-0000-000000000000",
    "locationId": "00000000-0000-0000-0000-000000000000"
}
```

## Create a new sales invoice with a line by using deep insert

If you need to create a new sales invoice together with one line, use a deep insert on [Create salesInvoices](dynamics_salesInvoice_create.md). Send the header fields and one nested `salesInvoiceLines` entry in one `POST` request.

Deep insert and `$batch` are complementary:

- Use deep insert to create a new invoice and one line in one atomic request. No batch envelope is required.
- Use `$batch` to add multiple lines to an existing invoice or combine multiple operations in one transactional request.

**Request**

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesInvoices
Content-type: application/json

{
    "customerNumber": "20000",
    "salesInvoiceLines": [
        {
            "lineType": "Item",
            "lineObjectNumber": "1928-S",
            "quantity": 3
        }
    ]
}
```

A successful request returns `201 Created` and the created `salesInvoices` object.

## Add multiple lines to an existing sales invoice by using $batch

If the sales invoice already exists, use an [OData transactional `$batch` request](../../../webservices/use-odata-batch.md) to add multiple lines in a single HTTP call. This pattern is also useful when you need one transactional request that combines different operations.

**Request**

```json
POST https://{businesscentralPrefix}/api/v2.0/$batch
Content-type: application/json
Isolation: snapshot

{
    "requests": [
        {
            "method": "POST",
            "id": "1",
            "url": "companies({id})/salesInvoices({salesInvoiceId})/salesInvoiceLines",
            "headers": {
                "Content-Type": "application/json"
            },
            "body": {
                "lineType": "Item",
                "lineObjectNumber": "1928-S",
                "quantity": 3,
                "shipmentDate": "2024-04-15"
            }
        },
        {
            "method": "POST",
            "id": "2",
            "url": "companies({id})/salesInvoices({salesInvoiceId})/salesInvoiceLines",
            "headers": {
                "Content-Type": "application/json"
            },
            "body": {
                "lineType": "Item",
                "lineObjectNumber": "1936-S",
                "quantity": 6,
                "shipmentDate": "2024-04-15"
            }
        }
    ]
}
```

> [!TIP]
> The `Isolation: snapshot` header ensures that if any line fails validation, all changes in the batch are rolled back. Learn more in [Using OData transactional $batch requests](../../../webservices/use-odata-batch.md).

## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Sales Invoice Line](../resources/dynamics_salesinvoiceline.md)  
[Get Sales Invoice Line](dynamics_salesinvoiceline_get.md)  
[Update Sales Invoice Line](dynamics_salesinvoiceline_update.md)  
[Delete Sales Invoice Line](dynamics_salesinvoiceline_delete.md)  
