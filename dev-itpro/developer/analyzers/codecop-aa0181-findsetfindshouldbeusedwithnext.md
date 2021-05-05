---
title: "CodeCop Rule AA0181"
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
# CodeCop Rule AA0181
The FindSet() or Find() methods must be used only in connection with the Next() method.

## Description
Avoid getting the dataset when an enumeration is not used, which will decrease performance.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule
If you use `FindSet()` or `Find()` you must have a `Next()` method. Otherwise, you are wasting CPU and bandwidth since multiple records are loaded but you only use one.

## Bad code example
```AL
codeunit 1 MyCodeunit
{
   var
      customer: Record Customer;
                
   procedure Foo()
   begin
      if customer.FindFirst() then
         repeat
         ...
         until customer.Next() = 0;
      end;
}
```

## Good code example
```AL
codeunit 1 MyCodeunit
{
   var
      customer : Record Customer;
                
   procedure Foo()
   begin
      if customer.FindSet() then
         repeat
         ...
         until customer.Next() = 0;
      end;
}
```

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  