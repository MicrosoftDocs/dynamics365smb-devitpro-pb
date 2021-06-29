---
title: "CodeCop Rule AA0150"
ms.author: solsen
ms.custom: na
ms.date: 05/05/2021
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
# CodeCop Rule AA0150
Do not declare parameters by reference if their values are never changed.

## Description
Do not declare parameters by reference if their values are never changed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule
Defining a parameter as passed by reference and not actually changing it may lead to an unexpected variable value if the variable is later changed in the method. In addition, other developers may think that the value is changed in the method, eventhough that is not true.

## Bad code example 1
The following example illustrates the developer's error - forgot to remove var property of MyList in Method1, after redesigning Method2.
```AL
procedure Method1(var MyB: boolean)
begin
Method2(MyB);
end;

procedure Method2(MyC: boolean)
var
someVar: boolean;
begin
someVar := MyC;
end;
```

## Good code example 1
```AL
procedure Method1(MyB: boolean)
begin
Method2(MyB);
end;

procedure Method2(MyC: boolean)
var
someVar: boolean;
begin
someVar := MyC;
end;
```

## Bad code example 2
```AL
procedure Method1(var InvtValue: array[5] of Integer)
var 
MyInt: Integer;
begin
MyInt := InvtValue[0];
end;
``` 

## Good code example 2
```AL
procedure Method1(InvtValue: array[5] of Integer)
var 
MyInt: Integer;
begin
MyInt := InvtValue[0];
end;
``` 

## Remarks 

Variables of the following types are analyzed: `Integer`, `BigInteger`, `Boolean`, `Byte`, `Char`, `Code`, `Date`, `DateTime`, `Decimal`, `Time`, and `Text`. Also lists and arrays of above types are analyzed - these types should be changed with appropriate methods if they are passed by reference. 

Event subscribers, Integration Events, and ConfirmHanders are also not analyzed. Parameters of the type `List` can be also changed following built-in methods: `Add`, `AddRange`, `Set`, `Insert`, `Remove`, `RemoveAt`, `RemoveRange`, `Reverse`. `Arrays` additionally changed by `CompressArray` and `CopyArray`. Also the `Evaluate` built-in method is supported. 

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  