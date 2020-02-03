---
title: "Lifecycle Services for Embed App"
author: jswymer

ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 01/22/2020
---

# Managing an [!INCLUDE [prodshort](../developer/includes/prodshort.md)] [!INCLUDE[embedapp](../developer/includes/embedapp.md)] in Microsoft Lifecycle Services

Microsoft provides essential functionality and relevant services within [Microsoft Lifecycle Services](https://lcs.dynamics.com/v2) collaboration portal (LCS) to support qualified ISVs and their VARs in managing the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] based on [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online.  

In LCS, a partner can create a project for each [!INCLUDE[embedapp](../developer/includes/embedapp.md)] they would like to deploy to Dynamics 365 Business Central service. When creating a project, the partner will also select the country where the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] is expected to be available. The partner needs to create separate projects for each country, even if the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] is the same. Keeping different countries in different projects can help partner control access for other personas (CSS, VAR and other stakeholders) on the country level.  

Inside of the LCS project, the partner then proceeds to upload the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] package into the Asset library and deploy the environment in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online, based on the uploaded package. After the Environment is successfully provisioned, it is ready to accept customer sign-ups, which can come from either CSP or from self-service (IW) signups.  

Each business entity (tenant) that signed up for the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] is automatically added and displayed on the Tenant list page. On this page, the partner can find more details about the tenant, including the name and the URL to login into each one.  

To upgrade the environment to a new version of the [!INCLUDE[embedapp](../developer/includes/embedapp.md)], the partner must first upload the updated [!INCLUDE[embedapp](../developer/includes/embedapp.md)] package to the Asset library and then deploy it to the environment that is already running. During upgrade, the partner will be able to see the progress on the Tenant list page (version change) and more detailed logs, including detected errors, in the Environment monitoring section. VARs and customers will get notified about the scheduled upgrades and will be able to re-schedule those for more convenient time.  

The partner can define the date and time for the upgrade to start. The upgrade orchestration and execution is then performed Microsoft.  

Before deploying the new version of the application into their production environment, the partner will be able to deploy it into a sandbox environment, where tenants (customers, resellers) that opted in can test the new version safely and provide feedback to the Embed App partner before the partner deploys the new version into a production environment.  

The partner gets access to comprehensive logs for the activities that they perform in the portal:

- Deployment  
- Tenant provisioning  
- Tenant upgrade  
- Runtime (platform)  
- Runtime (application)  

They can also observe service health metrics, the load on the service (user activity, telemetry), and get insights into the performance of their application and tenants.  
In the upcoming updates, we will keep introducing more features and services for the partner to manage their environment efficiently, as well as functionality for resellers (VAR) who help the partner manage their tenants.  

## See Also

[[!INCLUDE[embedapp](../developer/includes/embedapp.md)] Overview](embed-app-overview.md)  
[Licensing in Dynamics 365 Business Central](licensing.md)  
[Components and Capabilities](app-components.md)  
[Microsoft Responsibilities for Apps on Business Central online](microsoft-responsibilities.md)  
[Preparing Demonstration Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../administration/demo-environment.md)  
[Preparing Test Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../administration/test-environment.md)  
