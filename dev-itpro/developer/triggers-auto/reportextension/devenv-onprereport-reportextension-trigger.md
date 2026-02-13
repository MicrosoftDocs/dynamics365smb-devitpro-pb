---
title: "OnPreReport (Report Extension) trigger"
description: "Runs before a report is run."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnPreReport (Report Extension) trigger
> **Version**: _Available or changed with runtime version 7.0._

Runs before a report is run.


## Syntax
```AL
trigger OnPreReport()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This trigger runs after the `OninitReport` trigger and the base report's `OnPreReport` trigger, and before data items are processed. Learn more about report trigger flow in [Report triggers and runtime operations](../../devenv-report-triggers.md#overall-report-trigger-and-operations).

## Related information

[OnInitReport (report) trigger](../report/devenv-oninitreport-report-trigger.md)
[OnPreReport (report extension) trigger](devenv-onprereport-reportextension-trigger.md)  
[OnPostReport (report extension) trigger](../report/devenv-onpostreport-report-trigger.md)  
[Report Triggers and Runtime Operations](../../devenv-report-triggers.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
