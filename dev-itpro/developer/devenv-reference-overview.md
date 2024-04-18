---
title: AL development environment reference overview
description: Overview of the objects in the AL Language development environment.
author: SusanneWindfeldPedersen
ms.custom: evergreen
ms.date: 03/19/2024
ms.reviewer: na
ms.topic: overview
ms.author: solsen
---

# AL development environment reference overview

This section describes all of the objects that are available with the AL Language development environment for [!INCLUDE [prod_short](includes/prod_short.md)]. The AL Language development environment is used to develop extensions for [!INCLUDE [prod_short](includes/prod_short.md)].

## Defining the AL data model

The AL Language development environment provides a set of objects that you can use to define the data model for your extension. These objects include tables, table extensions, and fields. In the table object, you define keys, indexes, and triggers.

|To | See |
|---|-----|
|Learn about how to define new table objects for your extension.|[Table object](devenv-table-object.md)|
|Learn about how to modify and extend existing table objects. |[Table extension object](devenv-table-ext-object.md)|

## Presenting the AL data

To present the AL data, you can define page objects, page extension objects, and page customization objects. You can also define profiles, reports, report extensions, xmlports, queries, and control add-ins.

|To |See |
|---|----|
|Learn about how to create new page objects for your extension.|[Page object](devenv-page-object.md)|
|Learn about how to modify and extend existing page objects.|[Page extension object](devenv-page-ext-object.md)|
|Learn about how to create page customization objects.|[Page customization object](devenv-page-customization-object.md)|
|Learn about how to create profile objects.|[Profile object](devenv-profile-object.md)|
|Learn about how to create report objects.|[Report object](devenv-report-object.md)|
|Learn about how to create report extension objects.|[Report extension object](devenv-report-ext-object.md)|
|Learn about how to create xmlport objects.|[XmlPort object](devenv-xmlport-object.md)|
|Learn about how to create query objects.|[Query object](devenv-query-object.md)|
|Learn about how to create control add-in objects.|[Control add-in object](devenv-control-addin-object.md)|

## Controlling access to data

To control data access, you can define permission sets, permission set extensions, and entitlement objects.

|To |See |
|---|----|
|Learn about how to create entitlement objects.|[Entitlement object](devenv-entitlement-object.md)|
|Learn about how to create permissionset objects.|[Permissionset object](devenv-permissionset-object.md)|
|Learn about how to create permissionset extension objects.|[Permissionset extension object](devenv-permissionset-ext-object.md)|


## Writing AL code

The AL code that you write for your extension is defined in codeunit objects, page objects, and table objects. You can also define methods, triggers, and properties for these objects.

|To |See |
|---|----|
|Learn about writing codeunits for your extension.|[Codeunit object](devenv-codeunit-object.md)|
|Get an overview of methods in AL grouped by the data type that they support.|[Data types and methods in AL](methods-auto/library.md)|
|Get an overview of method attributes in AL in alphabetical order.|[Method attributes](attributes/devenv-method-attributes.md)|
|Get an overview of option types in AL in alphabetical order.|[Option types](methods-auto/action/action-option.md)|
|Get an overview of properties in AL grouped by the objects that they support.|[Properties overview](properties/devenv-properties.md)|
|Get an overview of triggers in AL grouped by the objects that they support.|[Triggers overview](triggers-auto/devenv-triggers.md)|

## See also

[Developing extensions](devenv-dev-overview.md)  
[Get started with AL](devenv-get-started.md)  
[FAQ for developing in AL](devenv-dev-faq.md)  
[AL Language extension configuration](devenv-al-extension-configuration.md)
