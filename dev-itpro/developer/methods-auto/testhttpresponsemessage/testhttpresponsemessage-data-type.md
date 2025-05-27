---
title: "TestHttpResponseMessage data type"
description: "Represents a test HTTP response message including the status code and data."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpResponseMessage Data type
> **Version**: _Available or changed with runtime version 15.0._

Represents a test HTTP response message including the status code and data.



## Instance methods
The following methods are available on instances of the TestHttpResponseMessage data type.

|Method name|Description|
|-----------|-----------|
|[Content()](testhttpresponsemessage-content-method.md)|Gets the contents of the HTTP response.|
|[Headers()](testhttpresponsemessage-headers-method.md)|Gets the HTTP response's HTTP headers.|
|[HttpStatusCode([Integer])](testhttpresponsemessage-httpstatuscode-method.md)|Gets or sets the status code of the HTTP response.|
|[IsBlockedByEnvironment([Boolean])](testhttpresponsemessage-isblockedbyenvironment-method.md)|Gets or sets a value that indicates if the HTTP response is the result of the environment blocking an outgoing HTTP request.|
|[IsSuccessfulRequest([Boolean])](testhttpresponsemessage-issuccessfulrequest-method.md)|Gets or sets a value that indicates if the HTTP request was successful or not. By setting this value it is possible to mock the return value of the HttpClient call.|
|[ReasonPhrase(Text)](testhttpresponsemessage-reasonphrase-method.md)|Gets or sets the reason phrase which typically is sent by servers together with the status code.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  