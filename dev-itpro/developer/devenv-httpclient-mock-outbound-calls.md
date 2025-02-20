---
title: Mock outbound HttpClient web service calls during testing
description: Learn about how to test calling external services without having to set up a service using the HttpClient datatype.
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

To enhance testability of AL code that interacts with outbound web services, it's useful to be able to test functions that call external services without having to actually set up that external service. Mocking outbound web calls is useful when testing Copilot and AI features, because it enables developers to write unit tests without connecting to the Azure OpenAI Service, which saves tokens. To mock the outbound web service calls, you define a Handler function that intercepts and processes the request and returns a mocked response. The handler is a test function, which is marked with the [HttpClientHandler](attributes/devenv-httpclient-handler-attribute.md) attribute. For this type of test method, any HTTP request within the test body is routed to the client handler instead of to the external endpoint. The handler then receives the request and can mock the response.

The handler method signature must receive a `TestHttpRequestMessage` that contains information about the HTTP request, and a `TestHttpResponseMessage` that contains the mocked HTTP response values that should be updated by the handler. The boolean return value indicates whether to issue the original HTTP request; `true` or use the mocked response; `false`.

<!-- code example -->

In the following example the codeunit makes an external web service call, and the test codeunit intercepts and mocks this. Notice the use of the HttpClientHandler in the test codeunit.






### Populating and mocking responses

Populate the response object based on the request received by the handler. The handler can mock the response or send the request to the external endpoint, depending on the test requirements.

The handler returns a "not found" response if the document is empty or is a "200 OK" response if the ID is correct. This allows for testing different scenarios based on the request data.

## Handling the test execution

Blocking outbound requests during testing prevents unintended external calls. You can control this by using properties that specify whether requests are allowed, allowed only from handlers, or blocked.

The [TestHttpRequestPolicy property](properties/devenv-testhttprequestpolicy-property.md) allows you to control how outbound HTTP requests are treated during test execution. The property has the following possible values:

- `BlockOutboundRequests`: Any HTTP request issued during the test execution that isn't caught and handled by an HTTP client handler raises an exception.
- `AllowOutboundFromHandler`: All HTTP requests issued during the test execution are required to be caught by an HTTP client handler. The handler is allowed to explicitly fall through to issue the original request to the external endpoint.
- `AllowAllOutboundRequests`: All outbound HTTP requests issued during the test execution are allowed.

The following shows an example of a codeunit making an external web service call, and a test codeunit that intercepts and mocks this. Notice the use of the `HttpClientHandler` attribute in the test codeunit.

<!-- code example -->

```al
codeunit 50111 MyCodeunit
{
    procedure MethodwithHttpRequest()
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
    begin
        Client.Get('https://example.com', Response);
    end;
}

codeunit 50112 MyCodeunitTests
{
    Subtype = Test;
    TestHttpRequestPolicy = AllowOutboundFromHandler;

    [Test]
    [HandlerFunctions(`HttpClientHandler`)]
    procedure TestUnauthorizedResponseHandled()
    var
        MyCodeUnit: Codeunit: "MyCodeunit";
    begin
        MyCodeUnit.MethodWithHttpRequest();
    end;

    [HttpClientHandler]
    procedure HttpClientHandler(request: TestHttpRequestMessage; var response: TestHttpResponseMessage): Boolean
    begin
        // Mock a ´401 Unauthorized´ response for the `GET http://example.com` request
        if (request.RequestType = HttpRequestType::Get) and (request.Path = 'http://example.com') then begin
            response.HttpStatusCode := 401;
            response.ReasonPhrase := 'Unauthorized';
            exit(false); // Use the mocked response
        end;

        // fall through and issue the original request in case of other requests
        exit(true);
    end;
}
```

### Security limitations

The request object, which is received by the handler is limited for security reasons. It excludes headers, content, and cookies to ensure that sensitive information isn't exposed during testing. The request object includes path, query parameters, and request type, such as `GET` and `POST`.

Populating Response: populate the response object based on the request received by the handler. The handler can mock the response or send the request to the external endpoint, depending on the test requirements.

Mocking Responses: handler returns a "not found" response if the document is empty or a "200 OK" response if the ID is correct. This allows for testing different scenarios based on the request data.

Sending Requests: The handler can decide to send the request to the external endpoint instead of mocking the response. This is useful for scenarios where the handler can't mock certain parts of the request, such as authorization tokens.
	
## Related information

[Call external services with the HttpClient data type](devenv-httpclient-mock-outbound-calls.md)  
[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[TestHttpRequestPolicy property](properties/devenv-testhttprequestpolicy-property.md)
