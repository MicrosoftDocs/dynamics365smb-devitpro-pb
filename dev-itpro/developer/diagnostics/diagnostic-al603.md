---
title: "Compiler Warning AL0603"
description: "An implicit conversion is being performed from a value of type '{0}' to a value of type '{1}'."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL0603

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

An implicit conversion is being performed from a value of type '{0}' to a value of type '{1}'. This conversion can lead to data loss and unexpected runtime issues.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This warning means AL automatically converts a value from one type to another, and the conversion could truncate data or lose precision. Typical cases are assigning a longer text to a shorter `Text` or `Code`, or narrowing a numeric type.

To fix it, make the conversion explicit and control the length or precision. The following example can lose data because the text can be longer than the target:

```al
CodeValue := TextValue;
```

Use `CopyStr` to control the length:

```al
CodeValue := CopyStr(TextValue, 1, MaxStrLen(CodeValue));
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  