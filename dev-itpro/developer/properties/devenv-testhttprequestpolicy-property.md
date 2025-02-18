---
title: "TestHttpRequestPolicy property"
description: "Specifies the behavior when encountering outgoing http requests in test executions."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpRequestPolicy Property
> **Version**: _Available or changed with runtime version 15.0._

Specifies the behavior when encountering outgoing http requests in test executions.

## Applies to
-   Codeunit

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**BlockOutboundRequests**|runtime version 15.0|Any HTTP request issued during the test execution that is not caught and handled by an HTTP client handler will raise an exception.|
|**AllowOutboundFromHandler**|runtime version 15.0|All HTTP requests issued during the test execution are required to be caught by an HTTP client handler. The handler is allowed to explicitly fall through to issue the original request to the external endpoint.|
|**AllowAllOutboundRequests**|runtime version 15.0|All outbound HTTP requests issued during the test execution are allowed.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  