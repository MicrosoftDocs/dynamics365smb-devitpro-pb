---
title: (v1.0) generalLedgerEntries resource type
description: (v1.0) A general ledger entry in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# generalLedgerEntries resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a generalLedgerEntry object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:-------------|:-------------|:----------|
|[GET generalLedgerEntries](../api/dynamics_generalledgerentries_get.md)|generalLedgerEntries|Get a G/L entry object.|

## Properties

| Property           | Type                  |Description                                  |
|:-------------------|:----------------------|:--------------------------------------------|
|id                  |GUID                   |The unique ID of the G/L Entry.              |
|number              |numeric                |Specifies the number of the G/L Entry.       |
|postingDate         |date                   |Specifies the posting date of the G/L Entry. |
|documentNumber      |string, maximum size 20|Specifies the document number of the G/L Entry.|
|documentType        |string                 |Specifies the document type of the G/L Entry.|
|dimensions        |NAV.dimensionType                 |dimensions of the G/L Entry.|
|accountId           |GUID                   |Specifies the accountId of the G/L Entry.    |
|accountNumber       |string, maximum size 20|Specifies the accountNumber of the G/L Entry.|
|description         |string, maximum size 50|Specifies the description of the G/L Entry.  |
|debitAmount         |numeric                |Specifies the debitAmount of the G/L Entry.  |
|creditAmount        |numeric                |Specifies the creditAmount of the G/L Entry. |
|lastModifiedDateTime|datetime               |The last datetime the G/L Entry was modified.|


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
  "id": "GUID",
  "number": "int",
  "postingDate": "Date",
  "documentNumber": "string",
  "documentType": "string",
  "dimensions": "string",
  "accountId": "GUID",
  "accountNumber": "string",
  "description": "string",
  "debitAmount": "decimal",
  "creditAmount": "decimal",
  "lastModifiedDateTime": "datetime"
}
```
## See also

[General Ledger Entries](../resources/dynamics_generalledgerentries.md)  
[Get General Ledger Entries](../api/dynamics_generalledgerentries_get.md)  