---
title: Create Data Collector Set Using Template
description: Use the template to create user-defined Data collector Set for monitoring all Server instances on the computer that is running Business Cenytral Server. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.assetid: d1c5bdd0-a254-4cd9-8784-3590918398a3
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---
# Creating a Data Collector Set From the Template
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides a Data Collector Set template that includes the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] performance counters and additional performance counters for monitoring components, such as memory, physical disks, and SQL Server. You use the template to create user-defined Data Collection Sets for monitoring all [!INCLUDE[server](../developer/includes/server.md)] instances on the computer that is running [!INCLUDE[server](../developer/includes/server.md)].  
  
 The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data collector set template is an XML file that has the name DataCollectorSet.xml and is installed with [!INCLUDE[server](../developer/includes/server.md)]. By default, the template is located in the [!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\\Service folder.  
  
 Data that is collected by a data collector set is stored in a log file that you can view in Performance Monitor.  
  
 For more general information about Data Collector Sets, see [Creating Data Collector Sets](https://technet.microsoft.com/library/cc749337.aspx).  
  
### To create a data collection set from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] template  
  
1.  On the computer that is running [!INCLUDE[server](../developer/includes/server.md)], start Performance Monitor.  
  
    -   Choose **Start**, in the **Search** box, type **perfmon**, and then choose the related link.  
  
2.  In the navigation pane, expand **Data Collector Sets**, right-click **User-defined**, choose **New**, and then choose **Data Collector Set**.  
  
3.  In the **Create new Data Collector Set Wizard** page, enter a name for the new data collector set. Select **Create from a template \(Recommended\)**, and then choose the **Next** button.  
  
4.  On the **Which template would you like to use** page, choose the **Browse** button, locate the DataCollectorSet.xml, and then choose the **Open** button.  
  
     By default, the template is located in the [!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\\Service folder.  
  
5.  Choose the **Next** button, and then follow the instructions to finish creating the data collector set.  
  
     To see the new Data Collector Set, in the navigation pane, expand **Data Collector Sets**, and then expand **User Defined**.  
  
 For information about how to start the Data Collector Set, see [To start and stop a Data Collector Set](create-data-collector-performance-counters.md#StartDataCollectorSet).  
  
## See Also  
 [Working with Data Collector Sets](monitor-work-with-data-collector-sets.md)   
 [Business Central Performance Counters](performance-counters.md)   
 [View Performance Counter Data for a Data Collector Set](monitor-view-performance-counter-data-for-data-collector-set.md)   
 [Business Central Performance Counters](performance-counters.md)