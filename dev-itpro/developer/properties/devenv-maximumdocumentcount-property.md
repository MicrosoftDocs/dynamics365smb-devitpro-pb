---
title: "MaximumDocumentCount Property"
description: "Sets the maximum document count when generating a report by using WordMergerDataItem."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# MaximumDocumentCount Property
> **Version**: _Available or changed with runtime version 6.0._

Sets the maximum document count when generating a report by using WordMergerDataItem.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

An integer
 
## Syntax

```AL
MaximumDocumentCount = 100;
```

## Remarks

At runtime, this property will override the hard limit that is set by the **Default Max Documents** (ReportDefaultMaxDocuments) setting for [!INCLUDE[server](../includes/server.md)] instance. The [!INCLUDE[server](../includes/server.md)] instance also includes the **Max Documents (hard limit)** (ReportMaxDocuments) setting, which this property won't override.

For more information on report limits, see [Report limits](../devenv-report-object.md#report-limits).

## See Also  

[Report Properties](devenv-report-properties.md)  
[Report Object](../devenv-report-object.md)  
[Operational Limits for Business Central Online - Reports](../../administration/operational-limits-online.md#Reports)  
[Configuring Business Central Server - Reports](../../administration/configure-server-instance.md#Reports)  
