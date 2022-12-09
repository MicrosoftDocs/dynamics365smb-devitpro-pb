---
title: "Session Data Type"
description: "Represents a Microsoft Dynamics Business Central session."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Session Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents a Microsoft Dynamics Business Central session.


The following methods are available on the Session data type.


|Method name|Description|
|-----------|-----------|
|[ApplicationArea([Text])](session-applicationarea-method.md)|Gets or sets the application areas for the current session.|
|[ApplicationIdentifier()](session-applicationidentifier-method.md)|Gets the application ID associated with the current thread.|
|[BindSubscription(Codeunit)](session-bindsubscription-method.md)|Binds the event subscriber methods in the codeunit to the current codeunit instance for handling the events that they subscribe to. This essentially activates the subscriber functions for the codeunit instance.|
|[CurrentClientType()](session-currentclienttype-method.md)|Gets the client type that is running in current session.|
|[CurrentExecutionMode()](session-currentexecutionmode-method.md)|Specifies the mode in which the session is running.|
|[DefaultClientType()](session-defaultclienttype-method.md)|Gets the default client that is configured for the server instance that is used by the current session.|
|[EnableVerboseTelemetry(Boolean, Duration)](session-enableverbosetelemetry-method.md)|Temporarily enable verbose telemetry on the current session.|
|[GetCurrentModuleExecutionContext()](session-getcurrentmoduleexecutioncontext-method.md)|Gets the current session's execution context for the currently executing module.|
|[GetExecutionContext()](session-getexecutioncontext-method.md)|Gets the current session's execution context.|
|[GetModuleExecutionContext([Guid])](session-getmoduleexecutioncontext-method.md)|Gets the current session's execution context scoped to a specific module.|
|[IsSessionActive(Integer)](session-issessionactive-method.md)|Tests if the specified SessionID is active on the server instance where it was started.|
|[LogMessage(Text, Text, Verbosity, DataClassification, TelemetryScope, Text, Text [, Text] [, Text])](session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)|Logs a trace message to a telemetry account.|
|[LogMessage(Text, Text, Verbosity, DataClassification, TelemetryScope, Dictionary of [Text, Text])](session-logmessage-string-string-verbosity-dataclassification-telemetryscope-dictionary[text,text]-method.md)|Logs a trace message to a telemetry account.|
|[LogSecurityAudit(Text, SecurityOperationResult, Text, AuditCategory [, Array of [Text]] [, Array of [Text]])](session-logsecurityaudit-method.md)|Logs an IfX audit message to a telemetry account.|
|[SendTraceTag(Text, Text, Verbosity, Text [, DataClassification])](session-sendtracetag-method.md)|Send a trace tag to the telemetry service.|
|[SetDocumentServiceToken(Text)](session-setdocumentservicetoken-method.md)|Sets the document service token in the current session.|
|[StartSession(var Integer, Integer [, Text] [, var Record])](session-startsession-integer-integer-string-table-method.md)|Starts a session without a UI and runs the specified codeunit.|
|[StartSession(var Integer, Integer, Text, var Record, Duration)](session-startsession-integer-integer-string-table-duration-method.md)|Starts a session without a UI and runs the specified codeunit.|
|[StartSession(var Integer, Integer, Duration [, Text] [, var Record])](session-startsession-integer-integer-duration-string-table-method.md)|Starts a session without a UI and runs the specified codeunit.|
|[StopSession(Integer [, Text])](session-stopsession-method.md)|Stops a session.|
|[UnbindSubscription(Codeunit)](session-unbindsubscription-method.md)|Unbinds the event subscriber methods from in the codeunit instance. This essentially deactivates the subscriber methods for the codeunit instance.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  