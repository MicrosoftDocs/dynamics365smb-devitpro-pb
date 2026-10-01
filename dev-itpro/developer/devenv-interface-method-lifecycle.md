---
title: Interface method lifecycle
description: Learn the recommended lifecycle for adding, transitioning, and removing interface methods in AL.
ms.author: solsen
ms.date: 04/29/2026
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# Interface method lifecycle

[!INCLUDE [2026-releasewave2](../includes/2026-releasewave2.md)]

When you publish an interface in an AL extension, dependent extensions can implement it. Changes to the interface's methods can break those extensions. This article describes the recommended lifecycle for safely adding, transitioning, and removing interface methods.

## Method states

An interface method can be in the following states:

| State | Has body | Description |
|-------|----------|-------------|
| Required | No | All codeunits must implement this method. Contributes to the interface runtime identifier. |
| Default (optional) | Yes | Has a default implementation. Implementors can override it but don't have to. Doesn't affect the runtime identifier. |
| RequiredPending | Yes | Marked with `[RequiredPending]`. Still optional, but the compiler warns implementors to add their own implementation. |
| Obsolete Pending | Either | Marked for future removal. |
| Obsolete Removed | Either | Removed from the public API. |

## Runtime identifier

The interface runtime identifier is a hash computed from the required (non-default) methods. It determines binary compatibility between the interface and its implementors at deployment.

Key rules:

- Default methods and RequiredPending methods don't contribute to the hash.
- Adding or removing default methods doesn't change the runtime identifier.
- Making a method required or removing a required method changes the runtime identifier.
- When the runtime identifier changes, dependent extensions must be recompiled.

## Adding new methods to a published interface

You can't add a required method to a published interface directly. The AppSourceCop rule [AS0066](analyzers/appsourcecop-as0066.md) prevents this change because it breaks all existing implementors.

Instead, add new methods as **default methods** (with a body). Default methods are safe to add because:

- Existing implementors continue to compile.
- The runtime identifier doesn't change.
- Dependent extensions don't need recompilation.

```AL
interface IPaymentProvider
{
    // Existing required method
    procedure ProcessPayment(Amount: Decimal): Boolean;

    // New default method - safe to add
    procedure ValidatePayment(Amount: Decimal): Boolean
    begin
        exit(true); // Default: always valid
    end;
}
```

## Transitioning from default to required

When a default method must eventually be implemented by all consumers, follow this two-phase process:

### Phase 1 - Mark as RequiredPending

Add the [RequiredPending attribute](attributes/devenv-requiredpending-attribute.md) to the default method. The method keeps its body, so it stays optional.

```AL
[RequiredPending('Implement ValidatePayment for proper validation. This will become required in version 3.0.', '2.0')]
procedure ValidatePayment(Amount: Decimal): Boolean
begin
    exit(true);
end;
```

The compiler emits warning AL0924 for any implementing codeunit that doesn't override the method:

> Interface method 'IPaymentProvider.ValidatePayment' will become required. Reason: Implement ValidatePayment for proper validation. This change will become required in version 3.0. Tag: 2.0. Add an implementation now to avoid a future breaking change.

A code fix is available to help implementors: **Implement RequiredPending interface method**.

### Phase 2 - Make required

In a later major version, remove the body and the `[RequiredPending]` attribute:

```AL
procedure ValidatePayment(Amount: Decimal): Boolean;
```

The method is now required. Any codeunit that doesn't add its own implementation fails to compile. The AppSourceCop emits [AS0149](analyzers/appsourcecop-as0149.md) to warn about the runtime identifier change.

> [!IMPORTANT]
> Skipping Phase 1 and going directly from default to required triggers [AS0148](analyzers/appsourcecop-as0148.md), which is an error.

## Removing methods from an interface

To remove a method from a published interface, follow the standard Obsolete lifecycle:

1. **Obsolete Pending**: Mark the method with `[Obsolete('Pending', 'Use method Y instead.')]`. Callers receive a warning.
2. **Obsolete Removed**: In a later version, change to `[Obsolete('Removed', 'Use method Y instead.')]`. Callers receive an error.
3. **Delete**: In a subsequent version, remove the method entirely.

> [!NOTE]
> Removing a required method changes the runtime identifier ([AS0149](analyzers/appsourcecop-as0149.md)). Removing a default method doesn't change the runtime identifier but still triggers [AS0018](analyzers/appsourcecop-as0018.md).

## Summary of AppSourceCop rules

The following AppSourceCop rules enforce the interface method lifecycle:

| Rule | What it validates | Severity |
|------|-------------------|----------|
| [AS0066](analyzers/appsourcecop-as0066.md) | New required method on published interface | Error |
| [AS0148](analyzers/appsourcecop-as0148.md) | Default method made required without `[RequiredPending]` first | Error |
| [AS0149](analyzers/appsourcecop-as0149.md) | Runtime identifier changed (required method added or removed) | Warning |
| [AS0072](analyzers/appsourcecop-as0072.md) | Tag version must match configured target | Hidden |
| [AS0073](analyzers/appsourcecop-as0073.md) | Tag must be set | Hidden |
| [AS0074](analyzers/appsourcecop-as0074.md) | Tag must not change unless attribute is newly added | Hidden |
| [AS0075](analyzers/appsourcecop-as0075.md) | Reason must be set | Warning |
| [AS0076](analyzers/appsourcecop-as0076.md) | Tag must match configured pattern | Hidden |

## Code fixes

The compiler provides code fixes to help implementers:

| Diagnostic | Code fix | Description |
|------------|----------|-------------|
| Missing required methods | **Implement required interface methods** | Adds stubs for required methods only |
| Missing required methods | **Implement all interface methods** | Adds stubs for required and default methods |
| RequiredPending warning (AL0924) | **Implement RequiredPending interface method** | Adds a stub for the RequiredPending method |

All code fixes support Fix All scopes (Document, Project, Solution) for batch application.

## Lifecycle diagram

The following diagram shows the complete lifecycle of an interface method:

```
                    ┌──────────────────┐
         ┌────────>│  Default method   │──────────────┐
         │         │  (optional, body) │              │
         │         └────────┬─────────┘              │
         │                  │                         │
    Add new method    Add [RequiredPending]    Add [Obsolete('Pending')]
         │                  │                         │
         │                  v                         v
         │         ┌──────────────────┐      ┌──────────────────┐
         │         │ RequiredPending  │      │ Obsolete Pending │
         │         │  (optional+warn) │      │                  │
         │         └────────┬─────────┘      └────────┬─────────┘
         │                  │                         │
         │           Remove body            [Obsolete('Removed')]
         │                  │                         │
         │                  v                         v
         │         ┌──────────────────┐      ┌──────────────────┐
         │         │ Required method  │      │ Obsolete Removed │
         │         │   (no body)      │      │                  │
         │         └──────────────────┘      └────────┬─────────┘
         │                                            │
         │                                      Delete method
         │                                            │
         │                                            v
         └────────────────────────────────── (method removed)
```

## Related information

[Interfaces in AL](devenv-interfaces-in-al.md)  
[RequiredPending attribute](attributes/devenv-requiredpending-attribute.md)  
[Obsolete attribute](attributes/devenv-obsolete-attribute.md)  
[Extending interfaces in AL](devenv-interfaces-in-al-extend.md)  
[Obsolete objects and tags](devenv-obsolete-objects.md)  
