---
title: "Compiler Error AL0104"
description: "Syntax error, '{0}' expected."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0104

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Syntax error, '{0}' expected.
## Error message example
Syntax error, ';' expected


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

The compiler expected a specific token at the reported line and column, shown in place of the message's placeholder (for example, `;`, `)`, or `end`). Go to that position and add or correct the token.

Common causes:

- A missing semicolon (`;`) at the end of a statement.
- An unclosed parenthesis `)`, bracket `]`, or brace `}`.
- A missing `begin` or `end` in a code block.
- A missing keyword, such as `then` after an `if` condition.

The real problem is often on the line just before the reported position, so check the preceding line as well.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  