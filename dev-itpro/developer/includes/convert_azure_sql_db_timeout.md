---
author: jswymer
ms.service: dynamics365-business-central
ms.topic: include
ms.date: 04/12/2021
ms.author: jswymer
---

> [!NOTE]
> When the database is on Azure SQL Database, you may get the following error:
>
> `SQL Server: Execution Timeout Expired. The timeout period elapsed prior to completion of the operation or the server is not responding. The statement has been terminated.`
>
> If you do, scale up the database resources in Azure SQL, then run the Invoke-NAVApplicationDatabaseConversion cmdlet again. If the conversion is successful, you can then scale it back down to its original setting and continue the upgrade.