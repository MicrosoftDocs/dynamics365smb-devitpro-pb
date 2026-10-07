---
title: "AppSourceCop Warning AS0149"
description: "Making a method required or removing an obsolete method from a published interface changes the interface's runtime identifier."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0149
Adding or removing a required method on an interface may break dependent extensions at runtime.

## Description
Making a method required or removing an obsolete method from a published interface changes the interface's runtime identifier. Dependent extensions will not break at compile time but may break at runtime until they are recompiled.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This warning is raised when a change to an interface modifies the set of required (non-default) methods, which changes the interface's runtime identifier. Scenarios that trigger this rule include:

- A RequiredPending method becomes required (body removed)
- A required method becomes optional (body added, making it a default method)
- A required method is deleted

The runtime identifier determines binary compatibility between the interface and its implementors at deployment. When the identifier changes, dependent extensions continue to compile but may fail at runtime until they're recompiled against the updated interface.

> [!NOTE]
> When [AS0066](appsourcecop-as0066.md) or [AS0148](appsourcecop-as0148.md) also fires on the same interface, this warning is suppressed because the error is more actionable.

## How to fix this diagnostic?

This warning is informational; it alerts you that a runtime identifier change has occurred. Consider the following:

- **If the change is intentional** (for example, completing the RequiredPending-to-required transition), the warning is expected. Dependent extensions must be recompiled after updating to the new version of your extension.
- **If the change was unintentional**, restore the method to its previous state (add back the body, or restore a deleted method).

To minimize disruption, follow the recommended two-phase lifecycle: use `[RequiredPending]` before making methods required. Learn more in [Interface method lifecycle](../devenv-interface-method-lifecycle.md).

## Related information

[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[RequiredPending attribute](../attributes/devenv-requiredpending-attribute.md)  
[Analyzer rule AS0148](appsourcecop-as0148.md)  
[AS0066](appsourcecop-as0066.md)  
[Interface method lifecycle](../devenv-interface-method-lifecycle.md)  
[AppSourceCop analyzer](appsourcecop.md)  
