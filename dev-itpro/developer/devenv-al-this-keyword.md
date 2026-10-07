---
title: Use the AL this Keyword for Object Self-Reference
description: Use the AL this keyword to qualify object members, improve code readability, and pass the current codeunit instance to other methods.
ms.reviewer: solsen
ms.topic: concept-article
ms.date: 10/07/2026
author: SusanneWindfeldPedersen
ms.collection: get-started
ms.custom:
  - bap-template
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date:08/21/2024
---

# Reference the current AL object with the "this" keyword

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

The `this` keyword is familiar from languages such as C#, JavaScript, and Python. In AL, it provides a self-reference for an object. For codeunits, you can also pass `this` as an argument or return it as the current codeunit instance. The keyword improves readability by distinguishing object members from local symbols.

## Scenarios for using `this`

The main benefits of using the `this` keyword are:

- It allows codeunits to pass a reference to the current object (`this`) as an argument to another method.
- It improves readability by indicating that a referenced symbol is a member of the object itself.

The CodeCop rule [AA0248](analyzers/codecop-aa0248.md) is enabled by default with a severity level of `hidden`. Hidden means that it appears as three dots in the editor, but doesn't show up as a diagnostic in the **Problems** view in Visual Studio Code or in any pipelines. The CodeCop rule identifies places where you can use the `this` keyword. A code action can update existing code to use the keyword. Learn more about applying code actions in [AL code actions](devenv-code-actions.md).

> [!NOTE]
> The current [System Application](/dynamics365/business-central/application/system-application/module/system-application) uses the `this` keyword to reference methods and globals in the same object.

## Related information

[CodeCop hidden AA0248](analyzers/codecop-aa0248.md)  
[AL code actions](devenv-code-actions.md)
