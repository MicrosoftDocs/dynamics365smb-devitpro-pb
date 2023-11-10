---
title: AL Platform Overview
description: Introduces and explains the elements that the Business Central platform consists of.
ms.custom: bap-template
ms.date: 09/25/2023
ms.reviewer: na
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: solsen
---

# AL Platform Overview

This section introduces the different parts of the AL platform that are available for extension developers who want to extend the business functionality of [!INCLUDE[prod_short](includes/prod_short.md)].

## Platform capabilities

[!INCLUDE[prod_short](includes/prod_short.md)] comes with a rich platform of system modules and capabilities that you can leverage in your extensions. Getting familiar with the modules in the [!INCLUDE[prod_short](includes/prod_short.md)] system application might save you a lot of time as it contains implementations of many generic tasks you might need. For more information, see [Overview of the System Application](devenv-system-application-overview.md).

You can start background sessions using the task scheduler and job queues can help you offload work from UI sessions. For more information, see [Task Scheduler](devenv-task-scheduler.md).

If you need to call out to external web services, you can use the HTTPClient datatype. For more information, see
[Call external services with the HttpClient data type](devenv-httpclient.md).

Secure your app secrets with Azure Key Vault. For more information, see [Using Azure Key Vaults for Secrets](devenv-app-key-vault-overview.md).

If you want to integrate to online print solutions, learn more about how to develop printer extensions here: [Printer extension overview](devenv-reports-printing.md).

You can create deep links to the web client and the mobile app, see [Web client URL](devenv-web-client-urls.md) and [Business Central app URL](devenv-link-to-mobile-app.md) for more information.

Instrumenting your extension using feature telemetry and custom telemetry can help you monitor the extension after it has been deployed to production. For more information, see [Creating Custom Telemetry Events](devenv-instrument-application-for-telemetry-app-insights.md).



## See Also

[Overview of the System Application](devenv-system-application-overview.md)  
[Task Scheduler](devenv-task-scheduler.md)  
[Job Queue](devenv-job-queue.md)  
[HttpClient Data Type](methods-auto/httpclient/httpclient-data-type.md)  
[Using Azure Key Vaults for Secrets](devenv-app-key-vault-overview.md)  
[Creating Custom Telemetry Events](devenv-instrument-application-for-telemetry-app-insights.md)  
[Add Feature Usage Telemetry](https://github.com/microsoft/BCApps/tree/main/src/System%20Application/App/Telemetry)  
[Creating a Printer Extension](devenv-reports-create-printer-extension.md)  
[Getting started with Microsoft .NET Interoperability from AL (on-premises only)](devenv-get-started-call-dotnet-from-al.md)  
