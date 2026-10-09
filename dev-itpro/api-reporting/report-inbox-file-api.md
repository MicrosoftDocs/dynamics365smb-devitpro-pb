---
title: Report Inbox File API Reference
description: Learn how the report inbox file API exposes report inbox files, file sizes, company names, and document content in Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.date: 09/25/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get report inbox files through the API

[!INCLUDE [2026-releasewave2](../includes/2026-releasewave2.md)]

The report inbox file API in [!INCLUDE [prod_short](../includes/prod_short.md)] gives integrations access to report inbox files and their metadata. Use the API to retrieve the company name, file name, file size, and document content for a report inbox file.

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../includes/prod_short.md)] in [Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## reportInboxFile

Represents a report inbox file in [!INCLUDE [prod_short](../includes/prod_short.md)].

### Methods

| Method | Return type | Description |
|:-------|:------------|:------------|
| GET | reportInboxFile | Gets a reportInboxFile object. |

### Properties

| Property | Type | Description |
|:---------|:-----|:------------|
| id | GUID | The unique ID of the reportInboxFile. Noneditable. |
| companyName | string | Specifies the name of the company that the report inbox file belongs to. |
| fileName | string | Specifies the name of the report file. |
| byteSize | integer | Specifies the size of the report file in bytes. |
| documentContent | stream | Specifies the content of the report file. |

## Related information

[Report Inbox Companies API](report-inbox-companies-api.md)  
[Report Inbox Content API](report-inbox-content-api.md)  
[Report Inbox Items API](report-inbox-items-api.md)  
[Develop APIs with pages and queries](../developer/devenv-api.md)  
