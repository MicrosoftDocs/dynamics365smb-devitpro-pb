---
title: Enable Sending Telemetry to Application Insights
description: Learn how you can get richer telemetry by connecting your Business Central with Application Insights for telemetry. 
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
ms.date: 07/09/2021
---

# Enable Sending Telemetry to Application Insights

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

This article describes how to set up tenants to send telemetry data to Azure Application Insights for [!INCLUDE [prod_short](../includes/prod_short.md)] online and on-premises environments.

## <a name="appinsights"></a>Get started

1. If you don't already have one, get a subscription to [Microsoft Azure](https://azure.microsoft.com).
2. Sign in to the [Azure portal](https://portal.azure.com).
3. Create an Application Insights resource by following the guidelines at [Workspace-based Application Insights resources](/azure/azure-monitor/app/create-workspace-resource).

    [!INCLUDE [admin-appinsights-germany](../includes/admin-appinsights-germany.md)]

    The Application Insights resource can be in any Azure tenant that is accessible to your organization. For example, a delegated administrator from the reselling partner is the person analyzing the telemetry. But this person might not have access rights the customer's Azure instance. This scenario enables the partner to send the telemetry to their own Application Insights instance.

    > [!TIP]
    > You can use the same Application Insights resource for multiple tenants and their different environments.

    For more information, see [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).  

4. Depending on your [!INCLUDE[prod_short](../includes/prod_short.md)] version, get the **Connection String** or **Instrumentation Key** of the Application Insights resource.

    You can copy this information from the **Overview** page for resource in the Azure portal.

    - For [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (v17) or earlier, copy the **Instrumentation Key**.

    - For later versions, copy the **Connection String**.

        > [!NOTE]
        > For these versions, you can use either the instrumentation key or the connection string. However, for reliability, we recommend that you use the connection string.  

## Enable on tenants

Once you have the resource and its connection string or instrumentation key, you can enable your tenants to send telemetry to your Application Insights resource.

The way you enable Application Insights depends on whether you want to connect to a [!INCLUDE [prod_short](../includes/prod_short.md)] online or [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises. For on-premises, if also depends on whether the [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a single-tenant or multitenant instance.

1. For [!INCLUDE [prod_short](../includes/prod_short.md)] online:

    1. In the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments**, and then select the environment that you want to change.

        > [!IMPORTANT]  
        > The next steps require a restart to the environment, which is triggered automatically at the end of this procedure. Plan to do this during non-working hours to avoid disruptions.
    2. On the **Environment** page, the **Application Insights Key** field shows if the environment already uses application insights.

        To enable application insights, choose the **Define** caption, and then, in the **Set Application Insights Key** pane, choose the **Enable application insights** field and enter the instrumentation key in the **Instrumentation Key** field.  

        > [!NOTE]
        > In version 15 and 16, to enable application insights, choose the **Application Insights Key** action, and then specify the instrumentation key.
    3. Choose the **Save** button.

2. For a single-tenant server instance of [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises:

    1. Set the **Application Insights Connection String** or **Application Insights Instrumentation Key** setting of the server instance. For more information, see [Configuring Business Central Server](configure-server-instance.md#General).

3. For a multitenant server instance of [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises:

    1. Enable this feature on a per-tenant basis when you mount tenants on the [!INCLUDE[server](../developer/includes/server.md)] instance.

        The [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant?view=businesscentral-ps&preserve-view=true) includes the `-ApplicationInsightsConnectionString` and `-ApplicationInsightsKey` parameters. For example:

        ```powershell
        Mount-NAVTenant -ServerInstance BC180 -Tenant tenant1 -DatabaseName "Demo Database BC (18-0)" -DatabaseServer localhost -DatabaseInstance BCDEMO -ApplicationInsightsConnectionString 'InstrumentationKey=11111111-2222-3333-4444-555555555555;IngestionEndpoint=https://westeurope-1.in.applicationinsights.azure.com/'
        ```

        or

        ```powershell
        Mount-NAVTenant -ServerInstance BC180 -Tenant tenant1 -DatabaseName "Demo Database BC (18-0)" -DatabaseServer localhost -DatabaseInstance BCDEMO -ApplicationInsightsKey 11111111-2222-3333-4444-555555555555
        ```

## Enable in Docker

If you're using the BcContainerHelper module, specify the Application Insights instrumentation key when you create the container. The key is used on the server instance for a single-tenant container. For a multi-tenant container, it's used on the default tenant.

```powershell
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

## Cleaning up settings

If the Application Insights resource is tied to your partner account, and you end the relationship with a customer where you have set up telemetry based on your account's instrumentation key, you must remove the instrumentation key while you still have access to that customer's [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

## See Also

[Monitoring Long Running SQL Queries](monitor-long-running-sql-queries-event-log.md)  
[Environment Telemetry](tenant-admin-center-telemetry.md)  
[Monitoring and Analyzing With Telemetry](telemetry-overview.md)  
