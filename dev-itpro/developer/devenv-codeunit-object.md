---
title: Codeunit object
description: Describes the codeunit object, which is a container for business logic in AL for Business Central.
author: SusanneWindfeldPedersen
ms.custom: evergreen
ms.date: 04/18/2024
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
---

# Codeunit object

A codeunit is a container for AL code that you can use in many application objects. You typically implement business logic in codeunits and call the codeunit from the object that needs to perform that specific logic. 

## Snippet support

Typing the shortcut `tcodeunit` will create the basic layout for a codeunit object when using the [!INCLUDE [prod_short](includes/prod_short.md)] in Visual Studio Code.

## Codeunit example

This codeunit example checks whether a given customer has registered a shoe size. If not, the customer is assigned a shoe size of 42. The example is for illustrational purposes only, the customer table doesn't have a `ShoeSize` field by default.

The codeunit can be used both as a direct call to `codeunit.run(customer)` or as a call to the procedure inside the codeunit `createcustomer.CheckSize(customer)`.

```AL
codeunit 50113 CreateCustomer
{
    TableNo = Customer;

    trigger OnRun();
    begin
        CheckSize(Rec);
    end;

    procedure CheckSize(var Cust : Record Customer)
    begin
        if not Cust.HasShoeSize() then
            Cust.ShoeSize := 42;
    end;
}
```

## Codeunit self-reference keyword

The `this` keyword can be used in codeunits in AL as a self-reference, and it allows passing the current object as an argument to methods. Additionally, using the `this` keyword enhances readability in larger methods by clearly indicating whether a variable is in the global or local scope. Learn more about the `this` keyword in [Use the this keyword for codeunit self-reference](devenv-al-this-keyword.md).

## Related information

[Developing extensions](devenv-dev-overview.md)  
[Table extension object](devenv-table-ext-object.md)  
[Page extension object](devenv-page-ext-object.md)  
[AL development environment](devenv-reference-overview.md)  
[XML comments in code](devenv-xml-comments.md)  
[Use the this keyword for codeunit self-reference](devenv-al-this-keyword.md).
