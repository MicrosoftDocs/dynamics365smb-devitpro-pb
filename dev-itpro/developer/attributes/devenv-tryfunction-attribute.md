---
title: "TryFunction attribute"
description: "Specifies the method to be a try method, which can be used to catch and handle errors and exceptions that occur when code is run."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# TryFunction attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies the method to be a try method, which can be used to catch and handle errors and exceptions that occur when code is run.


## Applies to

- Method


## Syntax


> **Version**: _Available or changed with runtime version 2.0._
```AL
[TryFunction]
procedure TryFunction()
```

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

> [!NOTE]  
> In test and upgrade codeunits, this property only applies to normal methods as specified by the [Normal Attribute \(Test Codeunits\)](devenv-normal-attribute.md) or [MethodType Property \(Upgrade Codeunits\)](../devenv-methodtype-property-upgrade-codeunits.md).  

Try methods in AL enable you to handle errors that occur in the application during code execution. For example, with try methods, you can provide more user-friendly error messages to the end user than those thrown by the system. You can use try methods to catch errors/exceptions that are thrown by [!INCLUDE[prod_short](../includes/prod_short.md)] or exceptions that are thrown during .NET Framework interoperability operations.  

Learn more in [Handling Errors by Using Try Methods](../devenv-handling-errors-using-try-methods.md).

## Example

The `IsSecureHttpUrl` method raises an error when a URL doesn't start with `https://`. The `TryFunction` attribute lets the `OnRun` trigger detect and handle the error without stopping execution.

```al
codeunit 50100 TryFunctionExample
{
    trigger OnRun()
    begin
        if not IsSecureHttpUrl('http://www.contoso.com') then
            Message('The URL is not secure.');
    end;

    [TryFunction]
    local procedure IsSecureHttpUrl(Url: Text)
    begin
        if CopyStr(Url, 1, 8) <> 'https://' then
            Error(NonSecureUrlErr);
    end;

    var
        NonSecureUrlErr: Label 'The URL must use HTTPS.';
}
```

## Related information

[AL Method Reference](../methods-auto/library.md)  
[Essential AL Methods](../devenv-essential-al-methods.md)  
[Method Attributes](devenv-method-attributes.md)  
[Handling Errors by Using Try Methods](../devenv-handling-errors-using-try-methods.md)  
[Properties](../properties/devenv-properties.md)
