---
title: "ExecutionTimeout Property"
description: "Sets the maximum time the report will run after which it is automatically terminated."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExecutionTimeout Property
> **Version**: _Available or changed with runtime version 6.0._

Sets the maximum time the report will run after which it is automatically terminated.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

A string in the format `hh:mm:ss`.

## Remarks

At runtime, this property will override the limit that is set by the **Default Max Rendering Timeout** (ReportDefaultTimeout) setting for [!INCLUDE[server](../includes/server.md)] instance. The [!INCLUDE[server](../includes/server.md)] instance also includes the **Max Rendering Timeout (hard limit)** (ReportTimeout) setting, which this property won't override.

For more information on report limits, see [Report limits](../devenv-report-object.md#report-limits).

## See Also  

[Report Properties](devenv-report-properties.md)  
[Report Object](../devenv-report-object.md)  
[Operational Limits for Business Central Online - Reports](../../administration/operational-limits-online.md#Reports)  
[Configuring Business Central Server - Reports](../../administration/configure-server-instance.md#Reports)  
