---
title: "Interfaces Overview"
description: "Interfaces in AL are syntactical contracts that can be implemented by a non-abstract method."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Interfaces Overview

An interface in AL is similar to an interface in any other programming language; an interface is a syntactical contract that can be implemented by a non-abstract method. The interface is used to define which capabilities must be available for an object, while allowing actual implementations to differ, as long as they comply with the defined interface.

This allows for writing code that reduces the dependency on implementation details, makes it easier to reuse code, and supports a poly-morphing way of calling object methods, which again can be used for substituting business logic.

The interface object declares an interface name along with its methods, and objects that implement the interface methods, must use the `implements` keyword along with the interface name(s). The interface object itself does not contain any code, only signatures, and cannot itself be called from code, but must be implemented by other objects.
 
The compiler checks to ensure that implementations adhere to assigned interfaces.

You can declare variables as a given interface to allow passing objects that implement the interface, and then call interface implementations on the passed object in a polymorphic manner.

## Snippet support

## Interface example

The following example ...

```
interface IAddressProvider 
{ 
    procedure getAddress(): Text; 
} 

interface IShipping 
{ 
    procedure GetShippingMethod(); 
} 

codeunit 50200 CompanyAddressProvider implements IAddressProvider 
{ 

    trigger OnRun() 
    begin 
    end; 

    var 
        myInt: Integer; 

    procedure getAddress(): Text; 

    begin 
        exit('Microsoft address \ Denmark 2800') 
    end; 
} 


codeunit 50201 PrivateAddressProvider implements IAddressProvider 
{ 
    trigger OnRun() 
    begin 
    end; 

    var 
        myInt: Integer; 

    procedure getAddress(): Text; 

    begin 
        exit('My Home address \ Denmark 2800') 
    end; 
} 


page 50200 MyPage
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
                    Message(iAddressProvider.getAddress());

                end;

            }

            action(sendHome)
            {
                ApplicationArea = All;

                trigger OnAction()

                begin
                    sendTo := sendTo::Private
                end;
            }

            action(sendWork)
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
```

## See Also