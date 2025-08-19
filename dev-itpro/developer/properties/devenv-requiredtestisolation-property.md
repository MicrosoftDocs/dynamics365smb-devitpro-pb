---
title: "RequiredTestIsolation property"
description: "Sets the required TestIsolation for tests in this codeunit to run in."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RequiredTestIsolation Property
> **Version**: _Available or changed with runtime version 16.0._

Sets the required TestIsolation for tests in this codeunit to run in.

## Applies to
-   Codeunit

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**None**|runtime version 16.0|Specifies that this test codeunit can run by a TestRunner with any TestIsolation.|
|**Disabled**|runtime version 16.0|Specifies that this test codeunit is required to be run by a TestRunner with Disabled TestIsolation.|
|**Codeunit**|runtime version 16.0|Specifies that this test codeunit is required to be run by a TestRunner with Codeunit TestIsolation.|
|**Function**|runtime version 16.0|Specifies that this test codeunit is required to be run by a TestRunner with Function TestIsolation.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `RequiredTestIsolation` property allows engineers to set the required TestIsolation for the test codeunit to run in. If the selected TestRunner doesn't satisfy the test codeunit's `RequiredTestIsolation` property, then the tests might fail. The property can be used to group tests for execution and reporting in CI/CD pipelines. Learn more about how the [TestType property](devenv-testtype-property.md) can be used to categorize tests.

## Related information

[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[TestType property](devenv-testtype-property.md)  