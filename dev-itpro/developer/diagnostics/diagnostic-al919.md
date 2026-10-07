---
title: "Compiler Error AL0919"
description: "The Scope attribute is not allowed on interface members."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0919

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The Scope attribute is not allowed on interface members.

## Description
Interface methods cannot have specific compilation scope restrictions because interfaces must be implementable by any codeunit regardless of its scope.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Interface methods define a contract that any implementing codeunit must fulfill. Applying a `Scope` attribute to an interface method would restrict which codeunits can implement the interface, contradicting the purpose of interfaces as general contracts.

## How to fix it

Remove the `Scope` attribute from the interface method declaration. If you need scope restrictions, apply them on the implementing codeunit's methods instead.

## Example of code that triggers AL0919

```al
interface IMyInterface
{
    [Scope('OnPrem')]
    procedure DoWork();
}
```

## Example of how to fix it

Remove the `Scope` attribute from the interface method.

```al
interface IMyInterface
{
    procedure DoWork();
}
```

## Related information
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
