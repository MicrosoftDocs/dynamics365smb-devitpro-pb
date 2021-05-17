---
title: "Report and Data Item Triggers"
description: "Report and data item triggers in AL for Business Central."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Report and Data Item Triggers

In reports, triggers are typically used to perform calculations and verification. Triggers let you control how data is selected and retrieved in a more complex and effective way than you can achieve by using properties.  

## Report Triggers  

The following table lists triggers that apply to the report itself.  

|Trigger|Runs|  
|-------------|--------------|  
|[OnInitReport Trigger](triggers-auto/report/devenv-oninitreport-report-trigger.md)|When the report is loaded.|  
|[OnPreReport Trigger](triggers-auto/report/devenv-onprereport-report-trigger.md)|Before the report is run, but after the **RequestPage** has been run.|  
|[Quit Method (Report, XMLport)](methods-auto/report/reportinstance-quit-method.md).|  
|[OnPostReport Trigger](triggers-auto/report/devenv-onpostreport-report-trigger.md)|After the report has run, but not if the report was stopped manually or by the [Quit Method (Report, XMLport)](methods-auto/report/reportinstance-quit-method.md).|  

## Data Item Triggers  

The following table lists triggers that apply to each data item on the report.  

|Trigger|Runs|  
|-------------|--------------|  
|[OnPreDataItem Trigger](triggers-auto/reportdataitem/devenv-onpredataitem-reportdataitem-trigger.md)|Before the data item is processed, but after the associated variable has been initialized.|  
|[OnAfterGetRecord (Data Items) Trigger](triggers-auto/reportdataitem/devenv-onaftergetrecord-reportdataitem-trigger.md)|When a record has been retrieved from the table.|  
|[OnPostDataItem Trigger](triggers-auto/reportdataitem/devenv-onpostdataitem-reportdataitem-trigger.md)|When the data item has been iterated for the last time.|  

## See Also
  
[Report Triggers](devenv-report-triggers.md)  
[Triggers](triggers-auto/devenv-triggers.md)