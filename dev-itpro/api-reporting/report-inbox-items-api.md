---
title: Report Inbox Items API Reference
description: Learn how the report inbox items API lets integrations retrieve report inbox entries and update whether an entry is marked as read.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.date: 09/25/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Work with report inbox items through the API

[!INCLUDE [2026-releasewave2](../includes/2026-releasewave2.md)]

The report inbox items API in [!INCLUDE [prod_short](../includes/prod_short.md)] gives integrations access to report inbox entries. Use the API to retrieve entry details and update whether an entry is marked as read.

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../includes/prod_short.md)] in [Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## reportInboxItem

Represents a report inbox entry in [!INCLUDE [prod_short](../includes/prod_short.md)].

### Methods

| Method | Return type | Description |
|:-------|:------------|:------------|
| GET | reportInboxItem | Gets a reportInboxItem object. |
| PATCH | reportInboxItem | Updates a reportInboxItem object. |

### Properties

| Property | Type | Description |
|:---------|:-----|:------------|
| id | GUID | The unique ID of the reportInboxItem. Noneditable. |
| companyName | string | Specifies the company name for the report inbox entry. |
| companyNameLower | string | Specifies the company name in lowercase. |
| includeAllCompanies | boolean | Specifies whether the report inbox entry applies to all companies. |
| entryNo | integer | Specifies the entry number. |
| reportId | integer | Specifies the ID of the report that created the entry. |
| reportName | string | Specifies the name of the report that created the entry. |
| description | string | Specifies the description of the report inbox entry. |
| createdDateTime | datetime | Specifies the date and time when the report inbox entry was created. |
| outputType | NAV.reportInboxOutputType | Specifies the report output type. The values are `PDF`, `Word`, `Excel`, and `Zip`. |
| read | boolean | Specifies whether the report inbox entry is marked as read. |
| fileName | string | Specifies the name of the report file. |

## Related information

[Report Inbox Companies API](report-inbox-companies-api.md)  
[Report Inbox Content API](report-inbox-content-api.md)  
[Report Inbox File API](report-inbox-file-api.md)  
[API developer overview](../developer/devenv-api.md)  
