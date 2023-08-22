---
title: "Using the SecretText datatype"
description: The 'SecretText' datatype is designed to protect sensitive values from being exposed when debugging.
author: SusanneWindfeldPedersen
ms.author:
ms.custom: bap-template
ms.date: 08/28/2023
ms.reviewer: na
ms.service: dynamics365-business-central
ms.topic: conceptual
---

# Using the SecretText datatype

`SecretText` is a data type designed to protect sensitive values from being exposed through the AL debugger when doing regular or snapshot debugging. Its use is recommended for applications that need to handle any kind of credentials like API keys, custom licensing tokens, or similar.

## The lifetime of a credential

When a credential isn't protected by the `NonDebuggable` attribute on a procedure scope or in the variable it's contained in, it's vulnerable to being exposed
in a debugging session or a snapshot for its entire lifetime in AL code. This lifetime can be split into three distinct phases.

### Retrieval

A credential can be retrieved in multiple ways:

1. An API key is retrieved through a call via the AL HttpClient and then used as authentication for further calls.
2. A token is fetched through a control add-in implementing an integration with an authentication provider like OAUTH2.
3. A custom developer defined scenario creates an authentication token.
4. A developer mistakenly hard-codes a credential in the code for testing purposes and forgets to remove it.

Any value of type `Text` or `Code` can be assigned to a `SecretText` value. If the tokens are retrieved and then converted to a `SecretText` value in the scope of a nondebuggable procedure, they are protected from the debugger during their lifetime. Furthermore, the AL compiler guarantees that a hardcoded credential can't be assigned directly to a destination of type `SecretText`.

```al
[NonDebuggable]
procedure RetrieveSessionToken(Credential: SecretText; TargetUri: Text) SessionToken : SecretText
var
    Request: HttpRequestMessage;
    Response: HttpResponseMessage;
    Client: HttpClient;
    Headers: HttpHeaders;
    Content: HttpContent;
begin
    Request.SetRequestUri(TargetUri);
    Request.GetHeaders(Headers);

    // Compose an authorization header with a secret value
    Headers.Add('Authorization', SecretStrSubstNo('Bearer %1', Credential));
    Client.Send(Request, Response);

    ParseSessionToken(Response, SessionToken);
    exit;
end;

[NonDebuggable]
procedure ParseSessionToken(Response: HttpResponseMessage; var SessionToken: SecretText) : Text
begin
    // Parse the response
end;
```

### Transit

A credential transits through AL code to reach the points where it's consumed. Transit includes:

1. Assignment to variables
2. Use as a parameter to call a procedure/trigger
3. Becoming the return value of a function call

The `SecretText` data type guarantees that the value remains nondebuggable by preventing any assignment from itself to any
debuggable type. This constraint includes the `Variant` data type. As a result, the `NonDebuggable` attribute is only required during retrieval
and can be omitted for the rest of the lifetime of a credential, as all intermediate destinations are automatically protected.

```al
procedure Assignments()
var
    PlainText: Text;
    Credential: SecretText;
begin
    Credential := PlainText; // Allowed
    PlainText := Credential; // Blocked

    ConsumePlainText(PlainText); // Allowed
    ConsumePlainText(Credential); // Blocked

    Credential := ProduceCredential(); //Allowed
    PlainText := ProduceCredential(); // Blocked
end;

procedure ConsumePlainText(PlainText: Text)
begin
end;

procedure ProduceCredential(): SecretText
begin
end;
```

### Consumption

The credential is consumed when it's used to perform an operation. A common example is communicating with an external web service via the AL HttpClient
where the following steps may be required:

1. Creating an authentication header for the request with the credential.
2. Adding the credential to the body of a request for the initial log-in.
3. Adding an API key to the parameters of a request

The AL HttpClient and all the intermediate types required to make a request support methods, which accept the `SecretText` data type,
so that the values can be passed directly to the AL runtime without being revealed to the debugger.

The code snippet below demonstrates how all the before mentioned scenarios can be implemented through these methods.

```al
procedure SendAuthenticatedRequestToApi(UriTemplate: Text; BearerToken: SecretText; KeyParameter: SecretText; SecretBody: SecretText)
    var
        Client: HttpClient;
        Headers: HttpHeaders;
        SecretHeader: SecretText;
        SecretUri: SecretText;

        RequestMessage: HttpRequestMessage;
    begin
        SecretHeader := SecretStrSubstNo('Bearer %1', BearerToken);

        RequestMessage.GetHeaders(Headers);

        // The header is added and remains hidden when debugging the headers
        // of the request message
        Headers.Add('Authorization', SecretHeader);

        // Headers.Contains('Authorization') - false
        // Headers.ContainsSecret('Authorization') - true
        // Headers.GetSecretValues must be used to get the values.
        // It is not possible to retrieve the header value as a plain text.

        SecretUri := SecretStrSubstNo(UriTemplate, KeyParameter);
        RequestMessage.SetSecretRequestUri(SecretUri);

        // RequestMessage.GetSecretRequestUri can be used to retrieve the request uri.
        // It cannot be retrieved by GetRequestUri as a plain text.

        RequestMessage.Content.WriteFrom(SecretBody);

        // RequestMessage.Content.ReadAs can only read back the body in a SecretText destination

        SendMessageAndHandleResponse(Client, RequestMessage);
    end;

    [NonDebuggable]
    procedure SendMessageAndHandleResponse(Client: HttpClient; Request: HttpRequestMessage) CredentialFromResponse: SecretText
    var
        Response: HttpResponseMessage;
    begin
        Client.Send(Request, Response);
        Response.Content.ReadAs(CredentialFromResponse);
    end;
```

## Built-in methods

### The Unwrap method

The `Unwrap` method allows the value to be extracted from a `SecretText` to a textual destination for compatibility reasons.
It's only permitted when building applications for the 'OnPrem' scope and its use produces a warning unless it's called
inside a procedure with the `NonDebuggable` attribute. It's not recommended to use this method for any other use except .NET
interoperability.

### The SecretStrSubstNo method

The `SecretStrSubstNo` method allows for composing different values of type `SecretText` without revealing their values.
Its behavior is identical to the `StrSubstNo` method on `Text` values with the important difference that its parameters and return value
are of type `SecretText`.

Some example uses are demonstrated in the snippet below:

```al
procedure SecretStrSubstNoExamples()
var
    First: SecretText;
    Second: SecretText;
    Result: SecretText;
begin
    // Concatenation
    Result := SecretStrSubstNo('%1%2', First, Second);

    // Build a header value
    Result := SecretStrSubstNo('Bearer %1', First);

    // Build a comma separated value list
    Result := SecretStrSubstNo('%1,%2', First, Second);
end;
```


## See Also

[NonDebuggable Attribute](methods/devenv-nondebuggable-attribute.md)  
[Http Client](methods-auto/httpclient/httpclient-data-type.md)
