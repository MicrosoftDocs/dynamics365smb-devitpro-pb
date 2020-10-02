---
title: "MaximumDataSetSize Property"
description: Explains the MaximumDataSetSize property on reports in Business Central
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# MaximumDataSetSize Property

Sets the maximum amount of rows to be included on the report.
  
## Applies To  

- Reports
  
## Property Value

An integer

## Syntax

```
MaximumDatasetSize = 2000;
```

## Remarks  

At runtime, this property will override the hard limit that is set by the **Default Max Rows** (ReportMaxRows) setting for [!INCLUDE[server](../includes/server.md)] instance. The [!INCLUDE[server](../includes/server.md)] instance also includes the **Max Rows (hard limit)** (ReportMaxRows) setting, which this property won't override.

## See Also  

[Report Properties](devenv-report-properties.md)  
[Report Object](../devenv-report-object.md)  
[Configuring Business Central Server - Reports](../../administration/configure-server-instance.md#Reports)  
[Operational Limits for Business Central Online - Reports](../../administration/operational-limits-online.md#Reports)  