---
title: "Compilation Scope Overview"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Compilation Scope Overview

In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] there are different layers of controlling what can be published to the server and accessed from within a project. 

## Configuring extension target on the server
By setting the **Allowed Extension Target Level** flag in the server configuration, you control what can be published to the server by setting the **Cloud** or **OnPrem** flag. For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md#Development). 

## Configuring extension target for an extension
In the manifest of an extension (the app.json file), you can set the **target** property to specify the compilation target of an extension. The available values are `Internal`, `Extension`, `OnPrem`, and `Cloud`. 

> [!IMPORTANT]  
> The `Internal` and  `Extension` values have been deprecated starting with runtime 4.0 and replaced by the `OnPrem` and `Cloud` respectively. 

The `target` property informs the compiler which APIs can be used within the current project. 
- If you specify `"target":"OnPrem"` you can use any platform APIs and .NET types. This is the most permissive target. It is only if you specify this target that you can use methods marked with `Scope('OnPrem')` or tables with the property [Scope (Tables)](properties/devenv-scope-table-property.md) set to `OnPrem`. 
- If you specify `"target":"Cloud"` you can only use APIs that are safe for use in a cloud environment. If the target is set to `Cloud`, the extension cannot use any method marked with `Scope('OnPrem')` or table with the property `Scope` set to `OnPrem`, even if those elements are declared within the same extension. For example, if you have two extensions; A and B. Extension A has an app.json target setting `"target": "OnPrem"` and defines a method with the [Scope Attribute](methods/devenv-scope-attribute.md) set to `[Scope('OnPrem')]`. Extension B has a dependency on extension A and extension B has an app.json target setting `"target": "Cloud"` and tries to call the method in extension A marked with scope `OnPrem`, you will get a compile error when you are trying to compile extension B. For more information, see [JSON Files](devenv-json-files.md).

## Methods and tables scope
Methods can be marked with the `[Scope()]` attribute to specify the compilation target and tables can be marked with the `Scope` property. Both instruct the compiler which target the method or table can be used in. For more information, see [Scope Attribute](methods/devenv-scope-attribute.md) and [Scope (Table) Property](properties/devenv-scope-table-property.md).

## See Also  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions in AL](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  
[Scope Attribute](methods/devenv-scope-attribute.md)  
[Scope (Table) Property](properties/devenv-scope-table-property.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)  