---
title: "Transitioning from API v1.0 to API v2.0"
description: "Reference content for transitioning Dynamics 365 Business Central v1.0 API to v2.0."
author: OnatBuyukakkus
ms.topic: get-started
ms.devlang: al
ms.date: 20/01/2024
ms.author: onbuyuka
---

# Transitioning from API v1.0 to API v2.0

Dynamics 365 Business Central API v2.0 includes some major changes from v1.0 for the better. 

## Schema version

API v2.0 schema version is always set to 2.0 to get the latest features in the Business Central OData stack.

## Key fields

In v1.0, following resources didn’t use the SystemId as the primary key. Instead they used non-GUID keys or multipart keys.

- attachments
- cashFlowStatement
- customerSale
- defaultDimensions
- dimensionLines
- generalLedgerEntries
- generalLedgerEntryAttachments
- incomeStatement
- purchaseInvoiceLines
- retainedEarningsStatement
- salesCreditMemoLines
- salesInvoiceLines
- salesOrderLines
- salesQuoteLines
- trialBalance
- vendorPurchase

All multipart keys and non-GUID in v2.0 have been replaced with unique GUID keys. API v2.0 entities can be retrieved with the SystemId. SystemId is immutable, platform enforced and indexed. This change improves auditing and API reading performance. It is also possible to create a new record and provide the SystemId in API v2.0.

## Nested objects

In API v1.0, some properties had [complex types](../v1.0/resources/dynamics_complextypes.md). These properties defined an [ODataEDMType Property](../../developer/properties/devenv-odataedmtype-property.md) that can be assigned following values.

- POSTALADDRESS
- Collection(DIMENSION)
- ITEM-UOM
- DOCUMENTLINEOBJECTDETAILS

Complex properties allowed returning nested JSON object in the API response. In API v2.0, all complex properties are replaced with first-level properties or navigation properties. This change improves API performance significantly since complex fields were calculated in the runtime and added additional compute time.

The change from complex property to first-level property can be seen in [customer](../v2.0/resources/dynamics_customer.md) resource type. In API v1.0, property ```address``` used ```POSTALADDRESS```. 

Here is an example of the response from [API v1.0 customer resource](../v1.0/api/dynamics_customer_get.md). ```address``` property can be seen as a complex property.

> [!NOTE]  
>   The response objects shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
  "id": "id-value",
  "number": "10000",
  "displayName": "Coho Winery",
  "type": "Company",
  "address": {
    "street": "192 Market Square",
    "city": "Atlanta",
    "state": "GA",
    "countryLetterCode": "US",
    "postalCode": "31772"
  }
}
```
Here is the first-level property replacement of the ```address``` property in an example response from [API v2.0 customer resource](../v2.0/api/dynamics_customer_get.md).

```json
{
    "id": "id-value",
    "number": "10000",
    "displayName": "Adatum Corporation",
    "type": "Company",
    "addressLine1": "192 Market Square",
    "addressLine2": "",
    "city": "Atlanta",
    "state": "GA",
    "country": "US",
    "postalCode": "31772",
}
```

The change from complex property to navigational property can be seen in [item](../v2.0/resources/dynamics_item.md) resource type. In API v1.0, property ```baseUnitOfMeasure``` used ```ITEM-UOM```. 

Here is an example of the response from [API v1.0 item resource](../v1.0/api/dynamics_item_get.md). ```baseUnitOfMeasure``` property can be seen as a complex property.

> [!NOTE]  
>   The response objects shown here may be truncated for brevity. All of the properties will be returned from an actual call.
```json
{
  "id": "id-value",
  "number": "1896-S",
  "displayName": "ATHENS Desk",
  "baseUnitOfMeasure": {
    "unitCode": "PCS",
    "unitName": "Piece",
    "symbol": "",
    "unitConversion": null
  }
}
```
There is no first-level property replacement of the ```baseUnitOfMeasure``` property in an example response from [API v2.0 item resource](../v2.0/api/dynamics_item_get.md). Instead, the new navigation property replacement ```unitOfMeasure``` represents data from related [unitOfMesure](../v2.0/resources/dynamics_unitOfMeasure.md) resource and may be optionally included in the response object. Navigation properties are included in the response object by ```$expand``` OData parameter.
```
GET businesscentralPrefix/companies({id})/items({id})?$expand=unitOfMeasure
```
```json
{
  "id": "id-value",
  "number": "1896-S",
  "displayName": "ATHENS Desk",
  "unitOfMeasure": {
    "id": "id-value",
    "code": "PCS",
    "displayName": "Piece",
    "internationalStandardCode": "EA",
    "symbol": ""
  }
}
```

All navigation properties are documented in [API (v2.0) Documentation](index.md).

## Relationship multiplicities

In API v1.0, API subpages (navigational properties) were always considered as collections. Therefore, all navigational properties returned a JSON array. In API v2.0 following properties are marked as ```Multiplicity = ZeroOrOne``` meaning a one-to-one relation. These properties return a JSON object in API v2.0.

| resource                                                                 | property                   |
|--------------------------------------------------------------------------|----------------------------|
| [contacts](../v2.0/resources/dynamics_contact.md)                        | contact                    |
| [contactInformation](../v2.0/resources/dynamics_contactInformation.md)   | contact                    |
| [customer](../v2.0/resources/dynamics_customer.md)                       | agedAccountsReceivable     |
| [customer](../v2.0/resources/dynamics_customer.md)                       | customerFinancialDetails   |
| [customer](../v2.0/resources/dynamics_customer.md)                       | picture                    |
| [employee](../v2.0/resources/dynamics_employee.md)                       | picture                    |
| [item](../v2.0/resources/dynamics_item.md)                               | generalProductPostingGroup |
| [item](../v2.0/resources/dynamics_item.md)                               | inventoryPostingGroup      |
| [item](../v2.0/resources/dynamics_item.md)                               | picture                    |
| [item](../v2.0/resources/dynamics_item.md)                               | unitOfMeasure              |
| [purchaseInvoiceLine](../v2.0/resources/dynamics_purchaseInvoiceLine.md) | location                   |
| [purchaseInvoice](../v2.0/resources/dynamics_purchaseInvoice.md)         | pdfDocument                |
| [purchaseOrderLine](../v2.0/resources/dynamics_purchaseOrderLine.md)     | location                   |
| [salesCreditMemoLine](../v2.0/resources/dynamics_salesCreditMemoLine.md) | location                   |
| [salesCreditMemo](../v2.0/resources/dynamics_salesCreditMemo.md)         | pdfDocument                |
| [salesInvoiceLine](../v2.0/resources/dynamics_salesInvoiceLine.md)       | location                   |
| [salesInvoice](../v2.0/resources/dynamics_salesInvoice.md)               | pdfDocument                |
| [salesOrderLine](../v2.0/resources/dynamics_salesOrderLine.md)           | location                   |
| [salesQuoteLine](../v2.0/resources/dynamics_salesQuoteLine.md)           | location                   |
| [salesQuote](../v2.0/resources/dynamics_salesQuote.md)                   | pdfDocument                |
| [vendor](../v2.0/resources/dynamics_vendor.md)                           | agedAccountsPayable        |
| [vendor](../v2.0/resources/dynamics_vendor.md)                           | picture                    |

## Enums

All properties that were of type option in API v1.0 are converted into enums for API v2.0. These properties were previously exposed as strings, instead now they are strongly typed. Enum values can be accessed from ```metadata``` endpoint, also enum captions can be accessed from ```entityDefinitions``` endpoint.

This change allows integration utilizing Dynamics 365 Business Central API v2.0 to determine available values for enum properties, for example displaying dropdown values to the end user.

## See also

[API (v2.0) Documentation](index.md)  
[API (v1.0) Documentation](../v1.0/index.md)  
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)     
[Enabling the APIs for Dynamics 365 Business Central](enabling-apis-for-dynamics-nav.md)   
[Developing a Custom API](../../developer/devenv-develop-custom-api.md)  