---
title: Auditing events in Purview
description: Get an overview of the signals Business Central emits to Purview.
author: jobulsin
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 05/21/2024
ms.author: jobulsin
---

# Auditing in Purview

> [!NOTE]
> Purview auditing solutions for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is in Preview. Please register any feedback and requests for additional events to be auditable on [aka.ms/bcideas][https://aka.ms/bcideas].

Your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments automatically emit auditable events to [Microsoft Purview auditing solutions](/purview/audit-solutions-overview). Microsoft Purview auditing solutions provide an integrated solution to help organizations effectively respond to security events, forensic investigations, internal investigations, and compliance obligations. For [!INCLUDE[prod_short](../developer/includes/prod_short.md)], this means that Create, Update, and Delete events that require administrator privileges are emitted to Purview's unified audit log, aiding security, legal, and compliance investigation across all Microsoft services used in your organization.

> [!TIP]  
> Before [!INCLUDE[prod_short](../includes/prod_short.md)] online logs authorization attempts to telemetry, a successful authentication (login) must happen against Microsoft Entra ID (formerly Azure Active Directory). With the information in the Microsoft Entra sign-in log, you can figure out what happened if a user sign-in failed. For more information, see [Analyze sign-ins with the Microsoft Entra sign-in log](/entra/identity/monitoring-health/quickstart-analyze-sign-in).
> 
> If you want to track, monitor, or alert on successful and failed login attempts against Microsoft Entra ID, configure integration to Azure Monitor on Microsoft Entra and analyze further with KQL. For more information, see [Integrate Microsoft Entra logs with Azure Monitor](/entra/identity/monitoring-health/howto-access-activity-logs#integrate-logs-with-azure-monitor-logs).

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments automatically emit all events listed below to Microsoft Purview auditing solutions, and Purview is enabled by default on every tenant. Learn more about enabling or disabling Purview auditing solutions on your tenant [here](/purview/audit-log-enable-disable).

## Schema

Every event emitted to Purview auditing solutions uses the [common schema](/office/office-365-management-api/office-365-management-activity-api-schema#common-schema). Events related to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments can be found under the `Dynamics365BusinessCentralLog` AuditLogRecordType. For events with this AuditLogRecordType, the following fields are added to the common schema to contain details specific to your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments.

|Name|Description|Mandatory|Type|
|---|---|---|---|
|BcEnvironmentName|The name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment|False|Edm.String|
|BcEnvironmentType|The type of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment (that is, Production or Sandbox)|False|Edm.String|
|BcCompanyName|The name of the company in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment|False|Edm.String|
|BcCustomDimensions|Contains dynamic values based on the emitted event, see details for each event below|False|Edm.ComplexType|
|BcOperationName|The name of the operation for which the log was emitted|True|Edm.String|

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] events emitted to Purview are categorized as events and activities; events are high-level and are parents to the more specific activities.

|Event name|Description|
|---|---|
|Administered environment|Activities that create, update, or delete environments|
|Configured extension|Activities that configure extensions|
|Administered user|Activities that create, update, or delete users|
|Administered company|Activities that create, update, or delete companies|
|Configured integration|Activities that configure integrations|
|Configured Copilot|Activities that configure Copilot|
|Configured cloud migration|Activities that configure cloud migration|
|Administered report|Activities that create, update, or delete reports|

### Administered environment activities

Activities listed in the table below can be audited by filtering to the `Administered environment` event.

<table>
    <thead>
        <tr>
            <th>Activity</th>
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
        <tr>
            <td>Recovered environment</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td rowspan=2>Scheduled update</td>
            <td>IgnoreUpdateWindow</td>
            <td>false</td>
        </tr>
        <tr>
            <td>RunOn</td>
            <td>0001-01-01T00:00:00</td>
        </tr>
        <tr>
            <td>Set Security Group Access</td>
            <td>Value</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>Removed Security Group Access</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Set Application Insights Connection String</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Set Access with Microsoft 365 Licenses</td>
            <td>Value</td>
            <td>true</td>
        </tr>
        <tr>
            <td>Set AppSource Apps Update Cadence</td>
            <td>Value</td>
            <td>DuringMajorMinorUpgrade</td>
        </tr>
        <tr>
            <td rowspan=8>Reported Service Outage</td>
            <td>AppVersion</td>
            <td>24.0.0.0</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>email@cronus.com</td>
        </tr>
        <tr>
            <td>FirstName</td>
            <td>John</td>
        </tr>
        <tr>
            <td>LastName</td>
            <td>Doe</td>
        </tr>
        <tr>
            <td>OutageQuestionAnswers</td>
            <td>1: Yes. 2: All users</td>
        </tr>
        <tr>
            <td>OutageType</td>
            <td>Logon</td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>+1 0000000000</td>
        </tr>
        <tr>
            <td>PlatformVersion</td>
            <td>24.0.0.0</td>
        </tr>
        <tr>
            <td rowspan=5>Set Update Window</td>
            <td>PreferredEndTime</td>
            <td>06:00</td>
        </tr>
        <tr>
            <td>PreferredEndTimeUtc</td>
            <td>0001-01-01T06:00:00</td>
        </tr>
        <tr>
            <td>PreferredStartTime</td>
            <td>00:00</td>
        </tr>
        <tr>
            <td>PreferredStartTimeUtc</td>
            <td>0001-01-01T00:00:00</td>
        </tr>
        <tr>
            <td>TimeZoneId</td>
            <td>Coordinated Universal Time</td>
        </tr>
        <tr>
            <td>Exported Environment</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Restarted Environment</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Cancelled Session</td>
            <td>sessionId</td>
            <td>12345</td>
        </tr>
        <tr>
            <td rowspan=2>Requested Environment Transfer</td>
            <td>DestinationEntraTenantId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>RunAt</td>
            <td>0001-01-01T00:00:00</td>
        </tr>
        <tr>
            <td rowspan=4>Accepted Environment Transfer Request</td>
            <td>ApplicationFamily</td>
            <td>BusinessCentral</td>
        </tr>
        <tr>
            <td>DestinationEnvironmentName</td>
            <td>EnvironmentName</td>
        </tr>
        <tr>
            <td>SourceEntraTenantId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>SourceEnvironmentName</td>
            <td>EnvironmentName</td>
        </tr>
        <tr>
            <td>Cancelled Environment Transfer Request</td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td rowspan=3>Link Environment to Power Platform Environment</td>
            <td>powerPlatformEnvironmentId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>applicationFamily</td>
            <td>BusinessCentral</td>
        </tr>
        <tr>
            <td>environmentName</td>
            <td>EnvironmentName</td>
        </tr>
        <tr>
            <td rowspan=3>Unink Environment to Power Platform Environment</td>
            <td>powerPlatformEnvironmentId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>applicationFamily</td>
            <td>BusinessCentral</td>
        </tr>
        <tr>
            <td>environmentName</td>
            <td>EnvironmentName</td>
        </tr>
        <tr>
            <td rowspan=3>Set Support Contact Information</td>
            <td>Email</td>
            <td>support@cronus.com</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>SupportContact</td>
        </tr>
        <tr>
            <td>Url</td>
            <td>https://cronus.com/support</td>
        </tr>
    </tbody>
</table>

### Configured extension activities

Activities listed in the table below can be audited by filtering to the `Configured extension` event.

<table>
    <thead>
        <tr>
            <th>Activity</th>
            <th>Custom dimensions</th>
            <th>Sample value</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=5>Installed Global App</td>
            <td>appId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>AllowPreviewVersion</td>
            <td>true</td>
        </tr>
        <tr>
            <td>InstallOrUpdateNeededDependencies</td>
            <td>true</td>
        </tr>
        <tr>
            <td>TargetVersion</td>
            <td>24.0.0.0</td>
        </tr>
        <tr>
            <td>UseEnvironmentUpdateWindow</td>
            <td>true</td>
        </tr>
        <tr>
            <td rowspan=5>Updated Global App</td>
            <td>appId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>AllowPreviewVersion</td>
            <td>true</td>
        </tr>
        <tr>
            <td>InstallOrUpdateNeededDependencies</td>
            <td>true</td>
        </tr>
        <tr>
            <td>TargetVersion</td>
            <td>24.0.0.0</td>
        </tr>
        <tr>
            <td>UseEnvironmentUpdateWindow</td>
            <td>true</td>
        </tr>
        <tr>
            <td rowspan=4>Uninstalled Global App</td>
            <td>appId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>DeleteData</td>
            <td>true</td>
        </tr>
        <tr>
            <td>UninstallDependents</td>
            <td>true</td>
        </tr>
        <tr>
            <td>UseEnvironmentUpdateWindow</td>
            <td>true</td>
        </tr>
        <tr>
            <td rowspan=2>Cancelled Global App Update</td>
            <td>appId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>ScheduledOperationId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
    </tbody>
</table>

### Administered user activities

Activities listed in the table below can be audited by filtering to the `Administered user` event.

<table>
    <thead>
        <tr>
            <th>Activity</th>
            <th>Message parameters</th>
            <th>Sample value</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=2>The license configuration [PlanConfiguration] has been created by the UserSecurityID [UserSecurityId]</td>
            <td>PlanConfiguration</td>
            <td>D365 Business Central Basic Financials</td>
        </tr>
        <tr>
            <td>UserSecurityId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td rowspan=2>The license configuration [PlanConfiguration] has been modified by the UserSecurityID [UserSecurityId]</td>
            <td>PlanConfiguration</td>
            <td>D365 Business Central Basic Financials</td>
        </tr>
        <tr>
            <td>UserSecurityId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td rowspan=2>The license configuration [PlanConfiguration] has been deleted by the UserSecurityID [UserSecurityId]</td>
            <td>PlanConfiguration</td>
            <td>D365 Business Central Basic Financials</td>
        </tr>
        <tr>
            <td>UserSecurityId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td rowspan=2>The plan configuration [PlanConfiguration] has been customized by the UserSecurityID [UserSecurityId]</td>
            <td>PlanConfiguration</td>
            <td>D365 Business Central Basic Financials</td>
        </tr>
        <tr>
            <td>UserSecurityId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>Update users from Microsoft 365 wizard has been run by the UserSecurityID [UserSecurityId]</td>
            <td>UserSecurityId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td rowspan=2>The user with UserSecurityId [UserSecurityId1] has been disabled by user with UserSecurityID [UserSecurityId2]</td>
            <td>UserSecurityId1</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>UserSecurityId2</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td rowspan=2>The permission set [PermissionSet] has been copied by UserSecurityId</td>
            <td>UserSecurityID1</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>UserSecurityID2</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>The Effective Permissions page has been opened by UserSecurityId [UserSecurityId]</td>
            <td>UserSecurityId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td rowspan=7>The user settings (UserSecurityId [UserSecurityId1]) has been updated with the values: Language ID [LanguageId], Locale ID [LocaleId], Company [Company], Time Zone [TimeZone], Profile ID [ProfileId] by UserSecurityId [UserSecurityId2]</td>
            <td>UserSecurityID1</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>LanguageId</td>
            <td>1033</td>
        </tr>
        <tr>
            <td>LocaleId</td>
            <td>1033</td>
        </tr>
        <tr>
            <td>Company</td>
            <td>CRONUS USA, Inc.</td>
        </tr>
        <tr>
            <td>TimeZone</td>
            <td>W. Europe Standard Time</td>
        </tr>
        <tr>
            <td>ProfileId</td>
            <td>BUSINESS MANAGER EVALUATION</td>
        </tr>
        <tr>
            <td>UserSecurityId2</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
    </tbody>
</table>


### Administered company activities
Coming soon.

### Configured integration activities

Activities listed in the table below can be audited by filtering to the `Configured integration` event.

<table>
    <thead>
        <tr>
            <th>Activity</th>
            <th>Custom dimensions</th>
            <th>Sample value</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Set Authorized Microsoft Entra App to Admin Center API</td>
            <td>appId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>Deleted Authorized Microsoft Entra App from Admin Center API</td>
            <td>appId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td rowspan=4>Set Customer Tenant Access to Application Family</td>
            <td>varTenantId</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>applicationFamily</td>
            <td>BusinessCentral</td>
        </tr>
        <tr>
            <td>country</td>
            <td>US</td>
        </tr>
        <tr>
            <td>access</td>
            <td>read</td>
        </tr>
        <tr>
            <td rowspan=3>Set Notification Recipient</td>
            <td>Id</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
        <tr>
            <td>Email</td>
            <td>recipient@cronus.com</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>John Doe</td>
        </tr>
        <tr>
            <td>Removed Notification Recipient</td>
            <td>Id</td>
            <td>00000000-0000-0000-0000-000000000000</td>
        </tr>
    </tbody>
</table>

### Configured Copilot activities
Coming soon.

### Configured cloud migration activities
Coming soon.

### Administered report activities
Coming soon.
