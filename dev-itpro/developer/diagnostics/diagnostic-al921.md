---
title: "Compiler Error AL0921"
description: "The method '{0}' cannot be used as the implementation for the interface method '{1}' because it is not public."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0921

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The method '{0}' cannot be used as the implementation for the interface method '{1}' because it is not public.

## Description
Interface implementations must be publicly accessible because interfaces can be invoked across module boundaries. Non-public methods will not be dispatched correctly at runtime.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Interface methods are called through an interface variable, which can be passed across module boundaries. The implementing method must be `public` so that the runtime can dispatch the call correctly. This error is the enforcement version of warning [AL0920](diagnostic-al920.md), which was introduced in an earlier runtime version.

## How to fix it

Change the accessibility of the implementing method to `public` by removing the `local` or `internal` access modifier.

## Example of code that triggers AL0921

```al
interface IValidator
{
    procedure Validate(input: Text): Boolean;
}

codeunit 50100 MyValidator implements IValidator
{
    // Error: internal method cannot implement an interface method.
    internal procedure Validate(input: Text): Boolean;
    begin
        exit(input <> '');
    end;
}
```

## Example of how to fix it

Make the implementing method public.

```al
interface IValidator
{
    procedure Validate(input: Text): Boolean;
}

codeunit 50100 MyValidator implements IValidator
{
    procedure Validate(input: Text): Boolean;
    begin
        exit(input <> '');
    end;
}
```

## Related information
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
[Compiler Warning AL0920](diagnostic-al920.md)  
