---
title: "TestPermissions Attribute"
description: "Specifies a value that can be used to determine which permission sets are used on tests that are run by a test method."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# TestPermissions Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies a value that can be used to determine which permission sets are used on tests that are run by a test method.


## Applies To

- Method

> [!NOTE]
> The **TestPermissions** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

```AL
[TestPermissions(TestPermissions: TestPermissions)]
```

### Arguments
*TestPermissions*  
&emsp;Type: [TestPermissions](../methods-auto/testpermissions/testpermissions-option.md)  
Specifies the permission sets used on tests that are run by the test method.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The **InheritFromTestCodeunit** option value for the *TestPermissions* argument is only relevant for test methods; not test codeunits. It specifies that a test method uses the TestPermissions property setting of the test codeunit to which it belongs. If you use this value on a test codeunit, the property will resolve to **Restrictive** at runtime.

Apart from **InheritFromTestCodeunit**, the values themselves do not perform any operations or have any specific behavior. Instead, you programmatically define what each value does, and the permissions sets it applies at runtime, by adding code in a test runner codeunit.

> [!NOTE]  
> To specify the permission sets that are used by all the tests run by a test codeunit, use the [TestPermissions Property](../properties/devenv-testpermissions-property.md).

## See Also  
[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)   
[TestPermissions Property](../properties/devenv-testpermissions-property.md)