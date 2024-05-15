---
title: Auditing events in Purview
description: Get an overview of the signals Business Central emits to Purview.
author: jobulsin
ms.topic: conceptual
ms.date: 13/05/2024
ms.author: jobulsin
---

# Auditing in Business Central

> [!NOTE]
> Purview auditing solutions for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is in Preview. Please register any feedback and requests for additional events to be auditable on (aka.ms/bcideas)[https://aka.ms/bcideas].

Your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments automatically emit auditable events to [Microsoft Purview auditing solutions](~/purview/audit-solutions-overview.md). Microsoft Purview auditing solutions provide an integrated solution to help organizations effectively respond to security events, forensic investigations, internal investigations, and compliance obligations. For [!INCLUDE[prod_short](../developer/includes/prod_short.md)], this means that actions Create, Update, and Delete events that require administrator privileges are emitted to Purview's unified audit log, aiding security, legal, and compliance investigation across all Microsoft services used in your organization.

> [!TIP]  
> Before [!INCLUDE[prod_short](../includes/prod_short.md)] online logs authorization attempts to telemetry, a successful authentication (login) must happen against Microsoft Entra ID (formerly Azure Active Directory). With the information in the Microsoft Entra sign-in log, you can figure out what happened if a user sign-in failed. For more information, see [Analyze sign-ins with the Microsoft Entra sign-in log](/entra/identity/monitoring-health/quickstart-analyze-sign-in)
> 
> If you want to track, monitor, or alert on successful and failed login attempts against Microsoft Entra ID, configure integration to Azure Monitor on Microsoft Entra and analyze further with KQL. For more information, see [Integrate Microsoft Entra logs with Azure Monitor](/entra/identity/monitoring-health/howto-access-activity-logs#integrate-logs-with-azure-monitor-logs).

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments automatically emit all events listed below to Microsoft Purview auditing solutions, and Purview is enabled by default on every tenant. Learn more about enabling or disabling Purview auditing solutions on your tenant [here](~/purview/audit-log-enable-disable).

## Schema
Every event emitted to Purview auditing solutions uses the [common schema](~/office/office-365-management-api/office-365-management-activity-api-schema#common-schema). Events related to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments can be found under the `Dynamics365BusinessCentralLog` AuditLogRecordType. For events with this AuditLogRecordType, the following fields are added to the common schema to contain details specific to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments.

|Name|Description|Mandatory|Type|
|---|---|---|---|
|BcEnvironmentName|The name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment|False|Edm.String|
|BcEnvironmentType|The type of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment (i.e. Production or Sandbox)|False|Edm.String|
|BcCompanyName|The name of the company in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment|False|Edm.String|
|BcCustomDimensions|Contains dynamic values based on the emitted event, see details for each event below|False|Edm.ComplexType|
|BcOperationName|The name of the operation for which the log was emitted|True|Edm.String|

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] events emitted to Purview are categorized as events and operations; events are high-level and are parents to the more specific operations.

|Event name|Description|
|---|---|
|Administered environment|Operations that create, update, or delete environments|
|Configured extension|Operations that create, update, or delete extensions|
|Administered user|Operations that create, update, or delete users|
|Administered company|Operations that create, update, or delete companies|
|Configured integration|Operations that create, update, or delete integrations|
|Configured Copilot|Operations that create, update, or delete Copilot|
|Configured cloud migration|Operations that create, update, or delete cloud migration|
|Administered report|Operations that create, update, or delete reports|

### Administered environment operations

Operations listed in the table below can be audited by filtering to the `Administered environment` event.

<table>
    <thead>
        <tr>
            <th>Operation name</th>
            <th>Custom dimensions</th>
            <th>Sample value</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=2>Created environment</td>
            <td>ApplicationVersion</td>
            <td>24.0.0.0</td>
        </tr>
        <tr>
            <td>CountryCode</td>
            <td>US</td>
        </tr>
        <tr>
            <td>Removed environment</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Renamed environment</td>
            <td>NewEnvironmentName</td>
            <td>EnvironmentName</td>
        </tr>
        <tr>
            <td rowspan=2>Copied environment</td>
            <td>targetEnvironmentType</td>
            <td>Production</td>
        </tr>
        <tr>
            <td>targetEnvironmentName</td>
            <td>EnvironmentName</td>
        </tr>
        <tr>
            <td rowspan=6>Restored environment</td>
            <td>EnvironmentName</td>
            <td>RestoredEnvironment</td>
        </tr>
        <tr>
            <td>EnvironmentType</td>
            <td>Production</td>
        </tr>
        <tr>
            <td>PointInTime</td>
            <td>0001-01-01T00:00:00</td>
        </tr>
        <tr>
            <td>SkipInstallingPTEs</td>
            <td>false</td>
        </tr>
        <tr>
            <td>SkipInstallingThirdPartyGlobalApps</td>
            <td>false</td>
        </tr>
        <tr>
            <td>SkipEnvironmentCleanup</td>
            <td>false</td>
        </tr>
    </tbody>
</table>
