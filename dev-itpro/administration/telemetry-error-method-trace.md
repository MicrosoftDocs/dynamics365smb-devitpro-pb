---
title:  Error Method Trace Telemetry
description: Learn about the Error method telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 03/28/2023
ms.author: jswymer
---
# Analyzing Error Method Telemetry

[!INCLUDE[2022_releasewave1.md](../includes/2022_releasewave1.md)]

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

When a user gets an error dialog while working in [!INCLUDE[prod_shoirt](../includes/prod_short.md)], a telemetry signal is emitted, which can be logged in an [!INCLUDE[appInsights](../includes/azure-appinsights-name.md)] resource. 

This telemetry data let's you identify and analyze calls to the Error method from AL code. You can also set up alerts in [!INCLUDE[appInsights](../includes/azure-appinsights-name.md)] to get notified if many users experience errors.

## Error dialog displayed

Occurs when the Error method is called and displays a dialog to the user.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Error dialog displayed: {failureReason}**|
|severityLevel|**3**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0030**|
|alErrorMessage|The error string defined in error method and displayed in the client.<br><br> If the error message wasn't a text constant, you get the message `Use ERROR with a text constant to improve telemetry details` instead of the actual message.<br><br> Some messages can contain customer data. As a precaution, Business Central only emits information that's classified as [SystemMetadata](../developer/devenv-classifying-data.md). Information that belongs to other data classifications, like customer data, isn't shown. Instead, the following message is shown: "Message not shown because the NavBaseException(string, Exception, bool) constructor was used."| 
|alEnglishLanguageDiagnosticsMessage|The error message in English (no matter which language the user had specified in the client).<br /><br />This dimension was introduced in Business Central 2023 release wave 1, version 22.0.  |
|alObjectId|Specifies the ID of the AL object.|
|alObjectType|Specifies the type of the AL object. |
|alStackTrace| [!INCLUDE[alStackTrace](../includes/include-telemetry-dimension-al-stacktrace.md)] |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|failureReason|**Dialog** means the error was the result of an error method call in AL. Errors thrown by the platform have other reasons, like MetadataNotFound.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all error telemetry.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|The Microsoft Entra tenant ID that's used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|The version number of the component that emits telemetry (see the component dimension)|
|environmentName|The name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|The environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|telemetrySchemaVersion|The version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema|

<!--
{"telemetrySchemaVersion":"0.1","component":"Dynamics 365 Business Central Server","componentVersion":"20.0.35106.0","environmentType":"Production","aadTenantId":"common","eventId":"RT0030","companyName":"CRONUS International Ltd.","clientType":"WebClient","alObjectType":"System","alObjectId":"0","alStackTrace":"MyItem(Page 50201).\"Hello - OnAction\"(Trigger) line 19 - vlnagorn.debug3 by MsftInternal\\","failureReason":"Dialog:TargetInvocation","alErrorMessage":"Use ERROR with a text constant to improve telemetry details"}

{"telemetrySchemaVersion":"0.2","componentVersion":"20.0.36501.0","environmentType":"Production","aadTenantId":"common","component":"Dynamics 365 Business Central Server","companyName":"CRONUS International Ltd.","eventId":"RT0030","clientType":"WebClient","alObjectType":"System","alObjectId":"0","alStackTrace":"ItemBarcodeReport(Report 50100).\"Items - OnAfterGetRecord\"(Trigger) line 21 - excelrep by Default publisher\\","alErrorMessage":"My text","failureReason":"Dialog"}

{"telemetrySchemaVersion":"0.2","componentVersion":"20.0.36501.0","environmentType":"Production","aadTenantId":"common","component":"Dynamics 365 Business Central Server","companyName":"CRONUS International Ltd.","eventId":"RT0030","clientType":"WebClient","alObjectType":"System","alObjectId":"0","alErrorMessage":"The metadata object Report 50100 was not found.","failureReason":"MetadataNotFound"}

-->

### Sample KQL code (error dialogs)

This KQL code can help you get started analyzing which error dialogs users see:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0030'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
// which user got the error
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry id was introduced in the platform in version 20.0
, 'N/A'
)
// error information
, clientType = customDimensions.clientType
, errorMessageInUsersLanguage = customDimensions.alErrorMessage
, errorMessageInEnglish = customDimensions.alEnglishLanguageDiagnosticsMessage // This dimension was introduced in Business Central 2023 release wave 1, version 21.4.
, alStackTrace = customDimensions.alStackTrace
, failureReason = customDimensions.failureReason
```


## Understanding the error dialog
To effectively help users mitigate any issues they might encounter, you should learn more about the different parts of the error dialog, including how to interpret the AL stack trace. For more information, see [Understanding the error dialog](../developer/devenv-error-dialog.md).

## See also
[Dialog.Error Method](../developer/methods-auto/dialog/dialog-error-errorinfo-method.md) 
[Dialog.Error Method](../developer/methods-auto/dialog/dialog-error-string-joker-method.md)  
[Understanding the error dialog](../developer/devenv-error-dialog.md)   
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
