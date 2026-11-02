---
title: OData V4 Unbound Actions in Business Central
description: Create an OData V4 unbound action in AL, publish a codeunit as a web service, and send authenticated JSON requests to call its procedures in Business Central.
author: ap3rus
ms.date: 10/29/2026
ms.reviewer: solsen
ms.topic: how-to
ms.author: vlnagorn
---

# Create and call an OData V4 unbound action

Use an OData V4 unbound action to call an AL codeunit procedure without addressing a specific record. This article shows how to publish a codeunit, send procedure parameters as JSON, and read the result.

## Prerequisites for the codeunit example

- An AL extension project with object ID **50100** in its `app.json` ID ranges.
- A Business Central test environment and permission to publish web services. The calling identity needs permission to execute the codeunit and perform any operations that its procedures use.
- An HTTP client and authentication for your environment. The examples use OAuth. For Business Central online, use an OAuth access token. For on-premises environments, use the authentication configured for the server. Learn more in [Using OAuth to authorize Business Central web services](../webservices/authenticate-web-services-using-oauth.md).
- For on-premises environments, enabled OData V4 services. Learn more in [Business Central Server instance settings](../administration/server-instance-settings.md#expose-odata-and-api-services).

## Declare the codeunit procedures

Define public procedures in a codeunit. These codeunit actions don't require the `[ServiceEnabled]` attribute used for page-bound actions.

The following codeunit provides three operations:

| Procedure | Parameter | Successful result |
|-----------|-----------|-------------------|
| `Ping` | `input`: Integer | The supplied integer with its sign reversed, except for the minimum Integer value. |
| `Delay` | `delayMilliseconds`: Integer | Waits for the specified nonnegative number of milliseconds and returns no value. |
| `GetLengthOfStringWithConfirmation` | `inputJson`: Text | The length of `str` when `confirm` is true; otherwise `-1`, subject to the input requirements below. |

```al
codeunit 50100 "MiscOperations"
{
    procedure Ping(input: Integer): Integer
    begin
        exit(-input);
    end;

    procedure Delay(delayMilliseconds: Integer)
    begin
        Sleep(delayMilliseconds);
    end;

    procedure GetLengthOfStringWithConfirmation(inputJson: Text): Integer
    var
        InputObject: JsonObject;
        ConfirmToken: JsonToken;
        StringToken: JsonToken;
    begin
        InputObject.ReadFrom(inputJson);

        if not InputObject.Get('confirm', ConfirmToken) then
            exit(-1);

        if not ConfirmToken.AsValue().AsBoolean() then
            exit(-1);

        if not InputObject.Get('str', StringToken) then
            exit(-1);

        exit(StrLen(StringToken.AsValue().AsText()));
    end;
}
```

For `GetLengthOfStringWithConfirmation`, pass `inputJson` as text containing a JSON object. When present, `confirm` should be a Boolean and `str` should be a string. The procedure returns `-1` if confirmation is missing or false, or if `str` is missing. Invalid JSON or incompatible values can cause a runtime error instead.

The separate checks ensure that each property is available before the code converts it. AL `and` expressions don't short-circuit, so a compound condition isn't a safe way to guard these conversions.

## Publish the codeunit as a web service

1. Build and publish the extension to your test environment.
1. In Business Central, use **Search** to find and open the **Web Services** page.
1. Select **New**.
1. Set **Object Type** to **Codeunit**, **Object ID** to **50100**, and **Service Name** to `MyOperations`.
1. Select **Published**.

The action URL uses the service name `MyOperations`, not the codeunit name `MiscOperations`. Construct the URL as shown in the next section. For codeunits, the generated OData URL can point to documentation instead of an action endpoint.

Learn more in [Publish a web service](../webservices/publish-web-service.md).

## Call a procedure with an HTTP POST request

Join the published service name and the procedure name with an underscore:

```http
POST <BaseUrl>/ODataV4/<ServiceName>_<ProcedureName>?company=<CompanyName>
```

Replace `<BaseUrl>` with your environment's OData URL prefix, excluding `/ODataV4`. For Business Central online, use `https://api.businesscentral.dynamics.com/v2.0/<TenantId>/<EnvironmentName>`. Replace `<TenantId>` and `<EnvironmentName>` with your tenant ID and environment name. For on-premises environments, ask your administrator for the configured OData URL prefix.

For this example, `<ServiceName>` is `MyOperations`. Use the company name or company ID for `company`. URL-encode the company name. The example uses a company named `CRONUS USA Inc.`; replace it with a company in your environment.

For OAuth authentication, replace `<AccessToken>` with an access token for your environment.

Send a JSON object whose property names match the declared procedure parameter names, including their casing. For `inputJson`, the value must be a JSON string containing JSON text, not a nested JSON object.

### Test the service with a simple parameter

Start with `Ping` to check the service URL, authentication, and parameter format before trying the JSON-text example:

```http
POST <BaseUrl>/ODataV4/MyOperations_Ping?company=CRONUS%20USA%20Inc. HTTP/1.1
Authorization: Bearer <AccessToken>
Content-Type: application/json
Accept: application/json;odata.metadata=minimal

{
  "input": 42
}
```

A successful request returns `200 OK` with `-42` in the response's `value` property.

For `Ping`, use `input` values from `-2147483647` to `2147483647`. The minimum Integer value, `-2147483648`, can't be negated within the Integer range.

### Pass JSON text as a parameter

```http
POST <BaseUrl>/ODataV4/MyOperations_GetLengthOfStringWithConfirmation?company=CRONUS%20USA%20Inc. HTTP/1.1
Authorization: Bearer <AccessToken>
Content-Type: application/json
Accept: application/json;odata.metadata=minimal

{
  "inputJson": "{\"str\":\"Hello world!\",\"confirm\":true}"
}
```

The `str` value, `Hello world!`, has 12 characters. A successful response returns `200 OK` with that length in the `value` property:

```http
HTTP/1.1 200 OK
Content-Type: application/json;odata.metadata=minimal

{
  "@odata.context": "<BaseUrl>/ODataV4/$metadata#Edm.Int32",
  "value": 12
}
```

The `@odata.context` annotation shown here corresponds to the requested minimal-metadata JSON format.

### Call a procedure that returns no value

The `Delay` procedure takes a number of milliseconds but has no return value:

```http
POST <BaseUrl>/ODataV4/MyOperations_Delay?company=CRONUS%20USA%20Inc. HTTP/1.1
Authorization: Bearer <AccessToken>
Content-Type: application/json

{
  "delayMilliseconds": 100
}
```

After the procedure completes successfully, the service returns:

```http
HTTP/1.1 204 No Content
```

Use a small, nonnegative value for `delayMilliseconds`. This example doesn't validate the parameter. A value of `-1` can wait indefinitely, and values below `-1` cause an error.

## Migrate supported codeunit operations from SOAP

OData V4 unbound actions can expose supported public codeunit procedures as web-service operations. When migrating from SOAP, review the procedure signatures and update the client's request and response handling. Don't assume that changing the URL is sufficient.

Procedures with ordinary `var` parameters or array parameters aren't exposed through this codeunit action path. Use supported parameter and return types, and inspect `<BaseUrl>/ODataV4/$metadata` to verify the actions available to your client.

## Troubleshoot unbound-action requests

- If the action isn't found, confirm that codeunit **50100** is published as `MyOperations`. Use POST and the exact service and procedure names separated by an underscore.
- If a parameter is missing, use its declared name and casing in the JSON body. Use `input` for `Ping`, `delayMilliseconds` for `Delay`, and `inputJson` for `GetLengthOfStringWithConfirmation`. The `inputJson` value must be a JSON string, not a nested object.
- If the JSON conversion fails, check both the outer request body and the JSON text inside `inputJson`. This sample doesn't convert every invalid input into `-1`.
- If execution is denied, check the calling identity's permissions and authentication.

## Related information

[Create and call an OData V4 bound action](devenv-creating-and-interacting-with-odatav4-bound-action.md)  
[Publish a web service](../webservices/publish-web-service.md)  
[Using OAuth to authorize Business Central web services](../webservices/authenticate-web-services-using-oauth.md)  
[Known OData limitations](../webservices/odata-known-limitations.md)  
[Handling UI interaction when working with web services](../webservices/handling-ui-interaction-when-working-with-web-Services.md)  
