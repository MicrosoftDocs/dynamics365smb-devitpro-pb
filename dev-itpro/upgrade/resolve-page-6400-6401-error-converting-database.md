---
title: "Page 6400 and 6401 Errors "
description: "Explains how to resolve the compilation errors that you get forPage 6400 and 6401 when converting a database from Dynamics NAV to Business Central."
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Resolving Page 6400 and 6401 Compilation Errors 
This article explains how to resolve the compilation error that you get for page **6400 Flow Selector** and page **6401 Flow Template Selector** when converting a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to  [!INCLUDE[prodhort](../developer/includes/prodshort.md)].

## Resolution

In the `ControlAddinReady` function for page 6400 and 6401, replace the following code:

``` 
CurrPage.FlowAddin.Initialize(
  FlowServiceManagement.GetFlowUrl,FlowServiceManagement.GetLocale,
  AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowARMResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE),
  AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowGraphResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE));
```

With the following code:

```
CurrPage.FlowAddin.Initialize(
        FlowServiceManagement.GetFlowUrl,FlowServiceManagement.GetLocale,
        AzureAdMgt.GetAccessToken(FlowServiceManagement.GetFlowARMResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE),
        AzureAdMgt.GetAccessToken(FlowServiceManagement.GetAzureADGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE),
        AzureAdMgt.GetAccessToken(FlowServiceManagement.GetMicrosoftGraphhResourceUrl,FlowServiceManagement.GetFlowResourceName,FALSE));
```


## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2018-Database.md)  
