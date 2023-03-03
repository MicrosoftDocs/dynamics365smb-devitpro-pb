---
title: "Compiler Warning AL0756"
description: "The division by Abs(integer) will change its behavior in release version 11."
ms.author: solsen
ms.custom: na
ms.date: 12/05/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL0756

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The division by Abs(integer) will change its behavior in release version 11. For more information visit the official documentation.

### The bug
By definition integer division in AL should result in decimal type.
```al
local procedure TestDivision()
    var
        i: Integer;
        j: Integer;
        d: Decimal;
    begin
        i := 5;
        j := 2;
        d := i / j; // d will be 2.5
    end;
```

However, a misbehavior was found where if the divisor is a result returned by system method `Abs(Integer)` the result of the division will be an Integer and it will trancate the fraction part. This issue can be also reproduced as if you call `Abs` with any other non-decimal type like `Byte`, `Char`, `BigInteger`.

```al
local procedure TestDivision()
var
    i: Integer;
    j: Integer;
    d: Decimal;
begin
    i := 5;
    j := 2;
    d := i / Abs(j); // d will be 2
end;
```

In any other case the Integer divided by Integer results in Decimal division.
```al
local procedure TestDivision()
var
    i: Integer;
    j: Integer;
    d: Decimal;
begin
    i := 5;
    j := 2;
    d := i / MyProcedure(); // d will be 2.5
end;

local procedure MyProcedure(): Integer
begin
    exit(2);
end;
```

### The solution
With the release of runtime version 11 the issue will be fixed. The behavior will change and `Integer / Abs(Integer)` will return the expected `Decimal` value. Until then this warning will be shown to warn for the future change and mark the usage of such division.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  