---
title: "Session.EnableVerboseTelemetry Method"
ms.author: solsen
ms.custom: na
ms.date: 02/11/2021
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
# Session.EnableVerboseTelemetry Method
> **Version**: _Available or changed with runtime version 3.2._

Temporarily enable verbose telemetry on the current session.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 Session.EnableVerboseTelemetry(EnableFullALFunctionTracing: Boolean, Duration: Duration)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*EnableFullALFunctionTracing*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to enable method tracing.  
*Duration*  
&emsp;Type: [Duration](../duration/duration-data-type.md)  
Specifies the amount of time, in milliseconds, that verbose telemetry is enabled on the session. When the time is exceeded, system specified telemetry level is used again. The maximum value is 3600000, one hour.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  