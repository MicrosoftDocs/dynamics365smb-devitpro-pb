---
title: "TestHttpRequestMessage data type"
description: "Represents a test HTTP request message."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpRequestMessage data type
> **Version**: _Available or changed with runtime version 15.0._

Represents a test HTTP request message.



## Instance methods
The following methods are available on instances of the TestHttpRequestMessage data type.

|Method name|Description|
|-----------|-----------|
|[HasSecretUri()](testhttprequestmessage-hassecreturi-method.md)|**true** if the request has a secret URI set, otherwise **false**.|
|[Path()](testhttprequestmessage-path-method.md)|Gets the path of the HTTP request unless a secret URI was set, in which case it's an empty string.|
|[QueryParameters()](testhttprequestmessage-queryparameters-method.md)|Gets the query parameters of the HTTP request if the request does not have a secret URI, otherwise an empty Dictionary.|
|[RequestType()](testhttprequestmessage-requesttype-method.md)|Gets the HTTP method type.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Related information

[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  