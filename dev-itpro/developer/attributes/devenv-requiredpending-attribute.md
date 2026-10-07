---
title: "RequiredPending attribute"
description: "Specifies that the annotated method will be required."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# RequiredPending attribute
> **Version**: _Available or changed with runtime version 18.0._

Specifies that the annotated method will be required.


## Applies to

- Method

## Syntax

```AL
[RequiredPending(Reason: Text [, Tag: Text])]
```

### Arguments
*Reason*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the reason for the method being required.  

*[Optional] Tag*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies a free-form text to support tracking of where and when the method was marked as required, for example, branch, build, or date of requiring the method.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `[RequiredPending]` attribute can only be applied to interface methods that have a default implementation (a body). Applying it to a method without a body (a required method) raises a compile-time error, because the method is already required.

The attribute is part of a two-phase lifecycle for transitioning interface methods from optional to required:

1. **Phase 1 - RequiredPending**: Add `[RequiredPending]` to the default method. The method retains its body, so existing implementors continue to compile. However, the compiler emits warning AL0924 for any codeunit that implements the interface but doesn't override the method. This warning gives implementors time to add their own implementation.

2. **Phase 2 - Required**: In a later major version, remove the body and the `[RequiredPending]` attribute. The method is now required. The AppSourceCop warns about the runtime identity change ([AS0149](../analyzers/appsourcecop-as0149.md)).

Skipping Phase 1 and making the method required directly triggers an AppSourceCop error ([AS0148](../analyzers/appsourcecop-as0148.md)).

### Tag validation

The `Tag` parameter follows the same validation rules as the [Obsolete](devenv-obsolete-attribute.md) attribute tag. If you configure the AppSourceCop with `obsoleteTagVersion` and `obsoleteTagPattern`, those settings apply to `[RequiredPending]` tags as well. The following AppSourceCop rules validate the tag:

- [AS0072](../analyzers/appsourcecop-as0072.md) - Tag version must match the configured target version
- [AS0073](../analyzers/appsourcecop-as0073.md) - Tag must be set
- [AS0074](../analyzers/appsourcecop-as0074.md) - Tag must not change unless the attribute is newly added
- [AS0075](../analyzers/appsourcecop-as0075.md) - Reason must be set
- [AS0076](../analyzers/appsourcecop-as0076.md) - Tag must match the configured pattern

### Code fix

When the compiler emits AL0924 for a codeunit that doesn't override a RequiredPending method, a code fix is available: **Implement RequiredPending interface method**. This code fix adds the method stub to the codeunit. It supports Fix All scopes (Document, Project, Solution) for batch application.

## Example

In this example, the interface `IPaymentProvider` initially has only required methods. When a new `ValidatePayment` capability is needed, it is added as a default method with `[RequiredPending]` to give existing implementors notice.

### Version 1.0 - initial interface

```AL
interface IPaymentProvider
{
    procedure ProcessPayment(Amount: Decimal): Boolean;
}
```

### Version 2.0 - add a default method with RequiredPending

```AL
interface IPaymentProvider
{
    procedure ProcessPayment(Amount: Decimal): Boolean;

    [RequiredPending('Implement ValidatePayment to add validation logic. This method will become required in version 3.0.', '2.0')]
    procedure ValidatePayment(Amount: Decimal): Boolean
    begin
        // Default implementation: no validation
        exit(true);
    end;
}
```

Existing implementors continue to compile. The compiler warns:

> AL0924: Interface method 'IPaymentProvider.ValidatePayment' will become required. Reason: Implement ValidatePayment to add validation logic. This method will become required in version 3.0. Tag: 2.0. Add an implementation now to avoid a future breaking change.

### Version 3.0 - make the method required

```AL
interface IPaymentProvider
{
    procedure ProcessPayment(Amount: Decimal): Boolean;
    procedure ValidatePayment(Amount: Decimal): Boolean;
}
```

The method is now required. Any codeunit that hasn't added its own `ValidatePayment` will fail to compile.

## Related information

[Interface method lifecycle](../devenv-interface-method-lifecycle.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
[Obsolete attribute](devenv-obsolete-attribute.md)  
[AL method reference](../methods-auto/library.md)  
[Method attributes](devenv-method-attributes.md)  
