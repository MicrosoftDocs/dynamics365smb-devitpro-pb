---
title: "ExecutionTimeout Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExecutionTimeout Property
> **Version**: _Available from runtime version 6.0._

Sets the maximum time the report will run after which it is automatically terminated.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Property Value

A string in the format `hh:mm:ss`.

## Remarks

At runtime, this property will override the limit that is set by the **Default Max Rendering Timeout** (ReportDefaultTimeout) setting for [!INCLUDE[server](../includes/server.md)] instance. The [!INCLUDE[server](../includes/server.md)] instance also includes the **Max Rendering Timeout (hard limit)** (ReportTimeout) setting, which this property won't override.

## See Also  

[Report Properties](devenv-report-properties.md)  
[Report Object](../devenv-report-object.md)  
[Configuring Business Central Server - Reports](../../administration/configure-server-instance.md#Reports)  
[Operational Limits for Business Central Online - Reports](../../administration/operational-limits-online.md#Reports)  