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
ms.date: 12/15/2021
ms.author: edupont
---

# Production and Sandbox Environments

You can create environments of different types. Which type of environment to choose depends on what you need it for.  

> [!TIP]
> If you're new to environments, get an overview of how Azure Active Directory, environments, and companies work in [!INCLUDE [prod_short](../includes/prod_short.md)] online at [Understanding the infrastructure of Business Central online](tenant-environment-topology.md).

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

> [!NOTE]
> [!INCLUDE [admin-suspended](../includes/admin-suspended.md)]

### Manage production environments

Use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to manage the environments manually. For more information, see [Managing Production and Sandbox Environments](tenant-admin-center-environments.md).  

Instead, use the [Administration Center API](administration-center-api.md).  

## Sandbox environments

[!INCLUDE [admin-env-sandbox](../developer/includes/admin-env-sandbox.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

### <a name="precautions"></a>Precautions for sandbox environments with production data

[!INCLUDE [admin-env-sandbox-precautions](../developer/includes/admin-env-sandbox-precautions.md)]

### Manage sandbox environments

Use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to manage the environments manually. For more information, see [Managing Production and Sandbox Environments](tenant-admin-center-environments.md).  

Alternatively, use the [Administration Center API](administration-center-api.md).  

### Pre-sales performance evaluation

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

### Advanced user experience

It is possible to enable and try the full functionality of the standard version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in a sandbox environment by setting the **Experience** field on the **Company Information** page to *Premium*. Find the **Company Information** page in the :::image type="icon" source="../media/search_small.png" border="false"::: menu in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. However, we recommend that you as the admin set up dedicated demonstration environments instead. For more information, see [Preparing Demonstration Environments](demo-environment.md).  

### Complete sample data

The standard demonstration company in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] includes sample data for a limited number of scenarios. You can also create a new company with the **Advanced Evaluation - Complete Sample Data** option. In this type of company, users can take training or step through walkthroughs that require more sample data, such as [Walkthrough: Receiving and Putting Away in Basic Warehouse Configurations](/dynamics365/business-central/walkthrough-receiving-and-putting-away-in-basic-warehousing). This sample data is different from the standard sample data, and we advise that you do not capture and share screenshots with this advanced sample data.  

For more information, see [Creating New Companies in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]](/dynamics365/business-central/about-new-company) in the business functionality content.

## See also

[Managing Environments in the Administration Center](tenant-admin-center-environments.md)  
[Preparing Demonstration Environments](demo-environment.md)  
[Preparing Test Environments](test-environment.md)  
[Steps to set up a sandbox environment and Visual Studio Code](../developer/devenv-get-started.md#steps-to-set-up-a-sandbox-environment-and-visual-studio-code)  
[Get started with the Container Sandbox Development Environment](../developer/devenv-get-started-container-sandbox.md)  
