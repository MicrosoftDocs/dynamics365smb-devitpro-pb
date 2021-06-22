---
title: "TryFunction Attribute"
description: "The TryFunction attribute in AL for Business Central"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# TryFunction Attribute

> **Version**: _Available from runtime version 2.0._

Specifies the method to be a try method, which can be used to catch and handle errors and exceptions that occur when code is run.  
  
## Applies to
 
- AL methods 
  
> [!NOTE]  
> In test and upgrade codeunits, this property only applies to normal methods as specified by the [Normal Attribute \(Test Codeunits\)](devenv-normal-attribute.md) or [MethodType Property \(Upgrade Codeunits\)](../devenv-methodtype-property-upgrade-codeunits.md).  

## Syntax
```AL
[TryFunction]
local procedure MyTryMethod()
```

## Remarks  

Try methods in AL enable you to handle errors that occur in the application during code execution. For example, with try methods, you can provide more user-friendly error messages to the end user than those thrown by the system. You can use try methods to catch errors/exceptions that are thrown by [!INCLUDE[prod_short](../includes/prod_short.md)] or exceptions that are thrown during .NET Framework interoperability operations.  

For more information, see [Handling Errors by Using Try Methods](../devenv-handling-errors-using-try-methods.md).  

## Example

The `IsSecureHttpUrl` method throws an error when trying to make a web request using an insecure URL. By setting the **TryFunction** attribute on it, the exception can be caught and handled by the `OnRun` trigger.

```al
[TryFunction]
procedure IsSecureHttpUrl(Url: Text)
var
    Uri: DotNet Uri;
begin
    IsValidUri(Url);
    Uri := Uri.Uri(Url);
    if Uri.Scheme <> 'https' then
        Error(NonSecureUriErr);
end;
```
```
trigger OnRun()
var
    URL: Text;
begin
    if IsSecureHttpUrl(URL) then
        message('URL is not secure.')
        exit(true);
    exit(false);
end;
```

## See Also  

[AL Method Reference](../methods-auto/library.md)  
[Essential AL Methods](../devenv-essential-al-methods.md)  
[Method Attributes](devenv-method-attributes.md)  
[Handling Errors by Using Try Methods](../devenv-handling-errors-using-try-methods.md)  
[Properties](../properties/devenv-properties.md)
