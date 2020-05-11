---
title: "Procedure overload"
description: "Using the procedure overload to create multiple procedures with the same name, but with different signatures, on the same application object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Procedure overload
 
Procedure overload enables developers to create multiple procedures with the same name, but with different signatures, on the same application object. Conceptually, overloaded procedures are used to execute the same task on a different set of arguments. When an overloaded procedure is called, a specific implementation of that procedure, appropriate to the context of the call, will be run. 

## Reasons for using procedure overload

Overloaded procedures give programmers the flexibility to call a procedure with similar semantics for different types of data. At the same time, overloaded procedures remove the need for abusing the Variant data type for the purpose of processing different types of data a similar manner and allows the developer to write strongly-typed code and rely on the compiler for validation. 

### Remarks 
Overload resolution is performed by using procedure signatures to find the best match. The signature of a procedure is represented by its name and the type, order, and number of parameters. The return type of a procedure is not part of the procedure’s signature. 


## Example
The following example shows how a **ToString** method can be implemented with and without using procedure overloads.  
In the first code snippet, a **ToString** procedure is implemented. This takes a Variant value and inspects the type of the value to delegate to different implementations. If the caller passes a value of a different type than Integer, Date, and Text, an empty string will be returned. This can lead to bugs that will only show up at runtime. 


```
codeunit 10 Stringifier 
{ 
    local procedure TextToString(value : Text) : Text; 
    begin 
        Exit(value); 
    end; 
 
    local procedure DateToString(value : Date) : Text; 
    begin 
        Exit(Format(value)); 
    end; 
 
    local procedure IntegerToString(value : Integer) : Text; 
    begin 
        Exit(Format(value)); 
    end; 
 
    procedure ToString(value: Variant) : Text; 
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

In the second code snippet, we overload the ToString procedure for Text, Date and Integer. At this point, it is not possible for a caller to call a ToString method with a different type other than Integer, Date, or Text. This will catch the bug above at compile time. 

```
codeunit 10 StringifierWithOverloads 
{ 
    procedure ToString(value : Text) : Text; 
    begin 
        Exit(value); 
    end; 
 
    procedure ToString(value : Date) : Text; 
    begin 
        Exit(Format(value)); 
    end; 
 
    procedure ToString(value : Integer) : Text; 
    begin 
        Exit(Format(value)); 
    end; 
} 
```

## See Also
[AL Development Environment](../devenv-reference-overview.md)  
