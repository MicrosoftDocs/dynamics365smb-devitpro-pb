---
author: edupont04
ms.service: dynamics365-business-central
ms.topic: include
ms.date: 09/28/2021
ms.author: edupont
---
For example, an extension extends a table in the base application. In SQL Server, the table doesn't contain the data from the base app table for some reason. In this example, the **Cloud Migration Management** page shows the table as not migrated, and the page that renders the table is blank. The solution is to verify on-premises that the table with the table extension contains the same count of records as the table for the base app table.