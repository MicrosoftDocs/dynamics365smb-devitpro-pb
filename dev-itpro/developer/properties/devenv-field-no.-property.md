---
title: "Field No. Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Field No. Property

Sets a unique numeric ID for the field.  
  
## Applies to  

- Fields  

## Syntax

```AL
field(Field No.; MyField; Blob)
{
    ...
}
```
 
## Remarks  

No two fields can have the same Field No. within a table. The Field No. is used for reference purposes and you can use the [Name Property](devenv-name-property.md) in code. The Name is automatically converted to the Field No. when AL code is compiled.  
  
Usually, the Field No. is automatically assigned by Table Designer when you add fields to a table.  
  
## See Also  

[Name Property](devenv-name-property.md)