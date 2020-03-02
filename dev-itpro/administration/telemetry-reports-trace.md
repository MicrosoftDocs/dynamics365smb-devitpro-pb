---
title: Web Service Request Trace | Microsoft Docs
description: Learn about the web service request telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 02/18/2020
ms.author: jswymer
---

# Analyzing Report Generation Telemetry

Report generation telemetry gathers data about reports that are run on the service. It provides information about whether the report dataset generation succeeded, failed, or was canceled for some reason.

## Operation: Success report generation

This operation occurs when a report dataset generates without any errors.
 
### General dimensions

The following table explains the general dimensions included in a **Success report generation** operation. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value||
|---------|-----|-----------|
|operation_Name|**Success report generation**||
|message|**The report <ID> '<Name>' rendered successfully**||
|severityLevel|**1**||

## Operation: Failed report generation

This operation occurs when the report dataset couldn't be generated because of an error.

### General dimensions

The following table explains the general dimensions included in a **Failed report generation** operation.

|Dimension|Description or value|
|---------|-----|-----------|
|operation_Name|**Failed report generation**||
|message|**The report <ID> '<Name>' couldn't be rendered**||
|severityLevel|**3**||

## Operation: Cancellation report generation

Occurs when the report dataset generation was canceled. The cancellation cab be a result of a limit that was exceeded or the user canceled the operation.

### General dimensions

The following table explains the general dimensions included in a **Cancellation report generation** operation.

|Dimension|Description or value|
|---------|-----|-----------|
|operation_Name|**Cancellation report generation**|
|message|Specifies the reason the reason why the report was canceled. See [Analyzing cancellation messages](#reportcancellation) section for details.
|
|severityLevel|**2**|

### <a name="reportcancellation"></a>Analyzing cancellation messages

#### The report \<ID\> \'\<Name\>' is being canceled, but a COMMIT() has been performed. This can lead to data inconsistency if the report is not idempotent

This message indicated the

#### Cancellation event received. Requesting cancellation of the action.

This message 

#### Received a cancellation request from the user. Requesting cancellation of the action.

This message

#### The action took longer to complete ({0}) than the specified threshold ({1}). Requesting cancellation of the action.

The message

#### The number of processed rows exceeded ({0} rows) the maximum number of rows ({1} rows). Requesting cancellation of the action.

This message

## Custom dimensions

The following table explains the CustomDimensions included in report generation traces.

<!--
```
{"extensionVersion":"16.0.11335.0","Telemetry schema version":"0.3","telemetrySchemaVersion":"0.3","serverExecutionTime":"00:00:07.0126616","Component version":"16.0.11329.0","Environment type":"Production","componentVersion":"16.0.11329.0","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","sqlExecutes":"213","aadTenantId":"common","companyName":"CRONUS International Ltd.","sqlRowsRead":"320","AadTenantId":"common","clientType":"WebClient","Component":"Dynamics 365 Business Central Server","totalTime":"00:00:07.0753414","component":"Dynamics 365 Business Central Server","result":"Success","alObjectName":"Inventory - Sales Back Orders","alStackTrace":"AppObjectType: Report\r\n AppObjectId: 718","Company name":"CRONUS International Ltd.","Extension version":"16.0.11335.0","alObjectType":"Report","AL Stack trace":"AppObjectType: Report\r\n AppObjectId: 718","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","Client type":"WebClient","AL Object name":"Inventory - Sales Back Orders","alObjectId":"718","AL Object type":"Report","extensionName":"Base Application","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","Extension name":"Base Application","numberOfRows":"50","AL Object Id":"718"}
```

{"extensionVersion":"16.0.11335.0","Telemetry schema version":"0.3","telemetrySchemaVersion":"0.3","serverExecutionTime":"00:00:00.1047582","Component version":"16.0.11329.0","Extension version":"16.0.11335.0","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","Environment type":"Production","componentVersion":"16.0.11329.0","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","AL Object type":"Report","Extension name":"Base Application","AL Stack trace":"AppObjectType: Report\r\n AppObjectId: 38","AL Object name":"Trial Balance by Period","extensionName":"Base Application","alStackTrace":"AppObjectType: Report\r\n AppObjectId: 38","Company name":"CRONUS International Ltd.","numberOfRows":"0","alObjectName":"Trial Balance by Period","alObjectType":"Report","AL Object Id":"38","Client type":"WebClient","companyName":"CRONUS International Ltd.","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","aadTenantId":"common","sqlRowsRead":"1","sqlExecutes":"1","AadTenantId":"common","alObjectId":"38","clientType":"WebClient","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","totalTime":"00:00:00.1047582","result":"NavNCLDialogException"}


|Dimension|Description or value||
|---------|-----|-----------|
|extensionVersion|Specifies the version of the extension.||
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.||
|serverExecutionTime|Specifies the amount of time it took the service to complete the request. The time has the format hh:mm:ss.sssssss.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|sqlExecutes|Specifies the number of SQL statements that the request executed. ||
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. ||
|companyName|The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used at time of execution. ||
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.||
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).||
|totalTime|Specifies the amount of time it took for the service to process the request. The time has the format hh:mm:ss.sssssss.||
|component|**Dynamics 365 Business Central Server**|
|result|**Success** if the report generated successfully. Otherwise, if the report failed to generate, this column specifies the title of the exception that was thrown, such as **NavNCLDialogException**.|
|alObjectName|Specifies the name of the AL object that was run by the request.||
|alObjectType|Specifies the type of the AL object that was run by the request.||
|extensionId|Specifies the AppID of the extension.||
|alObjectId|Specifies the ID of the AL object that was run by request.||
|extensionName|Specifies the name of the extension.||
|numberOfRows|Specifies the number of rows generated for the report.||
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
-->

|Dimension|Description or value|
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the report object that was run.|
|alObjectName|Specifies the name of the report object that was run.|
|alObjectType|**Report**.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company for which the report was run.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the appID of the extension that the report object belongs to.|
|extensionName|Specifies the name of the extension that the report object belongs to.|
|extensionVersion|Specifies the version of the extension that the report object belongs to.|
|numberOfRows|Specifies the number of rows/records generated for the report dataset.|
|result|**Success** if the report generated successfully. Otherwise, if the report failed to generate, this column specifies the title of the exception that was thrown, such as **NavNCLDialogException**.|
|serverExecutionTime|Specifies the amount of time it took the service to complete the request. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that the report executed. |
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|
|totalTime|Specifies the amount of time it took for the system to generate the dataset and render the report. The time has the format hh:mm:ss.sssssss.|

## Example trace

The following code snippet is a CustomDimensions example for a successful report generation. 

`
{"extensionVersion":"16.0.11335.0","telemetrySchemaVersion":"0.3","serverExecutionTime":"00:00:07.0126616","componentVersion":"16.0.11329.0","environmentType":"Production","sqlRowsRead":"320","sqlExecutes":"213","aadTenantId":"common","companyName":"CRONUS International Ltd.","clientType":"WebClient","totalTime":"00:00:07.0753414","component":"Dynamics 365 Business Central Server","result":"Success","alObjectType":"Report","alObjectId":"718","extensionName":"Base Application","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","AL Stack trace":"AppObjectType: Report\r\n AppObjectId: 718","AL Object Id":"718","alObjectName":"Inventory - Sales Back Orders","alStackTrace":"AppObjectType: Report\r\n AppObjectId: 718","AL Object name":"Inventory - Sales Back Orders","numberOfRows":"50"}
`
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
