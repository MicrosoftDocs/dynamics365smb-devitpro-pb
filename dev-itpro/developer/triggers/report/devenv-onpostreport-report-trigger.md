---
title: "OnPostReport (Report) Trigger"
description: "Runs after a report is run."
ms.author: solsen
ms.custom: na
ms.date: 04/27/2021
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

# OnPostReport (Report) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after a report is run.


## Syntax
```
trigger OnPostReport()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

This trigger is run after all data items are processed. The trigger is not run if the report was stopped manually or by using the Quit before processing had concluded.  

Because this trigger is run after the report is processed, you can use it to inform users about the result of the report run. For example, if some records could not be processed, you could inform the user of this using the following code in this trigger.  

```AL
if ProblemsInReport then  
Message(Text000, NumberOfErrors);  
```  

Create the following global text constant variable.  

|**Text constant**|**ENU value**|  
|-----------------------|-------------------|  
|Text000|'%1 records were not processed'|  

Because this trigger is run before the End Write Transaction, you can also give the user the opportunity to roll back changes to the database by leaving the report with the [Quit Method \(Report, XMLport\)](../../methods-auto/report/reportinstance-quit-method.md).  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnPostReport (Report Extension) Trigger](../reportextension/devenv-onpostreport-reportextension-trigger.md)
