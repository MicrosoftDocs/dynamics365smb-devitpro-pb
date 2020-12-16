---
title: "How to: Set up Performance Counters in Windows Performance Monitor"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 73fa1a63-ca2f-4c50-a312-8297c18ca255
caps.latest.revision: 9
---
# Set up Performance Counters in Windows Performance Monitor
This topic describes how to use Windows Performance Monitor to collect and view data from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] performance counters. For a list of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] performance counters, see [Business Central Performance Counters](performance-counters.md).  
  
### To set up [!INCLUDE[prod_short](../developer/includes/prod_short.md)] performance counters  
  
1.  Start Windows Performance Monitor.  
  
    -   Choose **Start**, in the **Search** box, type **perfmon**, and then choose the related link.  
  
2.  In the navigation pane, expand **Monitoring Tools**, and then choose **Performance Monitor**.  
  
3.  In the console pane toolbar, choose the **Add** button.  
  
4.  In the **Add Counters** window, in the **Select counters from computer** drop-down list, choose the computer that is running [!INCLUDE[server](../developer/includes/server.md)].  
  
5.  In the **Available counters** list, expand **[!INCLUDE[prod_short](../developer/includes/prod_short.md)]**, and select one or more counters.  
  
6.  In the **Instances of selected object** list, select one or more [!INCLUDE[server](../developer/includes/server.md)] instances.  
  
7.  Choose the **Add** button, and then choose the **OK** button.  
  
8.  Choose the **OK** button.  
  
     Windows Performance Monitor displays data for the counters that you selected.  
  
 For more information about how to use Windows Performance Monitor, see [Windows Performance Monitor](https://go.microsoft.com/fwlink/?LinkId=259406).  
  
## See Also  
 [Business Central Performance Counters](performance-counters.md)   
 [Monitoring Business Central Server](monitor-server.md)   
 [Working with Data Collector Sets](monitor-work-with-data-collector-sets.md)