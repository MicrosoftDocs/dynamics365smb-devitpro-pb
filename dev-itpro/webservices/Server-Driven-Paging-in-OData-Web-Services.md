---
title: "Server-Driven Paging in OData Web Services"
description: Learn about how to configure paging in OData requests.
ms.custom: na
ms.date: 05/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Server-Driven Paging in OData Web Services

Paging ensures that the quantity of data that is returned by an OData URI doesn't overwhelm [!INCLUDE[server](../developer/includes/server.md)] or client program that you use to capture data, while optimizing performance.  
  
> [!NOTE]
> The term *page* in this topic refers only to a page that contains OData results and is not related to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] page objects.

## Overview

The size of data in results of an OData request will affect performance. In general, the more data you have, the longer it takes to process the request, potentially increasing memory usage. With pages that are slow, this condition can lead to request timeouts and out-of-memory exceptions.

Paging divides the data feed of a request into smaller chunks, or *pages*, which can't contain more than a specific number of entities. In essence, each page is handled as a separate request, with its own timeout. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises and online are set up to use a maximum of **20,000** entities per page by default. With [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, page size is determined by a configuration setting on the [!INCLUDE[server](../developer/includes/server.md)], which you can change. With [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, the page size is configured on the service and can't be changed.

However, with both on-premises and online, you can override the server-drive paging on a request-basis. This capability allows you to handle situations where you're experiencing timeouts and memory exceptions.

## Configuring server-driven paging for on-premises

You configure server-driven paging with the **Max Page Size** setting in the configuration for the [!INCLUDE[server](../developer/includes/server.md)] instance that you're using for OData services. To modify the setting, you can use [Server Administration Tool](../administration/administration-tool.md) or [Business Central Windows PowerShell Cmdlets](/powershell/business-central/overview). For more information about **Max Page Size** and other [!INCLUDE[server](../developer/includes/server.md)] parameters, see [Configuring Business Central Server](../administration/configure-server-instance.md).  
  
An increase in the **Max Page Size** will increase the memory consumption on the [!INCLUDE[server](../developer/includes/server.md)] or client. If the value is too large, it can overload the memory on [!INCLUDE[server](../developer/includes/server.md)]. For performance reasons, you should try to set the value of the **Max Page Size** as large as possible without overloading [!INCLUDE[server](../developer/includes/server.md)].
  
When using OData with queries that are set with a top number of rows by either the [TopNumberOfRows Property](../developer/properties/devenv-TopNumberOfRows-Property.md) and [TopNumberOfRows Method](../developer/methods-auto/query/queryinstance-topnumberofrows-method.md), you should set the **Max Page Size** value greater than the value of the **TopNumberOfRows** property and **TopNumberOfRows** method. For more information, see [Using OData with Queries That are Set with a Top Number of Rows](use-odata-with-queries-set-with-top-number-of-rows.md).  
  
> [!NOTE] 
> In the CustomSettings.config file for [!INCLUDE[server](../developer/includes/server.md)], the **Max Page Size** setting is called **ODataServicesMaxPageSize**.  

## Overriding Server-Driven Paging 

Instead relying on the server-driven paging setting, you can set paging on individual requests by the client. Setting paging on requests is useful when pages are slow and you're experiencing timeouts or out of memory exceptions.

To set paging on a request, use the `odata.maxpagesize` preference in the `Prefer` header of the HTTP request:

```HTTP
Prefer: odata.maxpagesize=300
```

> [!NOTE]
> `odata.maxpagesize` can't be greater than the **ODataServicesMaxPageSize** server setting for on-premises and 20000 for online.
  
## See Also

[OData Web Services](OData-Web-Services.md)