---
title: "Compiler Warning AL0924"
description: "Interface method '{0}.{1}' will become required."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning AL0924

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Interface method '{0}.{1}' will become required. {2}Add an implementation now to avoid a future breaking change.

## Description
A default interface method is marked with [RequiredPending], indicating it will become mandatory in a future version. Implement it to avoid a breaking change later.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When an interface method has a default implementation and is marked with the `[RequiredPending]` attribute, the interface author is signaling that this method will become required in a future version. The default implementation currently serves as a fallback, but relying on it will result in a compilation error once the method becomes mandatory.

This warning gives implementors a grace period to add their own implementation before the breaking change takes effect.

## How to fix it

Add an explicit implementation of the method in your codeunit. This ensures your code continues to compile when the method becomes required.

## Example of code that triggers AL0924

Given an interface in a dependency module:

```al
interface IPaymentProvider
{
    procedure ProcessPayment(amount: Decimal);

    [RequiredPending('ProcessRefund will become required in v27.0', '27.0')]
    procedure ProcessRefund(amount: Decimal);
    begin
        // Default: no refund support
        Error('Refunds are not supported.');
    end;
}
```

The following codeunit triggers AL0924 because it does not implement `ProcessRefund`:

```al
codeunit 50100 MyPaymentProvider implements IPaymentProvider
{
    procedure ProcessPayment(amount: Decimal);
    begin
        // Payment logic
    end;

    // Warning AL0924: IPaymentProvider.ProcessRefund will become required.
    // The default implementation is used as a fallback for now.
}
```

## Example of how to fix it

Add an explicit implementation of the pending-required method.

```al
codeunit 50100 MyPaymentProvider implements IPaymentProvider
{
    procedure ProcessPayment(amount: Decimal);
    begin
        // Payment logic
    end;

    procedure ProcessRefund(amount: Decimal);
    begin
        // Refund logic - implement before it becomes required
    end;
}
```

## Related information
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
[Compiler Error AL0923](diagnostic-al923.md)  
