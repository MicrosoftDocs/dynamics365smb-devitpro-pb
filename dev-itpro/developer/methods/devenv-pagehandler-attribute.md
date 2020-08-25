---
title: "PageHandler Attribute"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# PageHandler Attribute

Specifies that the method is a PageHandler method.

## Applies to  
AL methods on test codeunits. A test codeunit is a codeunit that has the [SubType Property](../properties/devenv-subtype-property.md) set to **Test**. 

## Syntax  
  
```  
[PageHandler]
procedure PageHandler(var MappingPage: TestPage 1214);
```    

## Remarks

The **PageHandler** method is called when a non-modal page is invoked in the code. 

The **PageHandler** attribute requires that the method where it is applied has the signature `procedure PageHandler(var MappingPage: TestPage 1214);`. The parameter variable, *TestPage* is the specific page in this case.

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)