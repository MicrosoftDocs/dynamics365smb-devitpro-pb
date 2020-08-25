---
title: "XML Comments in Code"
ms.custom: na
ms.author: solsen
ms.date: 08/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# XML Comments in Code

In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you can add documentation to your code by including XML elements in special comment fields directly in the source code before the block of code that the comment refers to. The syntax for adding XML comments in your code is triple slashes. 

By adding XML comments in code, you can enable IntelliSense in Visual Studio Code on the AL objects that you add in your code as a help to other developers, working with or extending your code. This means that when you have built extension and someone extends this code, they will get inline documentation when they use the given object.

> []
> Integration with DocFx and SandCastle is not yet supported.

## Supported XML tags

The following table lists the XML elements that are supported for AL.

| XML Tag   | Description |Syntax|
|-----------|-----------|---------|--|
|`<summary>`|A summary of the object|`<summary>description</summary>`|
|`<param>`  |Used in method declaration to describe one or more parameters defined in the method. For each parameter, specify the name and a description.|`<param name="name">description</param>`|
|`<returns>` |Used in method declaration to describe the return value of the method.|`<returns>description</returns>`|

## Example

```xml
/// <summary>
/// This property specifies a description of the object.
/// </summary>

Description = 'Name of the organization.';

```

## Special symbols

If you want angle brackets to appear in the text of a documentation comment, use the HTML encoding of `<` and `>` which is `&lt;` and `&gt;` respectively. This encoding is shown in the following example.

```xml
/// <summary>
/// This property always returns a value &lt; 1.
/// </summary>
```

## See Also  

[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions in AL](devenv-dev-overview.md)  
[Pages Overview](devenv-pages-overview.md)  