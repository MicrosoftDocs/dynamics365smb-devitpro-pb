---
title:  App Key Vault Secret Trace Telemetry | Microsoft Docs
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
# Analyzing App Key Vault Secret Trace Telemetry

**INTRODUCED IN:** Business Central 2020 release wave 2

App key vault telemetry gathers information about the acquisition of secrets in Azure Key Vaults by extensions at runtime. Secrets are a kind of credential used for authenticating an extension. For an overview of app key vaults and secrets, see [Using App Key Vaults with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions](../developer/devenv-app-key-vault-overview.md).

The app key vault secret process has two operations: *initialization* and *retrieval*. The telemetry data provides information about the success or failure for each of these operations. There are various conditions that cause a failure. The failure messages provide insight into the cause of the failure, helping you identify, troubleshoot, and resolve issues.

#### Initialization

Initialization is the first stage. It verifies the configuration of the app key vault provider in the extension and on the service. This stage is initiated by the `TryInitializeFromCurrentApp` method call in the extension code. Some conditions that cause failures in this stage include:

- The extension doesn't specify a key vault in it's app.json file.
- The Azure Key Vault Client Identity settings are incorrect. For example, like the application (client) ID of the key vault reader application in Azure.
- The Business Central Server lacks permission to the private key of the Azure Key Vault client certificate.

#### Retrieval

Retrieval is the second stage, and occurs after a successful initialization. In this stage, the service tries to get a secret from a specified key vault. This stage is initiated by the `GetSecret` method call in the extension code. Some conditions that cause failures include:

- The secret name requested by the extension is missing or not valid.
- The Azure Key Vault Client Identity settings are incorrect. For example, like the application (client) ID of the key vault reader application in Azure.
- The Business Central Server lacks permission to the private key of the Azure Key Vault client certificate.

For more information about using key vault secrets with extensions, see [App Key Vaults with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions](../developer/devenv-app-key-vault-overview.md).

## <a name="initializedsuccess"></a>App Key Vault secret initialization succeeded

Occurs when an extension secret was successfully initialized.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App Key Vault initialization succeeded: '{keyVaultUri}'.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by request.|
|alObjectType|Specifies the type of AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the request, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0014**|
|extensionName|Specifies the name of the extension that requested the secret. |
|extensionId|Specifies the AppID of the extension that requested the secret.|
|extensionPublisher|Specifies the publisher of the extension that requested the secret. |
|extensionVersion|Specifies the version of the extension that requested the secret.|
|keyVaultUri|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

<!--
Example:

{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"16.0.14248.0","componentVersion":"16.0.14248.0","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Extension name, Extension App Id, Extension version, Telemetry schema version","extensionPublisher":"Microsoft","Extension version":"17.0.14320.0","extensionVersion":"17.0.14320.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","component":"Dynamics 365 Business Central Server","Extension name":"System Application","extensionName":"System Application","AL Object Id":"3801","Company name":"CRONUS International Ltd.","eventId":"RT0014","Client type":"WebClient","companyName":"CRONUS International Ltd.","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","alObjectId":"3801","clientType":"WebClient","AL Object type":"CodeUnit","AL Stack trace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentAppInternal - System Application by Microsoft\r\n\"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentApp - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).TryInitializeFromCurrentApp - System Application by Microsoft\r\nHelloWorldPage(Page 50100).OnOpenPage(Trigger) line 4 - ALProject1 by Default publisher","AL Object name":"App Key Vault Secret Pr. Impl.","alStackTrace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentAppInternal - System Application by Microsoft\r\n\"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentApp - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).TryInitializeFromCurrentApp - System Application by Microsoft\r\nHelloWorldPage(Page 50100).OnOpenPage(Trigger) line 4 - ALProject1 by Default publisher","alObjectType":"CodeUnit","alObjectName":"App Key Vault Secret Pr. Impl.","keyVaultUrls":"https://jswymer-keyvault-z.vault.azure.net/"}
-->

## <a name="initializedfailed"></a>App Key Vault initialization failed

Occurs when a key vault failed to be initialized.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App Key Vault initialization failed.**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by request.|
|alObjectType|Specifies the type of AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed request, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0015**|
|extensionId|Specifies the AppID of the extension that requested the secret.|
|extensionName|Specifies the name of the extension that requested the secret.|
|extensionPublisher|Specifies the publisher of the extension that requested the secret. |
|extensionVersion|Specifies the version of the extension that requested the secret.|
|failureReason|Specifies the error that occurred.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|


<!--
## Example

{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","extensionPublisher":"Microsoft","Extension version":"17.0.14384.0","Component version":"16.0.14248.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","extensionVersion":"17.0.14384.0","componentVersion":"16.0.14248.0","AL Stack trace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentAppInternal - System Application by Microsoft\r\n\"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentApp - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).TryInitializeFromCurrentApp - System Application by Microsoft\r\nHelloWorldPage(Page 50100).OnOpenPage(Trigger) line 4 - ALProject1 by Default publisher","AL Object type":"CodeUnit","Extension name":"System Application","AL Object name":"App Key Vault Secret Pr. Impl.","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Extension name, Extension App Id, Extension version, Telemetry schema version","extensionName":"System Application","failureReason":"Extension 'ALProject1 by Default publisher 1.0.0.4' does not have a publisher AAD tenant ID, so it cannot use key vaults. The publisher's AAD tenant ID must be specified at publish time.","alStackTrace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentAppInternal - System Application by Microsoft\r\n\"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).InitializeFromCurrentApp - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).TryInitializeFromCurrentApp - System Application by Microsoft\r\nHelloWorldPage(Page 50100).OnOpenPage(Trigger) line 4 - ALProject1 by Default publisher","Company name":"CRONUS International Ltd.","alObjectType":"CodeUnit","alObjectName":"App Key Vault Secret Pr. Impl.","AL Object Id":"3801","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","Client type":"WebClient","companyName":"CRONUS International Ltd.","alObjectId":"3801","clientType":"WebClient","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"RT0015"}

-->
## <a name="retrievedsuccess"></a>App Key Vault secret retrieval succeeded

Occurs when a secret used by an extension is successfully retrieved from an Azure Key Vault.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App Key Vault secret retrieval succeeded from key vault '{keyVaultUri}'.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by request.|
|alObjectType|Specifies the type of AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0016**|
|extensionId|Specifies the AppID of the extension that requested the secret.|
|extensionName|Specifies the name of the extension that requested the secret. |
|extensionPublisher|Specifies the publisher of the extension that requested the secret. |
|extensionVersion|Specifies the version of the extension that requested the secret.|
|keyVaultUri|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

<!--
{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","Component version":"16.0.14248.0","componentVersion":"16.0.14248.0","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Extension name, Extension App Id, Extension version, Telemetry schema version","extensionPublisher":"Microsoft","Company name":"CRONUS International Ltd.","AL Object Id":"3801","Extension version":"17.0.14320.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","extensionVersion":"17.0.14320.0","Client type":"WebClient","companyName":"CRONUS International Ltd.","component":"Dynamics 365 Business Central Server","alObjectId":"3801","clientType":"WebClient","Extension name":"System Application","extensionName":"System Application","eventId":"RT0016","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","AL Object name":"App Key Vault Secret Pr. Impl.","AL Stack trace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).GetSecret - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).GetSecret - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 6 - ALProject4 by Me","AL Object type":"CodeUnit","alObjectName":"App Key Vault Secret Pr. Impl.","alObjectType":"CodeUnit","alStackTrace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).GetSecret - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).GetSecret - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 6 - ALProject4 by Me","keyVaultUrl":"https://jswymer-keyvault-1.vault.azure.net/"}
-->

## <a name="retrievedfailed"></a>App Key Vault secret retrieval failed

Occurs when an extension failed to retrieve a secret from a specified Azure key vault.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**App Key Vault secret retrieval failed from key vault '{keyVaultUri}'.**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the name of the AL object that was run by request.|
|alObjectType|Specifies the type of AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0017**|
|extensionId|Specifies the AppID of the extension that requested the secret.|
|extensionName|Specifies the name of the extension that requested the secret. |
|extensionPublisher|Specifies the publisher of the extension that requested the secret. |
|extensionVersion|Specifies the version of the extension that requested the secret.|
|keyVaultUri|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

<!--
### Example

{"Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","extensionPublisher":"Microsoft","Extension version":"17.0.14320.0","Component version":"16.0.14248.0","extensionVersion":"17.0.14320.0","componentVersion":"16.0.14248.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","deprecatedKeys":"Company name, AL Object Id, AL Object type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Extension name, Extension App Id, Extension version, Telemetry schema version","Extension name":"System Application","AL Stack trace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).GetSecret - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).GetSecret - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 6 - ALProject4 by Me","AL Object type":"CodeUnit","AL Object name":"App Key Vault Secret Pr. Impl.","extensionName":"System Application","alObjectType":"CodeUnit","alStackTrace":"AppObjectType: CodeUnit\r\n AppObjectId: 3801\r\n AL CallStack: \"App Key Vault Secret Pr. Impl.\"(CodeUnit 3801).GetSecret - System Application by Microsoft\r\n\"App Key Vault Secret Provider\"(CodeUnit 3800).GetSecret - System Application by Microsoft\r\nHelloWorldPage(Page 50103).OnOpenPage(Trigger) line 6 - ALProject4 by Me","Company name":"CRONUS International Ltd.","alObjectName":"App Key Vault Secret Pr. Impl.","AL Object Id":"3801","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","Client type":"WebClient","companyName":"CRONUS International Ltd.","alObjectId":"3801","clientType":"WebClient","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"RT0017","failureReason":"Secret not found in key vault. Check that the secret name is valid.","keyVaultUrl":"https://jswymer-keyvault-1.vault.azure.net/"}

-->

## See also

[App Key Vaults with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Extensions](../developer/devenv-app-key-vault.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
