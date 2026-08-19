---
title: Create purchaseInvoiceLines  
description: Creates a purchase invoice line object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/17/2026
ms.author: solsen
ms.reviewer: solsen
---

# Create purchaseInvoiceLines

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a purchase invoice line object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines
POST businesscentralPrefix/companies({id})/purchaseInvoiceLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body
In the request body, supply a JSON representation of a **purchaseInvoiceLines** object.

## Response
If successful, this method returns ```201 Created``` response code and a **purchaseInvoiceLines** object in the response body.

## Example

**Request**

Here's an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseInvoices({id})/purchaseInvoiceLines
Content-type: application/json

{
    "id": "dd8db9c0-44e3-ea11-bb43-000d3a2feca1",
    "documentId": "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "sequence": 10000,
    "itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1896-S",
    "description": "ATHENS Desk",
    "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "PCS",
    "unitCost": 780.7,
    "quantity": 4,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 0,
    "taxCode": "FURNITURE",
    "amountIncludingTax": 0,
    "invoiceDiscountAllocation": 0,
    "netAmount": 3122.8,
    "netTaxAmount": 187.37,
    "netAmountIncludingTax": 3310.17,
    "expectedReceiptDate": "2019-01-01",
    "itemVariantId": "00000000-0000-0000-0000-000000000000",
    "locationId": "00000000-0000-0000-0000-000000000000"
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
    "id": "dd8db9c0-44e3-ea11-bb43-000d3a2feca1",
    "documentId": "5d115c9c-44e3-ea11-bb43-000d3a2feca1",
    "sequence": 10000,
    "itemId": "fca5738a-44e3-ea11-bb43-000d3a2feca1",
    "accountId": "00000000-0000-0000-0000-000000000000",
    "lineType": "Item",
    "lineObjectNumber": "1896-S",
    "description": "ATHENS Desk",
    "unitOfMeasureId": "5ca6738a-44e3-ea11-bb43-000d3a2feca1",
    "unitOfMeasureCode": "PCS",
    "unitCost": 780.7,
    "quantity": 4,
    "discountAmount": 0,
    "discountPercent": 0,
    "discountAppliedBeforeTax": false,
    "amountExcludingTax": 0,
    "taxCode": "FURNITURE",
    "taxPercent": 6.00006,
    "totalTaxAmount": 0,
    "amountIncludingTax": 0,
    "invoiceDiscountAllocation": 0,
    "netAmount": 3122.8,
    "netTaxAmount": 187.37,
    "netAmountIncludingTax": 3310.17,
    "expectedReceiptDate": "2019-01-01",
    "itemVariantId": "00000000-0000-0000-0000-000000000000",
    "locationId": "00000000-0000-0000-0000-000000000000"
}
```


## Create a new purchase invoice with a line by using deep insert

If you need to create a new purchase invoice together with one line, use a deep insert on [Create purchaseInvoices](dynamics_purchaseInvoice_create.md). Send the header fields and one nested `purchaseInvoiceLines` entry in one `POST` request.

Deep insert and `$batch` are complementary:

- Use deep insert to create a new invoice and one line in one atomic request. No batch envelope is required.
- Use `$batch` to add multiple lines to an existing invoice or combine multiple operations in one transactional request.

**Request**

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/purchaseInvoices
Content-type: application/json

{
    "vendorNumber": "20000",
    "vendorInvoiceNumber": "107001",
    "purchaseInvoiceLines": [
        {
            "lineType": "Item",
            "lineObjectNumber": "1896-S",
            "quantity": 4
        }
    ]
}
```

A successful request returns `201 Created` and the created `purchaseInvoices` object.

## Add multiple lines to an existing purchase invoice by using $batch

If the purchase invoice already exists, use an [OData transactional `$batch` request](../../../webservices/use-odata-batch.md) to add multiple lines in a single HTTP call. This pattern is also useful when you need one transactional request that combines different operations.

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
            "url": "companies({id})/purchaseInvoices({purchaseInvoiceId})/purchaseInvoiceLines",
            "headers": {
                "Content-Type": "application/json"
            },
            "body": {
                "lineType": "Item",
                "lineObjectNumber": "1896-S",
                "quantity": 4,
                "expectedReceiptDate": "2024-04-15"
            }
        },
        {
            "method": "POST",
            "id": "2",
            "url": "companies({id})/purchaseInvoices({purchaseInvoiceId})/purchaseInvoiceLines",
            "headers": {
                "Content-Type": "application/json"
            },
            "body": {
                "lineType": "Item",
                "lineObjectNumber": "1900-S",
                "quantity": 10,
                "expectedReceiptDate": "2024-04-15"
            }
        }
    ]
}
```

> [!TIP]
> The `Isolation: snapshot` header ensures that if any line fails validation, all changes in the batch are rolled back. Learn more in [Using OData transactional $batch requests](../../../webservices/use-odata-batch.md).

## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  

[Purchase Invoice Line](../resources/dynamics_purchaseinvoiceline.md)  
[Get Purchase Invoice Line](dynamics_purchaseinvoiceline_get.md)  
[Update Purchase Invoice Line](dynamics_purchaseinvoiceline_update.md)  
[Delete Purchase Invoice Line](dynamics_purchaseinvoiceline_delete.md)  
