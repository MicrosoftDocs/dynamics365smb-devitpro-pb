---
title: "AL Platform Overview"
description: Introduces and explains the elements that the Business Central platform consists of.
ms.custom: na
ms.date: 04/12/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
---

# AL Platform Overview

This section introduces the different parts of the AL platform that are available for extension developers who want to extend the business functionality of [!INCLUDE[prod_short](includes/prod_short.md)].

## Platform capabilities

[!INCLUDE[prod_short](includes/prod_short.md)] comes with a rich platform of system modules and capabilities that you can leverage in your extensions. Getting familiar with the modules in the [!INCLUDE[prod_short](includes/prod_short.md)] system application might save you a lot of time as it contains implementations of many generic tasks you might need. For more information, see [Overview of the System Application](devenv-system-application-overview.md).

Learning how to start background sessions using the task scheduler and job queues can help you offload work from UI sessions. For more information, see [Task Scheduler](devenv-task-scheduler.md).

Instrumenting your extension using feature telemetry and custom telemetry can help you monitor the extension after it has been deployed to production. For more information, see [Creating Custom Telemetry Events](devenv-instrument-application-for-telemetry-app-insights.md) and [Add Feature Usage Telemetry](https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Telemetry).

## See Also

[Overview of the System Application](devenv-system-application-overview.md)  
[Task Scheduler](devenv-task-scheduler.md)  
[Job Queue](devenv-job-queue.md)  
[Using Azure Key Vaults for Secrets](devenv-app-key-vault-overview.md)  
[Creating Custom Telemetry Events](devenv-instrument-application-for-telemetry-app-insights.md)  
[Add Feature Usage Telemetry](https://github.com/microsoft/ALAppExtensions/tree/main/Modules/System/Telemetry)  
[Creating a Printer Extension](devenv-reports-create-printer-extension.md)  
[Getting started with Microsoft .NET Interoperability from AL (on-premises only)](devenv-get-started-call-dotnet-from-al.md)  
