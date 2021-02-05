---
title: "Variables must be initialized before usage."
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Rule AA0205
Variables must be initialized before usage.  

## Description
Always initialize a variable before usage. This can improve readability and make debugging easier.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule
Using uninitialized variables may lead to strange behavior, the code may become harder to debug and in some cases readability of the code can decrease. 

## Bad code example 1
```AL
var
    x: Integer;
    z: Integer;

procedure Proc1();
var
begin
    Proc2(z);
    x := z;
end;

procedure Proc2(z: Integer);
var
begin
    z := 10;
end;
```

## Good code example 1
```AL
var
    x: Integer;
    z: Integer;

procedure Proc1();
var
begin
    Proc2(z);
    x := z;
end;

procedure Proc2(var z: Integer);
var
begin
    z := 10;
end;
```

## Bad code example 2
```AL
 procedure TestFunc()
    var
        a: Integer;
        b:​ Integer;
    begin
​        b := a + 1;                                                                                                                                                                                                       
    end;
```

## Good code example 2
```AL
procedure TestFunc()
    var
        a: Integer;
        b: Integer;
    begin
        a := 0;
        
        b := a + 1;
    end;
```

## Remarks

​Variables of the following types are analyzed: `Integer`, `BigInteger`, `Boolean`, `Byte`, `Char`, `Code`, `Date`, `DateTime`, `Decimal`, `List`, `Record`, and `Time`.

Some variables need special initialization, for example, `List` is initialized using `.Add()`, `Record` is initialized via `.Init()`, `.Clear()`, or assignment. Local record variables and arrays are ignored. Global record variables can be initialized in other method.

Initialization is possible using evaluate, for, `foreach` statements. If a variable is passed in a method through `var`, the rule considers it initialized in the method.

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  