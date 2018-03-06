---
title: "Using OData with Queries That are Set with a Top Number of Rows"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e280dac4-97d9-4a15-b5b8-2a80c3cff73a
caps.latest.revision: 8
manager: edupont
---
# Using OData with Queries That are Set with a Top Number of Rows
[!INCLUDE[navnow](includes/navnow_md.md)] queries include the [TopNumberOfRows Property](TopNumberOfRows-Property.md) and [TOPNUMBEROFROWS Function](TOPNUMBEROFROWS-Function.md) that can be used to specify the maximum number of rows to include in the resulting dataset. The OData configuration includes the **Max Page Size** setting that specifies the maximum number of entities returned per page of OData results. The default value is 1000.  
  
 To ensure that the OData results include the correct number of entities when you are using a query that is set with a top number of rows, you should set the **Max Page Size** value greater than the value that is set by the **TopNumberOfRows**  property and **TOPNUMBEROFROWS**  function. Otherwise, the **TopNumberOfRows** property and **TOPNUMBEROFROWS** function are ignored and the query dataset will be returned in the OData results.  
  
> [!NOTE]  
>  Typically, the **TopNumberOfRows** property or **TOPNUMBEROFROWS** function are used to return a relatively small number of entities, such as the top five, ten, or 100 entities. Therefore, in most cases, the value of the **TopNumberOfRows** property and **TOPNUMBEROFROWS** function will be less than the **Max Page Size**, so that you will not have to change the **Max Page Size** setting.  
  
 For information about how to change the **Max Page Size** setting, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md) and [Server-Driven Paging in OData Web Services](Server-Driven-Paging-in-OData-Web-Services.md).