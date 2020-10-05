---
title: "Server-Driven Paging in OData Web Services"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Server-Driven Paging in OData Web Services
Server-driven paging ensures that the quantity of data that is returned by an OData URI does not overwhelm [!INCLUDE[server](../developer/includes/server.md)] or client program that you use to capture data, while optimizing performance.  
  
> [!NOTE] 
>  The term *page* in this topic refers only to a page that contains OData results and is not related to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] page objects.  
  
## Configuring Server-Driven Paging  
 You configure server-driven paging with the **Max Page Size** setting in the configuration for the [!INCLUDE[server](../developer/includes/server.md)] instance that you are using for OData services. To modify the setting, you can use [Server Administration Tool](../administration/administration-tool.md) or [Business Central Windows PowerShell Cmdlets]((/powershell/business-central/overview). For more information about **Max Page Size** and other [!INCLUDE[server](../developer/includes/server.md)] parameters, see [Configuring Business Central Server](../administration/configure-server-instance.md).  
  
 The **Max Page Size** setting specifies the maximum number of entities returned per page of OData results. The default value is 1000. You can consider a page to be a chunk of data. A large data feed is divided into chunks of data. Each chunk contains no more entities than the value of **Max Page Size**. An increase in the value of **Max Page Size** creates fewer chunks \(or pages\) per request, which in turn, decreases the processing time. However, an increase in the **Max Page Size** will increase the memory consumption on the [!INCLUDE[server](../developer/includes/server.md)] or client. If the value is too large, it can overload the memory on [!INCLUDE[server](../developer/includes/server.md)]. For performance reasons, you should try to set the value of the **Max Page Size** as large as possible without overloading [!INCLUDE[server](../developer/includes/server.md)]. If the computer that is running [!INCLUDE[server](../developer/includes/server.md)] is returning out of memory exceptions, then you should reduce the value of **Max Page Size** until the errors stop.  
  
 When using OData with queries that are set with a top number of rows by either the [TopNumberOfRows Property](../developer/properties/devenv-TopNumberOfRows-Property.md) and [TopNumberOfRows Method](../developer/methods-auto/query/queryinstance-topnumberofrows-method.md), you should set the **Max Page Size** value greater than the value of the **TopNumberOfRows** property and **TopNumberOfRows** method. For more information, see [Using OData with Queries That are Set with a Top Number of Rows](use-odata-with-queries-set-with-top-number-of-rows.md).  
  
> [!NOTE] 
> In the CustomSettings.config file for [!INCLUDE[server](../developer/includes/server.md)], the **Max Page Size** setting is called **ODataServicesMaxPageSize**.  
  
## See Also  
 [OData Web Services](OData-Web-Services.md)  