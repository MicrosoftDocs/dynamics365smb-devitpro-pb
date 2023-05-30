---
title: "AppSourceCop Warning AS0092"
description: "The app.json file must specify an Azure Application Insights resource for monitoring operations related to this extension."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0092
The app.json file must specify an Azure Application Insights resource.

## Description
The app.json file must specify an Azure Application Insights resource for monitoring operations related to this extension. See https://learn.microsoft.com/dynamics365/business-central/dev-itpro/administration/telemetry-overview for additional information.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## How to fix this diagnostic?

This diagnostic can be fixed by specifying an Azure Application Insights resource for the extension. 

For more information about enabling Application Insights, see [Monitoring and Analyzing Telemetry](../../administration/telemetry-overview.md) and [Environment Telemetry](../../administration/tenant-admin-center-telemetry.md).

For additional information about the manifest of extensions (app.json), see [JSON Files](../devenv-json-files.md).

### When targeting runtime version 7.2 or higher?

If your extension is targeting runtime `7.2` (i.e. Business Central 2021 release wave 1 update 18.2), you can fix this diagnostic by specifying the connection string of the Azure Application Insights resource setup to monitor the operations related to this extension. 

```JSON
{
    "applicationInsightsConnectionString": "<your-azure-application-insight-connection-string>"
}
```

### When targeting a runtime version lower than 7.2?

If your extension is targeting a lower runtime version than `7.2`, you can fix this diagnostic by specifying the instrumentation key of the Azure Application Insights resource setup to monitor the operations related to this extension.

Or before `7.2` - Business Central 2021 release wave 1 update 18.2:

```JSON
{
    "applicationInsightsKey": "<your-azure-application-insight-instrumentationKey>"
}
```

## Code examples triggering the rule

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

This rule is also triggered when specifying 'applicationInsightsKey' and targeting a runtime version higher or equal to `7.2`.

```JSON
{
    "applicationInsightsKey": "241514be-e378-4455-a2d3-bf7e40b7d41d",
    "runtime": "7.2"
}
```

## Benefits of using the Application Insights

Using Application Insights provides telemetry to troubleshoot, understand, and fix issues related to your extension in production.

## Usage of Application Insights during the validation of AppSource submissions

The Azure Application Insights resource specified in the manifest of the extension submitted to AppSource will be used to log detailed information about the validation process for your AppSource submission. For more information, see [Analyzing AppSource Submission Validation Trace Telemetry](../../administration/telemetry-appsource-submission-validation-trace.md).

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
