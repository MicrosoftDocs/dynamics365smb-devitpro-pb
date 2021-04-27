---
title: journalLines resource type
description: A journal line in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# journalLines resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a line in a journal in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                    | Return Type|Description         |
|:----------------------------------------------------------|:-----------|:-------------------|
|[GET journalLines](../api/dynamics_journalline_get.md)      |journalLines|Gets a journal line.   |
|[POST journalLines](../api/dynamics_create_journalline.md)  |journalLines|Creates a journal line.|
|[PATCH journalLines](../api/dynamics_journalline_update.md) |journalLines|Updates a journal line.|
|[DELETE journalLines](../api/dynamics_journalline_delete.md)|none        |Deletes a journal line.|


## Navigation 

| Method                                                    |Description         |
|:----------------------------------------------------------|:-------------------|
|[attachments](../resources/dynamics_attachment.md)|paymentTerm   |Attach documents to journalLine. |
|[account](../resources/dynamics_account.md)|paymentMethod   |Gets the account. |


## Properties

| Property             | Type                   |Description                                                        |
|:---------------------|:-----------------------|:------------------------------------------------------------------|
|id                    |GUID                    |The unique ID of the journal line. Non-editable.                   |
|journalDisplayName    |string, maximum size 10 |The display name of the journal that this line belongs to. Read-Only.|
|lineNumber            |integer                 |The number of the journal line.                                    |
|accountId             |GUID                    |The unique ID of the account that the journal line is related to.  |
|accountNumber         |string, maximum size 20 |The number of the account that the journal line is related to.     |
|postingDate           |date                    |The date that the journal line is posted.                          |
|documentNumber        |string, maximum size 20 |Specifies a document number for the journal line.                  |
|externalDocumentNumber|string, maximum size 20 |Specifies an external document number for the journal line.        |
|amount                |decimal                 |Specifies the total amount (including VAT) that the journal line consists of.|
|description           |string, maximum size 50 |The description of the journal line, provided by the user or autocreated.|
|comment               |string, maximum size 250|A user specified comment on the journal line.                      |
|lastModifiedDateTime  |datetime                |The last datetime the journal line was modified. Read-Only.        |

## Relationships
A journal line is a subpage of a journal. It cannot be accessed directly.

A journal line can be a "Parent Entity" of the dimension lines.

An Account (accountId) must exist in the Accounts table.


## JSON representation

Here is a JSON representation of the resource.


```json
{
    "id": "GUID",
    "journalDisplayName": "string",
    "lineNumber": "integer",
    "accountId": "GUID",
    "accountNumber": "string",
    "postingDate": "date",
    "documentNumber": "string",
    "externalDocumentNumber": "string",
    "amount": "decimal",
    "description": "string",
    "comment": "string",
    "lastModifiedDateTime": "datetime"
}
```

## See also
[Journal Line](../resources/dynamics_journalline.md)  
[Get Journal Line](../api/dynamics_journalline_get.md)  
[Create Journal Line](../api/dynamics_create_journalline.md)  
[Update Journal Line](../api/dynamics_journalline_update.md)  
[Delete Journal Line](../api/dynamics_journalline_delete.md)  