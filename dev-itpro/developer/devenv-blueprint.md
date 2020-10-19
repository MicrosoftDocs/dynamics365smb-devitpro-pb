# Development Blueprint

## Architecture

There are some ground rules to follow to ensure that application modules bring us closer to the architecture we want. The internal architecture of modules can, and most likely will, differ, but that is not within the scope of this document. 

To ensure low coupling and high cohesion, every module is a separate entity that is equipped with a publicly accessible façade, while the internal implementation is hidden from public access: 

<p align="center">
  <img src="Images/Architecture.png" alt="Architecture layout" />
</p>

This is achieved by following a few simple design principles:

### One module, one project
Modules are independent projects and have their own `app.json` files. For details about the contents of the `app.json` file, see the Project Setup section.

### Packaging / Layering
Modules may belong to a specific package, or functional layer if you will. The Microsoft Business Central application teams are currently working on the following layers:

A module becomes part of a layer when it’s added to the folder structure of the layer’s package. A module may belong to several packages, as the module always is a package of its own, but also may be bundled into larger functional layering packages.

### Dependencies 
Dependencies to other modules can only be taken to modules in the same functional layer or to lower layers. For example, a module in the Core Application can only take dependencies to modules in the Core Application or System Application, but never on add-on extensions.

### Target Environment
Every module must initially target the most restrictive environment, being cloud. If unsafe operations are required, those should result in a System Application module where the unsafe operations are wrapped with safe APIs. That is done by setting the target to OnPrem. Modules in higher layers than System Application must have Target set to Cloud in `app.json`.

### Object Accessibility 
Only façade codeunits, pages and tables required in the public API of the module can be accessible. Internal implementation details must be marked as such by setting the access modifier to Internal, i.e. entities can be accessed within the module but cannot be called from outside the module.

### Façade codeunits
 Every module must have a façade. The façade must follow the following rules:
* Access must be set to Public. While being the default, it should be set explicitly to emphasize that this is a facade or an API-like codeunit exposing the core functionality for which the module has been constructed.
* All integration and business event publishers must go in the façade as internal functions, preventing them from being invoked outside of the module.
* Event publishers should be marked as internal by default. Exceptions must be documented.
* All external methods go in the façade.
* Facades cannot contain logic or local functions.
* Because the façade is the codeunit that other modules reference it should get a short, meaningful name (e.g. entity name). Internal implementation codeunits can be suffixed with “Impl,” for example, because they are not referenced outside the module.

### Business Logic
Business logic should be contained in implementation codeunits. Pages and tables should not contain code unless it is absolutely required.

### Extensibility
Extensibility must be thought into the internal implementation of every module. In cases where a module should not be extensible, the *Extensibility* property on tables, pages and enums must be set to *False* to prevent those objects from being extended.

Functions and fields in extensible tables and pages must get the proper access modifier:
* Local: The function or field can be accessed only by code in the same table or table extension where the function or field is defined.
* Internal: The function or field can be accessed only by code in the same module, but not from another module.
* Protected: The function or field can be accessed only by code in the same table or table/page extensions of that table.
* Public: The function or field can be accessed by any other code in the same module and in other modules that references it.

### Documentation
Every publicly accessible object must be documented, following the standards specified in section Documentation.

### Tests
Every module’s public API is tested according to standards described in section Testing.

### Single Instance
Use single instance only when it’s required, or if the module is expected to be called very frequently.

### DotNet
If a .Net type is an integral part of the module and is not referenced anywhere else, then the alias for that type must be defined within the module. If the .Net type is used in many different modules, then the alias for it must be defined in the DotNet Aliases module.

## Project Setup
Every module begins with a project setup that includes the following: 
Module Name: If the module represents an entity, name the module after the entity.
If the module does not represent an entity, give it a name that describes what it does. Try to avoid using words such as “Management” or “Helper” in the name because they don't add value. Module names can be singular or plural, depending on whether they handle one or more entities or tasks.

Location: Determine which layer the module belongs to and create a subfolder in a folder in that layer. For example, *Modules\System\My Module*).

Source Code: Add the source code of the module in a src subfolder. For example, *Modules\System\My Module\src*).

## Testing
Every module must be tested through a separate test module. Only public functions that are exposed through the façade, or other public objects such as pages, tables, xmlports, and queries, are tested by the test module.

<p align="center">
  <img src="Images/Testing.png" alt="Testing" />
</p>
 
**Test Module Name / Location**: The test module should have the same name as the module it tests, but be placed in a separate layer/package that contains tests for all modules in the layer. For example, *Modules\\**System Tests**\My Module*). Test code cannot reside in the same layer folder structure as the module or within the module because it must not be executable or part of a production environment.

## Documentation
### Module
The app.json file for each module must contain a user-friendly title, a short brief, and a description that states its purpose. 

### Public API
Every publicly accessible object must have a developer facing documentation that follows the XML documentation comments standard.

#### Public object
Every public codeunit, table, page, and so on, must have a summary that states what the object is used for.
```
/// <summary>
/// Lorem ipsum dolor sit amet, consectetur adipiscing elit.
/// </summary>
```

#### Public function
Every public function must have a summary, parameter description as well as return value description:
```
/// <summary>
/// Maecenas sodales posuere ligula eu maximus.
/// </summary>
/// <param name="Lorem">The current language ID</param>
/// <param name="ipsum ">The CaptionClass expression to resolve</param>
/// <returns> Fusce in tristique massa, tincidunt tempor libero.</returns>
```
