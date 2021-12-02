---
title: "RequestPageHandler Attribute"
description: "The RequestPageHandler attribute in AL for Business Central"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: jswymer
---

# RequestPageHandler Attribute

Specifies that the method is a RequestPageHandler method.

## Applies to  
AL methods on test codeunits. A test codeunit is a codeunit that has the [SubType Property](../properties/devenv-subtype-property.md) set to **Test**. 

## Syntax  
  
```AL
[RequestPageHandler]
procedure RequestPageHandler(var RequestPage: TestRequestPage);
```    

## Remarks

The **RequestPageHandler** method is called when a report is invoked in the code. 

The **RequestPageHandler** attribute requires that the method where it is applied has the signature `RequestPageHandler(var RequestPage: TestRequestPage)`. The parameter variable, *RequestPage*, is a specific report ID.

If you create a **ReportHandler** method, then that method replaces all code for running the report, including the request page, and a **RequestPageHandler** is not called. Only create a **RequestPageHandler** method if you are not using a **ReportHandler** one. 

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[ReportHandler Attribute](devenv-reporthandler-attribute.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)
