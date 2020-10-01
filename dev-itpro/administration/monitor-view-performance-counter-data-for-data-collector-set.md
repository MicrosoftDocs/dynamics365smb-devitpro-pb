---
title: "How to: View Performance Counter Data for a Data Collector Set"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 002ace19-dc33-432b-b74f-ac280a51fcd5
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---
# How to: View Performance Counter Data for a Data Collector Set
When you run a Data Collector Set, the data that is collected for performance counters is stored to a log file \(.blg\) in the location that was defined when the Data Collector Set was created. In Windows Performance Monitor, you can view log files to see a visual representation of performance counter data.  
  
### To view the Data Collector Set log file  
  
1.  Start Windows Performance Monitor.  
  
    -   Choose **Start**, in the **Search** box, type **perfmon**, and then choose the related link.  
  
2.  In the navigation pane, expand **Monitoring Tools**, and then choose **Performance Monitor**.  
  
3.  In the console pane toolbar, choose the **View Log Data** button.  
  
     The **Performance Monitor Properties** page opens at the **Source** tab.  
  
4.  In the **Data Source** section, select **Log files**, and then choose the **Add** button.  
  
5.  Browse to the log file that you want to view, and then choose the **Open** button.  
  
6.  Choose the **OK** button.  
  
## See Also  
 [Business Central Performance Counters](performance-counters.md)   
 [Working with Data Collector Sets](monitor-work-with-data-collector-sets.md)   
 [Create Data Collector for Microsoft Dynamics NAV Performance Counters](create-data-collector-performance-counters.md)   
 [Create a Data Collector Set From Template](monitor-create-data-collector-set-from-template.md)   
 [Business Central Performance Counters](performance-counters.md)