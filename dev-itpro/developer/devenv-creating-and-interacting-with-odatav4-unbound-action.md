---
title: Creating and interacting with an OData V4 unbound action
description: Describing how to create and interact with an OData V4 Unbound Action in AL.
author: ap3rus
ms.date: 07/23/2024
ms.reviewer: solsen
ms.topic: concept-article
ms.author: vlnagorn
---

# Creating and interacting with an OData V4 unbound action

Unbound actions represent reusable operations that you can perform using an OData request. Use unbound actions when there is no particular entity that the action needs to be bound to.

## Using OData V4 unbound actions to migrate from SOAP to OData

One common use case for using SOAP endpoints with Business Central is to expose an AL method to be callable as a web service. The same thing can be achieved by using OData V4 unbound actions as described in this article.

## Declaring, registering, and publishing the OData unbound action

To declare an OData unbound action define a codeunit with a procedure with the desired business logic.

The following example illustrates a simple codeunit with three procedures that can be exposed as a web service and called as OData unbound actions.

```AL
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
        c: JsonToken;
        input: JsonObject;
    begin
        input.ReadFrom(inputJson);
        if input.Get('confirm', c) and c.AsValue().AsBoolean() = true and input.Get('str', c) then
            exit(StrLen(c.AsValue().AsText()))
        else
            exit(-1);
    end;
}
```

## Registering and publishing the codeunit as a web service

Registering and publishing the codeunit is identical to how you work with other web services. For more information, see [Publish a Web Service](/dynamics365/business-central/across-how-publish-web-service).

## Verifying web service availability

### HTTP request

To call specific procedure on a codeunit use the base OData URL for the codeunit and procedure name separated by an underscore.

```
POST /ODataV4/{serviceName}_{procedureName}?company={companyName|companyId} HTTP/1.1
{requestBody}
```

### Request headers

|Header|Value|
|---|---|
|Authorization|Bearer {token}. Required.|

### Example request

```
POST {baseUrl}/ODataV4/MyOperations_GetLengthOfStringWithConfirmation?company=CRONUS%20USA%20Inc. HTTP/1.1
{
    "inputJson": "{\"str\":\"Hello world!\",\"confirm\":true}"
}
```

### Example response

```
HTTP/1.1 200 OK
{
  "@odata.context": "{baseUrl}/ODataV4/$metadata#Edm.Int32",
  "value": 12
}
```

## Related information

[AL development environment](devenv-reference-overview.md)  
[Creating and interacting with an OData V4 bound action](devenv-creating-and-interacting-with-odatav4-bound-action.md)  
[Getting started with Microsoft .NET interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
[Devoloping for multiple platform versions](devenv-developing-for-multiple-platform-versions.md)  
[Exporting permission sets](devenv-export-permission-sets.md)  
[Discover events using the Event Recorder](devenv-events-discoverability.md)  

