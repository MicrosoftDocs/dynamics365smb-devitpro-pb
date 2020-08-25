---
title: "Obsolete Attribute"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Obsolete Attribute

Specifies that a method or a variable is or will be deprecated in a future version. To mark objects and other elements of code, use the [ObsoleteState Property](../properties/devenv-obsoletestate-property.md) and [ObsoleteReason Property](../properties/devenv-obsoletereason-property.md).

## Syntax  
```  
[Obsolete('(<Reason>,<tag>')]
```
  
## Example
Setting the attribute on a method or a variable. Each method must be marked with `[Obsolete('(<Reason>,<tag>')]`.
    
```
codeunit 50143 SoonObsolete
{    
       [Obsolete('Pending, Pending removal use X instead')]
       local procedure MyProcedure()
       var
           myInt: Integer;
       begin
           //Make something happen
       end;
}    
    
```
     
## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-obsolete-attribute.md)  
[ObsoleteState Property](../properties/devenv-obsoletestate-property.md)  
[ObsoleteReason Property](../properties/devenv-obsoletereason-property.md)  
