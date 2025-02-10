---
title: "TestPermissions property"
description: "Specifies a value that can be used to determine which permission sets are used on tests that are run by test codeunits or test functions."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestPermissions Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies a value that can be used to determine which permission sets are used on tests that are run by test codeunits or test functions.

## Applies to
-   Codeunit

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**InheritFromTestCodeunit**|runtime version 1.0|Is only relevant for test methods; not test codeunits. It specifies that a test method uses the TestPermissions property setting of the test codeunit to which it belongs. If you use this value on a test codeunit, the property will resolve to Restrictive at runtime.|
|**Restrictive**|runtime version 1.0|This is the default value. Setting the Restrictive value will cause the permission execution context of every test in the codeunit to be set by default to 'D365 Full Access’. It is required to lower the level of permissions within every test to any permission sets other than 'D365 Full Access’. Otherwise, it will result in a runtime error. The change of the permission execution context is supported by  Codeunit "Library - Lower Permissions".|
|**NonRestrictive**|runtime version 1.0|Setting the NonRestrictive value will cause that the permission execution context of every test in the codeunit is set to 'D365 Full Access’. Opposite to Restrictive, setting the TestPermissions property to NonRestrictive does not require a change of permissions.|
|**Disabled**|runtime version 1.0|Setting this value will exclude any change of the permission execution context and all tests will be executed using SUPER.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
TestPermissions = Disabled;
```

## Remarks

The default value of `TestPermissions` is `Restrictive`. The **TestPermissions** property works together with the **OnBeforeTestRun** and **OnAfterTestRun** triggers in test runner codeunits. The value of the **TestPermissions** property is passed as a parameter to the test runner codeunit triggers. The permission sets that are used during a test are determined by the code that you add to the triggers. Typically, you use the **OnBeforeTestRun** trigger to apply permissions sets and the **OnAfterTestRun** trigger to clear permissions sets.

Tests have the `TestPermissions` property by default set to `Restrictive`. With the **Permissions Mock** system app in the test framework library, you can mock permissions when running unit tests. The **Permissions Mock** module can be used to add permissions sets to the running test user, or limit the user's permissions.

For more information, see the open source test library [Permissions Mock](https://github.com/microsoft/BCApps/tree/main/src/Tools/Test%20Framework/Test%20Libraries/Permissions%20Mock).

> [!NOTE]  
> To specify the permission sets that are used by the tests run by a specific test method, use the [TestPermissions Attribute](/dynamics365/business-central/dev-itpro/developer/attributes/devenv-testpermissions-attribute).

## Related information

[Properties](devenv-properties.md)  
[TestPermissions Attribute](/dynamics365/business-central/dev-itpro/developer/attributes/devenv-testpermissions-attribute)  
