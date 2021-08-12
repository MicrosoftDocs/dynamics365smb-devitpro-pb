---
title: "Obsolete Attribute"
description: "Specifies that the annotated symbol will be deprecated."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# Obsolete Attribute
> **Version**: _Available or changed with runtime version 4.0._

Specifies that the annotated symbol will be deprecated.


## Applies To

- Method
- DeclareMethod
- Variable
- Event


## Syntax

```AL
[Obsolete([Reason: Text] [, Tag: Text])]
```

### Arguments
*[Optional] Reason*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies the reason for the symbol being deprecated.  

*[Optional] Tag*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
Specifies a free-form text to support tracking of where and when the object was marked as obsolete, for example, branch, build, or date of obsoleting the object.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

To mark objects and other elements of code, use the [ObsoleteState Property](../properties/devenv-obsoletestate-property.md) and [ObsoleteReason Property](../properties/devenv-obsoletereason-property.md).

## Example
Setting the attribute on a method or a variable. Each method must be marked with `[Obsolete('<Reason>','<tag>')]`.
    
```AL
codeunit 50143 SoonObsolete
{    
       [Obsolete('Pending removal use X instead', '17.0')]
       procedure MyProcedure()
       var
           myInt: Integer;
       begin
           // Make something happen
       end;
}    
    
```
     
## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-obsolete-attribute.md)  
[ObsoleteState Property](../properties/devenv-obsoletestate-property.md)  
[ObsoleteReason Property](../properties/devenv-obsoletereason-property.md)  