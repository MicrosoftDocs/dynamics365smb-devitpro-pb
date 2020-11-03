---
title: "TestPermissions Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
Specifies a value that can be used to determine which permission sets are used on tests that are run by test codunits or test functions.

## Applies to
-   Codeunit

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|InheritFromTestCodeunit|TODO:Add documentation|
|Restrictive|TODO:Add documentation|
|NonRestrictive|TODO:Add documentation|
|Disabled|TODO:Add documentation|
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