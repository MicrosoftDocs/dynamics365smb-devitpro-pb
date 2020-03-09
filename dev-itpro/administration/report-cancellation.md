---
title: Report Cancellation
description: When you start a Business Central client, a connection is established, and a corresponding session is added to the Business Central Server.
ms.custom: na
ms.date: 10/17/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Report Cancellation

There are several operations and events that can initiate a request on the server to cancel a report. Some of these operations and events are invoked by the user, while others by the server itself. The server doesn't cancel a report immediately. Instead, every five seconds it evaluates the status of cancellation requests. The following diagram illustrates this flow:

![Report cancellation](../developer/media/report_cancellation.png "Report cancellation")  

This flow means a report isn't necessarily canceled when a limit is exceeded. For example, if the maximum number of rows is exceeded, the report won't be canceled as long as it completes within the five-second interval.


...The error message is too long, so the end has been cut off...

## See Also

[Configuring Business Central Server](configure-server-instance.md)  
[Analyzing Report Telemetry](telemetry-reports-trace.md)  