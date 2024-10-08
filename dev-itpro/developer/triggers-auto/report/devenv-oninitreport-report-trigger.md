---
title: "OnInitReport (Report) trigger"
description: "Runs when the report is loaded."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnInitReport (Report) trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when the report is loaded.


## Syntax
```AL
trigger OnInitReport()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

This trigger is run before the request page is run and before any table views or filters are set. This trigger performs any processing that is required before the report is run, such as initializing global variables. It can also stop the report.  

> [!NOTE]  
> This trigger is currently not supported for [Report Extension Object](../../devenv-report-ext-example.md).

## Related information

[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[Report Triggers and Runtime Operations](../../devenv-report-triggers.md)  
