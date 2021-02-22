---
title: "Deprecated Tables"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Deprecated Tables

[!INCLUDE [2020_releasewave1](../includes/2020_releasewave1.md)]

In the latest version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)], a number of tables have been deprecated. The following tables have been marked with an `ObsoleteState:Removed`. Code that uses the deprecated table or tables, must be rewritten to use the new table or tables. The deprecated tables are mapped as follows:

<br>

|Deprecated Table Name|New Table Name|
|---------------------|--------------|
|NAV App| Published Application|
|NAV App Object Metadata| Application Object Metadata|
|NAV App Resource| Application Resource|
|NAV App Dependencies| Application Dependency|
|NAV App Tenant App| Installed Application|

## See Also

[Technical Upgrade](upgrade-technical-upgrade-v15-v16.md)