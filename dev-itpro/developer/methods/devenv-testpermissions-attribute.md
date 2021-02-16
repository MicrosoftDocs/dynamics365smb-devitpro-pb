---
title: "TestPermissions Attribute"
description: "The TestPermissions attribute in AL for Business Central"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# TestPermissions Attribute
AL methods on test codeunits. A test codeunit is a codeunit that has the [SubType Property](../properties/devenv-subtype-property.md) set to **Test**. 

## Applies to
AL methods on test codeunits.

## Syntax  
```AL
[TestPermissions(TestPermissions: Testpermissions)]
```

### Arguments

*TestPermissions*  
Type: [TestPermissions](../methods-auto/testpermissions/testpermissions-option.md)  
 
Specifies the permission sets used on tests that are run by the test method.

*TestPermissions* can have one of following values:

* **Disabled**
    
* **Restrictive**
    
* **NonRestrictive**
    
* **InheritFromTestCodeunit**

    **InheritFromTestCodeunit** is only relevant for test methods; not test codeunits. It specifies that a test method uses the TestPermissions property setting of the test codeunit to which it belongs. If you use this value on a test codeunit, the property will resolve to **Restrictive** at runtime.

Apart from **InheritFromTestCodeunit**, the values themselves do not perform any operations or have any specific behavior. Instead, you programmatically define what each value does, and the permissions sets it applies at runtime, by adding code in a test runner codeunit.

> [!NOTE]  
> To specify the permission sets that are used by all the tests run by a test codeunit, use the [TestPermissions Property](../properties/devenv-testpermissions-property.md).

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)   
[TestPermissions Property](../properties/devenv-testpermissions-property.md)