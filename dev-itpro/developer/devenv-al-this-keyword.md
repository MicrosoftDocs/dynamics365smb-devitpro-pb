---
title: Use the this keyword for codeunit self-reference
description: Learn how you can use the this keyword to pass a reference to itself and improve readability of code.
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 08/21/2024
ms.custom: bap-template
author: SusanneWindfeldPedersen
ms.collection: get-started
---

# Use the `this` keyword for codeunit self-reference

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

The `this` keyword allows passing the current object as an argument to methods, which previously required less optimal workarounds. Additionally, using the `this` keyword enhances readability in larger methods by clearly indicating whether a variable is in the global or local scope.

## Scenarios for using `this`

The main benefits of using the `this` keyword are:

- It allows codeunits to pass a reference to the current object (`this`) as an argument to another method.
- It improves readability by indicating that a referenced symbol is a member of the object itself.

A new CodeCop rule [AA0248](analyzers/codecop-aa0248.md), has been added and is enabled by default with a severity level of `hidden`. Hidden means that it appears as three dots in the editor, but doesn't show up as a diagnostic in the **Problems** view in Visual Studio Code or in any pipelines. There's also a [workspace-wide code action](devenv-code-actions.md) to update existing code to use the `this` keyword.

The System Application has been updated to use `this` for referencing methods and globals within the same object.

## Related information

[CodeCop Hidden AA0248](analyzers/codecop-aa0248.md)  
[AL code actions](devenv-code-actions.md)