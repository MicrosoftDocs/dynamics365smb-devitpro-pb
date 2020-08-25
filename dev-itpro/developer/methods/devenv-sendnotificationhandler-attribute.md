---
title: "SendNotificationHandler Attribute"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# SendNotificationHandler Attribute

Specifies that the method is a SendNotificationHandler method.

## Applies to  
AL methods on test codeunits. A test codeunit is a codeunit that has the [SubType Property](../properties/devenv-subtype-property.md) set to **Test**. 

## Syntax  
  
```  
[SendNotificationHandler]
SendNotificationHandler(var Notification: Notification) : Boolean;
```    
  
## Remarks

The **SendNotificationHandler** method is called when a notification is raised from the code.

The **SendNotificationHandler** attribute requires that the method where it is applied has the signature `SendNotificationHandler(var Notification: Notification) : Boolean`. The parameter variable, *Notification*, holds the actual notification.

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)