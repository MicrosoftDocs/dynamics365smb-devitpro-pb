---
title: Production and Sandbox Environments
description: Learn about the differences between production and sandbox environments for Dynamics 365 Business Central. 
author: jswymer
ms.topic: article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox
ms.date: 11/12/2024
ms.author: jswymer
ms.reviewer: jswymer
---

# Production and sandbox environments

You can create environments of different types. Which type of environment to choose depends on what you need it for.  

> [!TIP]
> If you're new to environments, get an overview of how Microsoft Entra ID, environments, and companies work in [!INCLUDE [prod_short](../includes/prod_short.md)] online at [Understanding the infrastructure of Business Central online](tenant-environment-topology.md).

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

Use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to manage the environments manually. Learn more in [Managing Production and Sandbox Environments](tenant-admin-center-environments.md).  

Instead, use the [Administration Center API](administration-center-api.md).  

## Sandbox environments

[!INCLUDE [admin-env-sandbox](../developer/includes/admin-env-sandbox.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

### <a name="partnersandbox"></a>Partner sandboxes

As a partner, you can buy the *Dynamics 365 Business Central Partner Sandbox* license. You need a valid Microsoft Partner Network (MPN) ID. This offer was made available to support partners that need nonproduction environments to learn, test, develop, and deliver end-to-end customer demos with their solutions. The *Partner Sandbox* license has to be purchased for at least five users per tenant, gives access to Business Central Premium functionality, and acts as a normal *Premium* license that your customers might acquire.

> [!IMPORTANT]
> The environments that you acquire through the *Dynamics 365 Business Central Partner Sandbox* license are strictly meant for use only on the partner’s tenant. You aren't allowed to use this license in a customer tenant, nor in a production environment.

The first pack of five *Partner Sandbox* licenses grants a base environment quota of one production and three sandbox environments on the tenant. For each extra five Partner Sandbox licenses available on your tenant, the quota increases by three sandbox environments.

Tenants that have the Partner Sandbox license can create sandbox environments on Early Access Preview versions. Learn more in [Early Access Preview Environments](preview-environments.md#early-access-preview).

Partner Sandbox licenses can but don't have to exist alongside regular full user licenses; you can request them for a new tenant or use them to replace existing full user licenses.

Partners can purchase the unique, partner-only license via Web Direct to create flexible, cost-effective solutions that don't expire. Accessing the SKUs and pricing is simple: [Go to experience.dynamics.com](https://experience.dynamics.com/requestlicense/) and submit a request for the *Dynamics 365 Business Central Partner Sandbox* license. Use a valid MPN ID. Once your request is approved, you receive a token to purchase the SKUs directly. Pay by credit card. If the total billing is over $500/month for your company, then you can pay by invoice.

To change the number of Partner Sandbox licenses on your tenant after purchasing initial licenses through experience.dynamics.com, [manage your subscription in the Microsoft 365 Admin Center](/microsoft-365/commerce/subscriptions/manage-self-service-purchases-users#buy-more-or-reduce-licenses).

### <a name="precautions"></a>Precautions for sandbox environments with production data

[!INCLUDE [admin-env-sandbox-precautions](../developer/includes/admin-env-sandbox-precautions.md)]

### Manage sandbox environments

Use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to manage the environments manually. Learn more in [Managing Production and Sandbox Environments](tenant-admin-center-environments.md).  

Alternatively, use the [Administration Center API](administration-center-api.md).  

### Presales performance evaluation

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

### Advanced user experience

It's possible to enable and try the full functionality of the standard version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in a sandbox environment by setting the **Experience** field on the **Company Information** page to *Premium*. Find the **Company Information** page in the :::image type="icon" source="../media/search_small.png" border="false"::: menu in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. However, as an admin, we recommend that you set up dedicated demonstration environments instead. Learn more in [Preparing Demonstration Environments](demo-environment.md).  

### Complete sample data

The standard demonstration company in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] includes sample data for a limited number of scenarios. You can also create a new company with the **Advanced Evaluation - Complete Sample Data** option. In this type of company, users can take training or step through walkthroughs that require more sample data, such as [Walkthrough: Receiving and Putting Away in Basic Warehouse Configurations](/dynamics365/business-central/walkthrough-receiving-and-putting-away-in-basic-warehousing). This sample data is different from the standard sample data, and we advise that you don't capture and share screenshots with this advanced sample data.  

Learn more in [Creating New Companies in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]](/dynamics365/business-central/about-new-company) in the business functionality content.

## Related information

[Managing Environments in the Administration Center](tenant-admin-center-environments.md)  
[Preparing Demonstration Environments](demo-environment.md)  
[Preparing Test Environments](test-environment.md)  
[Steps to set up a sandbox environment and Visual Studio Code](../developer/devenv-get-started.md#steps-to-set-up-a-sandbox-environment-and-visual-studio-code)  
[Get started with the Container Sandbox Development Environment](../developer/devenv-get-started-container-sandbox.md)  
[Performance in Business Central online](../performance/performance-online.md)   
