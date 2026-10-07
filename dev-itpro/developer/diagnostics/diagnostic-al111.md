---
title: "Compiler Error AL0111"
description: "Semicolon expected."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0111

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Semicolon expected. Add a semicolon (;) to terminate the statement.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

Add a semicolon (`;`) to terminate the statement at the reported position. This error often points to the line *before* the one you'd expect, so check the preceding statement.

Common causes:

- A missing `;` after an assignment, a method call, or a variable declaration.
- A property line that isn't terminated.

Some constructs must *not* end with a semicolon. Don't add one after a `moveafter` or `movebefore` operation in a `tableextension` or `pageextension`, and don't put a semicolon on the statement immediately before an `else`.

```al
// Missing semicolon -> AL0111
Message('Hello')

// Correct
Message('Hello');
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  