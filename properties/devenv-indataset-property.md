---
title: "InDataSet Property"
author: solsen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 1f39b1b8-1eef-455a-878f-47f29d4ffe91
ms.author: solsen
---

 

# InDataSet Property
Sets whether the AL variable's value is included in the dataset.  

## Applies To  
 AL variables of [Boolean Data Type](../datatypes/devenv-boolean-data-type.md) or [Integer Data Type](../datatypes/devenv-integer-data-type.md) on pages.  

## Property Value  
Defined to include the variable's value in the dataset; otherwise, undefined. The default is undefined.  

## Syntax
```
var
[InDataSet]
MyVariable: Boolean;
```


## Remarks  
 You must define this property on a variable if it is used as the value of the [Editable Property](devenv-styleexpr-property.md), [Enabled Property](devenv-styleexpr-property.md), [Visible Property](devenv-styleexpr-property.md) and [StyleExpr Property](devenv-styleexpr-property.md).  

## See Also  
<!--
 [How to: Style Field Text on a Page](How-to--Style-Field-Text-on-a-Page.md)
-->
[Properties](devenv-properties.md)  
[StyleExpr Property](../properties/devenv-styleexpr-property.md)   
[Editable Property](../properties/devenv-editable-property.md)  
[Enabled Property](../properties/devenv-enabled-property.md)  
[Visible Property](../properties/devenv-visible-property.md)
