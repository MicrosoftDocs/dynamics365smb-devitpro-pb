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
> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments automatically emit all events listed below to Microsoft Purview auditing solutions, and Purview is enabled by default on every tenant. Learn more about enabling or disabling Purview auditing solutions on your tenant [here](~/purview/audit-log-enable-disable).

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
|Environment Administration|Operations that create, update, or delete environments|
|Extension Administration|Operations that create, update, or delete extensions|
|User Administration|Operations that create, update, or delete users|
|Company Administration|Operations that create, update, or delete companies|
|Integration Administration|Operations that create, update, or delete integrations|
|Copilot Administration|Operations that create, update, or delete Copilot|
|Cloud Migration Administration|Operations that create, update, or delete cloud migration|
|Report Administration|Operations that create, update, or delete reports|

### Environment Administration Operations
