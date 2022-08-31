---
title: "AllowScheduling Property"
description: "Sets whether a report can be scheduled to run in the background."
ms.author: solsen
ms.custom: na
ms.date: 06/31/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AllowScheduling Property
> **Version**: _Available or changed with runtime version 6.2._

Sets whether a report can be scheduled to run in the background.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**true** if a report can be scheduled; otherwise, **false**. The default is **true**.  

## Syntax

```AL
AllowScheduling = false;
```

## Remarks

When set to **true**, the **Schedule** action is available from the **Send to** button on the report's request page, which lets users schedule a time that they want the report to run. To learn how the user schedules a report, see [Schedule a Report](/dynamics365/business-central/ui-work-report#ScheduleReport) in the business functionality help.

> [!NOTE]
> Together with the [SaveValues Property](devenv-savevalues-property.md), this property also determines whether the report supports multiple previews. When both the **AllowScheduling** and **SaveValues** properties are set to **true**, users can preview the report from the request page as many times as they like, without the need to close the request page. This capability lets users to try different options, for example, change filters and see how the generated report will look like. If either property is set to **false**, the report won't support multiple previews and the request page closes once the user previews the report. In this case, the request page includes a **Preview and Close** button instead of **Preview**.

## See Also  

[Request Pages](../devenv-request-pages.md)  
[Report Properties](devenv-report-properties.md)  
[SaveValues Property](devenv-savevalues-property.md)  