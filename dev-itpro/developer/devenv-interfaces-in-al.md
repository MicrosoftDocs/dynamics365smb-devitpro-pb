---
title: "Interfaces in AL"
description: "Interfaces in AL are syntactical contracts that can be implemented by a non-abstract method."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Interfaces in AL

An interface in AL is similar to an interface in any other programming language; it is a syntactical contract that can be implemented by a non-abstract method. The interface is used to define which capabilities must be available for an object, while allowing actual implementations to differ, as long as they comply with the defined interface.

This allows for writing code that reduces the dependency on implementation details, makes it easier to reuse code, and supports a polymorphic way of calling object methods, which again can be used for substituting business logic.

The interface declares an interface name along with its methods, and codeunits that implement the interface methods, must use the `implements` keyword along with the interface name(s). The interface itself does not contain any code, only signatures, and cannot itself be called from code, but must be implemented by other objects.
 
The AL compiler checks to ensure that implementations adhere to assigned interfaces.

You can declare variables as a given interface to allow passing objects that implement the interface, and then call interface implementations on the passed object in a polymorphic manner.

## Snippet support
Typing the shortcut `tinterface` will create the basic layout for an interface object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.


## Interface example

The following example defines an interface `IAddressProvider`, which has one method `getAddress` with a certain signature. The codeunits `CompanyAddressProvider` and `PrivateAddressProvider` both implement the `IAddressProvider` interface, and each define a different implementation of the `getAddress` method; in this case a simple variation of address value.

The `MyAddressPage` is a simple page with an action that captures the choice of address and calls, based on that choice, an implementation of the `IAddressProvider` interface.

```AL
interface IAddressProvider
{
    procedure GetAddress(): Text;
}

codeunit 50200 CompanyAddressProvider implements IAddressProvider
{
    procedure GetAddress(): Text;

    begin
        exit('Company address \ Denmark 2800')
    end;
}

codeunit 50201 PrivateAddressProvider implements IAddressProvider
{
    procedure GetAddress(): Text;

    begin
        exit('My Home address \ Denmark 2800')
    end;
}

enum 50200 SendTo
{
    Extensible = true;

    value(0; Company)
    {
    }

    value(1; Private)
    {
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
            group(GroupName)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()

                var
                    iAddressProvider: Interface IAddressProvider;

                begin
                    AddressproviderFactory(iAddressProvider);
                    Message(iAddressProvider.GetAddress());

                end;

            }

            action(SendToHome)
            {
                ApplicationArea = All;

                trigger OnAction()

                begin
                    sendTo := sendTo::Private
                end;
            }

            action(SendToWork)
            {
                ApplicationArea = All;

                trigger OnAction()

                begin
                    sendTo := sendTo::Company
                end;
            }
        }
    }

    local procedure AddressproviderFactory(var iAddressProvider: Interface IAddressProvider)
    var
        CompanyImplementer: Codeunit CompanyAddressProvider;
        PrivateImplementer: Codeunit PrivateAddressProvider;
    begin

        if sendTo = sendTo::Company then
            iAddressProvider := CompanyImplementer;

        if sendTo = sendTo::Private then
            iAddressProvider := PrivateImplementer;

    end;

    var
        sendTo: enum SendTo;

```

## See Also

[Codeunit Object](devenv-codeunit-object.md)  
[Extensible Enums](devenv-extensible-enums.md)  