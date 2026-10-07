---
title: "Compiler Error AL0118"
description: "The name '{0}' does not exist in the current context."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0118

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The name '{0}' does not exist in the current context.


## Description
The referenced name does not exist in the current context.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

The compiler can't resolve the name at the reported position. It isn't declared, it's out of scope, or it comes from a dependency you haven't referenced.

To fix it:

1. Check the spelling and quoting of the name. Names with spaces or special characters must be quoted, for example `"No. Series"`.
2. Make sure the variable, parameter, or method is declared and in scope.
3. If the name belongs to another extension, add that extension to the `dependencies` in **app.json**.
4. Use IntelliSense or **Go to Definition** (F12) to confirm the symbol exists and is accessible.

```al
var
    Cust: Record Customer;
begin
    // 'Customr' is misspelled -> AL0118
    Customr.FindFirst();
    // Correct
    Cust.FindFirst();
end;
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  