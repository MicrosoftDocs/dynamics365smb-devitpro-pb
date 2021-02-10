---
title: "Enabling Application Insights for Tenant Telemetry On-Premises"
description: This topic describes how to enable Application Insights for telemetry on-premises. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Enabling Application Insights for Tenant Telemetry On-Premises

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

This article describes how to set up tenants to send telemetry data to Azure Application Insights for on-premises environments.

<!--
> [!IMPORTANT]
> If you using [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (v17) or earlier, emitting data to Azure Application Insights resources in Germany regions, like **(Europe) Germany West Central** or **(Europe) Germany North** , doesn't work. Until this issue is fixed, the mitigation is to create an Azure Application Insights resource in a region outside of Germany. Then, when the issue has been fixed, move the resource to the preferred region.
-->

## <a name="ApplicationInsights"></a>Get started

1. Create an Application Insights resource.

    See [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

    > [!IMPORTANT]
    > If you using [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (v17) or earlier, don't use an Azure Application Insights resource in Germany regions, like **(Europe) Germany West Central** or **(Europe) Germany North**, because you may have problems connecting to the resource using the instrumentation key.

2. Get the connection string or the instrumentation key of the Application Insights resource. You get this information from the [Azure Portal](/azure/bot-service/bot-service-resources-app-insights-keys?view=azure-bot-service-4.0).

    - If you using [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (v17) or earlier, use the instrumentation key. The instrumentation key looks something like this: 11111111-2222-3333-4444-555555555555.

    - For all later versions, use the connection string. The connection string looks something like this: InstrumentationKey=11111111-2222-3333-4444-555555555555;IngestionEndpoint=https://westeurope-1.in.applicationinsights.azure.com/

        > [!NOTE]
        > For these versions, you can use the instrumentation key. However, for reliability reasons, we recommend that you use the connection string.  

## Enable on tenants

Once you have the resource and its connection string , you can enable your tenants to send telemetry to your Application Insights resource.

The way you enable Application Insights depends on whether the [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a single-tenant or multitenant instance:

- For a single-tenant server instance, you set the **Application Insights Connection String** setting of the server instance. For more information, see [Configuring Business Central Server](configure-server-instance.md#General).

- For a multitenant server instance, you enable this feature on a per-tenant basis when you mount tenants on the [!INCLUDE[server](../developer/includes/server.md)] instance. The [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant?view=businesscentral-ps) includes the `-ApplicationInsightsConnectionString` parameter that you set to the instrumentation key, for example:

    ```
    Mount-NAVTenant -ServerInstance BC150 -Tenant tenant1 -DatabaseName "Demo Database BC (18-0)" -DatabaseServer localhost -DatabaseInstance BCDEMO -ApplicationInsightsConnectionString InstrumentationKey=11111111-2222-3333-4444-555555555555;IngestionEndpoint=https://westeurope-1.in.applicationinsights.azure.com/
    ```

    or

    ```
    Mount-NAVTenant -ServerInstance BC150 -Tenant tenant1 -DatabaseName "Demo Database BC (18-0)" -DatabaseServer localhost -DatabaseInstance BCDEMO -ApplicationInsightsKey 11111111-2222-3333-4444-555555555555
    ```

## Enable in Docker

If you are running Business Central in Docker using the latest BcContainerHelper, you can specify the Application Insights Key when creating the container and this will be used in server instance settings if the container is single-tenant or for the default tenant if the container is multi-tenant.

    New-BcContainer `
        -accept_eula `
        -updateHosts `
        -artifactUrl (Get-BCArtifactUrl -country us) `
        -applicationInsightsKey "11111111-2222-3333-4444-555555555555" 

You can specify the same or another key when creating additional tenants:

    New-BcContainerTenant -tenantId "additional" -applicationInsightsKey "55555555-4444-3333-2222-111111111111" 

## See Also

[Monitoring Long Running SQL Queries](monitor-long-running-sql-queries-event-log.md)  
[Enable Application Insights for Online](tenant-admin-center-telemetry.md#appinsights)  
[Monitoring and Analyzing With Telemetry](telemetry-overview.md)  
