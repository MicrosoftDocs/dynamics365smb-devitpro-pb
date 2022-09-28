---
title:  Extension Lifecycle Trace Telemetry | Microsoft Docs
description: Learn about the extension lifecycle telemetry in Business Central  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 05/12/2021
ms.author: jswymer
---
# Analyzing Extension Lifecycle Trace Telemetry

**INTRODUCED IN:** Business Central 2020 release wave 1, version 16.3. Extension-level support introduced in 2020 release wave 2, version 17.1.

Extension lifecycle telemetry gathers data about the success or failure of the following extension-related operations:

- Compiling an extension
- Synchronizing an extension
- Publishing an extension
- Installing an extension
- Updating an extension
- Uninstalling an extension
- Unpublishing an extension

Failed operations result in a trace log entry that includes a reason for the failure.

Traces are recorded for operations started initiated from any of the following components, depending whether you have Business Central online or on-premises:

|Component|Online|On-premises|
|---------|------|-----------|
|[Extension Management page](/dynamics365/business-central/ui-extensions) in the Business Central client.|![check mark for feature.](../developer/media/check.png)|![check mark for feature.](../developer/media/check.png)|
|[Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central admin center.|![check mark for feature.](../developer/media/check.png)||
|[App Management API](administration-center-api_app_management.md) of the Business Central admin center.|![check mark for feature.](../developer/media/check.png)||
|[Extension management PowerShell cmdlets](/powershell/module/microsoft.dynamics.nav.apps.management) from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]||![check mark for feature.](../developer/media/check.png)|
|Business Central control plane, which is the online service managed by Microsoft.|![check mark for feature.](../developer/media/check.png)||

<!--
- [Extension Management page](/dynamics365/business-central/ui-extensions) in the Business Central client.
- [Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central admin center.
- [App Management](administration-center-api_app_management.md) of the Business Central admin center API.
- [Extension management PowerShell cmdlets](/powershell/module/microsoft.dynamics.nav.apps.management) from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] (on-premises).
- ->

<!--## Behavior overview

- Compiling, publishing, and unpublishing extensions

    Data for these operations is only recorded for extensions that are published in the tenant scope.

    - For on-premises, it includes extensions that are published by running the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) with the `-Scope Tenant` parameter.
    
    - For online, it includes per-tenant extensions uploaded from the **Extension Management** page in the client. It doesn't include Microsoft extensions or [AppSource extensions](https://appsource.microsoft.com/en-US/marketplace?product=dynamics-365-business-central).

- Synchronizing extensions

    - For on-premises, data for this operation is recorded when an extension is synchronized by using the [Sync-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp).

    - For online, data is recorded when an extension is installed from the **Extension Management** page in the client. Or, when upgraded from the [Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central administration center.

- Installing and uninstalling extensions

    - For on-premises, data for these operations is recorded when an extension is installed or uninstalled by using the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) or [Uninstall-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp). Or, when an extension is installed or uninstalled from the **Extension Management** page in the client.

    - For online, data for these operations is recorded when an extension is installed or uninstalled from the **Extension Management** page in the client.

- Updating an extension

    - For on-premises, data for this operation is recorded when an extension is upgraded by using the [Start-NAVAppDataUpgrade cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade).

    - For online, data is recorded when an extension is updated from the [Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central administration center.-->

> [!NOTE]
> For some operations, you might experience that certain custom dimensions aren't available. The reason is that custom dimensions are added to the signal gradually, as the information is retrieved. If the operation fails before the custom dimension is retrieved, it isn't included in the result. For example, if you try to uninstall an extension using the Ininstall-NAVApp cmdlet, and the specified extension name is wrong, the operation fails. In this case, the `extensionid` and `extensionVersion` will be excluded from the results.  

## ENVIRONMENT/SERVER TRACES

The traces in this section are recorded for extensions that are published to the environment/server in the tenant scope only.

- For on-premises, it includes extensions that are published by running the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) with the `-Scope Tenant` parameter.

- For online, it includes per-tenant extensions uploaded from the **Extension Management** page in the client. It doesn't include Microsoft extensions or [AppSource extensions](https://appsource.microsoft.com/en-US/marketplace?product=dynamics-365-business-central).

## <a name="compiledsuccess"></a>Extension compiled successfully

Occurs when an extension compiles successfully on the service. An extension compiles when it's published or when it's repaired by using the [Repair-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension compiled successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0020**|
|extensionCompilationDependencyList|Specifies details about the extensions on which the compiled extension has dependencies.<br /><br /> **Note:** If the value exceeds 8000 characters, one or two additional dimensions will be included in the trace to cover the complete dependency list. For more information, see [About Custom Dimensions](telemetry-overview.md#customdimensions).|
|extensionCompilationResult |**Compilation succeeded without errors or warnings.**|
| extensionName|Specifies the name of the extension that was compiled.|
| extensionId|Specifies the ID of the extension that was compiled.|
| extensionPublishedAs|Specifies whether the compiled extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the compiled extension.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


<a name="other"></a>**Common custom dimensions**

The following table explains custom dimensions that are common to all traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
<!--
### Example

{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"16.0.14073.14105","Environment type":"Production","componentVersion":"16.0.14073.14105","environmentType":"Production","extensionPublishedAs":"Tenant","component":"Dynamics 365 Business Central Server","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","serverExecutionTime":"00:00:00.0456442","extensionPublisher":"Default publisher","Extension version":"1.0.0.0","Extension App Id":"0119d1d8-9fdc-415d-b8c8-b2e30ef627e5","extensionVersion":"1.0.0.0","aadTenantId":"common","AadTenantId":"common","extensionScope":"Tenant","Extension name":"ExtZ","extensionName":"ExtZ","extensionId":"0119d1d8-9fdc-415d-b8c8-b2e30ef627e5","eventId":"LC0020","totalTime":"00:00:00.0456442","extensionCompilationDependencyList":"For dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft', tenantid 'default' and version '16.0.0.0', found dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.14073.14105'.\r\nFor dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft', tenantid 'default' and version '16.0.0.0', found dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.3.14085.14119'.\r\nFor dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.0.0.0', found secondary reference app with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.0.0'.\r\nFor dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft', tenantid 'default' and version '16.0.0.0', found dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft' and version '16.3.14085.14119'.\r\nFor dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft' and version '16.0.0.0', found secondary reference app with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.0.0'.\r\nFor dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft' and version '16.0.0.0', found secondary reference app with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.3.0.0'.\r\nFor dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft', tenantid 'default' and version '16.0.0.0', found dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.14073.14105'.\r\nFor dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft', tenantid 'default' and version '16.0.0.0', found dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.3.14085.14119'.\r\nFor dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.0.0.0', found secondary reference app with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.0.0'.\r\nFor dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft', tenantid 'default' and version '16.0.0.0', found dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.14073.14105'.\r\nFor dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft', tenantid 'default' and version '16.0.0.0', found dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft' and version '16.3.14085.14119'.\r\nFor dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft' and version '16.0.0.0', found secondary reference app with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.0.0'.\r\nFor dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft' and version '16.0.0.0', found secondary reference app with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.3.0.0'.\r\nFor dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft', tenantid 'default' and version '16.0.0.0', found dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.14073.14105'.\r\nFor dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft', tenantid 'default' and version '16.3.0.0', found dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.3.14085.14119'.\r\nFor dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.3.0.0', found secondary reference app with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.0.0'.\r\nLoading dependency module with ID '8874ed3a-0643-4247-9ced-7a7002f7135d', name 'System', publisher 'Microsoft' and version '16.0.0.0' for target app with ID '0119d1d8-9fdc-415d-b8c8-b2e30ef627e5', name 'ExtZ', publisher 'Default publisher' and version '1.0.0.0'.\r\nLoading dependency module with ID '63ca2fa4-4f03-4f2b-a480-172fef340d3f', name 'System Application', publisher 'Microsoft' and version '16.0.0.0' for target app with ID '0119d1d8-9fdc-415d-b8c8-b2e30ef627e5', name 'ExtZ', publisher 'Default publisher' and version '1.0.0.0'.\r\nLoading dependency module with ID '437dbf0e-84ff-417a-965d-ed2bb9650972', name 'Base Application', publisher 'Microsoft' and version '16.0.0.0' for target app with ID '0119d1d8-9fdc-415d-b8c8-b2e30ef627e5', name 'ExtZ', publisher 'Default publisher' and version '1.0.0.0'.","result":"Success","clientType":"Background"}

--> 
## <a name="compiledfailed"></a>Extension failed to compile

Occurs when an extension failed to compile on the service. An extension compiles when it's published or when it's repaired by using the [Repair-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension failed to compile: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0021**|
|extensionCompilationDependencyList|Specifies details about the extensions on which the compiled extension has dependencies.<br /><br /> **Note:** If the value exceeds 8000 characters, one or two additional dimensions will be included in the trace to cover the complete dependency list. For more information, see [About Custom Dimensions](telemetry-overview.md#customdimensions).|
|extensionCompilationResult |Specifies details about the error that occurred during compilation.|
| extensionName|Specifies the name of the extension that failed to compile.|
| extensionId|Specifies the ID of the extension that failed to compile.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the compiled extension.|
|failureReason|Specifies the error that occurred when compiling the extension.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## <a name="publishedsuccess"></a>Extension published successfully

Occurs when an extension published successfully on the service. <!--For on-premises, an extension is published by running the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) . For online, an extension is published when it's uploaded from the **Extension Management** page in the client.-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension published successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0014**|
| extensionId|Specifies the ID of the extension that was published.|
| extensionIsRad|Specifies whether the extension that was RAD published. **True** indicates the extension was RAD published. **False** indicates normal publishing. <br /><br />RAD (Rapid Application Development) publishing is done from the AL development environment. RAD publishing is a partial publishing operation that only publishes objects application objects that have changed during development. For more information, see [Work with Rapid Application Development](../developer/devenv-rad-publishing.md).|
| extensionName|Specifies the name of the extension that published.|
| extensionId|Specifies the ID of the extension that published.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the published extension.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||
<!--
### Example

{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","serverExecutionTime":"00:00:00.1694332","Component version":"16.0.14073.14105","Environment type":"Production","componentVersion":"16.0.14073.14105","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","Extension version":"1.0.0.0","extensionVersion":"1.0.0.0","aadTenantId":"common","AadTenantId":"common","extensionPublishedAs":"Tenant","sqlRowsRead":"18","extensionPublisher":"Default publisher","sqlExecutes":"26","Extension name":"ExtY","component":"Dynamics 365 Business Central Server","extensionName":"ExtY","totalTime":"00:00:00.1694332","Extension App Id":"27f169c5-9c11-4d6e-a747-0477ad25d175","extensionScope":"Tenant","eventId":"LC0014","clientType":"Background","extensionId":"27f169c5-9c11-4d6e-a747-0477ad25d175","result":"Success","extensionIsRad":"False"}
-->

## <a name="publishedfailed"></a>Extension failed to publish

Occurs when an extension failed publish on the service. <!--For on-premises, an extension is published by running the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) . For online, an extension is published when it's uploaded from the **Extension Management** page in the client.-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension failed to publish: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0015**|
| extensionId|Specifies the ID of the extension that was published.|
| extensionIsRad|Specifies whether the extension that was RAD published. **True** indicates the extension was RAD published. **False** indicates normal publishing. <br /><br />RAD (Rapid Application Development) publishing is done from the AL development environment. RAD publishing only is a partial publishing operation that only publishes objects application objects that have changed during development. For more information, see [Work with Rapid Application Development](../developer/devenv-rad-publishing.md).|
| extensionName|Specifies the name of the extension that published.|
| extensionId|Specifies the ID of the extension that published.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the published extension.|
|failureReason|Specifies the error that occurred when publishing.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## <a name="unpublishedsuccess"></a>Extension unpublished successfully

Occurs when an extension was unpublished successfully on the service. <!--An extension is unpublished by running the [Unpublish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp). For online, an extension is published when it's uploaded from the **Extension Management** page in the client.-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension unpublished successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0018**|
| extensionId|Specifies the ID of the extension that was unpublished.|
| extensionName|Specifies the name of the extension that was unpublished.|
| extensionId|Specifies the ID of the extension that was unpublished.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the unpublished extension.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||
<!--
### Example

{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","serverExecutionTime":"00:00:00.1694332","Component version":"16.0.14073.14105","Environment type":"Production","componentVersion":"16.0.14073.14105","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","Extension version":"1.0.0.0","extensionVersion":"1.0.0.0","aadTenantId":"common","AadTenantId":"common","extensionPublishedAs":"Tenant","sqlRowsRead":"18","extensionPublisher":"Default publisher","sqlExecutes":"26","Extension name":"ExtY","component":"Dynamics 365 Business Central Server","extensionName":"ExtY","totalTime":"00:00:00.1694332","Extension App Id":"27f169c5-9c11-4d6e-a747-0477ad25d175","extensionScope":"Tenant","eventId":"LC0014","clientType":"Background","extensionId":"27f169c5-9c11-4d6e-a747-0477ad25d175","result":"Success","extensionIsRad":"False"}
-->

## <a name="unpublishedfailed"></a>Extension failed to un-publish

Occurs when an extension fails to unpublish on the service.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension failed to un-publish: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0019**|
| extensionId|Specifies the ID of the extension that failed to unpublish.|
| extensionName|Specifies the name of the extension that failed to unpublish.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the unpublished extension.|
|failureReason|Specifies the error that occurred when unpublishing.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||
<!--
### Example

{"extensionName":"pbt","AadTenantId":"common","sqlRowsRead":"0","Extension name":"pbt","DeveloperMode":"true","Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","Environment type":"Production","component":"Dynamics 365 Business Central Server","environmentType":"Production","extensionVersion":"1.0.0.6","sqlExecutes":"2","extensionPublishedAs":"Tenant","componentVersion":"16.0.13877.0","Component version":"16.0.13877.0","clientType":"Background","result":"Failure","aadTenantId":"common","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","totalTime":"00:00:00.0030022","extensionIsRad":"False","serverExecutionTime":"00:00:00.0030022","failureReason":"This extension cannot be published into the tenant scope because it's currently or was previously published into the global scope and at least one globally published application 'pbt by Me' has a dependency on it. \r\nAn unpublished global scoped extension can only be published to the tenant scope if there are no published applications to the global scope that depend on this application. \r\nAn application published into the global scope cannot have dependencies on applications published into the tenant scope.","Extension App Id":"0b6c8443-c488-4967-b53d-f53ac52b6180","extensionId":"0b6c8443-c488-4967-b53d-f53ac52b6180","extensionScope":"Tenant","Extension version":"1.0.0.6","eventId":"LC0015","telemetrySchemaVersion":"0.1","extensionPublisher":"Me"}

-->

## TENANT TRACES

The traces in this section are recorded for synchronizing, installing and updating extensions on a tenant.

- Synchronizing extensions

    - For on-premises, data for this operation is recorded when an extension is synchronized by using the [Sync-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp).

    - For online, data is recorded when an extension is installed from the **Extension Management** page in the client. Or, when upgraded from the [Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central administration center.

- Installing and uninstalling extensions

    - For on-premises, data for these operations is recorded when an extension is installed or uninstalled by using the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) or [Uninstall-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp). Or, when an extension is installed or uninstalled from the **Extension Management** page in the client.

    - For online, data for these operations is recorded when an extension is installed or uninstalled from the **Extension Management** page in the client.

- Updating an extension

    - For on-premises, data for this operation is recorded when an extension is upgraded by using the [Start-NAVAppDataUpgrade cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade).

    - For online, data is recorded when an extension is updated from the [Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central administration center.

## <a name="syncedsuccess"></a>Extension synchronized successfully

Occurs when an extension synchronizes successfully on the tenant.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension synchronized successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0012**|
| extensionId|Specifies the ID of the extension that was synchronized.|
| extensionName|Specifies the name of the extension that was synchronized.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionSynchronizationMode|Specifies whether the extension was synchronized in one of the following modes:<ul><li>**Add** -  The database schema defined by the objects in the extension are added to the database schema of the tenant database. This mode is typically used mode after you publish an extension for the first time.</li><li>**Clean** - The database schema defined by all versions of the extension will be removed from the database and all data is lost. This mode is typically used when an extension will no longer be used and all versions unpublished. </li><li>**Development** - This mode is acts similar to Add, except it's intended for use during development. It lets you sync the same version of an extension that is already published. However, to run this mode, only one version the App can be currently published.</li><li>**ForceSync** - This mode like **Add** except it supports destructive schema changes (like removing fields, renaming them, changing their datatypes, and more). it's typically used during development, and is the mode used when an extension is published and installed from the AL development environment.</li></ul> For more information about the modes, see [Sync-NAVApp cmdlet -Mode](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp).|
| extensionVersion|Specifies the version of the extension was synchronized.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||
<!--
### Example:

{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"16.0.14073.14105","Environment type":"Production","componentVersion":"16.0.14073.14105","environmentType":"Production","extensionPublishedAs":"Tenant","component":"Dynamics 365 Business Central Server","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","serverExecutionTime":"00:00:00.3318695","extensionPublisher":"Default publisher","Extension version":"1.0.0.0","Extension App Id":"0119d1d8-9fdc-415d-b8c8-b2e30ef627e5","extensionVersion":"1.0.0.0","aadTenantId":"common","AadTenantId":"common","extensionScope":"Tenant","Extension name":"ExtZ","extensionName":"ExtZ","extensionId":"0119d1d8-9fdc-415d-b8c8-b2e30ef627e5","eventId":"LC0012","totalTime":"00:00:00.3318695","sqlRowsRead":"114","sqlExecutes":"22","result":"Success","extensionSynchronizationMode":"Add"}
-->

## <a name="syncedfailed"></a>Extension synchronized failed

Occurs when an extension fails to synchronize on the tenant.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension failed to synchronize: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0013**|
| extensionId|Specifies the ID of the extension that failed to synchronize.|
| extensionName|Specifies the name of the extension that failed to synchronize.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionSynchronizationMode|Specifies whether the extension was synchronized in one of the following modes:<ul><li>**Add** -  The database schema defined by the objects in the extension are added to the database schema of the tenant database. This mode is typically used mode after you publish an extension for the first time.</li><li>**Clean** - The database schema defined by all versions of the extension will be removed from the database and all data is lost. This mode is typically used when an extension will no longer be used and all versions unpublished. </li><li>**Development** - This mode is acts similar to Add, except it's intended for use during development. It lets you sync the same version of an extension that is already published. However, to run this mode, only one version the App can be currently published.</li><li>**ForceSync** - This mode like **Add** except it supports destructive schema changes (like removing fields, renaming them, changing their datatypes, and more). it's typically used during development, and is the mode used when an extension is published and installed from the AL development environment.</li></ul> For more information about the modes, see [Sync-NAVApp cmdlet -Mode](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp).|
| extensionVersion|Specifies the version of the extension was synchronized.|
| failureReason|Specifies the error that occurred when synchronizing the extension.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## <a name="installedsuccess"></a>Extension installed successfully

Occurs when an extension installs successfully on a tenant.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension installed successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0010**|
| extensionId|Specifies the ID of the extension that was installed.|
| extensionName|Specifies the name of the extension that was installed.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the extension that was installed.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## <a name="dependentinstalledsuccess"></a>Dependent extension installed successfully

Occurs when an extension is installed because another extension that depends on it was installed. This event is only available from version 18.1 and later.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Dependent Extension installed successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0026**|
| extensionId|Specifies the ID of the extension that was installed.|
| extensionName|Specifies the name of the extension that was installed.|
| extensionPublisher|Specifies the extension's publisher.|
| extensionVersion|Specifies the version of the extension that was installed.|
| parentExtensionId|Specifies the ID of the other extension that required the installation this extension.|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","extensionVersion":"1.0.0.0","Component version":"18.0.24800.0","extensionPublisher":"Default publisher","componentVersion":"18.0.24800.0","Environment type":"Production","Extension version":"1.0.0.0","environmentType":"Production","Extension App Id":"cfa8a06b-c74c-4d41-b2c0-5c39d1377da7","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"bc18-index-1","extensionName":"bc18-index-1","aadTenantId":"common","AadTenantId":"common","extensionId":"cfa8a06b-c74c-4d41-b2c0-5c39d1377da7","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"LC0026","parentExtensionId":"dac46aa2-3007-49d1-93c1-80d337c173e6"}

-->

## <a name="installedfailed"></a>Extension failed to install

Occurs when an extension failed to install on a tenant. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension failed to install: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0011**|
| extensionId|Specifies the ID of the extension that failed to uninstall.|
| extensionName|Specifies the name of the extension that failed to uninstall.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the extension that was installed.|
|failureReason|Specifies the error that occurred when the extension was installed.|
| result|**Failed**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## <a name="uninstalledsuccess"></a>Extension un-installed successfully

Occurs when an extension is successfully uninstalled from a tenant.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension un-installed successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0016**|
|doNotSaveData|Specifies whether the uninstall operation was run with option not to save the data in database table fields that are added by the extension. When using the Uninstall-NAVApp cmdlet, this condition is set with the -DoNotSaveData switch parameter.|
| extensionId|Specifies the ID of the extension that was uninstalled.|
| extensionName|Specifies the name of the extension that was uninstalled.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the extension was uninstalled.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

<!--
### Example

{"Component version":"16.0.13877.0","totalTime":"00:00:00.0705066","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","aadTenantId":"common","result":"Success","component":"Dynamics 365 Business Central Server","extensionName":"pbt","sqlRowsRead":"60","extensionId":"0b6c8443-c488-4967-b53d-f53ac52b6180","AadTenantId":"common","sqlExecutes":"12","extensionVersion":"1.0.0.6","extensionPublishedAs":"Global","Environment type":"Production","Telemetry schema version":"0.1","Extension name":"pbt","DeveloperMode":"true","Component":"Dynamics 365 Business Central Server","extensionScope":"Global","Extension version":"1.0.0.6","extensionPublisher":"Me","telemetrySchemaVersion":"0.1","Extension App Id":"0b6c8443-c488-4967-b53d-f53ac52b6180","serverExecutionTime":"00:00:00.0705066","eventId":"LC0016","componentVersion":"16.0.13877.0"}
-->

## <a name="dependentunistalled"></a>Dependent extension un-installed successfully

Occurs when an extension is uninstalled because an extension that it's dependent on was uninstalled. This event is only available from version 18.1 and later.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Dependent extension un-installed successfully: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0027**|
|doNotSaveData|Specifies whether the uninstall operation on the parent extension was run with option not to save the data in database table fields that are added by the extension. When using the Uninstall-NAVApp cmdlet, this condition is set with the -DoNotSaveData switch parameter.|
| extensionId|Specifies the ID of the dependent extension that was uninstalled.|
| extensionName|Specifies the name of the dependent extension that was uninstalled.|
| extensionPublisher|Specifies the dependent extension's publisher.|
| extensionVersion|Specifies the version of the dependent extension was uninstalled.|
| parentExtensionId|Specifies the ID of the extension that the uninstalled extension is dependent on.|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","extensionPublisher":"Default publisher","Component version":"18.0.24800.0","Extension version":"1.0.0.0","Environment type":"Production","componentVersion":"18.0.24800.0","extensionVersion":"1.0.0.0","Extension App Id":"dac46aa2-3007-49d1-93c1-80d337c173e6","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"bc-index5","extensionName":"bc-index5","aadTenantId":"common","AadTenantId":"common","extensionId":"dac46aa2-3007-49d1-93c1-80d337c173e6","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"LC0027","doNotSaveData":"False","parentExtensionId":"cfa8a06b-c74c-4d41-b2c0-5c39d1377da7"}
-->


## <a name="uninstalledfailed"></a>Extension failed to un-install

Occurs when an extension failed to uninstall on a tenant.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension failed to un-install: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| eventId|**LC0017**|
|doNotSaveData|Specifies whether the uninstall operation was run with option not to save the data in database table fields that are added by the extension. When using the Uninstall-NAVApp cmdlet, this condition is set with the -DoNotSaveData switch parameter.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| extensionId|Specifies the ID of the extension that failed to uninstall.|
| extensionName|Specifies the name of the extension that failed to uninstall.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>|
| extensionVersion|Specifies the version of the extension that failed to uninstall.|
|failureReason|Specifies the error that occurred when the extension was uninstalled.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||
<!--
### Example

{"Component":"Dynamics 365 Business Central Server","componentVersion":"16.0.13877.0","Component version":"16.0.13877.0","eventId":"LC0017","serverExecutionTime":"00:00:00.0035521","failureReason":"Cannot find the extension 'pbt' because it's not published.","Extension App Id":"pbt","DeveloperMode":"true","telemetrySchemaVersion":"0.1","Extension version":"1.0.0.7","Telemetry schema version":"0.1","environmentType":"Production","extensionVersion":"1.0.0.7","sqlExecutes":"3","extensionId":"pbt","sqlRowsRead":"0","AadTenantId":"common","component":"Dynamics 365 Business Central Server","Environment type":"Production","result":"Failure","aadTenantId":"common","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","totalTime":"00:00:00.0035521"}

-->

## <a name="updatedsuccess"></a>Extension updated successfully 

Occurs when an extension updates successfully on the service. <!--The update operation is run by the [Start-NAVAppDataUpgrade cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade).-->

> [!NOTE]
> Data is also recorded for any upgrade code that was run. For more information, see [Analyzing Extension Update Trace Telemetry](telemetry-extension-update-trace.md).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension updated successfully: {extensionName} version {extensionVersion} by {extensionPublisher}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0022**|
| extensionCulture|Specifies the language version for which the extension that was upgraded. The value is a language culture name, such as **en-US** or **da-DK**. If a language wasn't specified when the extension was installed, then en-US is used by default. |
| extensionId|Specifies the ID of the extension that failed to uninstall.|
| extensionName|Specifies the name of the extension that was being upgraded.|
| extensionPublisher|Specifies the extension's publisher.|
| extensionVersion|Specifies the new version of the extension being upgraded.|
| extensionVersionFrom|Specifies the old version of the extension being upgraded.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||
<!--
### Example

{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","serverExecutionTime":"00:00:00.5390116","Component version":"16.0.13877.0","Environment type":"Production","componentVersion":"16.0.13877.0","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","DeveloperMode":"true","AadTenantId":"common","sqlExecutes":"14","sqlRowsRead":"49","aadTenantId":"common","Component":"Dynamics 365 Business Central Server","totalTime":"00:00:00.5390116","component":"Dynamics 365 Business Central Server","eventId":"LC0022","result":"Success","Extension version":"1.0.0.6","extensionVersion":"1.0.0.6","Extension name":"pbt","extensionName":"pbt","extensionCulture":"en-US","extensionVersionFrom":"1.0.0.5"}
-->
## <a name="updatedfailed"></a>Extension failed to update 

Occurs when an extension failed to update on the service. <!--The update operation is run by the [Start-NAVAppDataUpgrade cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade).-->

> [!NOTE]
> Data is also recorded for any upgrade code that was run. For more information, see [Analyzing Extension Update Trace Telemetry](telemetry-extension-update-trace.md).

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension failed to update: {extensionName} version {extensionVersion} by {extensionPublisher} ({extensionId})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
| environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0023**|
| extensionCulture|Specifies the language version for which the extension that was upgraded. The value is a language culture name, such as **en-US** or **da-DK**. If a language wasn't specified when the extension was installed, then en-US is used by default. |
| extensionId|Specifies the ID of the extension that failed to uninstall.|
| extensionName|Specifies the name of the extension that was being upgraded.|
| extensionPublisher|Specifies the extension's publisher.|
| extensionVersion|Specifies the new version of the extension being upgraded.|
| extensionVersionFrom|Specifies the old version of the extension being upgraded.|
| failureReason|Specifies the error that occurred during upgrade.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||
<!--
### Example

{"result":"Failure","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","serverExecutionTime":"00:00:00.0063533","Extension version":"1.0.0.5","Component version":"16.0.13877.0","componentVersion":"16.0.13877.0","extensionCulture":"en-US","Environment type":"Production","extensionVersion":"1.0.0.5","environmentType":"Production","Extension name":"pbt","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","extensionName":"pbt","failureReason":"Cannot upgrade the extension 'pbt by Me 1.0.0.5' because its version must be newer than the current version. The current version is '1.0.0.6'","DeveloperMode":"true","aadTenantId":"common","sqlExecutes":"7","AadTenantId":"common","sqlRowsRead":"32","component":"Dynamics 365 Business Central Server","totalTime":"00:00:00.0063533","Component":"Dynamics 365 Business Central Server","eventId":"LC0023"}
-->

## CONTROL PLANE TRACES

[!INCLUDE[component](../developer/includes/online_only.md)]

The traces in this section are emitted by the Business Central control plane service during the installation or update operation of an extension/app. Theses traces compliment the tenant traces described above and help you identify the origin or cause of the extension's installation or update. The traces are recorded when:

- The extension is explicitly installed or updated
- The extension is installed or updated because an extension that's dependant on it was installed or updated.
- A hotfix is applied to the extension by Microsoft or ISV embed partner.

The following table illustrates the traces you can expect to see with the installation or update of an extension, in the order that they'll occur. The trace messages have been simplified for illustration purposes.

|Extension install lifecycle|Extension update lifecycle|Trace source|
|---------------------------|--------------------------|------------|
|Environment app version install scheduled|Environment app version update scheduled|Control plane|
|Environment app version install started|Environment app version update started|Control plane|
|Environment app version install/update requires dependency app| Environment app version install/update requires dependency app|Control plane|
|Extension synchronized: version|Extension synchronized: version|Tenant |
|Extension installed: version|Extension updated: version|Tenant |
|Environment app version installed|Environment app version updated|Control plane|

## <a name="app-install-scheduled"></a>Environment app version installation scheduled for environment

Occurs when scheduling the installation of a new extension/app has completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionName}, version {extensionDestinationVersion} installation scheduled for environment: {environmentName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0161**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]||
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"countryCode":"US","telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0161","extensionPublisher":"Bgasio publisher","extensionName":"Bgasio Test App 1","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd420","environmentName":"Production-copied","environmentVersion":"19.3.34541.36466","useEnvironmentUpdateWindow":"False","applicationFamily":"BusinessCentral","runAfterDateUtc":"2022-03-10T14:29:43.7255256Z","extensionDestinationVersion":"1.0.3.0","allowDependencyUpdate":"True","allowPreviewVersion":"False"}

-->

## <a name="app-install-schedule-failed"></a>Environment app version installation scheduling failed for environment

Occurs when scheduling the installation of a new extension/app has failed. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionName}, version {extensionDestinationVersion} installation scheduling failed for environment: {environmentName}**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0162**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]||
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0162","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd420","extensionScope":"Global","environmentName":"Production-copied","countryCode":"US","useEnvironmentUpdateWindow":"False","environmentVersion":"19.3.34541.36466","applicationFamily":"BusinessCentral","runAfterDateUtc":"2022-03-10T16:13:14.6046369Z","failureReason":"Validation failed with errors: \r\nApp Id: d3654b00-28c5-434b-bbf8-82f2231cd420, Name: Bgasio Test App 1, Publisher: Bgasio publisher, Version: 1.0.3.0, IncompatibleFromVersion: , Scope: Global, Availability: Available requires the following apps to be installed or updated as dependencies, please either allow automatic dependency installation/update or do the operation manually:\r\nInstall, AppId: d3654b00-28c5-434b-bbf8-82f2231cd422, Name: Bgasio Test App 2, Publisher: Bgasio publisher, Version: 1.0.6.0\r\n-App ID: 'd3654b00-28c5-434b-bbf8-82f2231cd420'\r\n-Country Code: 'US'\r\n-Target App Version: '1.0.3.0'\r\n-Allow App Dependency Auto Install/Update: 'False'","extensionDestinationVersion":"1.0.3.0","allowDependencyUpdate":"False","allowPreviewVersion":"False"}
-->

## <a name="app-install-latest"></a>Environment app version installation started for environment

Occurs when installing a new extension/app has started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionName}, version {extensionDestinationVersion} installation started for environment: {environmentName}**|
|severityLevel|**1** |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0163**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]||
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"countryCode":"US","telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0163","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd430","environmentName":"Production-pt","extensionScope":"Tenant","extensionDestinationVersion":"latest compatible","environmentVersion":"19.3.34541.35569","allowDependencyUpdate":"True","runAfterDateUtc":"2022-03-21T10:16:34.9925527Z","applicationFamily":"BusinessCentral","useEnvironmentUpdateWindow":"False","allowPreviewVersion":"False"}
-->

## <a name="app-install-latest-succeeded"></a>Environment app version installation succeeded for environment

Occurs when installing a new extension/app has completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionName}, version {extensionVersion} installation succeeded for environment: {environmentName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0164**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]||
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"countryCode":"US","telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0164","totalTime":"00:00:02.6719067","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd430","environmentName":"Production-pt","extensionScope":"Tenant","extensionDestinationVersion":"latest compatible","environmentVersion":"19.3.34541.35569","allowDependencyUpdate":"True","runAfterDateUtc":"2022-03-21T10:16:34.9925527Z","applicationFamily":"BusinessCentral","useEnvironmentUpdateWindow":"False","allowPreviewVersion":"False"}

-->

## <a name="app-install-failed"></a>Environment app version installation failed for environment

Occurs when installing a new extension/app has failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionName}, version {extensionDestinationVersion} installation failed for environment: {environmentName}**|
|severityLevel|**1**<!--question: shoulf be 3?-->|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependentsUninstall|[!INCLUDE[allowDependentsUninstall](../includes/include-telemetry-dimension-allow-dependents-uninstall)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0165**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|


<!--
{"telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0165","extensionName":"Bgasio Test App 1","extensionPublisher":"Bgasio publisher","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd420","environmentName":"Production-renamed","countryCode":"US","environmentVersion":"19.3.34541.36466","applicationFamily":"BusinessCentral","useEnvironmentUpdateWindow":"False","runAfterDateUtc":"2022-03-09T16:29:50.7423987Z","extensionSourceVersion":"1.0.3.1","deleteData":"True","allowDependentsUninstall":"False"}
-->

## <a name="app-dependency-app"></a>Environment app version installation/update requires automatically installing a new dependency app for environment

Occurs when the extension/app that's being installed or updated has a dependency on another extension/app that must be installed first.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionName}, version {extensionDestinationVersion} installation/update requires automatically installing a new dependency app {dependencyExtensionName}, version {dependencyExtensionDestinationVersion} for environment: {environmentName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|dependencyExtensionDestinationVersion|Specifies the version of the dependency extension. |
|dependencyExtensionId|Specifies the ID of the dependency extension/app.|
|dependencyExtensionName|Specifies the name of the dependency extension/app.|
|dependencyExtensionPublisher|Specifies the publisher of the dependency extension/app.|
|dependencyExtensionScope|Specifies whether the dependency extension/app is published to one of the following scopes: <br />**Global** - the extension can be installed on all tenants connected the service instance. <br />**Tenant** - the extension can only be installed on the tenant to which it was published.|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0166**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]||
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|



<!--
{"telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","extensionPublisher":"Bgasio publisher","eventId":"LC0166","extensionName":"Bgasio Test App 1","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd420","extensionScope":"Global","environmentName":"Production-copied","countryCode":"US","useEnvironmentUpdateWindow":"False","environmentVersion":"19.3.34541.36466","applicationFamily":"BusinessCentral","extensionDestinationVersion":"1.0.3.0","allowDependencyUpdate":"False","allowPreviewVersion":"False","dependencyExtensionPublisher":"Bgasio publisher","dependencyExtensionName":"Bgasio Test App 2","dependencyExtensionDestinationVersion":"1.0.6.0","dependencyExtensionId":"d3654b00-28c5-434b-bbf8-82f2231cd422","dependencyExtensionScope":"Global"}
-->

## <a name="app-update-scheduled"></a>Environment app update to version scheduled for environment

Occurs when scheduling the update of an existing extension/app to another version has succeeded.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionName} update to version {extensionDestinationVersion} scheduled for environment: {environmentName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0167**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"countryCode":"US","telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0167","extensionPublisher":"Bgasio publisher","extensionName":"Bgasio Test App 1","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd420","environmentName":"Production-copied","extensionScope":"Global","useEnvironmentUpdateWindow":"False","extensionDestinationVersion":"1.0.3.1","environmentVersion":"19.3.34541.36466","applicationFamily":"BusinessCentral","allowDependencyUpdate":"True","allowPreviewVersion":"False","runAfterDateUtc":"2022-03-10T16:14:47.5673701Z","extensionSourceVersion":"1.0.3.0"}

-->
## <a name="app-update-schedule-failed"></a>Environment app update to version scheduling failed for environment

Occurs when scheduling the update of an existing extension/app to another version has failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionId} update to version {extensionDestinationVersion} scheduling failed for environment: {environmentName}**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0168**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"countryCode":"US","telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0168","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd420","failureReason":"Validation failed with errors: \r\nApp Id: d3654b00-28c5-434b-bbf8-82f2231cd420, Name: Bgasio Test App 1, Publisher: Bgasio publisher, Version: 1.0.3.1, IncompatibleFromVersion: , Scope: Global, Availability: Available requires the following apps to be installed or updated as dependencies, please either allow automatic dependency installation/update or do the operation manually:\r\nInstall, AppId: 967b4a3e-3148-421f-bc18-001402305402, Name: Vertex Tax Links 2 GLOBAL, Publisher: Default publisher, Version: 2.0.5.7\r\n-App ID: 'd3654b00-28c5-434b-bbf8-82f2231cd420'\r\n-Country Code: 'US'\r\n-Target App Version: '1.0.3.1'\r\n-Allow App Dependency Auto Install/Update: 'False'","environmentName":"Production-copied","extensionScope":"Global","useEnvironmentUpdateWindow":"False","extensionDestinationVersion":"1.0.3.1","environmentVersion":"19.3.34541.36466","applicationFamily":"BusinessCentral","allowDependencyUpdate":"False","allowPreviewVersion":"False","runAfterDateUtc":"2022-03-10T16:14:41.4562490Z"}
-->

## <a name="app-update-latest-started"></a>Environment app update to version started for environment

Occurs when updating of an existing extension/app to another version has started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionId} update to version {extensionDestinationVersion} started for environment: {environmentName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0169**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"countryCode":"US","telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0169","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd430","extensionScope":"Tenant","environmentName":"Production-pt","extensionSourceVersion":"2.0.5.16","extensionDestinationVersion":"latest compatible","environmentVersion":"19.3.34541.35569","allowDependencyUpdate":"True","runAfterDateUtc":"2022-03-21T10:17:51.9124591Z","applicationFamily":"BusinessCentral","useEnvironmentUpdateWindow":"False","allowPreviewVersion":"False"}
-->

## <a name="app-update-latest-succeeded"></a>Environment app update to version succeeded for environment

Occurs when updating of an existing extension/app to another version has completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionId} update to version {extensionDestinationVersion} succeeded for environment: {environmentName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0170**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"countryCode":"US","telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0170","totalTime":"00:00:05.5550331","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd430","extensionScope":"Tenant","environmentName":"Production-pt","extensionSourceVersion":"2.0.5.16","extensionDestinationVersion":"latest compatible","environmentVersion":"19.3.34541.35569","allowDependencyUpdate":"True","runAfterDateUtc":"2022-03-21T10:17:51.9124591Z","applicationFamily":"BusinessCentral","useEnvironmentUpdateWindow":"False","allowPreviewVersion":"False"}
-->

## <a name="app-update-latest-failed"></a>Environment app update to version failed for environment

Occurs when updating an existing extension/app to another version has failed.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionId} update to version {extensionDestinationVersion} failed for environment: {environmentName}**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0171**|
|extensionDestinationVersion|[!INCLUDE[extensionDestinationVersion](../includes/include-telemetry-dimension-extension-destination-version.md)]|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionScope|[!INCLUDE[extensionScope](../includes/include-telemetry-dimension-extension-scope.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|totalTime|[!INCLUDE[totalTime](../includes/include-telemetry-dimension-total-time.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"countryCode":"US","telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0171","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd430","totalTime":"00:00:14.2345806","failureReason":"App d3654b00-28c5-434b-bbf8-82f2231cd430 failed to install/update, errors encountered:\r\nCould not upgrade the NAV extension 'PTE with new environment cleanup by Default publisher 2.0.5.16' due to the following error: 'Table CleanupData :: The field 'Data' has changed the length of the data type from '50' to '500'. Changing the length of the data type on fields is not allowed.'.","extensionScope":"Tenant","environmentName":"Production-pt","environmentVersion":"19.3.34541.35569","applicationFamily":"BusinessCentral","extensionSourceVersion":"2.0.5.15","extensionDestinationVersion":"latest compatible","allowDependencyUpdate":"True","runAfterDateUtc":"2022-03-21T10:14:10.6886778Z","useEnvironmentUpdateWindow":"False","allowPreviewVersion":"False"}

-->
## <a name="app-uninstall-scheduled"></a>Environment app uninstall scheduled for environment

Occurs when scheduling the uninstallation of an extension/app has completed successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionName} uninstall scheduled for environment: {environmentName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependencyUpdate|[!INCLUDE[allowDependencyUpdate](../includes/include-telemetry-dimension-allow-dependency-update.md)]|
|allowPreviewVersion|[!INCLUDE[allowPreviewVersion](../includes/include-telemetry-dimension-allow-preview-version.md)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0173**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]|
|extensionName|[!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)]|
|extensionPublisher|[!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)]|
|extensionSourceVersion|[!INCLUDE[extensionSourceVersion](../includes/include-telemetry-dimension-extension-source-version.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","extensionPublisher":"Bgasio publisher","eventId":"LC0173","extensionName":"Bgasio Test App 2","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd422","environmentName":"Production-copied","countryCode":"US","useEnvironmentUpdateWindow":"False","environmentVersion":"19.3.34541.36466","applicationFamily":"BusinessCentral","runAfterDateUtc":"2022-03-10T16:12:10.7226989Z","allowDependentsUninstall":"True","extensionSourceVersion":"1.0.6.0","deleteData":"True"}
-->

## <a name="app-uninstall-schedule-failed"></a>Environment app uninstall scheduling failed for environment

Occurs when scheduling the uninstallation of an extension/app has failed.


### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Environment app {extensionId} uninstall scheduling failed for environment: {environmentName}**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|allowDependentsUninstall|[!INCLUDE[allowDependentsUninstall](../includes/include-telemetry-dimension-allow-dependents-uninstall)]|
|applicationFamily|[!INCLUDE[applicationFamily](../includes/include-telemetry-dimension-application-family.md)]|
|countryCode|[!INCLUDE[countryCode](../includes/include-telemetry-dimension-country-code.md)]|
|deleteData|[!INCLUDE[deleteData](../includes/include-telemetry-dimension-delete-data.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|environmentVersion|[!INCLUDE[environmentVersion](../includes/include-telemetry-dimension-environment-version.md)]|
|eventId|**LC0174**|
|extensionId|[!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)]||
|failureReason|[!INCLUDE[failureReason](../includes/include-telemetry-dimension-failure-reason.md)]|
|runAfterDateUtc|[!INCLUDE[runAfterDateUtc](../includes/include-telemetry-dimension-run-after-date.md)]|
|useEnvironmentUpdateWindow|[!INCLUDE[useEnvironmentUpdateWindow](../includes/include-telemetry-dimension-use-environment-update-window.md)]|
|[See common custom dimensions](#other)|-|

<!--
{"telemetrySchemaVersion":"0.1","environmentType":"Production","aadTenantId":"1633d4a2-6d53-4254-868f-b8d70eefed7a","component":"Dynamics 365 Business Central Control Plane","eventId":"LC0174","extensionId":"d3654b00-28c5-434b-bbf8-82f2231cd420","environmentName":"Production-copied","countryCode":"US","useEnvironmentUpdateWindow":"False","environmentVersion":"19.3.34541.36466","applicationFamily":"BusinessCentral","runAfterDateUtc":"2022-03-10T16:12:32.8184873Z","allowDependentsUninstall":"True","deleteData":"True","failureReason":"Validation failed with errors: \r\nApp to uninstall is not installed.\r\n-App ID: 'd3654b00-28c5-434b-bbf8-82f2231cd420'\r\n-Environment: 'Production-copied'"}

-->

## See also

[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
