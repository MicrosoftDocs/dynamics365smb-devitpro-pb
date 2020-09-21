---
title: "MaximumDocumentCount Property"
description: Explains the MaximumDocumentCount property on reports in Business Central
ms.custom: na
ms.date: 06/25/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# MaximumDocumentCount Property

Sets the maximum document count when generating a report by using `WordMergerDataItem`.
  
## Applies To  

- Reports

## Property Value

An integer
 
## Syntax

```
MaximumDocumentCount = 100;
```

## Remarks

At runtime, this property will override the hard limit that is set by the **Default Max Documents** (ReportDefaultMaxDocuments) setting for [!INCLUDE[server](../includes/server.md)] instance. The [!INCLUDE[server](../includes/server.md)] instance also includes the **Max Documents (hard limit)** (ReportMaxDocuments) setting, which this property won't override.

## See Also  

[Report Properties](devenv-report-properties.md)  
[Report Object](../devenv-report-object.md)  
[Configuring Business Central Server - Reports](../../administration/configure-server-instance.md#Reports)  
[Operational Limits for Business Central Online - Reports](../../administration/operational-limits-online.md#Reports)  