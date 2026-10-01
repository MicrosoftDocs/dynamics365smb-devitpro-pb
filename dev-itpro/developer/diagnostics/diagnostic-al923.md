---
title: "Compiler Error AL0923"
description: "The attribute '[RequiredPending]' can only be applied to interface methods with a default implementation."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0923

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The attribute '[RequiredPending]' can only be applied to interface methods with a default implementation.

## Description
The [RequiredPending] attribute is only valid on interface methods that have a body (default implementation). Methods without a body are already required.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `[RequiredPending]` attribute signals that an optional interface method (one with a default implementation) will become required in a future version. Applying it to a method without a body is meaningless because methods without a default implementation are already required -- all implementors must provide them.

## How to fix it

Either add a default implementation (body) to the interface method, or remove the `[RequiredPending]` attribute.

## Example of code that triggers AL0923

```al
interface INotification
{
    // Error: RequiredPending on a method without a body.
    // This method is already required because it has no default implementation.
    [RequiredPending('This will become required', '27.0')]
    procedure Notify(message: Text);
}
```

## Example of how to fix it

If the method should be required, simply remove the `[RequiredPending]` attribute. It is already required because it has no body.

```al
interface INotification
{
    procedure Notify(message: Text);
}
```

If you intend to make the method optional now and required later, add a default implementation body.

```al
interface INotification
{
    [RequiredPending('Implementors must provide Notify by v27.0', '27.0')]
    procedure Notify(message: Text);
    begin
        // Default no-op implementation.
        // Implementors should override this.
    end;
}
```

## Related information
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
[Compiler Warning AL0924](diagnostic-al924.md)  
