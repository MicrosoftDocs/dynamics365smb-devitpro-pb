---
title: "OnInitReport Trigger"
description: "OnInitReport trigger in AL for Business Central."
ms.date: 04/01/2021
ms.topic: reference
author: SusanneWindfeldPedersen
---

# OnInitReport Trigger

Runs when the report is loaded.  

## Syntax  

```AL
trigger OnInitReport()
begin
    ...
end;
``` 
  
## Applies to

- Report objects
  
## Remarks  

This trigger is run before the request page is run and before any table views or filters are set. This trigger performs any processing that is required before the report is run, such as initializing global variables. It can also stop the report.  

> [!NOTE]  
> This trigger is currently not supported for [Report Extension Object](../devenv-report-ext-example.md).
  
## See Also  

[Triggers](devenv-triggers.md)  
[Report and Data Item Triggers](devenv-report-and-data-item-triggers.md)  