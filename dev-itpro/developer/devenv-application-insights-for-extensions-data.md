---
title: Data logged to app/extension telemetry 
description: Describes what data is sent to Azure Application Insights for app/extensions. 
ms.date: 02/09/2024
ms.reviewer: solsen
ms.topic: conceptual
author: kennieNP
---

# Data logged to app/extension telemetry 

For an app/extension that enables telemetry, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] platform emits telemetry events that happen in the context of the AL code of the app/extension. For example, you get telemetry events when users interact with pages from your app/extension, when REST APIs from your app/extension are called, or when reports from your app/extension are rendered. You get telemetry events when users get error dialogs raised in pages from your app/extension, and when your AL code consumes excessive resources on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server or database.

Currently, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] offers telemetry on the following operations (the column _Extension support_ shows the types of events that are emitted to app/extension telemetry):  

[!INCLUDE[prod_short](../includes/include-telemetry-by-area.md)]

## See also  

[Instrumenting an application for telemetry](devenv-instrument-application-for-telemetry.md)  
[Viewing telemetry data in Azure Application Insights](../administration/telemetry-overview.md)  