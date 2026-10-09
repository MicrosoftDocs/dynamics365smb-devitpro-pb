---
title: Report Inbox Companies API Reference
description: Learn how the report inbox companies API exposes company-level report inbox counts and the latest change time in Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.date: 09/25/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Work with report inbox companies through the API

[!INCLUDE [2026-releasewave2](../includes/2026-releasewave2.md)]

The report inbox companies API in [!INCLUDE [prod_short](../includes/prod_short.md)] gives integrations a company-level view of the report inbox. Use the API to retrieve the number of report inbox entries, the number of unread entries, and the time of the latest change for each company.

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../includes/prod_short.md)] in [Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## reportInboxCompany

Represents report inbox information for a company in [!INCLUDE [prod_short](../includes/prod_short.md)].

### Methods

| Method | Return type | Description |
|:-------|:------------|:------------|
| GET | reportInboxCompany | Gets a reportInboxCompany object. |

### Properties

| Property | Type | Description |
|:---------|:-----|:------------|
| id | GUID | The unique ID of the reportInboxCompany. Noneditable. |
| companyName | string | Specifies the company name. |
| companyNameLower | string | Specifies the company name in lowercase. |
| entryCount | integer | Specifies the number of report inbox entries for the company. |
| unreadCount | integer | Specifies the number of unread report inbox entries for the company. |
| lastModifiedDateTime | datetime | Specifies the date and time when the report inbox information was last modified. |

## Related information

[Report Inbox Content API](report-inbox-content-api.md)  
[Report Inbox File API](report-inbox-file-api.md)  
[Report Inbox Items API](report-inbox-items-api.md)  
[Develop APIs with pages and queries](../developer/devenv-api.md)  
