---
title: "Report Triggers"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Report Triggers
When you run a report, the report triggers are called in a specific order.  

 The following illustration describes the order of report triggers.  

 ![Order of report triggers](../media/reporttriggers.png "ReportTriggers")  

## Report triggers  
 When you initiate the report run, the [OnInitReport Trigger](devenv-oninitreport-trigger.md) is called. If the OnInitReport does not end the processing of the report, then the request page for the report is run, if it is defined. The page triggers for the request page are called. On the request page, you select the options that you want for this report. You can also decide to cancel the report run. If you decide to continue, then the [OnPreReport Trigger](devenv-onprereport-trigger.md) is called. At this point, no data has yet been processed. When the OnPreReport trigger has been run, the first data item is processed provided that the processing of the report was not ended in the OnPreReport trigger.  

 When the first data item has been processed, the next data item, if there is any, is processed in the same way. When there are no more data items, the [OnPostReport Trigger](devenv-onpostreport-trigger.md) is called to do any necessary post processing, for example, removing temporary files.  

> [!IMPORTANT]  
>  If you define two methods that have the same name, one defined in a report and the other in a table that is referenced by the report, you cannot invoke the  defined in the report directly. By default, a call to the  invokes the  that is defined in the table. This behavior occurs when the  is called from a source expression or a trigger.  

### How a data item is processed  
 Before the first record is retrieved, the [OnPreDataItem Trigger](devenv-onpredataitem-trigger.md) is called, and after the last record has been processed, the [OnPostDataItem Trigger](devenv-onpostdataitem-trigger.md) is called.  

 Between these two triggers, the data item records are processed. Processing a record means executing the record triggers and outputting data. After a record is retrieved from the data item, the [OnAfterGetRecord (Data Items) Trigger](devenv-onaftergetrecord-data-items-trigger.md) is called.  

 If there is an indented data item, then the records in this data item are processed.  

 When there are no more records to be processed in a data item, control returns to the point from which processing was initiated. For an indented data item, this means the next record of the data item on the next highest level. If the data item is already on the highest level, then control returns to the report.  

## See Also

[Report and DataI](devenv-report-and-data-item-triggers.md)  
[Report Object](../devenv-report-object.md)  
[Triggers](devenv-triggers.md)  
