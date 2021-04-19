---
title: Production and Sandbox Environments
description: Learn about the differences between production and sandbox environments for Dynamics 365 Business Central. 
author: edupont04
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox
ms.date: 04/13/2021
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

### Manage production environments

Use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to mange the environments manually. For more information, see [Managing Production and Sandbox Environments](tenant-admin-center-environments.md).  

Alternatively, use the [Administration Center API](administration-center-api.md).  

## Sandbox environments

[!INCLUDE [admin-env-sandbox](../developer/includes/admin-env-sandbox.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

### <a name="precautions"></a>Precautions for sandbox environments with production data

[!INCLUDE [admin-env-sandbox-precautions](../developer/includes/admin-env-sandbox-precautions.md)]

### Manage sandbox environments

Use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to mange the environments manually. For more information, see [Managing Production and Sandbox Environments](tenant-admin-center-environments.md).  

Alternatively, use the [Administration Center API](administration-center-api.md).  

### Pre-sales performance evaluation

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

### Creating default sandbox environments

A single, default sandbox environment can also be created in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application. For more information, see [How to: Create a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics365/business-central/dev-itpro/toc.json).  

## See also

[Managing Environments in the Administration Center](tenant-admin-center-environments.md)  
[Preparing Demonstration Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](demo-environment.md)  
[Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](test-environment.md)  
[Steps to set up a sandbox environment and Visual Studio Code](../developer/devenv-get-started.md#steps-to-set-up-a-sandbox-environment-and-visual-studio-code)  
[Get started with the Container Sandbox Development Environment](../developer/devenv-get-started-container-sandbox.md)  
