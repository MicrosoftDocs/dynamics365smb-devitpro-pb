---
author: jswymer
ms.topic: include
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---
For example, an extension extends a table in the base application, but records are missing from the extension's companion table in SQL Server. In this case, the **Cloud Migration Management** page can show the table as not migrated, and the page that displays the data can appear blank. Verify on-premises that the companion table contains a corresponding record for each record in the base application table. If records were copied but don't appear in the online user interface, use **Repair companion table records** on the **Cloud Migration Management** page to insert missing companion records.