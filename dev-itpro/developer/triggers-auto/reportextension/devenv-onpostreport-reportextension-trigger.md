---
title: "OnPostReport (Report Extension) trigger"
description: "Runs after a report is run."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnPostReport (Report Extension) trigger
> **Version**: _Available or changed with runtime version 7.0._

Runs after a report is run.


## Syntax
```AL
trigger OnPostReport()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This trigger is run after all data items are processed and after the base report's `OnPostReport` trigger. The trigger is not run if the report was stopped manually or by using the Quit before processing had concluded. Learn more about report trigger flow in [Report triggers and runtime operations](../../devenv-report-triggers.md#overall-report-trigger-and-operations).

Because this trigger is run after the report is processed, you can use it to inform users about the result of the report run. For example, if some records could not be processed, you could inform the user of this using the following code in this trigger.  

```AL
if ProblemsInReport then  
Message(Text000, NumberOfErrors);  
```  

Create the following global text constant variable.  

|**Text constant**|**ENU value**|  
|-----------------------|-------------------|  
|Text000|'%1 records were not processed'|  

## Related information

[OnPostReport (report) trigger](../report/devenv-onpostreport-report-trigger.md)  
[OnPreReport (report extension) trigger](devenv-onprereport-reportextension-trigger.md)  
[OnPreReport (report) trigger](../report/devenv-onprereport-report-trigger.md)  
[Report triggers and runtime operations](../../devenv-report-triggers.md)  
[Get started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
