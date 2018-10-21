---
title: "HttpContent Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpContent Data Type
Represents an HTTP entity body and content headers.


The following methods are available on instances of the HttpContent data type.

|Method name|Description|
|-----------|-----------|
|[Clear()](httpcontent-clear-method.md)|Sets the HttpContent object to a default value. The content contains an empty string and empty headers.|
|[WriteFrom(Text)](httpcontent-writefrom-text-method.md)|Sets HttpContent content to the provided text or stream.|
|[WriteFrom(InStream)](httpcontent-writefrom-instream-method.md)|Sets HttpContent content to the provided text or stream.|
|[GetHeaders(var HttpHeaders)](httpcontent-getheaders-method.md)|Gets the HTTP content headers as defined in RFC 2616.|
|[ReadAs(var Text)](httpcontent-readas-text-method.md)|Reads the content into the provided text.|
|[ReadAs(var InStream)](httpcontent-readas-instream-method.md)|Reads the content into the provided text.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  