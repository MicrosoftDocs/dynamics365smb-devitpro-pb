---
title: "AppSourceCop Rule AS0092"
description: "The app.json file must specify an Azure Application Insights resource for monitoring operations related to this extension. See https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/telemetry-overview for additional information."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0092
The app.json file must specify an Azure Application Insights resource.

## Description
The app.json file must specify an Azure Application Insights resource for monitoring operations related to this extension. See https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/telemetry-overview for additional information.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## How to fix this diagnostic?

You can fix this diagnostic by specifying the either the connection string or the instrumentation key of the Azure Application Insights resource setup to monitor the operations related to this extension.

For more information about enabling Application Insights, see [Monitoring and Analyzing Telemetry](../../administration/telemetry-overview.md) and [Environment Telemetry](../../administration/tenant-admin-center-telemetry.md).

```JSON
{
    "applicationInsightsConnectionString": "<your-azure-application-insight-connection-string>"
}
```

Or before `7.2` - Business Central 2021 release wave 1 update 18.2:

```JSON
{
    "applicationInsightsKey": "<your-azure-application-insight-instrumentationKey>"
}
```

Including both of the properties will trigger a compiler error, so make sure to use only one. Using the `applicationInsightsConnectionString` property is preferred when available.

See [JSON Files](../devenv-json-files.md), for additional information about the manifest of extensions (app.json).

## Code example triggering the rule

This rule is triggered when both the 'applicationInsightsConnection' and the 'applicationInsightsKey' properties are not specified in the manifest (app.json) of the extension, or when its value is set to the empty string/GUID as shown below:

```JSON
{
    "applicationInsightsConnectionString": ""
}
```

```JSON
{
    "applicationInsightsKey": "00000000-0000-0000-0000-000000000000"
}
```

## Benefits of using the Application Insights

Using Application Insights provides telemetry to troubleshoot, understand, and fix issues related to your extension in production.

## Usage of Application Insights during the validation of AppSource submissions

The Azure Application Insights resource specified in the manifest of the extension submitted to AppSource will be used to log detailed information about the validation process for your AppSource submission.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  