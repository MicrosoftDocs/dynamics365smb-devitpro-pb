---
title: Interfaces in AL
description: Learn about interfaces in AL, including default method implementations and the RequiredPending attribute for evolving interfaces safely.
author: SusanneWindfeldPedersen
ms.date: 08/25/2026
ms.topic: article
ms.author: solsen
ms.collection: get-started
ms.reviewer: solsen
---

# Interfaces in AL

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

An interface in AL is similar to an interface in any other programming language; it's a syntactical contract that can be implemented by a nonabstract method. The interface is used to define which capabilities must be available for an object, while allowing actual implementations to differ, as long as they comply with the defined interface. 

This allows for writing code that reduces the dependency on implementation details, makes it easier to reuse code, and supports a polymorphic way of calling object methods, which again can be used for substituting business logic.

The interface declares an interface name along with its methods, and codeunits that implement the interface methods, must use the `implements` keyword along with one or more interface names. The interface itself doesn't contain any code, only signatures, and can't itself be called from code, but must be implemented by other objects.
 
The AL compiler checks to ensure that implementations adhere to assigned interfaces.

You can declare variables as a given interface to allow passing objects that implement the interface, and then call interface implementations on the passed object in a polymorphic manner.

> [!NOTE]  
> With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 1, you can use the **Go to Implementations** option in the Visual Studio Code context menu (or press <kbd>Ctrl</kbd>+<kbd>F12</kbd>) on an interface to view all the implementations within scope for that interface. This is supported on interfaces, and on codeunits and enums, which implement an interface, as well as on their procedures if they map to a procedure on an interface. It's also supported on codeunit variables of type interface to jump to other implementations of that specific interface.

## Extending interfaces

[!INCLUDE [2024-releasewave2](../includes/2024-releasewave2.md)]

Interfaces in AL can be extended to allow other changes to interfaces without changing the core functionality. Learn more in [Extending interfaces in AL](devenv-interfaces-in-al-extend.md).

## Default interface methods

[!INCLUDE [2026-releasewave2](../includes/2026-releasewave2.md)]

Interface methods can include a default implementation (a body). Methods with a body are optional - implementing codeunits don't have to override them. Methods without a body remain required and must be implemented by every codeunit that uses the interface.

Default interface methods let you add new functionality to a published interface without breaking existing implementors. Because the new method already has a body, existing codeunits continue to compile and use the default behavior until they choose to override it.

When you use **Go to Implementations** on an overriding method in a codeunit, the results include the matching default interface method and explicit implementations in other codeunits.

### Syntax

```AL
interface IMyInterface
{
    // Required method - all implementors must provide this
    procedure RequiredMethod();

    // Default method - implementors can override, but don't have to
    procedure OptionalMethod(): Text
    begin
        exit('default value');
    end;
}
```

### Runtime identity

The interface runtime identifier is computed from the required (non-default) methods only. Adding a default method to a published interface doesn't change the runtime identifier, which means dependent extensions don't need to be recompiled.

### Transitioning default methods to required

When you decide that a default method must be implemented by all consumers, you can't simply remove the body in the next version. That change would break existing implementations. Instead, follow the two-phase transition using the [RequiredPending attribute](attributes/devenv-requiredpending-attribute.md):

1. **Phase 1**: Add `[RequiredPending]` to the default method. Implementors receive a compiler warning (AL0924) encouraging them to add their own implementation.
2. **Phase 2**: In a later major version, remove the body and the `[RequiredPending]` attribute to make the method required. The AppSourceCop rule [AS0149](analyzers/appsourcecop-as0149.md) warns about the runtime ID change.

Skipping Phase 1 and directly removing the body triggers [AS0148](analyzers/appsourcecop-as0148.md), which is an error.

Learn more in [Interface method lifecycle](devenv-interface-method-lifecycle.md).

## Interface creation

When creating interfaces, consider the following guidelines:

- Use meaningful names for interfaces that clearly convey their purpose.
- Keep interfaces focused and cohesive, with a few related methods.
- Use versioning for interfaces to manage changes over time.
- Document the expected behavior of each method in the interface.
- Consider using [default implementations](#default-interface-method-implementations) for methods in interfaces to reduce boilerplate code.

## Some design guidelines

- Avoid adding required methods to published interfaces. Analyzer rule [AS0066](analyzers/appsourcecop-as0066.md) catches this condition.
- Use default methods to add new functionality to published interfaces safely.
- Use `[RequiredPending]` when a default method must eventually become required. Learn more in [RequiredPending attribute](attributes/devenv-requiredpending-attribute.md).
- Design interfaces with extension in mind. Learn more in [Extending interfaces in AL](devenv-interfaces-in-al-extend.md).
- Understand circular reference limitations. Analyzer rule [AL0852](diagnostics/diagnostic-al852.md) catches this.
- Interfaces can only contain procedure declarations. The analyzer rules [AL0584](diagnostics/diagnostic-al584.md), [AL0585](diagnostics/diagnostic-al585.md), and [AL0612](diagnostics/diagnostic-al612.md) catch this.
- Avoid naming conflicts with built-in procedures. Analyzer rule [AL0616](diagnostics/diagnostic-al616.md) catches this.
- When implementing multiple interfaces avoid duplication. The analyzer rules [AL0587](diagnostics/diagnostic-AL587.md) and [AL0675](diagnostics/diagnostic-AL675.md) catch this.
- Learn more about the full lifecycle of interface methods in [Interface method lifecycle](devenv-interface-method-lifecycle.md).

## Snippet support

Typing the shortcut `tinterface` creates the basic layout for an interface object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.


## Interface example

The following example defines an interface `IAddressProvider`, which has one method `getAddress` with a certain signature. The codeunits `CompanyAddressProvider` and `PrivateAddressProvider` both implement the `IAddressProvider` interface, and each define a different implementation of the `getAddress` method; in this case a simple variation of address value.

The `MyAddressPage` is a simple page with an action that captures the choice of address and calls, based on that choice, an implementation of the `IAddressProvider` interface.

```AL
namespace MyCompany.AddressManagement;

interface "IAddressProvider"
{
    procedure GetAddress(): Text
}

codeunit 50200 CompanyAddressProvider implements IAddressProvider
{

    procedure GetAddress(): Text
    var
        ExampleAddressLbl: Label 'Company address \ Denmark 2800';
        
    begin
        exit(ExampleAddressLbl);
    end;
}

codeunit 50201 PrivateAddressProvider implements IAddressProvider
{

    procedure GetAddress(): Text
    var
        ExampleAddressLbl: Label 'My Home address \ Denmark 2800';

    begin
        exit(ExampleAddressLbl);
    end;
}

enum 50200 SendTo implements IAddressProvider
{
    Extensible = true;

    value(0; Company)
    {
        Implementation = IAddressProvider = CompanyAddressProvider;
    }

    value(1; Private)
    {
        Implementation = IAddressProvider = PrivateAddressProvider;
    }
}

page 50200 MyAddressPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(MyGroup)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GetAddress)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    AddressProvider: Interface IAddressProvider;
                begin
                    AddressproviderFactory(AddressProvider);
                    Message(AddressProvider.GetAddress());
                end;
            }

            action(SendToHome)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    sendTo := sendTo::Private;
                end;
            }

            action(SendToWork)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    sendTo := sendTo::Company;
                end;
            }
        }
    }

    local procedure AddressproviderFactory(var iAddressProvider: Interface IAddressProvider)
    begin
        iAddressProvider := sendTo;
    end;

    var
        sendTo: enum SendTo;
}
```


## Create List and Dictionary of an interface

[!INCLUDE [2025rw1_and_later](includes/2025rw1_and_later.md)]

The [Dictionary](methods-auto/dictionary/dictionary-data-type.md) and [List](methods-auto/list/list-data-type.md) data types offer efficient lookup of key-value pairs and ordered collections, and allow managing collections of data dynamically. From runtime 15.0, you can create lists or dictionaries of interfaces.

The following example illustrates how to create a [Dictionary](methods-auto/dictionary/dictionary-data-type.md) of interfaces:

```AL
namespace MyCompany.BarcodeExamples;

using System.Text;

codeunit 50120 MyDictionaryCodeunit
{
    procedure MyProcedure(): Dictionary of [Integer, Interface "Barcode Font Provider"]
    var
        localDict: Dictionary of [Integer, Interface "Barcode Font Provider"];
        IProvider: Interface "Barcode Font Provider";
    begin
        localDict.Add(2, IProvider);
        exit(localDict);
    end;
}
```

The following example illustrates how to create a [List](methods-auto/list/list-data-type.md) of interfaces:

```al
namespace MyCompany.ShapeExamples;

interface IShape
{
    procedure GetArea(): Decimal;
}

codeunit 50101 Circle implements IShape
{
    procedure GetArea(): Decimal
    var
        Radius: Decimal;
    begin
        Radius := 5; // Example radius
        exit(3.14 * Radius * Radius); // Area of a circle: πr²
    end;
}

codeunit 50102 Square implements IShape
{
    procedure GetArea(): Decimal
    var
        SideLength: Decimal;
    begin
        SideLength := 4; // Example side length
        exit(SideLength * SideLength); // Area of a square: side²
    end;
}

codeunit 50103 ShapeListDemo
{
    trigger OnRun()
    var
        ShapeList: List of [Interface IShape];
        Shape: Interface IShape;
        CircleShape: Codeunit Circle;
        SquareShape: Codeunit Square;
    begin
        // Add instances of Circle and Square to the list
        ShapeList.Add(CircleShape);
        ShapeList.Add(SquareShape);

        // Iterate through the list and display the area of each shape

        foreach Shape in ShapeList do begin
            Message('The area of the shape is: %1', Shape.GetArea());
        end;
    end;
}
```

In the System Application, you can find the complete examples of using a list of interfaces in the [Telemetry Logger](https://github.com/search?q=repo%3Amicrosoft%2FBCApps+%22List+of+%5BInterface%22&type=code).

## Default interface method implementations

> **APPLIES TO:** Business Central 2026 release wave 2 and later, runtime version 18.0+

Interfaces can include method bodies that serve as *default implementations*. Codeunits that implement the interface can omit these methods to inherit the default behavior, or provide their own implementation to override it.

Default methods let you evolve interfaces over time without breaking existing implementors. When you add a new method with a default body, all codeunits that already implement the interface continue to compile and run — they inherit the default behavior automatically.

### Syntax

Define a default method by adding a body to a method declaration inside the interface object:

```al
interface IPaymentMethod
{
    // Default implementation — implementors can omit or override
    procedure GetTransactionFee(): Decimal
    begin
        exit(0);
    end;

    // Abstract — must be implemented
    procedure ValidateAmount(Amount: Decimal): Boolean;
}
```

### Implementing an interface with default methods

When a codeunit implements an interface that has default methods, the codeunit can choose to:

- **Inherit** the default by not declaring the method at all.
- **Override** the default by declaring its own implementation.

```al
codeunit 50100 CashPayment implements IPaymentMethod
{
    // GetTransactionFee is inherited from the interface default

    procedure ValidateAmount(Amount: Decimal): Boolean
    begin
        exit(Amount > 0);
    end;
}

codeunit 50101 CreditCardPayment implements IPaymentMethod
{
    // Override the default
    procedure GetTransactionFee(): Decimal
    begin
        exit(2.5);
    end;

    procedure ValidateAmount(Amount: Decimal): Boolean
    begin
        exit(Amount > 0);
    end;
}
```

### Dispatch behavior

Default methods are dispatched through the interface variable, not through the implementing codeunit's public API. This means you must call the method on an `Interface` variable:

```al
procedure ShowFee()
var
    PaymentMethod: Interface IPaymentMethod;
    Cash: Codeunit CashPayment;
begin
    PaymentMethod := Cash;
    Message('Fee: %1', PaymentMethod.GetTransactionFee()); // Returns 0 (default)
end;
```

Calling `GetTransactionFee()` directly on a `Codeunit CashPayment` variable won't work if the codeunit doesn't declare the method — use an `Interface IPaymentMethod` variable instead.

## The RequiredPending attribute

The `[RequiredPending]` attribute marks a default interface method as becoming required (abstract) in a future version. This attribute gives implementors advance notice to add their own implementation before the default body is removed.

When applied, the compiler reports a warning for any codeunit that relies on the default implementation instead of providing its own.

### Syntax

```al
interface IPaymentMethod
{
    [RequiredPending('Will become mandatory in v28.0', '28.0')]
    procedure GetTransactionFee(): Decimal
    begin
        exit(0);
    end;
}
```

The attribute takes two parameters:

- **Message** — A description shown in the compiler warning, explaining why and when the method becomes required.
- **Version** — The version in which the method becomes required. This parameter is informational and doesn't trigger automatic enforcement.

### Lifecycle for evolving interfaces

The `[RequiredPending]` attribute supports a safe transition lifecycle for published interfaces:

1. **Add method with default body** — Existing implementers continue to work without changes.
2. **Mark as `[RequiredPending]`** — Implementers receive a compiler warning prompting them to add their own implementation.
3. **Remove the default body** — The method becomes abstract (required). Implementers that didn't update now get a compiler error.

The AppSourceCop rules [AS0148](analyzers/appsourcecop-as0148.md) and [AS0149](analyzers/appsourcecop-as0149.md) enforce this lifecycle.

## Related information

[Codeunit object](devenv-codeunit-object.md)  
[Extensible enums](devenv-extensible-enums.md)  
[Extending interfaces in AL](devenv-interfaces-in-al-extend.md)  
[Type testing and casting operators for interfaces](devenv-interfaces-in-al-operators.md)  
[Interface method lifecycle](devenv-interface-method-lifecycle.md)  
[RequiredPending attribute](attributes/devenv-requiredpending-attribute.md)  
[Dictionary data type](methods-auto/dictionary/dictionary-data-type.md)  
[List data type](methods-auto/list/list-data-type.md)  
