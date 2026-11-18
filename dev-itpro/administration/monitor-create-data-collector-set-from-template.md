---
title: Create Data Collector Set Using Template
description: Create a Data Collector Set from the Business Central Server template to collect performance counters for server instances, memory, disks, and SQL Server.
ms.date: 11/17/2026
ms.topic: how-to
author: SusanneWindfeldPedersen
ai-usage: ai-assisted
---
# Creating a Data Collector Set from the template

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides a Data Collector Set template that includes the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] performance counters and additional performance counters for monitoring components, such as memory, physical disks, and SQL Server. You use the template to create user-defined Data Collector Sets for monitoring all [!INCLUDE[server](../developer/includes/server.md)] instances on the computer that is running [!INCLUDE[server](../developer/includes/server.md)].  
  
The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data collector set template is an XML file that has the name `DataCollectorSet.xml` and is installed with [!INCLUDE[server](../developer/includes/server.md)]. By default, the template is located in the [!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\\Service folder.  
  
Data that is collected by a data collector set is stored in a log file that you can view in Performance Monitor.  
  
 Learn more about Data Collector Sets in [Creating Data Collector Sets](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc749337(v=ws.11)).  
  
## Create a Data Collector Set from the template
  
1. On the computer that is running [!INCLUDE[server](../developer/includes/server.md)], start Performance Monitor.  
  
  Select **Start**, in the **Search** box, type **perfmon**, and then select the related link.  
  
1. In the navigation pane, expand **Data Collector Sets**, right-click **User Defined**, select **New**, and then select **Data Collector Set**.  
1. In the **Create new Data Collector Set Wizard** page, enter a name for the new data collector set. Select **Create from a template \(Recommended\)**, and then select the **Next** button.  
1. On the **Which template would you like to use** page, select the **Browse** button, locate `DataCollectorSet.xml`, and then select the **Open** button.  

   By default, the template is located in the [!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\\Service folder.  
  
1. Select the **Next** button, and then follow the instructions to finish creating the data collector set.  
  
   To view the new Data Collector Set, in the navigation pane, expand **Data Collector Sets**, and then expand **User Defined**.  
  
Learn more about starting the Data Collector Set in [To start and stop a Data Collector Set](create-data-collector-performance-counters.md#StartDataCollectorSet).  
  
## Related information

[Working with Data Collector Sets](monitor-work-with-data-collector-sets.md)  
[Business Central Performance Counters](performance-counters.md)  
[View Performance Counter Data for a Data Collector Set](monitor-view-performance-counter-data-for-data-collector-set.md)  
