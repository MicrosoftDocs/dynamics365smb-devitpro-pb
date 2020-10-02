---
title: "Codeunit Object"
description: "Description of the codeunit object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

# Codeunit Object
A codeunit is a container for AL code that you can use in many application objects. You typically implement business logic in codeunits and call the codeunit from the object that needs to perform that specific logic.

## Snippet support
Typing the shortcut `tcodeunit` will create the basic layout for a codeunit object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Codeunit example
This codeunit example checks whether a given customer has registered a shoe size. If not, the customer is assigned a shoe size of 42.

The codeunit can be used both as a direct call to `codeunit.run(customer)` or as a call to the procedure inside the codeunit `createcustomer.CheckSize(customer)`.

```
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

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[Table Extension Object](devenv-table-ext-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[AL Development Environment](devenv-reference-overview.md)  
[XML Comments in Code](devenv-xml-comments.md)
