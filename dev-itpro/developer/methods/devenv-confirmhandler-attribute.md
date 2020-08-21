---
title: "ConfirmHandler Attribute"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# ConfirmHandler Attribute

Specifies that the method is a ConfirmHandler method.

## Applies to  

AL methods on test codeunits. A test method is a method that has the [Test Attribute](devenv-test-attribute.md) declared. 

## Syntax  
  
```  
[ConfirmHandler]
procedure ConfirmHandler(Question: Text[1024]; var Reply: Boolean);
```    

## Remarks

The **ConfirmHandler** method is called when a confirm method is invoked in the code.

The **ConfirmHandler** attribute requires that the method where it is applied has the signature `ConfirmHandler(Question: Text[1024]; var Reply: Boolean)`. The parameter type, *Text*,  contains the text of the method and the parameter *Reply* if the response to confirm is *yes* or *no*.

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)