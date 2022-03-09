---
title: Analyzing Error Message Vote Telemetry | Microsoft Docs
description: Learn about error message vote telemetry in Business Central  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2021
ms.author: jswymer
---

# Analyzing Error Message Vote Telemetry

**APPLIES TO:** [!INCLUDE[2022_releasewave1.md](../includes/2022_releasewave1.md)]

When a user gets an error message while working in the application, the message includes a yes or no question as to whether the message was helpful, similar to the following illustration:

![Shows the error dialog and the voting actions, Yes and No, about the helpfulness of the message.](../developer/media/error-voting.png )

If a user selects either **Yes** or **No**, a signal is emitted and recorded in Application Insights. This information can help
iThe [!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data about the success or failure of authenticating web service access keys on web service requests. 

[!INCLUDE[webservice_key_deprecated](../includes/web-service-key-deprecated.md)]

As a partner or customer, this data lets you monitor the use of web service access keys on your environments in preparation for the deprecation of the feature.

For information about web service access keys, see [How to use an Access Key for SOAP and OData Web Service Authentication](../webservices/web-services-authentication.md#accesskey).

## <a name="succeeded"></a>Authentication with web service key succeeded

Occurs when a web service access key was authenticated successfully.

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|-----------|
|message|**Authentication with Web Service Key succeeded: {endpoint}**|
|severityLevel|**1**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.

|Dimension|Description or value|
|---------|-----|
|eventId|**CL0002**|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alObjectName|Specifies the ID of the AL object that was run by request.|
|alObjectType|Specifies the ID of the AL object that was run by request.|
|alStackTrace|Specifies the ID of the AL object that was run by request.|
|appId|Specifies the appID of the extension that the report object belongs to.|
|appName|Specifies the name of the extension that threw the error message.|
|appVersion|Specifies the version of the extension that threw the error message.|
|clientType|Specifies the type of client that executed the message, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|hostType||
|environmentName|Specifies the name of the tenant environment. Not included with Business Cenytal on-premises. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|errorMessage|Specifies the error shown to the user.|
|exceptionId||
|userFeedback|Specifies what the user voted, either **Yes** or **No**.|
|userLocale|Speci|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"telemetrySchemaVersion":"1.2","componentVersion":"20.0.36722.0","aadTenantId":"d88985a1-c863-442c-bb5f-dc622e480a8d","companyName":"CRONUS International Ltd.","component":"Dynamics 365 Business Central Client","eventId":"CL0002","clientType":"Desktop","alObjectType":"Page","alObjectName":"Dialog","alObjectId":"-1","alStackTrace":"undefined","hostType":"Browser","userLocale":"en-US","exceptionId":"undefined","errorMessage":"undefined","userFeedback":"No","appId":"null","appName":"null","appPublisher":"null","appVersion":"null","environmentName":"null"}


{"telemetrySchemaVersion":"1.2","componentVersion":"20.0.36722.0","environmentType":"undefined","companyName":"CRONUS International Ltd.","aadTenantId":"d88985a1-c863-442c-bb5f-dc622e480a8d","clientType":"Desktop","component":"Dynamics 365 Business Central Client","eventId":"CL0002","userFeedback":"No","userLocale":"en-US","appVersion":"1.0.0.0","appPublisher":"Default publisher","environmentName":"null","exceptionId":"4c70c77a-147e-4fc1-af16-96cf7c008fa6","alStackTrace":"CustomerListExt(PageExtension 50110).OnOpenPage(Trigger) line 8 - ALlogmessage by Default publisher","hostType":"Browser","errorMessage":"Use ERROR with a text constant to improve telemetry details","appId":"f2ae006d-deef-4990-828e-4c76906e7171","appName":"ALlogmessage","alObjectType":"Page","alObjectName":"Dialog","alObjectId":"-1"}


{"telemetrySchemaVersion":"1.2","componentVersion":"20.0.36722.0","companyName":"CRONUS International Ltd.","aadTenantId":"d88985a1-c863-442c-bb5f-dc622e480a8d","component":"Dynamics 365 Business Central Client","eventId":"CL0002","clientType":"Desktop","alObjectName":"Dialog","alObjectType":"Page","alObjectId":"-1","alStackTrace":"CustomerListExt(PageExtension 50110).OnOpenPage(Trigger) line 9 - ALlogmessage by Default publisher","appPublisher":"Default publisher","appName":"ALlogmessage","hostType":"Browser","environmentName":"null","appId":"f2ae006d-deef-4990-828e-4c76906e7171","userFeedback":"Yes","appVersion":"1.0.0.0","userLocale":"en-US","errorMessage":"Something went wrong again","exceptionId":"ddc77782-caa0-44a9-8fae-9329375613e2"}

-->
 
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
