---
title: Report Inbox Content API Reference
description: Learn how the report inbox content API exposes report file metadata and document content from the report inbox in Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.date: 09/25/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get report inbox content through the API

[!INCLUDE [2026-releasewave2](../includes/2026-releasewave2.md)]

The report inbox content API in [!INCLUDE [prod_short](../includes/prod_short.md)] gives integrations access to report file metadata and document content in the report inbox. Use the API to retrieve the file name, output type, file size, and document content for a report inbox entry.

> [!NOTE]
> Learn more about enabling APIs for [!INCLUDE [prod_short](../includes/prod_short.md)] in [Enabling the APIs for Dynamics 365 Business Central](../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## reportInboxContent

Represents the content and file metadata for a report inbox entry in [!INCLUDE [prod_short](../includes/prod_short.md)].

### Methods

| Method | Return type | Description |
|:-------|:------------|:------------|
| GET | reportInboxContent | Gets a reportInboxContent object. |

### Properties

| Property | Type | Description |
|:---------|:-----|:------------|
| id | GUID | The unique ID of the reportInboxContent. Noneditable. |
| fileName | string | Specifies the name of the report file. |
| outputType | NAV.reportInboxOutputType | Specifies the report output type. The values are `PDF`, `Word`, `Excel`, and `Zip`. |
| byteSize | integer | Specifies the size of the report file in bytes. |
| documentContent | stream | Specifies the content of the report file. |

## Related information

[Report Inbox Companies API](report-inbox-companies-api.md)  
[Report Inbox File API](report-inbox-file-api.md)  
[Report Inbox Items API](report-inbox-items-api.md)  
[API developer overview](../developer/devenv-api.md)  
