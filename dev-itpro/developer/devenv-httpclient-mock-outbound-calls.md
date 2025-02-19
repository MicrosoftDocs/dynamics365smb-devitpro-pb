---
title: Mock outbound HttpClient web service calls during testing
description: Learn about how to mock call external services using the HttpClient datatype.
ms.date: 02/19/2025
ms.reviewer: solsen
ms.topic: conceptual
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Mock outbound HttpClient web service calls during testing

> [!NOTE]
> This feature is only supported in [!INCLUDE [prod_short](includes/prod_short.md)] on-premises.

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

To enhance testability of AL code that interacts with outbound web services, it's useful to be able to test functions that call external services without having to set up a third-party service. Mocking outbound web calls is particularly useful when testing Copilot and AI features, because it enables developers to write unit tests without connecting to the Azure OpenAI Service, which saves tokens. To mock the outbound web service calls, you define an HttpClientHandler function that intercepts and processes the request and returns a mocked response. The handler is a test function, which is marked with the [HttpClientHandler](attributes/devenv-httpclient-handler-attribute.md) attribute. For this type of test method, any HTTP request within the test body is routed to the client handler instead of to the external endpoint. The handler then receives the request and can mock the response.

The handler method signature must receive a `TestHttpRequestMessage` that contains information about the HTTP request, as well as a `TestHttpResponseMessage` that contains the mocked HTTP response values that should be updated by the handler. The Boolean return value indicates whether to issue the original HTTP request; `true` or use the mocked response; `false`.

<!-- code example -->

### Populating and mocking responses

Populate the response object based on the request received by the handler. The handler can mock the response or send the request to the external endpoint, depending on the test requirements.

The handler returns a "not found" response if the document is empty or is a "200 OK" response if the ID is correct. This allows for testing different scenarios based on the request data.

## Handling the test execution

Blocking outbound requests during testing prevents unintended external calls. You can control this by using properties that specify whether requests are allowed, allowed only from handlers, or completely blocked.

The [TestHttpRequestPolicy property](properties/devenv-testhttprequestpolicy-property.md) allows you to control how outbound HTTP requests are treated during test execution. The property has the following possible values:

- `BlockOutboundRequests`: Any HTTP request issued during the test execution that is not caught and handled by an HTTP client handler will raise an exception.
- `AllowOutboundFromHandler`: All HTTP requests issued during the test execution are required to be caught by an HTTP client handler. The handler is allowed to explicitly fall through to issue the original request to the external endpoint.
- `AllowAllOutboundRequests`: All outbound HTTP requests issued during the test execution are allowed.

The following shows an example of a codeunit making an external web service call, as well as a test codeunit that intercepts and mocks this. Notice the use of the `HttpClientHandler` attribute in the test codeunit.

<!-- code example -->

### Security limitations

The request object, which is received by the handler is limited for security reasons. It excludes headers, content, and cookies to ensure that sensitive information isn't exposed during testing. The request object includes path, query parameters, and request type, such as `GET` and `POST`. 

Populating Response: populate the response object based on the request received by the handler. The handler can mock the response or send the request to the external endpoint, depending on the test requirements.

Mocking Responses: handler returns a "not found" response if the document is empty or a "200 OK" response if the ID is correct. This allows for testing different scenarios based on the request data.

Sending Requests: The handler can decide to send the request to the external endpoint instead of mocking the response. This is useful for scenarios where the handler cannot mock certain parts of the request, such as authorization tokens.
	
## Related information

[Call external services with the HttpClient data type](devenv-httpclient-mock-outbound-calls.md)  
[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[TestHttpRequestPolicy property](properties/devenv-testhttprequestpolicy-property.md)
