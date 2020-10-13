---
title: "Name Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ead6388f-9985-451d-91d5-6d1e42bb5620
caps.latest.revision: 10
ms.author: solsen
---

# Name Property

Sets the name of the object. The name is used for internal identification of the objects, controls, and other elements in AL code and the development environment.  

## Applies to  

- Codeunits  
- Fields  
- Menu items  
- Pages  
- Queries  
- Reports  
- Tables  
- XMLports  

## Syntax

```AL
codeunit 50103 Name { ... }
```

## Remarks

Unlike the [ID Property](devenv-id-property.md), the value of the **Name** property does not have to be unique; however, it is a good practice to use unique names. The Name can be up to 30 characters long. The name must comply with the Common Language Specification (CLS). For example, the first character must be a letter and subsequent characters can be any combination of letters, whole number, and underscores. For more information, see the "Naming" section in [Common Language Specification](https://go.microsoft.com/fwlink/?LinkId=193144) in the MSDN Library.  

When you use the Name in AL code, it is automatically converted to the value of the [ID Property](devenv-id-property.md) when the AL code is compiled.  

For report, page, XMLport, and query objects, the name is the default for the [Caption Property](devenv-caption-property.md).  

For controls, the default name is based on the ID.  

## See Also  

[ID Property](devenv-id-property.md)   
[Caption Property](devenv-caption-property.md)
