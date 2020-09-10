---
title: Report Generation Telemetry Trace | Microsoft Docs
description: Learn about the report telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2020
ms.author: jswymer
---

# Analyzing Report Generation Telemetry

[!INCLUDE[2020_releasewave1.md](../includes/2020_releasewave1.md)]

Report generation telemetry gathers data about reports that are run on the service. It provides information about whether the report dataset generation succeeded, failed, or was canceled. For each report, it tells you how long it ran, how many SQL statements it executed, and how many rows it consumed.

You use this data to gather statistics to help identify slow-running reports.

## Success report generation

Occurs when a report dataset generates without any errors.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|operation_Name|**Success report generation**<br /><br />**Note:** The use of the `operation_Name` column was deprecated in version 16.1. In future versions, data won't be stored in this column. So in version 16.1 and later, use the custom dimension column `eventID` column custom in Kusto queries instead of `operation_Name`.|
|message|Version 16.1 and later:<br />**Report rendered: {report ID} - {report name}**<br /><br />Before version 16.1:<br />**The report {report ID} '{report name}' rendered successfully**|
|severityLevel|**1**|

### Custom dimensions

<!--
The custom dimensions that are of particular interest for this operation include: numberOfRows, result, serverExecutionTime, sqlExecutes, sqlRowsRead, totalTime. For a description of these dimensions and other custom dimensions, see [Custom dimensions](#customdimensions).
-->
<!--
|Dimension|Description or value|
|---------|-----|
|numberOfRows|Specifies the number of rows generated for the report dataset.|
|result|**Success**.|
|serverExecutionTime|Specifies the amount of time it took the service to complete the request. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that the report executed. |
|totalTime|Specifies the amount of time it took for the system to generate the dataset and render the report. The time has the format hh:mm:ss.sssssss.|
-->

|Dimension|Description or value|
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the report object that was run.|
|alObjectName|Specifies the name of the report object that was run.|
|alObjectType|**Report**.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company for which the report was run.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the appID of the extension that the report object belongs to.|
|extensionName|Specifies the name of the extension that the report object belongs to.|
|extensionVersion|Specifies the version of the extension that the report object belongs to.|
|eventId|**RT0006**<br /><br/>This dimension was introduced in Business Central 2020 release wave 1, version 16.1.|
|numberOfRows|Specifies the number of rows/records generated for the report dataset.|
|result|**Success**|
|serverExecutionTime|Specifies the amount of time it took the service to complete the request<sup>[\[1\]](#1)</sup>. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that the report executed<sup>[\[1\]](#1)</sup>.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements*<sup>[\[1\]](#1)</sup>.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|
|totalTime|Specifies the amount of time it took for the system to generate the dataset and render the report<sup>[\[1\]](#1)</sup>. The time has the format hh:mm:ss.sssssss.|

<sup><a name=1></a></sup>From telemetrySchemaVersion **0.6** and onwards, this value also includes the CompanyOpen operation.

## Failed report generation

This operation occurs when the report dataset couldn't be generated because of an error.

### General dimensions

The following table explains the general dimensions of the **Failed report generation** operation.

|Dimension|Description or value|
|---------|-----|
|message|Version 16.1 and later:<br />**Report rendering failed: {report ID} - {report name}**<br /><br />Before version 16.1:<br />**The report {report ID} '{report name}' couldn't be rendered**|
|operation_Name|**Failed report generation**<br /><br />**Note:** The use of the `operation_Name` column was deprecated in version 16.1. In future versions, data won't be stored in this column. So in version 16.1 and later, use the custom dimension column `eventID` column custom in Kusto queries instead of `operation_Name`.|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the report object that was run.|
|alObjectName|Specifies the name of the report object that was run.|
|alObjectType|**Report**.|
|alStackTrace|The stack trace in AL.|
|cancelReason<sup>[\[2\]](#2)</sup>|Specifies why the report was canceled. |
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company for which the report was run.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the appID of the extension that the report object belongs to.|
|extensionName|Specifies the name of the extension that the report object belongs to.|
|extensionVersion|Specifies the version of the extension that the report object belongs to.|
|eventId|**RT0006**<br /><br/>This dimension was introduced in Business Central 2020 release wave 1, version 16.1.|
|numberOfRows|Specifies the number of rows/records generated for the report dataset.|
|result|Specifies the title of the exception that was thrown, such as **NavNCLDialogException**.|
|serverExecutionTime|Specifies the amount of time used by service on the request. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that the report executed. |
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|
|totalTime|Specifies the amount of time used to generate the dataset and render the report before it failed. The time has the format hh:mm:ss.sssssss.|

<sup><a name=2></a></sup> Available in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2020 release wave 2 and later only. 

### Analyzing report generation failures

When a report fails to generate, the `result` column in the CustomDimensions will include the title of the exception that was thrown by the service or the AL code.  

## Cancellation report generation

This operation occurs when the report dataset generation was canceled. There are various conditions that can cancel a report. The **Cancellation report generation** operation emits different trace messages for each condition.

### General dimensions

The following table explains the general dimensions of the **Cancellation report generation** operation.

|Dimension|Description or value|
|---------|-----|
|operation_Name|**Cancellation report generation**<br /><br />**Note:** The use of the `operation_Name` column was deprecated in version 16.1. In future versions, data won't be stored in this column. So in version 16.1 and later, use the custom dimension column `eventID` column custom in Kusto queries instead of `operation_Name`.|
|message|Specifies the reason why the report was canceled. See [Analyzing cancellation messages](#reportcancellation) section for details.|
|severityLevel|**2**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the report object that was run.|
|alObjectName|Specifies the name of the report object that was run.|
|alObjectType|**Report**.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company for which the report was run.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the appID of the extension that the report object belongs to.|
|extensionName|Specifies the name of the extension that the report object belongs to.|
|extensionVersion|Specifies the version of the extension that the report object belongs to.|
|eventId|**RT0007**<br /><br/>This dimension was introduced in Business Central 2020 release wave 1, version 16.1.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

### <a name="reportcancellation"></a>Analyzing report cancellations

The cancellation messages indicate events that caused the report to be canceled. The telemetry can help identify slow-running reports - reports that take longer than expected to run and generate a large number of rows.

> [!NOTE]
> The service evaluates cancellation events in a specific order, and the evaluation is done every five seconds. For more information, see [Report Generation and Cancellation Flow](report-cancellation.md).

#### The report \<ID\> \'\<Name\>' is being canceled, but a COMMIT() has been performed. This can lead to data inconsistency if the report is not idempotent

This message occurs when a report is being canceled, but a COMMIT in AL was made. The report will still be canceled. This pattern isn't recommended. Reconsider the report design.

#### Cancellation event received. Requesting cancellation of the action.

This message occurs when the session canceled a report as it was being generated.

#### Received a cancellation request from the user. Requesting cancellation of the action.

This message occurs when a user canceled a report in the client as it was being generated.

#### The action took longer to complete ({0}) than the specified threshold ({1}). Requesting cancellation of the action.

The service is configured to cancel reports if they take longer to generate than a set amount of time. With Business Central online, you can't change the threshold. With Business Central on-premises, you change the threshold by setting the **Max Execution Timeout** parameter on the [!INCLUDE[server](../developer/includes/server.md)] instance. There's no timeout for on-premises by default. For more information, see [Configuring Business Central Server](configure-server-instance.md#Reports).

#### The rendering of the word report has been cancelled because it took longer than the specified threshold ({0})"

This message occurs when a report that based on a Word layout takes longer to generate than the specified threshold. The event is only relevant for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online. There's no timeout for on-premises.

#### The number of processed rows exceeded ({0} rows) the maximum number of rows ({1} rows). Requesting cancellation of the action.

The service is configured to cancel reports if they generate more than a set number of rows. With Business Central online, you can't change this threshold. With Business Central on-premises, you change the threshold by setting the **Max Rows** parameter on the [!INCLUDE[server](../developer/includes/server.md)] instance. There's no limit on rows for on-premises by default. For more information, see [Configuring Business Central Server](configure-server-instance.md#Reports).


<!--
## <a name="customdimensions"></a>Custom dimensions

The following table explains the CustomDimensions included in report generation traces.


```
{"extensionVersion":"16.0.11335.0","Telemetry schema version":"0.3","telemetrySchemaVersion":"0.3","serverExecutionTime":"00:00:07.0126616","Component version":"16.0.11329.0","Environment type":"Production","componentVersion":"16.0.11329.0","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","sqlExecutes":"213","aadTenantId":"common","companyName":"CRONUS International Ltd.","sqlRowsRead":"320","AadTenantId":"common","clientType":"WebClient","Component":"Dynamics 365 Business Central Server","totalTime":"00:00:07.0753414","component":"Dynamics 365 Business Central Server","result":"Success","alObjectName":"Inventory - Sales Back Orders","alStackTrace":"AppObjectType: Report\r\n AppObjectId: 718","Company name":"CRONUS International Ltd.","Extension version":"16.0.11335.0","alObjectType":"Report","AL Stack trace":"AppObjectType: Report\r\n AppObjectId: 718","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","Client type":"WebClient","AL Object name":"Inventory - Sales Back Orders","alObjectId":"718","AL Object type":"Report","extensionName":"Base Application","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","Extension name":"Base Application","numberOfRows":"50","AL Object Id":"718"}
```
-->
<!--
{"extensionVersion":"16.0.11335.0","Telemetry schema version":"0.3","telemetrySchemaVersion":"0.3","serverExecutionTime":"00:00:00.1047582","Component version":"16.0.11329.0","Extension version":"16.0.11335.0","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","Environment type":"Production","componentVersion":"16.0.11329.0","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","AL Object type":"Report","Extension name":"Base Application","AL Stack trace":"AppObjectType: Report\r\n AppObjectId: 38","AL Object name":"Trial Balance by Period","extensionName":"Base Application","alStackTrace":"AppObjectType: Report\r\n AppObjectId: 38","Company name":"CRONUS International Ltd.","numberOfRows":"0","alObjectName":"Trial Balance by Period","alObjectType":"Report","AL Object Id":"38","Client type":"WebClient","companyName":"CRONUS International Ltd.","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","aadTenantId":"common","sqlRowsRead":"1","sqlExecutes":"1","AadTenantId":"common","alObjectId":"38","clientType":"WebClient","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","totalTime":"00:00:00.1047582","result":"NavNCLDialogException"}

-->
<!--
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



<!--
Report cancellation

Dimension|Description or value|
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the report object that was run.|
|alObjectName|Specifies the name of the report object that was run.|
|alObjectType|**Report**.|
|alStackTrace|| 
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company for which the report was run.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionId|Specifies the appID of the extension that the report object belongs to.|
|extensionName|Specifies the name of the extension that the report object belongs to.|
|extensionVersion|Specifies the version of the extension that the report object belongs to.|
|telemetry"chemaVersio"|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.||

## Example trace

The following code snippet is a CustomDimensions example for a successful report generation. 

`
{"extensionVersion":"16.0.11335.0","telemetrySchemaVersion":"0.3","serverExecutionTime":"00:00:07.0126616","componentVersion":"16.0.11329.0","environmentType":"Production","sqlRowsRead":"320","sqlExecutes":"213","aadTenantId":"common","companyName":"CRONUS International Ltd.","clientType":"WebClient","totalTime":"00:00:07.0753414","component":"Dynamics 365 Business Central Server","result":"Success","alObjectType":"Report","alObjectId":"718","extensionName":"Base Application","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","AL Stack trace":"AppObjectType: Report\r\n AppObjectId: 718","AL Object Id":"718","alObjectName":"Inventory - Sales Back Orders","alStackTrace":"AppObjectType: Report\r\n AppObjectId: 718","AL Object name":"Inventory - Sales Back Orders","numberOfRows":"50"}
`

<!--

{"telemetrySchemaVersion":"0.2","extensionVersion":"1.0.0.0","componentVersion":"16.0.11208.0","environmentType":"Production","companyName":"CRONUS International Ltd.","aadTenantId":"common","clientType":"WebClient","component":"Dynamics 365 Business Central Server","extensionName":"ALReportSample","Company name":"CRONUS International Ltd.","alObjectType":"Report","alStackTrace":"AppObjectType: Report\r\n AppObjectId: 50101\r\n AL CallStack: \"Report Layout Selection\"(Page 9652).\"RunReport - OnAction\"(Trigger) line 2 - Base Application by Microsoft","alObjectName":"TestReportMultipleIndentNoDlg","extensionId":"9a5a538b-d041-4042-99c2-3268a8cb827a","alObjectId":"50101"}



{"telemetrySchemaVersion":"0.2","componentVersion":"16.0.11059.0","environmentType":"Production","aadTenantId":"common","companyName":"CRONUS International Ltd.","clientType":"WebClient","component":"Dynamics 365 Business Central Server","extensionVersion":"1.0.0.0","extensionName":"ALReportSample","Company name":"CRONUS International Ltd.","alObjectType":"Report","alStackTrace":"AppObjectType: Report\r\n AppObjectId: 50102\r\n AL CallStack: \"Report Layout Selection\"(Page 9652).\"RunReport - OnAction\"(Trigger) line 2 - Base Application by Microsoft","alObjectName":"TestReportMultipleIndentOnOff","extensionId":"9a5a538b-d041-4042-99c2-3268a8cb827a","alObjectId":"50102"}
-->

 
  
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
