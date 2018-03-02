---
title: complex types JSON | Microsoft Docs
description: Complex data types in JSON for Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/03/2018
ms.author: solsen
---

# complex types JSON
These are the various complex types in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. You can see usage of these complex types in the various individual methods that make use of them.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Item category

Represents an Item Category complex type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

### Properties
| Property	   | Type	 |Description                                    |
|:-------------|:------|:----------------------------------------------|
|categoryId    |string |The unique ID of the item category.            |
|description   |string |Specifies the description of the item category.|

```json
"ItemCategory" 
{ 
  "categoryId": "string", 
  "description": "string" 
} 
```

## Unit of measure

Represents a Unit of Measure complex type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].       

### Properties
| Property	   | Type	 |Description                                                 |
|:-------------|:------|:-----------------------------------------------------------|
|code          |string |The unique ID of the unit of measure.                       |
|displayName   |string |Specifies the description of the unit of measure.           |
|symbol        |string |Specifies a graphical representation of the unit of measure.|
|unitConversion|       |Specifies the conversion rate to a different (target) unit of measure.|

```json
"UnitOfMeasure" 
{  
  "code":  "string", 
  "displayName": "string", 
  "symbol": "string", 
  "unitConversion": "NAV.ItemUnitOfMeasureConversion" 
} 
```

## Unit of measure conversion

Represents a Unit of Measure Conversion complex type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].       

### Properties
| Property	         | Type	   |Description                                  |
|:-------------------|:--------|:--------------------------------------------|
|toUnitOfMeasure     |string   |Specifies the unit of measure to convert to. |
|fromToConversionRate|decimal  |Specifies what the (source) base unit of measure is multiplied with in order to convert to the target unit of measure.|

```json
"ItemUnitOfMeasureConversion" 
{ 
"toUnitOfMeasure": "string", 
"fromToConversionRate": "decimal" 
} 
 ```

## Payment method

Represents a Payment Method complex type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].       

### Properties
| Property	   | Type	 |Description                           |
|:-------------|:------|:-------------------------------------|
|code          |string |The unique code of the payment method.|
|description   |string |Specifies a text that describes the payment method.|

```json
"PaymentMethod" 
{ 
"code": "string", 
"description": "string" 
} 
 ```

## Payment terms

Represents a Payment Terms complex type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].       

### Properties
| Property	| Type	|Description                          |
|:----------|:------|:------------------------------------|
|code       |string |The unique code of the payment terms.|
|description|string |Specifies a text that describes the payment terms.|

```json
"PaymentTermsType" 
{ 
"code": "string", 
"description": "string" 
} 
 ```

## Postal address

Represents a Postal Address complex type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].       

### Properties
| Property	   | Type	    |Description             |
|:-------------|:---------|:-----------------------|
|street        |string    |Postal address street.  |
|city          |string    |Postal address city.    |
|state         |string    |Postal address state.   |
|countryLetterCode|string |Postal address country letter code (two character word)|
|postalCode    |string    |Postal address post code|

```json
"PostalAddress" 
{ 
"street": "string",
"city": "string", 
"state": "string", 
"countryLetterCode": "string", 
"postalCode": "string" 
} 
 ```

## Shipment method

Represents a Shipment Method complex type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].       

### Properties
| Property	|Type	  |Description                            |
|:----------|:------|:--------------------------------------|
|code       |string |The unique code of the shipment method.|
|description|string |Specifies the description of the shipment method.|

```json
"ShipmentMethod" 
{ 
"code": "string", 
"description": "string" 
} 
```

## Line details

Represents a Line Details complex type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].       

### Properties
| Property	  | Type	|Description                  |
|:------------|:------|:----------------------------|
|number       |string |The sequence number of the document line details.|
|displayName  |string |The display name of the line.|

```json
"documentLineObjectDetails" 
{ 
"number": "string", 
"displayName": "string" 
} 
```

## See also
[Working with Dynamics 365 for Financials in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
