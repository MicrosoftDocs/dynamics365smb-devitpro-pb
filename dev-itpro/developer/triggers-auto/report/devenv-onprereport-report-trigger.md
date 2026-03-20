---
title: "OnPreReport (Report) trigger"
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

# OnPreReport (Report) trigger
> **Version**: _Available or changed with runtime version 1.0._

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

This trigger runs after the `OninitReport` trigger and request page (if any) are run, before data items are processed. Learn more about report trigger flow in [Report triggers and runtime operations](../../devenv-report-triggers.md#overall-report-trigger-and-operations).

The table views and filters for the report data items are set while this trigger is run. As this trigger is run after the request page is processed, you have access to any filters the user has set. If you want to print the settings of these filters in the report, you can retrieve them using the following text string.  
  
```AL
ReportFilter := SomeRecord.GetFilters;  
```  
  
Use the ReportFilter text string as the source expression for a control in a section of the report.  

## Related information

[OnInitReport (report) trigger](../report/devenv-oninitreport-report-trigger.md)  
[OnPreReport (report) trigger](../report/devenv-onprereport-report-trigger.md)  
[Report triggers and runtime operations](../../devenv-report-triggers.md)  
[Get started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
