---
title: "Test Attribute"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# Test Attribute

Specifies that the method is a test method.

## Applies to  
AL methods on test codeunits. A test codeunit is a codeunit that has the [SubType Property](../properties/devenv-subtype-property.md) set to **Test**. 

## Syntax  
  
```  
[Test]
procedure TestMethod();
```    

## Remarks

The **Test** attribute is used to test an area of the application.

## See Also  
[Method Attributes](devenv-method-attributes.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)