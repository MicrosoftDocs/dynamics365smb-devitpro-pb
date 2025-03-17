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

Testability of AL code that interacts with external web services is significantly enhanced when the responses from these services can be simulated in AL, eliminating the need to configure actual endpoints. Mocking outbound web calls is useful when testing that your code is capable of handling a wide range of possible responses, as well as allowing you to track outbound traffic during the test executions.
To mock outbound HttpClient calls you start by defining an HttpClientHandler that intercepts and processes the requests and simulates a response. Such a handler can be created by declaring a procedure with the appropriate signature and marking it with the HttpClientHandler attribute. In the body of the procedure you can analyze the intercepted request and mock the response by populating the response object with the desired values. Finally, the handler can be attached to any test method in the codeunit using the HandlerFunctions attribute. When a handler is attached to a test then all HttpClient calls that occur during the execution of that test is routed to the handler instead of the actual endpoint. However, there can be scenarios where you may only want to handle certain requests while letting others through to the external endpoint. This can be achieved by setting the return value of the handler accordingly.

## Defining the handler

The `HttpClientHandler` procedure receives a `TestHttpRequestMessage` that contains information about the HTTP request, and a `TestHttpResponseMessage` that contains the mocked HTTP response values that should be updated by the handler. The boolean return value indicates whether to issue the original HTTP request; `true` or use the mocked response; `false`.

> [!NOTE]
> The default return value of the `HttpClientHandler` procedure is `false`, ensuring that external service calls are only made intentionally. Therefore, an empty handler would still intercept the outbound request and mock a default response.

## Handling the test execution

In addition to defining the handler, you can control how outbound HTTP requests are treated during test execution by using the [TestHttpRequestPolicy](properties/devenv-testhttprequestpolicy-property.md) property. Blocking outbound requests during testing prevents unintended external calls. You can control this by using properties that specify whether requests are allowed, allowed only from handlers, or blocked.

The property has the following possible values:

|Value|Description|
|------|----------|
|`BlockOutboundRequests`|Any HTTP request issued during the test execution that isn't caught and handled by an HTTP client handler raises an exception.|
|`AllowOutboundFromHandler`| All HTTP requests issued during the test execution are required to be caught by an HTTP client handler. The handler is allowed to explicitly fall through to issue the original request to the external endpoint.|
|`AllowAllOutboundRequests`| All outbound HTTP requests issued during the test execution are allowed.|

## Example 

In the following example we have a procedure `GetDocumentContent` in the codeunit `DocumentService` that makes an external web service call. To verify that the `GetDocumentContent` works as expected, we can create a test in our `DocumentServiceTest` codeunit that makes an invocation to the `GetDocumentContents` and checks the content. Finally, we define an `HttpClientHandler` that simulates the desired `200 SUCCESS` response and attach it to the previously defined test. When the test is executed the handler will intercept the outbound request and mock the response.

```al
codeunit 50100 MyCodeunit
{
    procedure MethodWithHttpRequest()
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
    begin
        Client.Get('http://example.com', Response); // Store response in Response variable
    end;
}

codeunit 50111 MyCodeunitTests
{
    Subtype = Test; // Test codeunit
    TestHttpRequestPolicy = AllowOutboundFromHandler; // Allow outbound requests from handler

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
            exit(true); // fall through and issue the original request in case of other requests
    end;
}
```

### Security limitations

The request object, which is received by the handler contains limited information for security reasons. It excludes headers, content, and cookies to ensure that sensitive information isn't exposed during testing. The request object includes path, query parameters, and request type, such as `GET` and `POST`.
The response object is subject to certain limitations as well, notably the inability to set cookies or specify redirection status codes (3**).```

The handler can decide to send the request to the external endpoint instead of mocking the response. This is useful for scenarios where the handler can't mock certain parts of the request, such as authorization tokens.
	
## Related information

[Call external services with the HttpClient data type](devenv-httpclient-mock-outbound-calls.md)  
[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[TestHttpRequestPolicy property](properties/devenv-testhttprequestpolicy-property.md)
