---
title:  Extension Update Trace Telemetry | Microsoft Docs
description: Learn about the extension upgrade telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 05/10/2020
ms.author: jswymer
---
# Analyzing Extension Update Trace Telemetry

**INTRODUCED IN:** Business Central 2020 release wave 2

App key vault telemetry gathers information about the acquisition of secrets in Azure Key Vaults by extensions at runtime. Extensions can be configured to retrieve secrets from one or key vaults.

The gathered data can help you identify, troubleshoot, and resolve issues with per-tenant extensions. For more information about using key vault secrets with extensions, see [App Key Vaults with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions](extension-key-vault.md).

## App Key Vault secret initialization succeeded

Occurs when an extension secret was successfully initialized.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App Key Vault initialization succeeded: '{keVaultUri}'.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by request.|
|alObjectType|Specifies the type of AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used at time of execution. ||
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0014**|
|extensionName|Specifies the name of the extension.|
|extensionId|Specifies the AppID of the extension.|
|extensionPublisher|Specifies the publisher of the extension|
|extensionVersion|Specifies the version of the extension.|
|keyVaultUri|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

<!--
Example:

{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"16.0.14248.0","componentVersion":"16.0.14248.0","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Extension name, Extension App Id, Extension version, Telemetry schema version","extensionPublisher":"Microsoft","Extension version":"17.0.14320.0","extensionVersion":"17.0.14320.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","component":"Dynamics 365 Business Central Server","Extension name":"System Application","extensionName":"System Application","AL Object Id":"3801","Company name":"CRONUS International Ltd.","eventId":"RT0014","Client type":"WebClient","companyName":"CRONUS International Ltd.","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","alObjectId":"3801","clientType":"WebClient","AL Object type":"CodeUnit","AL Stack trace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentAppInternal - System Application by Microsoft\r\n\"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentApp - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).TryInitializeFromCurrentApp - System Application by Microsoft\r\nHelloWorldPage(Page 50100).OnOpenPage(Trigger) line 4 - ALProject1 by Default publisher","AL Object name":"App Key Vault Secret Pr. Impl.","alStackTrace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentAppInternal - System Application by Microsoft\r\n\"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentApp - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).TryInitializeFromCurrentApp - System Application by Microsoft\r\nHelloWorldPage(Page 50100).OnOpenPage(Trigger) line 4 - ALProject1 by Default publisher","alObjectType":"CodeUnit","alObjectName":"App Key Vault Secret Pr. Impl.","keyVaultUrls":"https://jswymer-keyvault-z.vault.azure.net/"}
-->

## App Key Vault initialization failed

Occurs when a key vault failed to be initialized.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App Key Vault initialization failed.**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by request.|
|alObjectType|Specifies the type of AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used at time of execution. ||
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0015**|
|extensionName|Specifies the name of the extension.|
|extensionId|Specifies the AppID of the extension.|
|extensionPublisher|Specifies the publisher of the extension|
|extensionVersion|Specifies the version of the extension.|
|failureReason|Specifies the error that occurred.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|


<!--
## Example

{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"16.0.14248.0","componentVersion":"16.0.14248.0","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Extension name, Extension App Id, Extension version, Telemetry schema version","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","AL Object Id":"3801","Company name":"CRONUS International Ltd.","Client type":"WebClient","companyName":"CRONUS International Ltd.","eventId":"RT0015","clientType":"WebClient","alObjectId":"3801","extensionPublisher":"Microsoft","Extension version":"17.0.14320.0","extensionVersion":"17.0.14320.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","Extension name":"System Application","extensionName":"System Application","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","AL Object name":"App Key Vault Secret Pr. Impl.","alObjectName":"App Key Vault Secret Pr. Impl.","alObjectType":"CodeUnit","failureReason":"No key vaults specified for extension 'ALProject4 by Me 1.0.0.3'.","alStackTrace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentAppInternal - System Application by Microsoft\r\n\"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentApp - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).TryInitializeFromCurrentApp - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 4 - ALProject4 by Me","AL Object type":"CodeUnit","AL Stack trace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentAppInternal - System Application by Microsoft\r\n\"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentApp - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).TryInitializeFromCurrentApp - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 4 - ALProject4 by Me"}

-->
## App Key Vault secret retrieval succeeded

Occurs when a secret used by an extension is successfully retrieved from an Azure Key Vault.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App Key Vault secret retrieval succeeded from key vault '{keVaultUri}'.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by request.|
|alObjectType|Specifies the type of AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used at time of execution. ||
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0016**|
|extensionName|Specifies the name of the extension.|
|extensionId|Specifies the AppID of the extension.|
|extensionPublisher|Specifies the publisher of the extension|
|extensionVersion|Specifies the version of the extension.|
|keyVaultUri|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

<!--
{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"16.0.14248.0","componentVersion":"16.0.14248.0","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Extension name, Extension App Id, Extension version, Telemetry schema version","extensionPublisher":"Microsoft","Company name":"CRONUS International Ltd.","AL Object Id":"3801","Extension version":"17.0.14320.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","extensionVersion":"17.0.14320.0","Client type":"WebClient","companyName":"CRONUS International Ltd.","component":"Dynamics 365 Business Central Server","alObjectId":"3801","clientType":"WebClient","Extension name":"System Application","extensionName":"System Application","eventId":"RT0016","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","AL Object name":"App Key Vault Secret Pr. Impl.","AL Stack trace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).GetSecret - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).GetSecret - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 6 - ALProject4 by Me","AL Object type":"CodeUnit","alObjectName":"App Key Vault Secret Pr. Impl.","alObjectType":"CodeUnit","alStackTrace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).GetSecret - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).GetSecret - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 6 - ALProject4 by Me","keyVaultUrl":"https://jswymer-keyvault-1.vault.azure.net/"}

-->

## App Key Vault secret retrieval failed

Occurs when an extension failed to retrieve a secret from a specified Azure key vault.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App Key Vault secret retrieval failed from key vault '{keVaultUri}'.**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by request.|
|alObjectType|Specifies the type of AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used at time of execution. ||
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0017**|
|extensionName|Specifies the name of the extension.|
|extensionId|Specifies the AppID of the extension.|
|extensionPublisher|Specifies the publisher of the extension|
|extensionVersion|Specifies the version of the extension.|
|failureReason|Specifies the error that occurred.|
|keyVaultUri|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

### Troubleshooting failures

<!--
### Example

{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","extensionPublisher":"Microsoft","Extension version":"17.0.14320.0","Component version":"16.0.14248.0","extensionVersion":"17.0.14320.0","componentVersion":"16.0.14248.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Extension name, Extension App Id, Extension version, Telemetry schema version","Extension name":"System Application","AL Stack trace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).GetSecret - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).GetSecret - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 6 - ALProject4 by Me","AL Object type":"CodeUnit","AL Object name":"App Key Vault Secret Pr. Impl.","extensionName":"System Application","alObjectType":"CodeUnit","alStackTrace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).GetSecret - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).GetSecret - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 6 - ALProject4 by Me","Company name":"CRONUS International Ltd.","alObjectName":"App Key Vault Secret Pr. Impl.","AL Object Id":"3801","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","Client type":"WebClient","companyName":"CRONUS International Ltd.","alObjectId":"3801","clientType":"WebClient","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"RT0017","failureReason":"Secret not found in key vault. Check that the secret name is valid.","keyVaultUrl":"https://jswymer-keyvault-1.vault.azure.net/"}

-->

## See also

[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
