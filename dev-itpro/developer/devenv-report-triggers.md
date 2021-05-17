---
title: "Report Triggers"
description: "Report triggers in AL for Business Central."
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Report Triggers

When you run a report, the report triggers are called in a specific order.  

The following illustration describes the order of report triggers.  

![Order of report triggers](media/reporttriggers.png "ReportTriggers")  

## Report triggers

When you start the report run, the [OnInitReport Trigger](triggers-auto/report/devenv-oninitreport-report-trigger.md) is called. If the OnInitReport doesn't end the processing of the report, then the request page for the report is run, if it's defined. The page triggers for the request page are called. On the request page, you select the options that you want for this report. You can also decide to cancel the report run. If you decide to continue, then the [OnPreReport Trigger](triggers-auto/report/devenv-onprereport-report-trigger.md) is called. At this point, no data has yet been processed. When the OnPreReport trigger has been run, the first data item is processed unless the processing of the report was ended in the OnPreReport trigger.  

When the first data item has been processed, the next data item, if there's any, is processed in the same way. When there are no more data items, the [OnPostReport Trigger](triggers-auto/report/devenv-onpostreport-report-trigger.md) is called to do any necessary post processing, for example, removing temporary files.  

> [!IMPORTANT]  
> If you define two methods that have the same name, one defined in a report and the other in a table that is referenced by the report, you cannot invoke the  defined in the report directly. By default, a call to the  invokes the  that is defined in the table. This behavior occurs when the  is called from a source expression or a trigger.  

### How a data item is processed

Before the first record is retrieved, the [OnPreDataItem Trigger](triggers-auto/reportdataitem/devenv-onpredataitem-reportdataitem-trigger.md) is called, and after the last record has been processed, the [OnPostDataItem Trigger](triggers-auto/reportdataitem/devenv-onpostdataitem-reportdataitem-trigger.md) is called.  

Between these two triggers, the data item records are processed. Processing a record means executing the record triggers and outputting data. After a record is retrieved from the data item, the [OnAfterGetRecord (Data Items) Trigger](triggers-auto/reportdataitem/devenv-onaftergetrecord-data-items-reportdataitem-trigger.md) is called.  

If there's an indented data item, then the records in this data item are processed.  

When there are no more records to be processed in a data item, control returns to the point from which processing was started. For an indented data item, it's the next record of the data item on the next highest level. If the data item is already on the highest level, then control returns to the report.  

## Trigger execution with multiple previews

[!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (version 17) introduced the ability to preview a report multiple times, without closing the request page. With this change, the execution flow of the report triggers is different.

When previewing a report, a new report instance is scheduled to run immediately. This new instance will rerun all of the report triggers, but won't execute any of the request page triggers. 

This condition leads to the two important differences in the flow, which may influence your design:

1. The **OnInitReport** trigger is run once when opening the request page and again for every preview of the report. In some cases, it can mean that before the report is even executed, the **OnInitReport** trigger has already run twice.
2. The request page and the request page triggers won't be executed on every preview. The new report instances will receive the request page parameters from the initial request page.

For some reports, their design may make it impossible to run them as scheduled reports. It's  possible to disable multiple previews and revert to the legacy preview behavior by setting the [AllowScheduling property](properties/devenv-allowscheduling-property.md) on the report object to `false`. This property was introduced in version 17.2.

## See Also

[Report and DataItem triggers](devenv-report-and-data-item-triggers.md)  
[Report Object](devenv-report-object.md)  
[Triggers](triggers-auto/devenv-triggers.md)  
