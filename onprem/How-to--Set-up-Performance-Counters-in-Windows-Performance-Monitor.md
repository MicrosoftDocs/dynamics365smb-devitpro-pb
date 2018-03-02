---
title: "How to: Set up Performance Counters in Windows Performance Monitor"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 73fa1a63-ca2f-4c50-a312-8297c18ca255
caps.latest.revision: 9
---
# How to: Set up Performance Counters in Windows Performance Monitor
This topic describes how to use Windows Performance Monitor to collect and view data from the [!INCLUDE[navnow](includes/navnow_md.md)] performance counters. For a list of [!INCLUDE[navnow](includes/navnow_md.md)] performance counters, see [Microsoft Dynamics NAV Performance Counters](Microsoft-Dynamics-NAV-Performance-Counters.md).  
  
### To set up [!INCLUDE[navnow](includes/navnow_md.md)] performance counters  
  
1.  Start Windows Performance Monitor.  
  
    -   Choose **Start**, in the **Search** box, type **perfmon**, and then choose the related link.  
  
2.  In the navigation pane, expand **Monitoring Tools**, and then choose **Performance Monitor**.  
  
3.  In the console pane toolbar, choose the **Add** button.  
  
4.  In the **Add Counters** window, in the **Select counters from computer** drop-down list, choose the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
5.  In the **Available counters** list, expand **[!INCLUDE[navnow](includes/navnow_md.md)]**, and select one or more counters.  
  
6.  In the **Instances of selected object** list, select one or more [!INCLUDE[nav_server](includes/nav_server_md.md)] instances.  
  
7.  Choose the **Add** button, and then choose the **OK** button.  
  
8.  Choose the **OK** button.  
  
     Windows Performance Monitor displays data for the counters that you selected.  
  
 For more information about how to use Windows Performance Monitor, see [Windows Performance Monitor](http://go.microsoft.com/fwlink/?LinkId=259406).  
  
## See Also  
 [Microsoft Dynamics NAV Performance Counters](Microsoft-Dynamics-NAV-Performance-Counters.md)   
 [Monitoring Microsoft Dynamics NAV Server](Monitoring-Microsoft-Dynamics-NAV-Server.md)   
 [Working with Data Collector Sets](Working-with-Data-Collector-Sets.md)