---
title: Production and Sandbox Environments
description: Learn about the differences between production and sandbox environments for Dynamics 365 Business Central. 
author: edupont04
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox
ms.date: 09/21/2020
ms.author: edupont
---

# Production and Sandbox Environments

You can create environments of different types. Which type of environment to choose depends on what you need it for.  

<!--The following table outlines some of the benefits of each environment type.

|Column1  |Column2  |
|---------|---------|
|Row1     |         |
|Row2     |         |
|Row3     |         |
|Row4     |         |
|Row5     |         |-->

## Production environments

[!INCLUDE [admin-env-prod](../developer/includes/admin-env-prod.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

## Sandbox environments

[!INCLUDE [admin-env-sandbox](../developer/includes/admin-env-sandbox.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

### Precautions for sandbox environments with production data

If a sandbox is created with a copy of a production environment, a number of precautions are taken for that sandbox:

- The job queue is automatically stopped  
- Any base application integration settings are cleared  
- Outbound HTTP calls from extensions are blocked by default and must be approved for each extension  

    To enable outbound HTTP calls, go to the **Extension Management** page in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], and choose **Configure**. Then, on the **Extension Settings** page, make sure that **Allow HttpClient Requests** is selected. This setting must be enabled for each extension.
- Any General Data Protection Regulation (GDPR) action must be handled separately and repeated for the sandbox. There is no synchronization with the production environment after the sandbox has been created.  

    The internal administrator has the same tools and responsibilities for a sandbox environment as they do for a production environment. As a data processor, [!INCLUDE [prodshort](../developer/includes/prodshort.md)] offers the same level of data protection and data handling restrictions that we apply to production environments.  

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

### Creating default sandbox environments

A single, default sandbox environment can also be created in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application. For more information, see [How to: Create a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics365/business-central/dev-itpro/toc.json).  

## See also

[Managing Environments in the Administration Center](tenant-admin-center-environments.md)  
[Preparing Demonstration Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](demo-environment.md)  
[Preparing Test Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](test-environment.md)  
[Steps to set up a sandbox environment and Visual Studio Code](../developer/devenv-get-started.md#steps-to-set-up-a-sandbox-environment-and-visual-studio-code)  
[Get started with the Container Sandbox Development Environment](../developer/devenv-get-started-container-sandbox.md)  
