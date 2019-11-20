---
title: "InDataSet Attribute"
ms.custom: na
ms.date: 11/20/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# InDataSet Attribute
Sets whether the AL variable's value is included in the dataset.  

## Applies To  
AL variables of [Boolean Data Type](../datatypes/devenv-boolean-data-type.md) or [Integer Data Type](../datatypes/devenv-integer-data-type.md) on pages.  

## Value  
Defined to include the variable's value in the dataset; otherwise, undefined. The default is undefined.  

## Syntax
```
var
[InDataSet]
MyVariable: Boolean;
```

## Remarks  
You must define this attribute on a variable if it is used as the value of the [Editable Property](devenv-styleexpr-property.md), [Enabled Property](devenv-styleexpr-property.md), [Visible Property](devenv-styleexpr-property.md) and [StyleExpr Property](devenv-styleexpr-property.md).  

## See Also
[StyleExpr Property](devenv-styleexpr-property.md)   
[Editable Property](devenv-styleexpr-property.md)  
[Enabled Property](devenv-styleexpr-property.md)  
[Visible Property](devenv-styleexpr-property.md)