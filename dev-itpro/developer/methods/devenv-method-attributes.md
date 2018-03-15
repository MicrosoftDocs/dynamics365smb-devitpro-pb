---
title: "Method Attributes"
ms.custom: na
ms.date: 06/07/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
# Method Attributes
An attribute is modifier on a method declaration that specifies information that controls the method's use and behavior. For example, decorating a method with the Integration attribute sets the method to be an event publisher. An attribute can have one or more arguments that set properties for the method instance.

In AL, attributes are placed before the method, and have the following syntax:

```
[Attribute_Name(ArgumentName : data_type, ArgumentName : data_type)]
```

For example, the Integration attribute has two arguments, and the syntax is:

```  
[Integration(IncludeSender : Boolean, GlobalVarAccess : Boolean)]
```    

## Attributes  
The following method attributes are available:

[Integration Attribute](devenv-integration-attribute.md)

[Business Attribute](devenv-business-attribute.md)

[EventSubscriber Attribute](devenv-eventsubscriber-attribute.md)

<!--Links [UpgradePerCompany](devenv-upgradepercompany-attribute.md)

[UpgradePerDatabase](devenv-upgradeperdatabase-attribute.md) -->

## See Also  
[AL Data Types](../datatypes/devenv-al-data-types.md)  
[AL Method Reference](devenv-al-method-reference.md)  
