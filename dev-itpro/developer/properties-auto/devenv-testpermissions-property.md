---
title: "TestPermissions Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestPermissions Property
> **Version**: _Available from runtime version 1.0._

Specifies a value that can be used to determine which permission sets are used on tests that are run by test codunits or test functions.

## Applies to
-   Codeunit

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|InheritFromTestCodeunit|Is only relevant for test methods; not test codeunits. It specifies that a test method uses the TestPermissions property setting of the test codeunit to which it belongs. If you use this value on a test codunit, the property will resolve to Restrictive at runtime.|
|Restrictive|Does not perform any operations or have any specific behavior. Instead, you programmatically define what each value does, and the permissions sets it applies at runtime, by adding code in a test runner codeunit.|
|NonRestrictive|Does not perform any operations or have any specific behavior. Instead, you programmatically define what each value does, and the permissions sets it applies at runtime, by adding code in a test runner codeunit.|
|Disabled|Does not perform any operations or have any specific behavior. Instead, you programmatically define what each value does, and the permissions sets it applies at runtime, by adding code in a test runner codeunit.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
TestPermissions = Disabled;
```

## Remarks

The **TestPermissions** property works together with the **OnBeforeTestRun** and **OnAfterTestRun** triggers in test runner codeunits. The value of the **TestPermissions** property is passed as a parameter to the test runner codeunit triggers. The permission sets that are used during a test are determined by the code that you add to the triggers. Typically, you use the **OnBeforeTestRun** trigger to apply permissions sets and the **OnAfterTestRun** trigger to clear permissions sets.

> [!NOTE]  
> To specify the permission sets that are used by the tests run by a specific test method, use the [TestPermissions Attribute](../methods/devenv-testpermissions-attribute.md).

## See Also

[Properties](devenv-properties.md)  
[TestPermissions Attribute](../methods/devenv-testpermissions-attribute.md)