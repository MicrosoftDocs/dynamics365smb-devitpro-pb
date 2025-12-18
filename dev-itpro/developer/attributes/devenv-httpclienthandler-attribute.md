---
title: "HttpClientHandler attribute"
description: "Specifies that the method is an HttpClientHandler method, which catches and handles HTTP requests in test executions."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# HttpClientHandler attribute
> **Version**: _Available or changed with runtime version 15.0._

Specifies that the method is an HttpClientHandler method, which catches and handles HTTP requests in test executions.

> [!NOTE]
> This attribute is supported only in Business Central on-premises.

## Applies to

- Method

> [!NOTE]
> The **HttpClientHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax


> **Version**: _Available or changed with runtime version 15.0._
```AL
[HttpClientHandler]
procedure HttpClientHandler(Request: TestHttpRequestMessage; var Response: TestHttpResponseMessage) IssueOriginalRequest: Boolean;
```
> [!IMPORTANT]
> The above signature requires the HttpClientHandler method to be *global*. Learn more in [Local and global scope in AL methods](../devenv-al-methods.md%23local-and-global-scope).

### Arguments
*Request*  
&emsp;Type: [TestHttpRequestMessage](../methods-auto/testhttprequestmessage/testhttprequestmessage-data-type.md)  
The HTTP request that need to be handled.  

*Response*  
&emsp;Type: [TestHttpResponseMessage](../methods-auto/testhttpresponsemessage/testhttpresponsemessage-data-type.md)  
The mocked response that need to be populated by the handler.  

### Return Values
*IssueOriginalRequest*  
&emsp;Type: [Boolean](../methods-auto/boolean/boolean-data-type.md)  
Indicates whether to issue the original HTTP request (`true`) or use the mocked response (`false`). The default return value of the HttpClientHandler procedure is `false`, ensuring that external service calls are only made intentionally.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  