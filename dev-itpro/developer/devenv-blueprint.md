---
title: Module Architecture
description: Learn about the internal components of modules in the System Application.
ms.date: 06/16/2025
ms.topic: article
author: bholtorf
ms.reviewer: solsen
---

# Module architecture

While the internal architecture of modules might vary, certain rules ensure consistency and reliability across application modules. To promote loose coupling and maintain consistency, each module is designed as a separate entity with a publicly accessible facade. The internal implementation details remain private, as illustrated in the following image: 

:::image type="content" source="media/module-architecture.png" alt-text="Architecture layout.":::

The following sections describe the design principles for modules.

## One module, one project

Modules are independent projects and have their own `app.json` files. Learn more about the contents of the `app.json` file in [Project setup](devenv-blueprint.md#project-setup).

## Packaging and layering

Modules can belong to a specific package, or functional layer. A module becomes part of a layer when it’s added to the folder structure of the layer’s package. A module can belong to several packages because the module is a package of its own, and can be bundled into larger functional layering packages.

## Dependencies

Dependencies to other modules can only be taken to modules in the same functional layer or to lower layers. For example, a module in the Core Application can only take dependencies to modules in the Core Application or System Application, but never to extensions.

## Target environment

Every module must initially target the most restrictive environment, which is the cloud environment. If unsafe operations are required, those should result in a System Application module where the unsafe operations are wrapped with safe APIs. That is done by setting the `Target` to `OnPrem`. Modules in layers above the System Application must have `Target` set to `Cloud` in the `app.json` file.

## Object accessibility 

Only facade codeunits, pages, and tables required in the public API of the module can be accessible. Internal implementation details must be marked as such by setting the access modifier to `Internal`, that is, entities can be accessed within the module but can't be called from outside the module.

## Facade codeunits

Every module must have a facade that meets the following rules:

* Access must be `Public`. It should be set explicitly to emphasize that this is a facade or an API-like codeunit that exposes the core functionality in the module.
* All integration and business event publishers must be in the facade as internal functions. This prevents them from being invoked outside the module.
* Event publishers should be marked as internal. Exceptions must be documented.
* All external methods go in the facade.
* Facades can't contain logic or local functions.
* Because the facade is the codeunit that other modules reference, it should have a short, meaningful name. Internal implementation codeunits can be suffixed with “Impl,” for example, because they aren't referenced outside the module.

## Business logic

Implementation codeunits contain the business logic. Pages and tables can contain code, but should do so only when it's absolutely required.

## Extensibility

Extensibility must be thought into the internal implementation of every module. If a module shouldn't be extensible, the `Extensibility` property on tables, pages, and enums must be set to `False` to prevent those objects from being extended.

Functions and fields in extensible tables and pages must have an access modifier, as described in the following table.

|Access  |Description  |
|---------|---------|
|`Local`|Accessed only by code in the same table or table extension where the function or field is defined.|
|`Internal`|Accessed only by code in the same module, but not from another module.|
|`Protected`|Accessed only by code in the same table or table/page extensions of that table.|
|`Public`|Accessed by any other code in the same module and in other modules that reference it.|

## Documentation

Every publicly accessible object must be documented. Learn more in [Documentation](devenv-blueprint.md#documentation).

## Tests

Every module’s public API must be tested according to Microsoft standards. Learn more in [Testing](devenv-blueprint.md#testing).

## Single instance

Use single instance only when it’s required, or if the module is expected to be called frequently.

## .NET

If a .NET type is an integral part of the module and isn't referenced elsewhere, the alias for that type must be defined in the module. If the .NET type is used in different modules, then the alias for it must be defined in the **DotNet Aliases** module.

## Project setup

Every module begins with a project setup that includes the following: 

* **Module Name**: If the module represents an entity, name the module after the entity. If the module doesn't represent an entity, give it a name that describes what it does. Module names can be singular or plural, depending on whether they handle one or more entities or tasks.
* **Location**: Determine which layer the module belongs to, and create a subfolder in a folder in that layer. For example, *Modules\System\My Module*.
* **Source Code**: Add the source code of the module in a `\src` subfolder. For example, *Modules\System\My Module\src*.

## Testing

Every module must be tested through a separate test module. Only public functions that are exposed through the facade, or other public objects such as pages, tables, xmlports, and queries, are tested by the test module.

:::image type="content" source="media/module-testing.png" alt-text="Testing.":::

The test module should have the same name as the module it tests, but be placed in a separate layer/package that contains tests for all modules in the layer. For example, *Modules\\**System Tests**\My Module*. Test code can't reside in the same layer folder structure as the module, or within the module, because it must not be executable or part of a production environment.

## Documentation guidelines

It's important that you document your module. The following sections provide some guidelines.

### Modules

The `app.json` file for each module must contain a user-friendly title, a short brief, and a description that states its purpose. 

### Public API

Every publicly accessible object must have developer facing documentation that follows the XML documentation comments standard.

### Public objects

Public objects, such as codeunits, tables, pages, and so on, must have a summary that states what the object is used for. Follow the XML documentation comments standard for the summary as the example below.

```
/// <summary>
/// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
/// </summary>
```

## Public functions

Public functions must have a summary, a parameter description, and a return value description. The following is an example of the syntax.

```
/// <summary>
/// Maecenas sodales posuere ligula eu maximus.
/// </summary>
/// <param name="Lorem">The current language ID</param>
/// <param name="ipsum ">The CaptionClass expression to resolve</param>
/// <returns> Fusce in tristique massa, tincidunt tempor libero.</returns>
```

## Related information

[Getting started with modules](devenv-getting-started.md)  
[Create a new module in the System Application](devenv-new-module.md)  
[Module architecture](devenv-blueprint.md)  
