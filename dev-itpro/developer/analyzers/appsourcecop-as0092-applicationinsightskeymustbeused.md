---
title: "The 'applicationInsightsKey' property must specify the AAD instrumentation key."
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
The 'applicationInsightsKey' property must specify the AAD instrumentation key.

## Description
The 'applicationInsightsKey' property must specify the instrumentation key of the Azure Application Insights resource for monitoring operations related to this extension. See https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/telemetry-overview for additional information.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!IMPORTANT]
> Specifying the instrumentation key of the Azure Application Inights resource for the extension will become mandatory for AppSource submissions from the 1st of June 2021.

## How to fix this diagnostic?

You can fix this diagnostic by specifying the instrumentation key of the Azure Application Insights resource setup to monitor the operations related to this extension.

For more information about enabling Application Insights, see [Monitoring and Analyzing Telemetry](../../administration/telemetry-overview.md) and [Environment Telemetry](../../administration/tenant-admin-center-telemetry.md).

```JSON
{
    "applicationInsightsKey": "<your-azure-application-insight-instrumentation-key>"
}
```

See [JSON Files](../devenv-json-files.md), for additional information about the manifest of extensions (app.json).

## Code example triggering the rule

This rule is triggered when the 'applicationInsightsKey' property is not specified in the manifest (app.json) of the extension, or when its value is set to the empty GUID.

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
