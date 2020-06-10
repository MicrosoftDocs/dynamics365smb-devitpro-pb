---
title: "Scope (Table) Property"
ms.custom: na
ms.date: 06/08/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Scope (Table) Property

Sets the scope of a table. The options are `Cloud`, `Extension`, `Internal`, `OnPrem`, and `Personalization`. 

> [!NOTE]  
> The following options `Extension`, `Internal`, and `Personalization` are being deprecated with runtime 4.0.

> [!NOTE]  
> This property is only taken into consideration at compile time. For example, at compile time, a table with `Access = Internal` cannot be used from other modules that do not have access to the internals of the module where the table is defined, but at runtime, any module can access the table by using reflection based mechanisms such as RecordRef.


## Applies to 
- Tables

## Remarks

When a table is marked with `Scope = OnPrem` it is not available to a cloud extension. 

System tables that have the `Scope` property set to `Internal` (`OnPrem`) cannot be accessed from extensions that have the `target` property set to `Cloud` or `External` through direct reference or through RecordRef.


## Examples
```
Scope = Cloud;
```
x

## See Also  
[Properties](devenv-properties.md)  
[Scope Property](devenv-scope-property.md)  
[Compilation Scope Overview](../devenv-compilation-scope-overview.md)  
[JSON Files](../devenv-json-files.md)  
[Configuring Business Central Server](../../administration/configure-server-instance.md)  
