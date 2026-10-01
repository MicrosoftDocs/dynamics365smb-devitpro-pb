---
title: "Compiler Warning (future error) AL0606"
description: "The 'with' statement is deprecated and will be removed for cloud development in a future release."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning (future error) AL0606

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The 'with' statement is deprecated and will be removed for cloud development in a future release.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

This warning means the code uses a `with` statement, which is deprecated for cloud development and becomes an error in a future release. Removing `with` makes member access explicit and avoids ambiguity between record members and other variables.

To fix it, remove the `with` block and qualify each member with the record variable. The following example uses `with`:

```al
with Customer do begin
    Name := 'Adatum Corporation';
    Validate("Credit Limit (LCY)", 1000);
end;
```

Qualify each member instead:

```al
Customer.Name := 'Adatum Corporation';
Customer.Validate("Credit Limit (LCY)", 1000);
```

Visual Studio Code also offers a Quick Fix code action that removes `with` statements for you.

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  