---
title: Using Key Vault Secrets in Business Central Extensions 
description: Describes how to use an Azure Key vault with Business Central extensions.
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Sending Extension Telemetry to Azure Application Insights

This article describes how to develop an extension to emit telemetry to an Application Insights resource in Azure. There are several operations  

#### Using Application Insights



1. Create an Application Insights resource in Azure if you don't have one.

    The Application Insights resource will be assigned an instrumentation key. Copy this key because you'll need it to enable Application Insights in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].  

    For more information, see [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

2. In the app.json file of the extension, add the `"applicationInsightsKey"`:

 ``` 
 "applicationInsightsKey": ["<instrumenation key>"] 
 ```
3. Now, you can run your extensions and view data in Application Insights.

   For more information, see [Viewing telemetry data in Application Insights](../administration/telemetry-overview.md) and [Analyzing App Key Vault Secret Trace Telemetry](../administration/telemetry-extension-key-vault-trace.md).

## See Also  
[Getting Started with AL](devenv-get-started.md)  
[Publishing and Installing Extensions](devenv-how-publish-and-install-an-extension-v2.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md) 