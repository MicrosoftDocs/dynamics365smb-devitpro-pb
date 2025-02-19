---
title: Mock outbound HttpClient web service calls during testing
description: Learn about how to mock call external services using the HttpClient datatype.
ms.custom: bap-template
ms.date: 02/19/2025
ms.reviewer: solsen
ms.topic: conceptual
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Mock outbound HttpClient web service calls during testing

> [!NOTE]
> This feature is only supported in [!INCLUDE [prod_short](includes/prod_short.md)] on-premises.
>
> This feature is available in [!INCLUDE [prod_short](includes/prod_short.md)] version 26.0 and later.

To enhance testability of AL code that interacts with outbound web services, it's useful to be able to mock these outbound calls. Mocking calls is particularly useful when you test Copilot and AI features, because it enables developers to write unit tests without connecting to the Azure OpenAI Service, which saves tokens. When you write your test, you can hardcode the return values for the outbound web service calls by using the HttpClient handler method that intercepts these calls.

When you add an [HttpClientHandler](attributes/devenv-httpclient-handler-attribute.md) attribute to a test method, every HTTP request during the test execution is intercepted and routed to the handler. The handler method signature must be as follows: it receives a `TestHttpRequestMessage` that contains information about the HTTP request, as well as a `TestHttpResponseMessage` that contains the mocked HTTP response values that should be updated by the handler. The Boolean return value indicates whether to issue the original HTTP request; `true` or use the mocked response; `false`.

## Handling the test execution

With the [TestHttpRequestPolicy property](properties/devenv-testhttprequestpolicy-property.md), you can control how outbound HTTP requests are treated during test execution. The property has the following possible values:

- `BlockOutboundRequests`: Any HTTP request issued during the test execution that is not caught and handled by an HTTP client handler will raise an exception.
- `AllowOutboundFromHandler`: All HTTP requests issued during the test execution are required to be caught by an HTTP client handler. The handler is allowed to explicitly fall through to issue the original request to the external endpoint.
- `AllowAllOutboundRequests`: All outbound HTTP requests issued during the test execution are allowed.

The following shows an example of a codeunit making an external web service call, as well as a test codeunit that intercepts and mocks this. Notice the use of the `HttpClientHandler` attribute in the test codeunit.

<!-- code example -->

## Related information

[Call external services with the HttpClient data type](devenv-httpclient-mock-outbound-calls.md)  
[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[TestHttpRequestPolicy property](properties/devenv-testhttprequestpolicy-property.md)
