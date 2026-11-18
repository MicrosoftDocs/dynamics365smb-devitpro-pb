---
title: Analyzing Company Lifecycle Trace Telemetry
description: Analyze Business Central company lifecycle telemetry to track company creation, copying, and deletion, and investigate canceled or failed operations.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ai-usage: ai-assisted
ms.author: jswymer
ms.reviewer: jswymer
---

# Analyzing company lifecycle trace telemetry

**INTRODUCED IN:** Business Central 2020 release wave 1, version 16.1

Company lifecycle telemetry gathers data about the success or failure of the following company-related operations:

- creating a company
- copying a company
- deleting a company 

Failed operations result in a trace log entry that includes a reason for the failure.

## Company created

Occurs when the company has been successfully created. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company created: {companyName}** <br /><br />`{companyName}` indicates the name of the new company.|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of keys that have been deprecated. We recommend that you update any queries that use these keys to use the new key names.|
|environmentName|Specifies the name of the tenant environment. Learn more in [Managing environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0001**|
|result|**Success**|
|serverExecutionTime|Specifies the amount of time it took the server to create the company. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that were executed.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time it took to create the company. The time has the format hh:mm:ss.sssssss.|

## Company creation canceled

Occurs when creating a company was canceled. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company creation canceled: {companyName}**<br /><br />`{companyName}` indicates the name of the company being created.|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of keys that have been deprecated. We recommend that you update any queries that use these keys to use the new key names.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0002**|
|cancelReason|Specifies why the operation was canceled.|
|cancelReasonMessage|Specifies the exception message for the cancellation.|
|result|**Canceled**|
|serverExecutionTime|Specifies the amount of time it took the server to create the company before being canceled. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that were executed by the operation.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time used to create the company before being canceled. The time has the format hh:mm:ss.sssssss.|

## Company creation failed

Occurs when a company failed to be created.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company creation failed: {companyName}**<br /><br />`{companyName}` indicates the name of the company being created.|
|severityLevel|**3**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of keys that have been deprecated. We recommend that you update any queries that use these keys to use the new key names.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0003**|
|failureReason|Specifies the exception that indicates the cause of the failure. |
|result|**Failure**|
|serverExecutionTime|Specifies the amount of time it took the server to create the company before it failed. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that were executed by the operation.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time used to create the company before it failed. The time has the format hh:mm:ss.sssssss.|

## Company copied

Occurs when a company has been copied from another company successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company copied: {companyNameSource} to {companyNameDestination}**<ul><li>`{companyNameSource}` is the name of the company that was copied.</li><li>`{companyNameDestination}` is the name of the new company that was created.</li></ul>|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyNameDestination|Specifies the name of the new company.|
|companyNameSource|Specifies the name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of keys that have been deprecated. We recommend that you update any queries that use these keys to use the new key names.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0004**|
|result|**Success**|
|serverExecutionTime|Specifies the amount of time it took the server to copy the company. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that were executed by the operation.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time it took to copy the company. The time has the format hh:mm:ss.sssssss.|


## Company copy canceled

Occurs when copying a company was canceled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company copy canceled: {companyNameSource} to {companyNameDestination}**<ul><li>`{companyNameSource}` is the name of the company that was being copied.</li><li>`{companyNameDestination}` is the name of the new company that was being created.</li></ul> |
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyNameSource|Specifies the name of the company that was being copied.|
|companyNameDestination|Specifies the name of the new company that was being created.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0005**|
|cancelReason|Specifies why the operation was canceled.|
|cancelReasonMessage|Specifies the exception message for the cancellation.|
|result|**Canceled**|
|serverExecutionTime|Specifies the amount of time it took the server to copy the company. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that were executed. |
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time used to do the operation. The time has the format hh:mm:ss.sssssss.|


## Company copy failed

Occurs when a company failed to be copied from another company.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company copy failed: {companyNameSource} to {companyNameDestination}**<ul><li>`{companyNameSource}` is the name of the company that was being copied.</li><li>`{companyNameDestination}` is the name of the new company that was being created.</li></ul>|
|severityLevel|**3**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyNameSource|Specifies the name of the company that was being copied.|
|companyNameDestination|Specifies the name of the new company that was being created.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0006**|
|failureReason|Specifies the exception that indicates the cause of the failure.|
|result|**Failure**|
|serverExecutionTime|Specifies the amount of time on the server. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that were executed.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time used to create the company before it failed. The time has the format hh:mm:ss.sssssss.|


## Company deleted

Occurs when a company has been deleted successfully.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company deleted: {companyName}**<br /><br />`{companyName}` indicates the name of the company that was deleted.|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0007**|
|result|**Success**|
|serverExecutionTime|Specifies the amount of time it took on the server. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that the operation executed.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time it took to delete the company. The time has the format hh:mm:ss.sssssss.|


## Company deletion canceled

Occurs when deleting a company was canceled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company deletion canceled: {companyName}**<br /><br />`{companyName}` indicates the name of the company that was being deleted.|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0008**|
|cancelReason|Specifies why the operation was canceled.|
|cancelReasonMessage|Specifies the exception message for the cancellation.|
|result|**Canceled**|
|serverExecutionTime|Specifies the amount of time it took on the server. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that were executed by the operation.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time used to delete the company before being canceled. The time has the format hh:mm:ss.sssssss.|

## Company deletion failed

Occurs when a company failed to be deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Company deletion failed: {companyName}**<br /><br />`{companyName}` indicates the name of the company that was being deleted.|
|severityLevel|**3**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|clientType|Specifies the type of client that performed the operation, such as **Background** or **Web**. Learn more in [ClientType option type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|eventId|**LC0009**|
|failureReason|Specifies the exception that caused the failure.|
|result|**Failure**|
|serverExecutionTime|Specifies the amount of time it took on the server. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that were executed by the operation.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
|totalTime|Specifies the amount of time used to delete the company before it failed. The time has the format hh:mm:ss.sssssss.|


## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
