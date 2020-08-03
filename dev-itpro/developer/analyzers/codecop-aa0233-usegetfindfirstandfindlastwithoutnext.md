---
title: "Use Get(), FindFirst() and FindLast() without Next() method."
ms.author: solsen
ms.custom: na
ms.date: 07/16/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Rule AA0233
Use Get(), FindFirst() and FindLast() without Next() method.  

## Description
Avoid enumeration of a dataset when the dataset is not filtered.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Reason for the rule
If you use `FindFirst()`, `FindLast()`, or `Get()`, then the database query will only fetch a single record and must fetch again when you call `Next()`, which will lower performance.

## Bad code example
```
codeunit 1 MyCodeunit
{
   var
      customer: Record Customer;
                
   procedure Foo()
   begin
      ...
      customer.FindFirst();
      ...
      customer.Next();
      ...
   end;
}
```

## Good code example

```
codeunit 1 MyCodeunit
{
   var
      customer : Record Customer;
                
   procedure Foo()
   begin
      ...
      customer.FindFirst();
      ...
      end;
}
```

## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  