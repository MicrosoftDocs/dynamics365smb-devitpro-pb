---
title: "Module Architecture"
description: "Learn about the internal components of modules in the System Application."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: bholtorf
---

# Module Architecture
Though the internal architecture of modules can, and most likely will, differ, there are rules that ensure consistency and reliability in the architecture of application modules. To reduce coupling and increase consistency, every module is a separate entity that has a publicly accessible facade, while the internal implementation is not public, as shown in the following image: 

:::image type="content" source="media/module-architecture.png" alt-text="Architecture layout":::

The following sections describe the design principles for modules.

## One Module, One Project
Modules are independent projects and have their own app.json files. For details about the contents of the app.json file, see [Project Setup](devenv-blueprint.md#project-setup).

## Packaging and Layering
Modules can belong to a specific package, or functional layer. A module becomes part of a layer when it’s added to the folder structure of the layer’s package. A module can belong to several packages because the module is a package of its own, and can be bundled into larger functional layering packages.

## Dependencies 
Dependencies to other modules can only be taken to modules in the same functional layer or to lower layers. For example, a module in the Core Application can only take dependencies to modules in the Core Application or System Application, but never to extensions.

## Target Environment
Every module must initially target the most restrictive environment, which is the cloud environment. If unsafe operations are required, those should result in a System Application module where the unsafe operations are wrapped with safe APIs. That is done by setting the **Target** to **OnPrem**. Modules in layers above the System Application must have **Target** set to **Cloud** in the **app.json** file.

## Object Accessibility 
Only facade codeunits, pages, and tables required in the public API of the module can be accessible. Internal implementation details must be marked as such by setting the access modifier to Internal, i.e. entities can be accessed within the module but cannot be called from outside the module.

## Facade Codeunits
Every module must have a facade that meets the following rules:
* Access must be **Public**. It should be set explicitly to emphasize that this is a facade or an API-like codeunit that exposes the core functionality in the module.
* All integration and business event publishers must be in the facade as internal functions. This prevents them from being invoked outside the module.
* Event publishers should be marked as internal. Exceptions must be documented.
* All external methods go in the facade.
* Facades cannot contain logic or local functions.
* Because the facade is the codeunit that other modules reference, it should have a short, meaningful name. Internal implementation codeunits can be suffixed with “Impl,” for example, because they are not referenced outside the module.

## Business Logic
Implementation codeunits contain the business logic. Pages and tables can contain code, but should do so only when it's absolutely required.

## Extensibility
Extensibility must be thought into the internal implementation of every module. If a module should not be extensible, the **Extensibility** property on tables, pages, and enums must be set to **False** to prevent those objects from being extended.

Functions and fields in extensible tables and pages must have an access modifier, as described in the following table.

|Access  |Description  |
|---------|---------|
|Local|Accessed only by code in the same table or table extension where the function or field is defined.|
|Internal|Accessed only by code in the same module, but not from another module.|
|Protected|Accessed only by code in the same table or table/page extensions of that table.|
|Public|Accessed by any other code in the same module and in other modules that reference it.|

## Documentation
Every publicly accessible object must be documented. For more information, see [Documentation](devenv-blueprint.md#documentation).

## Tests
Every module’s public API must be tested according to Microsoft standards. For more information, see [Testing](devenv-blueprint.md#testing).

## Single Instance
Use single instance only when it’s required, or if the module is expected to be called frequently.

## .NET
If a .NET type is an integral part of the module and is not referenced elsewhere, the alias for that type must be defined in the module. If the .NET type is used in different modules, then the alias for it must be defined in the DotNet Aliases module.

## Project Setup
Every module begins with a project setup that includes the following: 

* **Module Name**: If the module represents an entity, name the module after the entity. If the module does not represent an entity, give it a name that describes what it does. Module names can be singular or plural, depending on whether they handle one or more entities or tasks.
* **Location**: Determine which layer the module belongs to, and create a subfolder in a folder in that layer. For example, *Modules\System\My Module*).
* **Source Code**: Add the source code of the module in a src subfolder. For example, *Modules\System\My Module\src*).

## Testing
Every module must be tested through a separate test module. Only public functions that are exposed through the facade, or other public objects such as pages, tables, xmlports, and queries, are tested by the test module.

:::image type="content" source="media/module-testing.png" alt-text="Testing":::

The test module should have the same name as the module it tests, but be placed in a separate layer/package that contains tests for all modules in the layer. For example, *Modules\\**System Tests**\My Module*). Test code cannot reside in the same layer folder structure as the module, or within the module, because it must not be executable or part of a production environment.

## Documentation Guidelines
It's important that you document your module. The following sections provide some guidelines.

### Modules
The app.json file for each module must contain a user-friendly title, a short brief, and a description that states its purpose. 

### Public API
Every publicly accessible object must have developer facing documentation that follows the XML documentation comments standard.

### Public Objects
Public objects, such as codeunits, tables, pages, and so on, must have a summary that states what the object is used for.

```
/// <summary>
/// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
/// </summary>
```

## Public Functions
Public functions must have a summary, a parameter description, and a return value description. The following is an example.

```
/// <summary>
/// Maecenas sodales posuere ligula eu maximus.
/// </summary>
/// <param name="Lorem">The current language ID</param>
/// <param name="ipsum ">The CaptionClass expression to resolve</param>
/// <returns> Fusce in tristique massa, tincidunt tempor libero.</returns>
```
## See Also
[Getting Started with Modules](devenv-getting-started.md)  
[Create a New Module in the System Application](devenv-new-module.md)  
[Module Architecture](devenv-blueprint.md)  
