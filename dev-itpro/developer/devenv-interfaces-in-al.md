---
title: Interfaces in AL
description: Interfaces in AL are syntactical contracts that can be implemented by a nonabstract method.
author: SusanneWindfeldPedersen
ms.date: 06/26/2025
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

Interfaces in AL can be extended to allow additional changes to interfaces without changing the core functionality. Learn more in [Extending interfaces in AL](devenv-interfaces-in-al-extend.md).

## Interface creation

When creating interfaces, consider the following guidelines:

- Use meaningful names for interfaces that clearly convey their purpose.
- Keep interfaces focused and cohesive, with a small number of related methods.
- Use versioning for interfaces to manage changes over time.
- Document the expected behavior of each method in the interface.
- Consider using default implementations for methods in interfaces to reduce boilerplate code.

## Best practices and design guidelines

- Avoid adding methods to published interfaces. Analyzer rule [AS0066](analyzers/appsourcecop-as0066.md).
- Design interfaces with extension in mind. Learn more in [Extending interfaces in AL](devenv-interfaces-in-al-extend.md).
- Understand circular reference limitations. Analyzer rule [AL0852](analyzers/appsourcecop-al0852.md)
- Interfaces can only contain procedure declarations. Analyzer rules [AL0584](diagnostics/AL0584.md), [AL0585](diagnostics/al0585.md), [AL0612](diagnostics/al0612.md).
- Avoiding naming conflicts with built-in procedures. Analyzer rule [AL0616](diagnostics/al0616.md)
- Implementing multiple interfaces. Analyzer rules [AL0587](diagnostics/AL0587.md), [AL0675](diagnostics/AL0675.md).




**"Troubleshooting" section**
   - Common implementation errors (AL0582, AL0595)
   - Interface extension issues (AL0852, AL0867, AL0868)
   - Accessibility considerations (AL0748, AL0749)

**Add "Interface Evolution" guidance**
   - How to handle the need for new methods in published interfaces
   - Alternative patterns to avoid breaking changes
   - Version control for interfaces


<!--

### Diagnostics for designing interfaces

| Diagnostic | Description |
|------------|-------------|
| AL0584 | An interface member cannot have any variables. |
| AL0585 | An interface cannot have any variables. |
| AL0612 | An interface member must be a 'procedure'. |
| AL0616 | Defining a contract that matches a built-in codeunit procedure on an interface is not allowed. |

## 2. Interface Implementation

| Diagnostic | Description |
|------------|-------------|
| AL0582 | A class does not implement an interface member that is required. |
| AL0587 | An interface is already listed in the implementation list (duplicate). |
| AL0595 | A class claims to implement an interface but doesn't fully implement it. |
| AL0596 | A value doesn't implement the required interface and there is no default implementation. |

## 3. Interface Extension

| Diagnostic | Description |
|------------|-------------|
| AL0852 | Interface cannot extend another interface if it causes a circular reference. |
| AL0867 | A method is already declared in an interface in another extension. |
| AL0868 | A method from this interface is already declared in another interface, making it impossible to invoke this method via this interface. |

## 4. Interface Publishing and Versioning

| Diagnostic | Description |
|------------|-------------|
| AS0066 | A new method cannot be added to an interface that has been published because dependent extensions may break. |

## 5. Interface Accessibility

| Diagnostic | Description |
|------------|-------------|
| AL0675 | An implementation for an interface is already specified in the list. |
| AL0748 | Return types with 'Internal' accessibility may not be usable outside of the module. |
| AL0749 | Parameter types with 'Internal' accessibility may cause issues when calling the method from outside the module. |
>
-->

## Snippet support

Typing the shortcut `tinterface` creates the basic layout for an interface object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.


## Interface example

The following example defines an interface `IAddressProvider`, which has one method `getAddress` with a certain signature. The codeunits `CompanyAddressProvider` and `PrivateAddressProvider` both implement the `IAddressProvider` interface, and each define a different implementation of the `getAddress` method; in this case a simple variation of address value.

The `MyAddressPage` is a simple page with an action that captures the choice of address and calls, based on that choice, an implementation of the `IAddressProvider` interface.

```AL
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

## Related information

[Codeunit object](devenv-codeunit-object.md)  
[Extensible enums](devenv-extensible-enums.md)  
[Extending interfaces in AL](devenv-interfaces-in-al-extend.md)  
[Type testing and casting operators for interfaces](devenv-interfaces-in-al-operators.md)  
[Dictionary data type](methods-auto/dictionary/dictionary-data-type.md)  
[List data type](methods-auto/list/list-data-type.md)  
