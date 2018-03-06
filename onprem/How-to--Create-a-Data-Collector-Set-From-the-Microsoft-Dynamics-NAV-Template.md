---
title: Create Data Collector Set Using Template
description: Use the template to create user-defined Data collector Set for monitoring all Server instances on the computer that is running Dynamics NAV Server. 
ms.custom: na
ms.date: 11/27/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d1c5bdd0-a254-4cd9-8784-3590918398a3
caps.latest.revision: 11
---
# Creating a Data Collector Set From the Microsoft Dynamics NAV Template
[!INCLUDE[navnow](includes/navnow_md.md)] provides a Data Collector Set template that includes the [!INCLUDE[navnow](includes/navnow_md.md)] performance counters and additional performance counters for monitoring components, such as memory, physical disks, and SQL Server. You use the template to create user-defined Data Collection Sets for monitoring all [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
 The [!INCLUDE[navnow](includes/navnow_md.md)] data collector set template is an XML file that has the name DataCollectorSet.xml and is installed with [!INCLUDE[nav_server](includes/nav_server_md.md)]. By default, the template is located in the [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service folder.  
  
 Data that is collected by a data collector set is stored in a log file that you can view in Performance Monitor.  
  
 For more general information about Data Collector Sets, see [Creating Data Collector Sets](http://technet.microsoft.com/en-us/library/cc749337.aspx).  
  
### To create a data collection set from the [!INCLUDE[navnow](includes/navnow_md.md)] template  
  
1.  On the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], start Performance Monitor.  
  
    -   Choose **Start**, in the **Search** box, type **perfmon**, and then choose the related link.  
  
2.  In the navigation pane, expand **Data Collector Sets**, right-click **User-defined**, choose **New**, and then choose **Data Collector Set**.  
  
3.  In the **Create new Data Collector Set Wizard** page, enter a name for the new data collector set. Select **Create from a template \(Recommended\)**, and then choose the **Next** button.  
  
4.  On the **Which template would you like to use** page, choose the **Browse** button, locate the DataCollectorSet.xml, and then choose the **Open** button.  
  
     By default, the template is located in the [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service folder.  
  
5.  Choose the **Next** button, and then follow the instructions to finish creating the data collector set.  
  
     To see the new Data Collector Set, in the navigation pane, expand **Data Collector Sets**, and then expand **User Defined**.  
  
 For information about how to start the Data Collector Set, see [To start and stop a Data Collector Set](How-to--Create-a-Data-Collector-for-Microsoft-Dynamics-NAV-Performance-Counters.md#StartDataCollectorSet).  
  
## See Also  
 [Working with Data Collector Sets](Working-with-Data-Collector-Sets.md)   
 [Microsoft Dynamics NAV Performance Counters](Microsoft-Dynamics-NAV-Performance-Counters.md)   
 [How to: View Performance Counter Data for a Data Collector Set](How-to--View-Performance-Counter-Data-for-a-Data-Collector-Set.md)   
 [Microsoft Dynamics NAV Performance Counters](Microsoft-Dynamics-NAV-Performance-Counters.md)