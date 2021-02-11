---
title: "Enabling Application Insights for Tenant Telemetry On-Premises"
description: This article describes how to enable Application Insights for telemetry on-premises. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
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

1. Sign in to the [Azure portal](https://portal.azure.com).
2. Create an Application Insights resource by following the guidelines at [Workspace-based Application Insights resources](/azure/azure-monitor/app/create-workspace-resource).

    > [!IMPORTANT]
    > If you're running [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (v17) or earlier, don't use an Azure Application Insights resource in Germany regions, like **(Europe) Germany West Central** or **(Europe) Germany North**. If you do, traces from [!INCLUDE[prod_short](../includes/prod_short.md)] might not be recorded in Application Insights.

3. Depending on your [!INCLUDE[prod_short](../includes/prod_short.md)] version, get the **Connection String** or **Instrumentation Key** of the Application Insights resource.

    You can copy this information from the **Overview** page for resource in the Azure portal.

    - For [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (v17) or earlier, copy the **Instrumentation Key**.

    - For later versions, copy the **Connection String**.

        > [!NOTE]
        > For these versions, you can use the instrumentation key instead of the connection string. However, for reliability, we recommend that you use the connection string.  

## Enable on tenants

Once you have the resource and its connection string or instrumentation key, you can enable your tenants to send telemetry to your Application Insights resource.

The way you enable Application Insights depends on whether the [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a single-tenant or multitenant instance:

- For a single-tenant server instance, you set the **Application Insights Connection String** or **Application Insights Instrumentation Key** setting of the server instance. For more information, see [Configuring Business Central Server](configure-server-instance.md#General).

- For a multitenant server instance, you enable this feature on a per-tenant basis when you mount tenants on the [!INCLUDE[server](../developer/includes/server.md)] instance.

    The [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant?view=businesscentral-ps) includes the `-ApplicationInsightsConnectionString` and `-ApplicationInsightsKey` parameters. For example:

    ```powershell
    Mount-NAVTenant -ServerInstance BC180 -Tenant tenant1 -DatabaseName "Demo Database BC (18-0)" -DatabaseServer localhost -DatabaseInstance BCDEMO -ApplicationInsightsConnectionString InstrumentationKey=11111111-2222-3333-4444-555555555555;IngestionEndpoint=https://westeurope-1.in.applicationinsights.azure.com/
    ```

    or

    ```powershell
    Mount-NAVTenant -ServerInstance BC180 -Tenant tenant1 -DatabaseName "Demo Database BC (18-0)" -DatabaseServer localhost -DatabaseInstance BCDEMO -ApplicationInsightsKey 11111111-2222-3333-4444-555555555555
    ```

## Enable in Docker

If you're using the BcContainerHelper module, specify the Application Insights instrumentation key when you create the container. The key is used on the server instance for a single-tenant container. For a multi-tenant container, it's used on the default tenant.

```
New-BcContainer `
    -accept_eula `
    -updateHosts `
    -artifactUrl (Get-BCArtifactUrl -country us) `
    -applicationInsightsKey "11111111-2222-3333-4444-555555555555" 
```

You can specify the same or another key when creating more tenants:

```powershell
New-BcContainerTenant -tenantId "additional" -applicationInsightsKey "11111111-2222-3333-4444-555555555555" 
```

## See Also

[Monitoring Long Running SQL Queries](monitor-long-running-sql-queries-event-log.md)  
[Enable Application Insights for Online](tenant-admin-center-telemetry.md#appinsights)  
[Monitoring and Analyzing With Telemetry](telemetry-overview.md)  
