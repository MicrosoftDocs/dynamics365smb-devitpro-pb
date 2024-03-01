---
title: Programming in AL
ms.custom: na
ms.date: 03/01/2024
ms.reviewer: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
ms.collection: get-started
---

# Programming in AL

AL is the programming language that is used for manipulating data such as retrieving, inserting, and modifying records in a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] database. It controls the execution of the various application objects, such as pages, reports, or codeunits. 

With AL, you can create business rules to ensure that the data, which is stored in the database is meaningful and consistent with the way customers do business. Through AL programming, you can:

- Add new data or transfer data from one table to another, for example, from a journal table to a ledger table.
- Combine data from multiple tables into one report or display it on one page.
- Perform calculations, such as calculating the total amount of a sales order.
- Control the flow of the application, for example, by showing a message box when a certain condition is met.
- Create new or modify existing objects, such as a page or a report.

## Where to write AL code

Almost every object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] contains triggers where you can add your AL code. Triggers exist for the following objects.

- Tables and table extensions
- Table fields  
- Pages and page extensions
- Reports and report extensions
- Data items
- XMLports  
- Queries  

You can initiate the execution of your AL code from the following ways:  

- Actions  
- Any object that has an instantiation of the object that contains AL code. An example of an instantiation is a variable declaration  

> [!NOTE]  
> If the AL code is in a `local` method, then you can't run it from another object.  

## Variable declarations

Variables in AL are declared using the `var` keyword, and the syntax looks like this:

```AL
var
        myInt: Integer;
```

If you've multiple variables of the same type, these can be declared in one line, such as:

```AL
var
        myInt, nextInt, thirdInt : Integer;
        isValid, doCheck : Boolean;
```

The `protected` keyword can be used to make variables accessible between tables and table extensions and between pages and page extensions. For more information, see [Protected variables](devenv-protected-variables.md).

## Guidelines for placing AL code  

We recommend the following guidelines for AL code:  

- In general, write the code in codeunits instead of on the object on which it operates. This promotes a clean design and enables reusing code. It also helps enforce security. For example, typically users don't have direct access to tables that contain sensitive data, such as the **General Ledger Entry** table, nor do they have permission to modify objects. If you put the code that operates on the general ledger in a codeunit, give the codeunit access to the table, and give the user permission to run that codeunit. This way, security of the table won't be compromised and the user will be able to access the table.  

- If you must put code on an object instead of in a codeunit, then put the code as close as possible to the object on which it operates. For example, put code that modifies records in the triggers of the table fields.  

## Reusing code

Reusing code makes developing applications both faster and easier. More importantly, if you organize your AL code as suggested, your applications are less prone to errors. By centralizing the code, you don't unintentionally create inconsistencies by performing the same calculation in many places, for example, in several triggers that have the same table field as their source expression. If you have to change the code, you could either forget about some of these triggers or make a mistake when you modify one of them.

## See also

[Simple statements](devenv-al-simple-statements.md)  
[Control statements](devenv-al-control-statements.md)  
[Methods](devenv-al-methods.md)  
[System-defined variables](devenv-system-defined-variables.md)  
[AL operators](devenv-al-operators.md)  
[Developing extensions](devenv-dev-overview.md)  
[Get started with AL](devenv-get-started.md)
