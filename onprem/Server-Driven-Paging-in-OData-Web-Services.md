---
title: "Server-Driven Paging in OData Web Services"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: af503894-315a-4155-a6d3-ddc30925c5ed
caps.latest.revision: 17
manager: edupont
---
# Server-Driven Paging in OData Web Services
Server-driven paging ensures that the quantity of data that is returned by an OData URI does not overwhelm [!INCLUDE[nav_server](includes/nav_server_md.md)] or client program that you use to capture data, while optimizing performance.  
  
> [!NOTE]  
>  The term *page* in this topic refers only to a page that contains OData results and is not related to [!INCLUDE[navnow](includes/navnow_md.md)] page objects.  
  
## Configuring Server-Driven Paging  
 You configure server-driven paging with the **Max Page Size** setting in the configuration for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that you are using for OData services. To modify the setting, you can use [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md) or [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md). For more information about **Max Page Size** and other [!INCLUDE[nav_server](includes/nav_server_md.md)] parameters, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
 The **Max Page Size** setting specifies the maximum number of entities returned per page of OData results. The default value is 1000. You can consider a page to be a chunk of data. A large data feed is divided into chunks of data. Each chunk contains no more entities than the value of **Max Page Size**. An increase in the value of **Max Page Size** creates fewer chunks \(or pages\) per request, which in turn, decreases the processing time. However, an increase in the **Max Page Size** will increase the memory consumption on the [!INCLUDE[nav_server](includes/nav_server_md.md)] or client. If the value is too large, it can overload the memory on [!INCLUDE[nav_server](includes/nav_server_md.md)]. For performance reasons, you should try to set the value of the **Max Page Size** as large as possible without overloading [!INCLUDE[nav_server](includes/nav_server_md.md)]. If the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] is returning out of memory exceptions, then you should reduce the value of **Max Page Size** until the errors stop.  
  
 When using OData with queries that are set with a top number of rows by either the [TopNumberOfRows Property](TopNumberOfRows-Property.md) and [TOPNUMBEROFROWS Function](TOPNUMBEROFROWS-Function.md), you should set the **Max Page Size** value greater than the value of the **TopNumberOfRows** property and **TOPNUMBEROFROWS** function. For more information, see [Using OData with Queries That are Set with a Top Number of Rows](Using-OData-with-Queries-That-are-Set-with-a-Top-Number-of-Rows.md).  
  
> [!NOTE]  
>  In the CustomSettings.config file for [!INCLUDE[nav_server](includes/nav_server_md.md)], the **Max Page Size** setting is called **ODataServicesPageMaxSize**.  
  
## See Also  
 [OData Web Services](OData-Web-Services.md)   
 [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md)