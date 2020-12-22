---
title:  Extension Lifecycle Trace Telemetry | Microsoft Docs
description: Learn about the extension lifecycle telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/01/2020
ms.author: jswymer
---
# Analyzing Extension Lifecycle Trace Telemetry

**INTRODUCED IN:** Business Central 2020 release wave 1, version 16.3. For extension telemetry, this signal was introduced in 2020 release wave 2, version 17.1

Extension lifecycle telemetry gathers data about the success or failure of the following extension-related operations:

- Compiling an extension
- Synchronizing an extension
- Publishing an extension
- Installing an extension
- Updating an extension
- Uninstalling an extension
- Unpublishing an extension

Failed operations result in a trace log entry that includes a reason for the failure.

Data is gathered when the operations are done using:

- [Extension Management page](/dynamics365/business-central/ui-extensions) in the client.
- [Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central administration center.
- [Extension management PowerShell cmdlets](/powershell/module/microsoft.dynamics.nav.apps.management) from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

## Behavior overview

- Compiling, publishing, and unpublishing extensions

    Data for these operations is only recorded for extensions that are published in the tenant scope.
    
    - For on-premises, it includes extensions that are published by running the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) with the `-Scope Tenant` parameter.
    
    - For online, it includes per-tenant extensions uploaded from the **Extension Management** page in the client. It doesn't include Microsoft extensions or [AppSource extensions](https://appsource.microsoft.com/en-US/marketplace?product=dynamics-365-business-central).

- Synchronizing extensions

    - For on-premises, data for this operation is recorded when an extension is synchronized by using the [Sync-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp).

    - For online, data is recorded when an extension is installed from the **Extension Management** page in the client. Or, when upgraded from the [Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central administration center.

- Installing and uninstalling extensions

    - For on-premises, data for these operations is recorded when an extension is installed or uninstalled by using the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) or [Uninstall-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp). Or, when an extension is installed or uninstalled from the **Extension Management** page in the client.

    - For on-premises, data for these operations is recorded when an extension is installed or uninstalled from the **Extension Management** page in the client.

- Updating an extension

    - For on-premises, data for this operation is recorded when an extension is upgraded by using the [Start-NAVAppDataUpgrade cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade).

    - For online, data is recorded when an extension is updated from the [Manage Apps page](tenant-admin-center-manage-apps.md) in the Business Central administration center.

-  For some operations, you might experience that certain custom dimensions aren't available.

    The reason is that custom dimensions are added to the signal gradually, as the information is retrieved. If the operation fails before the custom dimension is retrieved, it isn't included in the result. 

    For example, if you try to uninstall an extension using the Ininstall-NAVApp cmdlet, and the specified extension name is wrong, the operation fails. In this case, the `extensionid` and `extensionVersion` will be excluded from the results.  

## ENVIRONMENT/SERVER-SIDE OPERATIONS

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0020**|
|extensionCompilationDependencyList|Specifies details about the extensions on which the compiled extension has dependencies.<br /><br /> **Note:** If the value exceeds 8000 characters, one or two additional dimensions will be included in the trace to cover the complete dependency list. For more information, see [About Custom Dimensions](telemetry-overview.md#customdimensions).|
|extensionCompilationResult |**Compilation succeeded without errors or warnings.**|
| extensionName|Specifies the name of the extension that was compiled.|
| extensionId|Specifies the AppID of the extension that was compiled.|
| extensionPublishedAs|Specifies whether the compiled extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the compiled extension.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0021**|
|extensionCompilationDependencyList|Specifies details about the extensions on which the compiled extension has dependencies.<br /><br /> **Note:** If the value exceeds 8000 characters, one or two additional dimensions will be included in the trace to cover the complete dependency list. For more information, see [About Custom Dimensions](telemetry-overview.md#customdimensions).|
|extensionCompilationResult |Specifies details about the error that occurred during compilation.|
| extensionName|Specifies the name of the extension that failed to compile.|
| extensionId|Specifies the AppID of the extension that failed to compile.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the compiled extension.|
|failureReason|Specifies the error that occurred when compiling the extension.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**LC0014**|
| extensionId|Specifies the AppID of the extension that was published.|
| extensionIsRad|Specifies whether the extension that was RAD published. **True** indicates the extension was RAD published. **False** indicates normal publishing. <br /><br />RAD (Rapid Application Development) publishing is done from the AL development environment. RAD publishing is a partial publishing operation that only publishes objects application objects that have changed during development. For more information, see [Working with Rapid Application Development](../developer/devenv-rad-publishing.md).|
| extensionName|Specifies the name of the extension that published.|
| extensionId|Specifies the AppID of the extension that published.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the published extension.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**LC0015**|
| extensionId|Specifies the AppID of the extension that was published.|
| extensionIsRad|Specifies whether the extension that was RAD published. **True** indicates the extension was RAD published. **False** indicates normal publishing. <br /><br />RAD (Rapid Application Development) publishing is done from the AL development environment. RAD publishing only is a partial publishing operation that only publishes objects application objects that have changed during development. For more information, see [Working with Rapid Application Development](../developer/devenv-rad-publishing.md).|
| extensionName|Specifies the name of the extension that published.|
| extensionId|Specifies the AppID of the extension that published.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the published extension.|
|failureReason|Specifies the error that occurred when publishing.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**LC0018**|
| extensionId|Specifies the AppID of the extension that was unpublished.|
| extensionName|Specifies the name of the extension that was unpublished.|
| extensionId|Specifies the AppID of the extension that was unpublished.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the unpublished extension.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**LC0019**|
| extensionId|Specifies the AppID of the extension that failed to unpublish.|
| extensionName|Specifies the name of the extension that failed to unpublish.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the unpublished extension.|
|failureReason|Specifies the error that occurred when unpublishing.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

<!--
### Example

{"extensionName":"pbt","AadTenantId":"common","sqlRowsRead":"0","Extension name":"pbt","DeveloperMode":"true","Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","Environment type":"Production","component":"Dynamics 365 Business Central Server","environmentType":"Production","extensionVersion":"1.0.0.6","sqlExecutes":"2","extensionPublishedAs":"Tenant","componentVersion":"16.0.13877.0","Component version":"16.0.13877.0","clientType":"Background","result":"Failure","aadTenantId":"common","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","totalTime":"00:00:00.0030022","extensionIsRad":"False","serverExecutionTime":"00:00:00.0030022","failureReason":"This extension cannot be published into the tenant scope because it is currently or was previously published into the global scope and at least one globally published application 'pbt by Me' has a dependency on it. \r\nAn unpublished global scoped extension can only be published to the tenant scope if there are no published applications to the global scope that depend on this application. \r\nAn application published into the global scope cannot have dependencies on applications published into the tenant scope.","Extension App Id":"0b6c8443-c488-4967-b53d-f53ac52b6180","extensionId":"0b6c8443-c488-4967-b53d-f53ac52b6180","extensionScope":"Tenant","Extension version":"1.0.0.6","eventId":"LC0015","telemetrySchemaVersion":"0.1","extensionPublisher":"Me"}

-->

## TENANT OPERATIONS

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
| component|**Dynamics 365 Business Central Server**.|
| componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
| deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0012**|
| extensionId|Specifies the AppID of the extension that was synchronized.|
| extensionName|Specifies the name of the extension that was synchronized.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionSynchronizationMode|Specifies whether the extension was synchronized in one of the following modes:<ul><li>**Add** -  The database schema defined by the objects in the extension are added to the database schema of the tenant database. This mode is typically used mode after you publish an extension for the first time.</li><li>**Clean** - The database schema defined by all versions of the extension will be removed from the database and all data is lost. This mode is typically used when an extension will no longer be used and all versions unpublished. </li><li>**Development** - This mode is acts similar to Add, except it is intended for use during development. It lets you to sync the same version of an extension that is already published. However, to run this mode, only one version the App can be currently published.</li><li>**ForceSync** - This mode like **Add** except it supports destructive schema changes (like removing fields, renaming them, changing their datatypes, and more). It is typically used during development, and is the mode used when an extension is published and installed from the AL development environment.</li></ul> For more information about the modes, see [Sync-NAVApp cmdlet -Mode](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp).|
| extensionVersion|Specifies the version of the extension was synchronized.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
| component|**Dynamics 365 Business Central Server**.|
| componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
| deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0013**|
| extensionId|Specifies the AppID of the extension that failed to synchronize.|
| extensionName|Specifies the name of the extension that failed to synchronize.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionSynchronizationMode|Specifies whether the extension was synchronized in one of the following modes:<ul><li>**Add** -  The database schema defined by the objects in the extension are added to the database schema of the tenant database. This mode is typically used mode after you publish an extension for the first time.</li><li>**Clean** - The database schema defined by all versions of the extension will be removed from the database and all data is lost. This mode is typically used when an extension will no longer be used and all versions unpublished. </li><li>**Development** - This mode is acts similar to Add, except it is intended for use during development. It lets you to sync the same version of an extension that is already published. However, to run this mode, only one version the App can be currently published.</li><li>**ForceSync** - This mode like **Add** except it supports destructive schema changes (like removing fields, renaming them, changing their datatypes, and more). It is typically used during development, and is the mode used when an extension is published and installed from the AL development environment.</li></ul> For more information about the modes, see [Sync-NAVApp cmdlet -Mode](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp).|
| extensionVersion|Specifies the version of the extension was synchronized.|
| failureReason|Specifies the error that occurred when synchronizing the extension.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
| component|**Dynamics 365 Business Central Server**.|
| componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
| deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
| environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0010**|
| extensionId|Specifies the AppID of the extension that was installed.|
| extensionName|Specifies the name of the extension that failed to synchronize.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the extension was installed.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
<!--
### Example:

{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","serverExecutionTime":"00:00:08.8671784","Component version":"16.0.14073.14105","Environment type":"Production","componentVersion":"16.0.14073.14105","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","Extension version":"1.0.0.0","extensionVersion":"1.0.0.0","aadTenantId":"common","AadTenantId":"common","extensionPublishedAs":"Tenant","sqlRowsRead":"0","extensionPublisher":"Default publisher","sqlExecutes":"1","Extension name":"ExtX","component":"Dynamics 365 Business Central Server","extensionName":"ExtX","totalTime":"00:00:08.8671784","Extension App Id":"4f5f1484-cfb4-48b3-ab92-6eef2b91d5fd","extensionScope":"Tenant","eventId":"LC0010","extensionId":"4f5f1484-cfb4-48b3-ab92-6eef2b91d5fd","result":"Success"}
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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
| component|**Dynamics 365 Business Central Server**.|
| componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
| deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0011**|
| extensionId|Specifies the AppID of the extension that failed to uninstall.|
| extensionName|Specifies the name of the extension that failed to uninstall.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the extension was installed.|
|failureReason|Specifies the error that occurred when the extension was installed.|
| result|**Failed**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

<!--
### Example

{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","serverExecutionTime":"00:00:00.0099237","Component version":"16.0.14073.14105","componentVersion":"16.0.14073.14105","Environment type":"Production","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version, Telemetry schema version","extensionVersion":"1.0.0.0","aadTenantId":"common","AadTenantId":"common","sqlRowsRead":"0","sqlExecutes":"1","totalTime":"00:00:00.0099237","component":"Dynamics 365 Business Central Server","Extension version":"1.0.0.0","eventId":"LC0011","Extension name":"exty","result":"Failure","extensionName":"exty","failureReason":"Cannot install the extension ExtY by Default publisher 1.0.0.0 for the tenant default because the referenced dependencies System Application, System Application, System Application, Base Application, ExtX are not installed. To install the dependencies as well as ExtY by Default publisher 1.0.0.0, run the command again and set the Force parameter."}
-->
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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
| component|**Dynamics 365 Business Central Server**.|
| componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
| deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|doNotSaveData|Specifies whether the uninstall operation was run with option not to save the data in database table fields that are added by the extension. When using the Uninstall-NAVApp cmdlet, this condition is set with the -DoNotSaveData switch parameter.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0016**|
| extensionId|Specifies the AppID of the extension that was uninstalled.|
| extensionName|Specifies the name of the extension that was uninstalled.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the extension was uninstalled.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

<!--
### Example

{"Component version":"16.0.13877.0","totalTime":"00:00:00.0705066","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","aadTenantId":"common","result":"Success","component":"Dynamics 365 Business Central Server","extensionName":"pbt","sqlRowsRead":"60","extensionId":"0b6c8443-c488-4967-b53d-f53ac52b6180","AadTenantId":"common","sqlExecutes":"12","extensionVersion":"1.0.0.6","extensionPublishedAs":"Global","Environment type":"Production","Telemetry schema version":"0.1","Extension name":"pbt","DeveloperMode":"true","Component":"Dynamics 365 Business Central Server","extensionScope":"Global","Extension version":"1.0.0.6","extensionPublisher":"Me","telemetrySchemaVersion":"0.1","Extension App Id":"0b6c8443-c488-4967-b53d-f53ac52b6180","serverExecutionTime":"00:00:00.0705066","eventId":"LC0016","componentVersion":"16.0.13877.0"}
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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
| component|**Dynamics 365 Business Central Server**.|
| componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
| deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|doNotSaveData|Specifies whether the uninstall operation was run with option not to save the data in database table fields that are added by the extension. When using the Uninstall-NAVApp cmdlet, this condition is set with the -DoNotSaveData switch parameter.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0017**|
| extensionId|Specifies the AppID of the extension that failed to uninstall.|
| extensionName|Specifies the name of the extension that failed to uninstall.|
| extensionPublishedAs|Specifies whether the extension was published as one of the following options:<ul><li>**Dev** - published from the AL development environment.</li><li>**Global** - published to the global scope.</li><li>**Tenant** - published to the tenant scope.</li></ul>|
| extensionPublisher|Specifies the extension's publisher.|
| extensionScope|Specifies whether the extension was published to one of the following scopes:<ul><li>**Global** - the extension can be installed on all tenants connected the service instance. </li><li>**Tenant** - the extension can only be installed on the tenant to which it was published.</li></ul>.|
| extensionVersion|Specifies the version of the extension that failed to uninstall.|
|failureReason|Specifies the error that occurred when the extension was uninstalled.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

<!--
### Example

{"Component":"Dynamics 365 Business Central Server","componentVersion":"16.0.13877.0","Component version":"16.0.13877.0","eventId":"LC0017","serverExecutionTime":"00:00:00.0035521","failureReason":"Cannot find the extension 'pbt' because it is not published.","Extension App Id":"pbt","DeveloperMode":"true","telemetrySchemaVersion":"0.1","Extension version":"1.0.0.7","Telemetry schema version":"0.1","environmentType":"Production","extensionVersion":"1.0.0.7","sqlExecutes":"3","extensionId":"pbt","sqlRowsRead":"0","AadTenantId":"common","component":"Dynamics 365 Business Central Server","Environment type":"Production","result":"Failure","aadTenantId":"common","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","totalTime":"00:00:00.0035521"}

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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
| component|**Dynamics 365 Business Central Server**.|
| componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
| deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We 
| environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0022**|
| extensionCulture|Specifies the language version for which the extension that was upgraded. The value is a language culture name, such as **en-US** or **da-DK**. If a language wasn't specified when the extension was installed, then en-US is used by default. |
| extensionId|Specifies the AppID of the extension that failed to uninstall.|
| extensionName|Specifies the name of the extension that was being upgraded.|
| extensionPublisher|Specifies the extension's publisher.|
| extensionVersion|Specifies the new version of the extension being upgraded.|
| extensionVersionFrom|Specifies the old version of the extension being upgraded.|
| result|**Success**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|
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
| aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
| component|**Dynamics 365 Business Central Server**.|
| componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
| deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
| environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
| environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
| eventId|**LC0023**|
| extensionCulture|Specifies the language version for which the extension that was upgraded. The value is a language culture name, such as **en-US** or **da-DK**. If a language wasn't specified when the extension was installed, then en-US is used by default. |
| extensionId|Specifies the AppID of the extension that failed to uninstall.|
| extensionName|Specifies the name of the extension that was being upgraded.|
| extensionPublisher|Specifies the extension's publisher.|
| extensionVersion|Specifies the new version of the extension being upgraded.|
| extensionVersionFrom|Specifies the old version of the extension being upgraded.|
| failureReason|Specifies the error that occurred during upgrade.|
| result|**Failure**|
| serverExecutionTime|Specifies the amount of time it took the server to complete the request. The time has the format hh:mm:ss.sssssss.|
| sqlExecutes|Specifies the number of SQL statements that the request executed. |
| sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
| telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|
| totalTime|Specifies the amount of time it took to process the request. The time has the format hh:mm:ss.sssssss.|

<!--
### Example

{"result":"Failure","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","serverExecutionTime":"00:00:00.0063533","Extension version":"1.0.0.5","Component version":"16.0.13877.0","componentVersion":"16.0.13877.0","extensionCulture":"en-US","Environment type":"Production","extensionVersion":"1.0.0.5","environmentType":"Production","Extension name":"pbt","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, AadTenantId, Environment name, Environment type","extensionName":"pbt","failureReason":"Cannot upgrade the extension 'pbt by Me 1.0.0.5' because its version must be newer than the current version. The current version is '1.0.0.6'","DeveloperMode":"true","aadTenantId":"common","sqlExecutes":"7","AadTenantId":"common","sqlRowsRead":"32","component":"Dynamics 365 Business Central Server","totalTime":"00:00:00.0063533","Component":"Dynamics 365 Business Central Server","eventId":"LC0023"}
-->
## See also

[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
