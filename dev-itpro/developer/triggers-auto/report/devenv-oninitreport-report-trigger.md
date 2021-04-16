---
title: "OnInitReport (Report) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnInitReport (Report) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs when the report is loaded.


## Syntax
```
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

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
