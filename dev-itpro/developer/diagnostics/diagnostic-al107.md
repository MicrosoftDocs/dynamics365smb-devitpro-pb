---
title: "Compiler Error AL0107"
description: "Syntax error, identifier expected."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0107

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Syntax error, identifier expected. Provide a valid name (letters, digits, and underscores only).


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This error means the compiler expected an identifier, such as a variable, field, or object name, but found something else. It's often caused by a reserved keyword, a number, or a special character used where a name belongs.

To fix it:

- Make sure the name uses only letters, digits, and underscores, and doesn't start with a digit.
- Don't use an AL reserved keyword, such as `var`, `begin`, or `record`, as a name.
- Enclose names that contain spaces or special characters in double quotation marks, for example `"Sales Header"`.

The following example causes the error because `record` is a reserved keyword:

```al
var
    record: Integer;
```

Use a valid identifier instead:

```al
var
    RecordCount: Integer;
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  