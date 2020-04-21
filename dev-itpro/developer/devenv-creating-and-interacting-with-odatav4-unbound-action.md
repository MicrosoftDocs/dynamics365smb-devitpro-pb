---
title: "Creating and Interacting with an OData V4 Unbound Action"
description: "Document how to create and interact with an OData V4 Unbound Action in AL."
author: ap3rus
ms.custom: na
ms.date: 04/21/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: vlnagorn
---

# Creating and interacting with an OData V4 Unbound Action

Unbound actions represent reusable operations you can perform using OData request. Use unbound actions when there is no particular entity the action needs to be bound to.

## Declaring, registering and publishing the OData unbound action

To declare OData unbound action define a code unit with procedure with the desired business logic.

The following example illustrates simple codeunit with two procedures that can be exposed as a web service and called as OData unbound actions.

```
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

See [Publish a Web Service](/dynamics365/business-central/across-how-publish-web-service).

## Verifying web service availability

### HTTP Request

To call specific procedure on a codeunit use base OData URL for the codeunit and procedure name separated by underscore.

```
POST /ODataV4/{serviceName}_{procedureName}?company={companyName|companyId} HTTP/1.1
{requestBody}
```

### Request Headers

|Header|Value|
|---|---|
|Authorization|Bearer {token}. Required.|

### Example Request

```
POST {baseUrl}/ODataV4/MiscOperations_GetLengthOfStringWithConfirmation?company=CRONUS%20USA%20Inc. HTTP/1.1
{
    "inputJson": {
        "str": "Hello world!",
        "confirm": true
    }
}
```

### Example Response

```
HTTP/1.1 200 OK
{
  "@odata.context": "{baseUrl}/ODataV4/$metadata#Edm.Int32",
  "value": -100
}
```

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Getting started with Microsoft .NET Interoperability from AL](devenv-get-started-call-dotnet-from-al.md)  
[Devoloping for Multiple Platform Versions](devenv-developing-for-multiple-platform-versions.md)  
[Exporting Permission Sets](devenv-export-permission-sets.md)  
[Discover Events Using the Event Recorder](devenv-events-discoverability.md)
[Creating and Interacting with an OData V4 Bound Action](devenv-creating-and-interacting-with-odatav4-bound-action.md)
