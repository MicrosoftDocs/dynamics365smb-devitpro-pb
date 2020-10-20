---
title: "Module Architecture"
description: "Learn about the internal components of modules in the System Application."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: bholtorf
---

# Module Architecture
The internal architecture of modules can, and most likely will, differ. To ensure low coupling and high cohesion, every module is a separate entity that is equipped with a publicly accessible façade while the internal implementation is hidden from public access, as shown in the following image. 
<!--
<p align="center">
  <img src="Images/Architecture.png" alt="Architecture layout" />
</p>
-->
This is achieved by following a few simple design principles:

### One Module, One Project
Modules are independent projects and have their own app.json files. For more information, see [Project Setup](devenv-blueprint.md#project-setup).

### Packaging and Layering
Modules can belong to a specific package, or functional layer if you will. <!--The Microsoft Business Central application teams are currently working on the following layers: what are the layers? Seems like we're missing something here.-->You include a module in a layer by adding it to the folder structure of the layer’s package. A module can belong to several packages, because the module is a package of its own that can be bundled into larger functional layering packages.

### Dependencies 
Dependencies to other modules can only be taken to modules in the same functional layer or to lower layers. For example, a module in the Core Application layer can only take dependencies to modules in the Core Application or System Application, but never to extensions.

### Target Environment
Every module must initially target the most restrictive environment, being the cloud. If unsafe operations are required, those should result in a System Application module where the unsafe operations are wrapped with safe APIs. That is done by setting the target to OnPrem. Modules in layers above the System Application must have Target set to Cloud in their app.json file.

### Object Accessibility 
Only façade codeunits, pages, and tables required in the public API of the module can be accessible. Internal implementation details must be marked as such by setting the access modifier to Internal, so that entities can be accessed within the module but cannot be called from outside the module.

### Façade codeunits
 Every module must have a façade. The façade must follow the following rules:

* Access must be set to Public. While being the default, it should be set explicitly to emphasize that this is a facade or an API-like codeunit exposing the core functionality for which the module has been constructed.
* All integration and business event publishers must be in the façade as internal functions, preventing them from being invoked outside of the module.
* Event publishers should be marked as internal by default. Exceptions must be documented.
* All external methods go in the façade.
* Facades cannot contain logic or local functions.
* Because the façade is the codeunit that other modules reference, it should have a short, meaningful name. Internal implementation codeunits can be suffixed with “Impl,” for example, because they are not referenced outside the module.

### Business Logic
The implementation codeunits should contain the business logic. Pages and tables should contain code only when that is absolutely required.

### Extensibility
Extensibility must be thought into the internal implementation of every module. In cases where a module should not be extensible, the *Extensibility* property on tables, pages, and enums must be set to *False* to prevent those objects from being extended.

Functions and fields in extensible tables and pages must have the proper access modifier, as described in the following table.

|Access  |Description|
|---------|---------|
|Local|Only by code in the same table or table extension where the function or field is defined.|
|Internal|Only by code in the same module, but not from another module.|
|Protected|Only by code in the same table, or table or page extensions of that table.|
|Public|By any other code in the same module, and in other modules that reference it.|

### Documentation
Every publicly accessible object must be documented to Microsoft standards. For more information, see [Documentation](devenv-blueprint.md#documentation).

### Tests
Every module’s public API must be tested according to Microsoft standards. For more information, see [Testing](devenv-blueprint.md#testing).

### Single Instance
Use single instance only when required, or if the module is expected to be called very frequently.

### Microsoft .NET
If a .NET type is an integral part of the module and is not referenced anywhere else, then the alias for that type must be defined in the module. If the .NET type is used in many different modules, then the alias for it must be defined in the DotNet Aliases module.

## Project Setup
Every module begins with a project setup that includes the following: 

* Module Name: If the module represents an entity, name the module after the entity. If the module does not represent an entity, give it a name that describes what it does. Avoid using words such as “Management” or “Helper” in the name because they don't add value. Module names can be singular or plural, depending on whether they handle one or more entities or tasks.
* Location: Determine which layer the module belongs to, and create a subfolder for a folder in that layer. For example, *Modules\System\My Module*).
* Source Code: Add the source code of the module in an src subfolder. For example, *Modules\System\My Module\src*).

## Testing
Every module must be tested through a separate test module. Only public functions that are exposed through the façade, or other public objects such as pages, tables, xmlports, and queries, are tested by the test module.
<!--
<p align="center">
  <img src="Images/Testing.png" alt="Testing" />
</p>
-->
The test module should have the same name as the module it tests, but be placed in a separate layer or package that contains tests for all modules in the layer. For example, *Modules\\**System Tests**\My Module*). Test code cannot reside in the same layer folder structure as the module, or within the module, because it must not be executable or part of a production environment.

## Documentation
This section provides information about 

### Module
The app.json file for each module must contain a user-friendly title, a short brief, and a description that states its purpose. 

### Public API
Every publicly accessible object must have a developer facing documentation that follows the XML documentation comments standard.

#### Public Object
Every public codeunit, table, page, and so on, must have a summary that states what the object is used for.

```
/// <summary>
/// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
/// </summary>
```

#### Public Function
Every public function must have a summary and parameter and return value descriptions.

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
[Create a New Module](devenv-new-module.md)
