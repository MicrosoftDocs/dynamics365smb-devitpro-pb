---
title: "OnInitReport Trigger"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnInitReport Trigger
Runs when the report is loaded.  

## Syntax  
```  
trigger OnInitReport()
begin
    ...
end;
``` 
  
## Applies to  
- Reports  
  
## Remarks  
 This trigger is run before the request page is run and before any table views or filters are set. This trigger performs any processing that is required before the report is run, such as initializing global variables. It can also stop the report.  
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [Report and Data Item Triggers](devenv-report-and-data-item-triggers.md)  