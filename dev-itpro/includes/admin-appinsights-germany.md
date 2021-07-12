---
author: edupont04
ms.service: dynamics365-business-central
ms.topic: include
ms.date: 07/09/2021
ms.author: edupont
---
> [!IMPORTANT]
> In [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (v17) and earlier, don't use an Azure Application Insights resource in Germany regions, such as **(Europe) Germany West Central** or **(Europe) Germany North**. If you do, traces from [!INCLUDE[prod_short](../includes/prod_short.md)] might not be recorded in Application Insights. The mitigation is to create an Azure Application Insights resource in a region outside of Germany. Then, when the relevant time comes, move the resource to the preferred region.
