---
title:  App Key Vault Secret Trace Telemetry | Microsoft Docs
description: Learn about app key vault secret trace telemetry in Business Central  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 12/29/2023
ms.author: jswymer
---
# Analyze a App key vault secret trace telemetry

[!INCLUDE[prod_short](../includes/2020_releasewave2.md)]

App key vault telemetry gathers information about the acquisition of secrets in Azure Key Vaults by extensions at runtime. For an overview of app key vaults and secrets, see [Using App Key Vaults with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Extensions](../developer/devenv-app-key-vault-overview.md).

The app key vault secret process has two operations: *initialization* and *retrieval*. The telemetry data provides information about the success or failure for each of these operations. There are various conditions that cause a failure. The failure messages provide insight into the cause of the failure, helping you identify, troubleshoot, and resolve issues.

#### Initialization

Initialization is the first stage. It verifies the configuration of the app key vault provider in the extension and on the service. This stage is initiated by the `TryInitializeFromCurrentApp` method call in the extension code. Some conditions that cause failures in this stage include:

- The extension doesn't specify a key vault in it's app.json file.
- The Azure Key Vault Client Identity settings are incorrect. For example, it could be that the application (client) ID that you specified for the key vault reader application in Azure is wrong.
- The Business Central Server lacks permission to the private key of the Azure Key Vault client certificate.

#### Retrieval

Retrieval is the second stage, and occurs after a successful initialization. In this stage, the service tries to get a secret from a specified key vault. This stage is initiated by the `GetSecret` method call in the extension code. Some conditions that cause failures include:

- The secret name requested by the extension is doesn't exist or isn't valid.
- The key vault doesn't exist.
- The application ID doesn't have permission to read from the key vault.

For more information about using key vault secrets with extensions, see [App Key Vaults with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Extensions](../developer/devenv-app-key-vault-overview.md).

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
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0014**|
|extensionId|Specifies the AppID of the extension that requested the secret.|
|extensionName|Specifies the name of the extension that requested the secret. |
|extensionPublisher|Specifies the publisher of the extension that requested the secret. |
|extensionVersion|Specifies the version of the extension that requested the secret.|
|keyVaultUrls|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

### Sample KQL code (successful Azure Keyvault initializations)

This KQL code can help you get started analyzing Azure Keyvault initializations.

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0014' 
| project timestamp
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
, alStackTrace = customDimensions.alStackTrace
, clientType = customDimensions.clientType
, extensionName = customDimensions.extensionName
, extensionId = customDimensions.extensionId
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
, keyVaultUrls = customDimensions.keyVaultUrls
```


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
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0015**|
|extensionId|Specifies the AppID of the extension that requested the secret.|
|extensionName|Specifies the name of the extension that requested the secret.|
|extensionPublisher|Specifies the publisher of the extension that requested the secret. |
|extensionVersion|Specifies the version of the extension that requested the secret.|
|failureReason|Specifies the error that occurred.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


### Sample KQL code (Azure Keyvault initialization errors)

This KQL code can help you get started troubleshooting and alerting on Azure Keyvault retrieval errors.

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0015' 
| project timestamp
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
, alStackTrace = customDimensions.alStackTrace
, clientType = customDimensions.clientType
, extensionName = customDimensions.extensionName
, extensionId = customDimensions.extensionId
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
, failureReason = customDimensions.failureReason
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

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
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0016**|
|extensionId|Specifies the AppID of the extension that requested the secret.|
|extensionName|Specifies the name of the extension that requested the secret. |
|extensionPublisher|Specifies the publisher of the extension that requested the secret. |
|extensionVersion|Specifies the version of the extension that requested the secret.|
|keyVaultUrl|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

### Sample KQL code (successful Azure Keyvault retrievals)

This KQL code can help you get started analyzing Azure Keyvault retrievals.

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0016' 
| project timestamp
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
, alStackTrace = customDimensions.alStackTrace
, clientType = customDimensions.clientType
, extensionName = customDimensions.extensionName
, extensionId = customDimensions.extensionId
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
, keyVaultUrl = customDimensions.keyVaultUrl
```


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
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|eventId|**RT0017**|
|extensionId|Specifies the AppID of the extension that requested the secret.|
|extensionName|Specifies the name of the extension that requested the secret. |
|extensionPublisher|Specifies the publisher of the extension that requested the secret. |
|extensionVersion|Specifies the version of the extension that requested the secret.|
|keyVaultUrl|Specifies the DNS name of the Azure key vault that was used in the request. The keyVaultUris are specified in the [app.json](../developer/devenv-json-files.md) file of the extension.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

### Sample KQL code (Azure Keyvault retrieval errors)

This KQL code can help you get started troubleshooting and alerting on Azure Keyvault retrieval errors.

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0017' 
| project timestamp
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
, alStackTrace = customDimensions.alStackTrace
, clientType = customDimensions.clientType
, extensionName = customDimensions.extensionName
, extensionId = customDimensions.extensionId
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
, failureReason = customDimensions.failureReason
, keyVaultUrl = customDimensions.keyVaultUrl
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]


## See also

[App Key Vaults with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Extensions](../developer/devenv-app-key-vault.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Alert on Telemetry](telemetry-alert.md)   