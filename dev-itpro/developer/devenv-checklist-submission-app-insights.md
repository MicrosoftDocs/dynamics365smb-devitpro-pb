---
title: AppSource Azure Application Insights and AppSource Submission FAQ
description: Describes the most common questions when submitting your app to AppSource for Business Central.
author: qutreson
ms.date: 10/08/2025
ms.reviewer: solsen
ms.topic: faq
ms.author: qutreson
ms.custom: sfi-ropc-nochange
---

# AppSource Azure Application Insights and AppSource submission FAQ

This article addresses some of the most frequently asked questions around Azure Application Insights for AppSource apps.

## How do I enable Application Insights telemetry for my submissions?

To enable Application Insights signals for your submissions, you must specify the `applicationInsightsConnectionString` property in the manifest (app.json) of your extension. Learn more about this property in [JSON files](devenv-json-files.md).

## I don't see any signals in the resource specified for my extension, what do I do next?

Here's a list of steps that you can follow to troubleshoot this issue:

1. Validate that the Application Insights resource queried is the same one as specified in the manifest (app.json) of your extension.
2. Validate that the time range when running the query covers the time of the submission.
3. If you're using the `applicationInsightsKey` property in the manifest (app.json) of your extension, you should use the `applicationInsightsConnectionString` property instead because it's more reliable. Make sure to use the full connection string from your Azure Application Resource.
4. If you're using the `applicationInsightsConnectionString` property in the manifest (app.json) of your extension, make sure that you're using the full connection string and that it contains, at least, the following key-value pairs: `InstrumentationKey=<some-key>`, `IngestionEndpoint=<some-url>`, and `LiveEndpoint=<some-url>`. Learn more in [Connection strings](/azure/azure-monitor/app/sdk-connection-string)
5. Validate the data sampling and daily cap set for the Azure Application Insights resource. Navigate to the resource in Azure and go to 'Configure > Usage and estimated costs'. Validate that your Application Insights retains all data (data sampling is set to 100%) and that you haven't reached your daily cap. Learn more in [Sampling in Application Insights](/azure/azure-monitor/app/sampling). 

## I can see some signals in Application Insights, but I can't find why my submission failed, what do I do next?

Much information is provided in the custom dimensions of the signals. The validation errors can generally be found for the signals with eventId `LC0034`. Learn more about the signals emitted during the technical validation of AppSource submission in [Analyzing AppSource submission validation trace telemetry](../administration/telemetry-appsource-submission-validation-trace.md).

> [!NOTE]
> Instead of writing your own queries, we recommend using the executable Azure Data Studio [Troubleshooting Guide (TSG)](https://go.microsoft.com/fwlink/?linkid=2172328). This guide contains queries that process the signals for your submission and extract the important information.

## Related information

[Technical validation checklist](devenv-checklist-submission.md)  
[Analyzing AppSource submission validation trace telemetry](../administration/telemetry-appsource-submission-validation-trace.md)
