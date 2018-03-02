---
title: journal resource type | Microsoft Docs
description: A journal in Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/05/2018
ms.author: solsen
---

# journal resource type
Represents a journal in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                            |Return Type|Description    |
|:--------------------------------------------------|:----------|:--------------|
|[GET journal](../api/dynamics_journal_get.md)      |journal    |Gets a journal.   |
|[POST journal](../api/dynamics_create_journal.md)  |journal    |Creates a journal.|
|[PATCH journal](../api/dynamics_journal_update.md) |journal    |Updates a journal.|
|[DELETE journal](../api/dynamics_journal_delete.md)|none       |Deletes a journal.|

## Properties
| Property	         | Type	                 |Description                                           |
|:-------------------|:----------------------|:-----------------------------------------------------|
|id                  |GUID                   |The unique ID of the journal. Non-editable.           |
|code                |string, maximum size 10| The code of the journal.                             |
|displayName         |string, maximum size 50| The display name of the journal.                     |
|lastModifiedDateTime|datetime               |The last datetime the journal was modified. Read-Only.|

## Relationships

## JSON representation

Here is a JSON representation of the resource.


```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "lastModifiedDateTime": "datetime"
}
```

## See also
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get journal](../api/dynamics_journal_get.md)  
[Create journal](../api/dynamics_create_journal.md)  
[Update journal](../api/dynamics_journal_update.md)  
[Delete journal](../api/dynamics_journal_delete.md)  
