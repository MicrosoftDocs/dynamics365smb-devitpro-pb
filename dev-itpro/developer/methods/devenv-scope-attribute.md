---
title: "Scope Attribute"
description: "The Scope attribute in AL for Business Central"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Scope Attribute
Specifies the scope of a method. The attribute has two options `OnPrem` and `Cloud`. The default option for a method is `[Scope('Cloud')]`, which means that the method can be accessed from Web services. 

> [!NOTE]  
> In previous versions `OnPrem` was equivalent to `Internal` and `Cloud` was equivalent to `External`. Both `Internal` and `External` options are being deprecated.

## Syntax  
```AL
[Scope('OnPrem')]
```
  
## Example
Setting the attribute on a method. Each method must be marked with `[Scope('OnPrem')]`.

```AL
procedure MyProcedureForCloud()
    begin
        Message('My procedure is available externally.');    
    end;

[Scope('OnPrem')]
procedure MyProcedureForOnPrem()
    begin
        Message('My procedure is available internally.');    
    end;

```
  
## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[JSON Files](../devenv-json-files.md)  
[Access Property](../properties/devenv-access-property.md)  
[Extensible Property](../properties/devenv-extensible-property.md)
