---
title: "TestPermissions attribute"
description: "Specifies a value that can be used to determine which permission sets are used on tests that are run by a test method."
ms.author: solsen
ms.date: 08/19/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# TestPermissions attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies a value that can be used to determine which permission sets are used on tests that are run by a test method.


## Applies to

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

## Remarks

The `InheritFromTestCodeunit` value applies only to test methods. It makes a test method use the `TestPermissions` property of its test codeunit. On a test codeunit, this value resolves to `Restrictive` at runtime.

Apart from `InheritFromTestCodeunit`, the values don't perform operations by themselves. Add code to a test runner codeunit to define which permission sets each value applies at runtime.

> [!NOTE]  
> To specify the permission sets that are used by all the tests run by a test codeunit, use the [TestPermissions Property](../properties/devenv-testpermissions-property.md).

## Related information
[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)   
[TestPermissions Property](../properties/devenv-testpermissions-property.md)
