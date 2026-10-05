---
title: Overload AL Procedures by Signature
description: Learn how AL procedure overload resolution uses names, parameter counts, orders, types, and implicit conversions to select a procedure at compile time.
author: SusanneWindfeldPedersen
ms.date: 10/05/2026
ms.update-cycle: 1095-days
ms.topic: reference
ms.author: solsen
ms.custom: evergreen
ms.reviewer: solsen
---

# Define overloaded procedures in AL
 
Procedure overloading lets you define multiple procedures with the same name and different signatures on the same application object. The procedures perform the same task for different arguments. At each call site, the compiler uses overload resolution to select the best applicable procedure.

## Reasons for using procedure overload

Procedure overloads let you use the same procedure name for different data types. They also let you write strongly typed code and rely on compiler validation instead of using the [Variant data type](../methods-auto/variant/variant-data-type.md) to process different types.

## How overload resolution works
Overload resolution uses the procedure name and the number, order, and types of the arguments to find the best match. The return type isn't used to select an overload at a call site.


## Example
The following examples compare implementations of a `ToString` procedure with and without procedure overloads.
The first code snippet implements `ToString` with a `Variant` parameter. The procedure checks the value's type and delegates to a type-specific implementation. If the caller passes a type other than `Integer`, `Date`, or `Text`, the procedure returns an empty string. This behavior can cause errors that appear only at runtime.


```AL
codeunit 50100 Stringifier
{ 
    local procedure TextToString(value : Text) : Text
    begin 
        Exit(value); 
    end; 
 
    local procedure DateToString(value : Date) : Text
    begin 
        Exit(Format(value)); 
    end; 
 
    local procedure IntegerToString(value : Integer) : Text
    begin 
        Exit(Format(value)); 
    end; 
 
    procedure ToString(value: Variant) : Text
    begin 
        if value.IsInteger then 
            Exit(IntegerToString(value)) 
        else if value.IsDate then 
                Exit(DateToString(value))
        else if value.IsText then 
                Exit(TextToString(value))
        else 
            Exit(''); 
    end; 
}
```

The second code snippet overloads the `ToString` procedure for `Text`, `Date`, and `Integer`. The compiler accepts a call only when overload resolution identifies a single best applicable procedure, including any permitted implicit conversions. If no overload is applicable, the compiler reports an error instead of allowing an unsupported value to reach the procedure at runtime.

```AL
codeunit 50101 StringifierWithOverloads
{ 
    procedure ToString(value : Text) : Text
    begin 
        Exit(value); 
    end; 
 
    procedure ToString(value : Date) : Text
    begin 
        Exit(Format(value)); 
    end; 
 
    procedure ToString(value : Integer) : Text
    begin 
        Exit(Format(value)); 
    end; 
} 
```

## Related information

[AL method reference](../methods-auto/library.md)  
[AL development environment](../devenv-reference-overview.md)  
