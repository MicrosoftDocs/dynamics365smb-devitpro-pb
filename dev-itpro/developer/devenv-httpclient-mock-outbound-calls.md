---
title: Mock outbound HttpClient web service calls during testing
description: Learn about how to test HttpClient web calls to external services without invoking the live/actual/remote service.
ms.date: 03/17/2025
ms.reviewer: solsen
ms.topic: conceptual
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Mock outbound HttpClient web service calls during testing

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

> [!NOTE]
> This feature is only supported in [!INCLUDE [prod_short](includes/prod_short.md)] on-premises.

Testability of AL code that interacts with external web services is enhanced when the responses from these services can be simulated in AL, eliminating the need to configure actual endpoints. Mocking outbound web calls is useful when testing that your code is capable of handling a wide range of possible responses, and allowing you to track outbound traffic during the test executions.
To mock outbound HttpClient calls, you start by defining an HttpClientHandler that intercepts and processes the requests and simulates a response. Such a handler can be created by declaring a procedure with the appropriate signature and marking it with the [HttpClientHandler](attributes/devenv-httpclienthandler-attribute.md) attribute. In the body of the procedure you can analyze the intercepted request and mock the response by populating the response object with the desired values. Finally, the handler can be attached to any test method in the codeunit using the [HandlerFunctions](attributes/devenv-handlerfunctions-attribute.md) attribute. When a handler is attached to a test then all HttpClient calls that occur during the execution of that test is routed to the handler instead of the actual endpoint. However, there can be scenarios where you might only want to handle certain requests while letting others through to the external endpoint. This can be achieved by setting the return value of the handler accordingly.

## Defining the handler

The `HttpClientHandler` procedure receives a `TestHttpRequestMessage` that contains information about the HTTP request, and a `TestHttpResponseMessage` that contains the mocked HTTP response values that should be updated by the handler. The boolean return value indicates whether to issue the original HTTP request; `true` or use the mocked response; `false`.

> [!NOTE]
> The default return value of the `HttpClientHandler` procedure is `false`, ensuring that external service calls are only made intentionally. Therefore, an empty handler would still intercept the outbound request and mock a default response.

## Handling the test execution

In addition to defining the handler, you can control how outbound HTTP requests are treated during test execution by using the [TestHttpRequestPolicy](properties/devenv-testhttprequestpolicy-property.md) property. By default, all outbound requests are allowed, but you can further restrict this behavior to only allow ones issued from a handler, or to block all unhandled outbound requests.

The property has the following possible values:

|Value|Description|
|------|----------|
|`BlockOutboundRequests`|Any HTTP request issued during the test execution that isn't caught and handled by an HTTP client handler raises an exception. This can be very useful when you don’t want frequent test executions in CI/CD pipelines to hit the actual endpoint.|
|`AllowOutboundFromHandler`| All HTTP requests issued during the test execution are required to be caught by an HTTP client handler. The handler is allowed to explicitly fall through to issue the original request to the external endpoint. This ensures that no unintentional http requests are made.|
|`AllowAllOutboundRequests`| All outbound HTTP requests issued during the test execution are allowed.|

## Example 

In the following example we have a procedure `GetDocumentContent` in the codeunit `DocumentService` that makes an external web service call. To verify that the `GetDocumentContent` works as expected, we can create a test in our `DocumentServiceTest` codeunit that makes an invocation to the `GetDocumentContents` and checks the content. Finally, we define an `HttpClientHandler` that simulates the desired `200 SUCCESS` response and attach it to the previously defined test. When the test is executed the handler will intercept the outbound request and mock the response.

```al

codeunit 1 DocumentService
{
    procedure GetDocumentContent(DocumentId: Text): Text
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Success: Boolean;
        Content: Text;
    begin
        Success := Client.Get('http://example.com/documents?DocumentId=' + DocumentId, Response);

        if (not Success) or (not Response.IsSuccessStatusCode) then
            Error('Unsuccessful request');

        Response.Content.ReadAs(Content);

        exit(Content);
    end;
}

codeunit 2 DocumentServiceTest
{
    Subtype = Test; // Test codeunit
    TestHttpRequestPolicy = AllowOutboundFromHandler; // Allow outbound requests from handler

    [Test]
    [HandlerFunctions('Handler')]
    procedure TestGetDocumentContent()
    var
        DocService: Codeunit "DocumentService";
    begin
        if (DocService.GetDocumentContent('EXAMPLE_ID') <> 'EXAMPLE CONTENT EXAMPLE_ID') then
            Error('Unexpected document content');
    end;

    [HttpClientHandler]
    procedure Handler(Request: TestHttpRequestMessage; var Response: TestHttpResponseMessage): Boolean
    var
        DocumentId: Text;
    begin
        if (Request.RequestType = HttpRequestType::Get) and (Request.Path = 'http://example.com/documents') then begin
            // Extract the DocumentId from the query parameters
            Request.QueryParameters.Get('DocumentId', DocumentId);

            // Populate the mocked response with the example content
            Response.Content.WriteFrom('EXAMPLE CONTENT ' + DocumentId);
            response.HttpStatusCode := 200;
            response.ReasonPhrase := 'SUCCESS';

            exit(false); // Use the mocked response
        end;

        exit(true); // fall through and issue the original request in case of other requests
    end;
}

```

### Security limitations

The request object, which is received by the handler contains limited information for security reasons. It excludes headers, content, and cookies to ensure that sensitive information isn't exposed during testing. The request object includes path, query parameters, and request type, such as `GET` and `POST`. Furthermore, if the URI of a request is set using a [SecretText](methods-auto/secrettext/secrettext-data-type.md), then neither the path nor the query parameters are available, to prevent leaking any secrets. You can filter for this case using the `HasSecretUri` property.
The response object is subject to certain limitations as well, notably the inability to set cookies or specify redirection status codes (3**).

The handler can decide to send the request to the external endpoint instead of mocking the response. This is useful in scenarios where the request has a secret URI or where certain parts of the response - such as authorization tokens - cannot be mocked.

## Related information

[Call external services with the HttpClient data type](devenv-httpclient-mock-outbound-calls.md)  
[HttpClient data type](methods-auto/httpclient/httpclient-data-type.md)  
[TestHttpRequestPolicy property](properties/devenv-testhttprequestpolicy-property.md)
