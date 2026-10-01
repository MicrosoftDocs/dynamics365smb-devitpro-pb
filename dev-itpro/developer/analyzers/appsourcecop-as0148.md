---
title: "AppSourceCop Error AS0148"
description: "When transitioning an optional (default) interface method to required, the method must first be marked with [RequiredPending] in a prior version."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0148
An interface method was made required without first being marked [RequiredPending].

## Description
When transitioning an optional (default) interface method to required, the method must first be marked with [RequiredPending] in a prior version. This gives consumers advance notice before the breaking change takes effect.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error is raised when a default (optional) interface method in the baseline version has been changed to a required method (body removed) without first being marked with `[RequiredPending]`.

Making an optional method required is a breaking change for dependent extensions; the dependent extension must implement the method or it won't compile. The `[RequiredPending]` attribute provides a warning period so implementors can add their implementation before it becomes mandatory.

This rule enforces the two-phase lifecycle for interface methods:

1. **Phase 1**: Add `[RequiredPending]` to the default method. Implementors receive a compiler warning (AL0924) but their code continues to compile.
2. **Phase 2**: In a later major version, remove the body to make the method required.

When both AS0148 and [AS0149](appsourcecop-as0149.md) fires on the same interface, AS0149 is suppressed because this error is more actionable.

## How to fix this diagnostic?

Restore the method's body (making it a default method again) and add the `[RequiredPending]` attribute:

```AL
interface IMyInterface
{
    [RequiredPending('This method will become required. Add your implementation now.', '26.0')]
    procedure MyMethod(): Text
    begin
        exit('default');
    end;
}
```

In a subsequent major version, you can remove the body and the attribute to make the method required.

Learn more about the recommended lifecycle in [Interface method lifecycle](../devenv-interface-method-lifecycle.md).

## Related information

[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[RequiredPending attribute](../attributes/devenv-requiredpending-attribute.md)  
[Analyzer rule AS0149](appsourcecop-as0149.md)  
[Analyzer rule AS0066](appsourcecop-as0066.md)  
[Interface method lifecycle](../devenv-interface-method-lifecycle.md)  
[AppSourceCop analyzer](appsourcecop.md)  
