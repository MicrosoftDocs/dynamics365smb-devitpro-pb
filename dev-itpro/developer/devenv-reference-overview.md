---
title: AL development environment reference overview
description: Overview of the objects in the AL Language development environment.
author: SusanneWindfeldPedersen
ms.custom: evergreen
ms.date: 05/14/2025
ms.topic: overview
ms.author: solsen
ms.reviewer: solsen
---

# AL development environment reference overview

> [!TIP]
> New to AL? Start with our [Quick Reference Guide](#quick-reference-guide) below or try the [Get started with AL](devenv-get-started.md) article.

This section provides a comprehensive reference to the objects, properties, trigger, attributes, and methods available in the AL Language development environment for [!INCLUDE [prod_short](includes/prod_short.md)]. Whether you're building your first extension or enhancing existing solutions, this guide can help you navigate the capabilities of AL.

## Quick reference guide

|If you want to | Start here |
|----------------|------------|
|Create a new extension | [Get started with AL](devenv-get-started.md) |
|Work with data | [Table object](devenv-table-object.md) |
|Build UI | [Page object](devenv-page-object.md) |
|Add business logic | [Codeunit object](devenv-codeunit-object.md) |
|Find methods/properties | [Properties overview](properties/devenv-properties.md) |
|Debug your code | [Debugging in AL](/dynamics365/business-central/dev-itpro/developer/devenv-debugging) |

## Define the AL data model

The data model is the foundation of your Business Central extension. AL provides powerful objects to define, store, and manipulate business data.

|To | See |
|---|-----|
|Learn about how to define new table objects for your extension.|[Table object](devenv-table-object.md)|
|Learn about how to modify and extend existing table objects. |[Table extension object](devenv-table-ext-object.md)|

## Present the AL data

Create intuitive user interfaces to display and interact with your data using pages, reports, and other presentation objects.

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

## Write business logic in AL

The real power of AL comes from the ability to implement custom business logic that makes your extension valuable to users.

|To |See |
|---|----|
|Learn about writing codeunits for your extension.|[Codeunit object](devenv-codeunit-object.md)|
|Get an overview of methods in AL grouped by the data type that they support.|[Data types and methods in AL](methods-auto/library.md)|
|Get an overview of method attributes in AL in alphabetical order.|[Method attributes](attributes/devenv-method-attributes.md)|
|Get an overview of option types in AL in alphabetical order.|[Option types](methods-auto/action/action-option.md)|
|Get an overview of properties in AL grouped by the objects that they support.|[Properties overview](properties/devenv-properties.md)|
|Get an overview of triggers in AL grouped by the objects that they support.|[Triggers overview](triggers-auto/devenv-triggers.md)|


## Control access to data

Security is a critical aspect of any business application. AL provides objects to define and manage permissions.

|To |See |
|---|----|
|Learn about how to create entitlement objects.|[Entitlement object](devenv-entitlement-object.md)|
|Learn about how to create permissionset objects.|[Permissionset object](devenv-permissionset-object.md)|
|Learn about how to create permissionset extension objects.|[Permissionset extension object](devenv-permissionset-ext-object.md)|

## Get started with your first AL extension

Ready to build your first extension? Follow these steps:

1. **Set up your development environment** - Install Visual Studio Code and the AL Language extension.
2. **Create a new AL project** - Use the AL:Go! command in Visual Studio Code.
3. **Define your data model** - Create tables and fields.
4. **Build your user interface** - Design pages to display and interact with data.
5. **Add business logic** - Write codeunits to implement your functionality.
6. **Test and publish** - Deploy your extension to Business Central.

Learn more in [Get started with AL](devenv-get-started.md).

## Related information

[Developing extensions](devenv-dev-overview.md)  
[Get started with AL](devenv-get-started.md)  
[FAQ for developing in AL](devenv-dev-faq.md)  
[AL Language extension configuration](devenv-al-extension-configuration.md)
