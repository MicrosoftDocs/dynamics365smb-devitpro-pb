---
title: "Understanding the error dialog"
description: Understand the different parts the error dialog to be able to help mitigate issues for users 
ms.custom: na
ms.date: 10/04/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: kennienp
ms.author: kepontop
---

# Understanding the error dialog

The AL language has many error handling features, which can help you deal with unexpected situations that occur when code is run. Whenever an error is surfaced to the user, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client displays an error dialog. In this article, you can learn more about the different parts of the error dialog to make you be able to help mitigate issues for users.

## Visual elements of the error dialog (versions 22 and earlier)
In versions 22 and earlier, the error dialog consists of the following four parts
1. (optionally) a title
2. a message directed to the user.
3. See details part that include a Copy Details action.
4. a yes or no question as to whether the message was helpful.


## Visual elements of the error dialog (from version 23)
Starting in version 23, the error dialog consists of the following four parts
1. (optionally) a title
2. a message directed to the user.
3. a Copy Details action.
4. a yes or no question as to whether the message was helpful.



## Information in Copy details
The information provided in Copy details is meant for troubleshooting. 

Here is an example of the content of Copy details:

```text
If requesting support, please provide the following details to help troubleshooting:

Something went wrong. Please contact your partner.

Internal session ID: 
23fa3850-ea3c-4529-81c8-fc36d3324676

Application Insights session ID: 
2637787e-7dfc-4139-9f83-2b16883b626e

Client activity id: 
9ca384ba-c4a0-eed4-d6df-267a2a40ae5f

Time stamp on error: 
2023-10-04T09:05:40.7201590Z

User telemetry id: 
7979ab03-7b75-455e-beed-505c7b2649fb

AL call stack: 
Report1(Report 50101).OnPostReport(Trigger) line 2 - ReportErrors by Default publisher
```

The following table explains the different elements in Copy details.

|Section | Description |
|--------|-------------|
|Internal session ID| An internal session id that is used by the [!INCLUDE[prod_short](../includes/azure-appinsights-name.md)] support team in case the issue needs to be reported as as support case.|
|Application Insights session ID| The session id. This is logged to the field operationId in the telemetry logged to [!INCLUDE[prod_short](../includes/azure-appinsights-name.md)] | 
|Client activity id| An internal session id that is used by the [!INCLUDE[prod_short](../includes/azure-appinsights-name.md)] support team in case the issue needs to be reported as as support case.|
|Time stamp on error| The date and time (in UTC timezone) for when the error occurred. |
|User telemetry id | [!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] | 
|AL call stack | The AL stack trace in the session when the error occurred.| 




## See also
[Error message quality telemetry](../administration/telemetry-error-message-voting-trace.md)   
[Error method telemetry](../administration/telemetry-error-method-trace.md)   
[Permission error telemetry](../administration/telemetry-permission-error-trace.md)   
[AL error handling](devenv-al-error-handling.md)   
[AL Control Statements](devenv-al-control-statements.md)   
[AL Development Environment](devenv-reference-overview.md)   