---
title: "Compiler Error AL0122"
description: "Cannot implicitly convert type '{0}' to '{1}'."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0122

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Cannot implicitly convert type '{0}' to '{1}'. Use an explicit conversion or change the type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

The value's type doesn't match the target type, and AL doesn't convert between them automatically. Convert the value explicitly, or use a variable of the correct type.

Common conversions:

- Number to text: use `Format()`.
- Text to a number, date, or other type: use `Evaluate()`.
- Between record types: copy the fields you need, or use `TransferFields`.

```al
var
    Qty: Integer;
    QtyText: Text;
begin
    Qty := 10;
    // Implicit conversion not allowed -> AL0122
    QtyText := Qty;
    // Correct
    QtyText := Format(Qty);
end;
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  