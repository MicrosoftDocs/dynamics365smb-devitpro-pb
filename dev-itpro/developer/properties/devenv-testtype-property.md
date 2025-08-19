---
title: "TestType property"
description: "Specifies the type of test implemented in the codeunit, such as unit test."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestType Property
> **Version**: _Available or changed with runtime version 16.0._

Specifies the type of test implemented in the codeunit, such as unit test.

## Applies to
-   Codeunit

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**UnitTest**|runtime version 16.0|Specifies that the codeunit contains unit tests, which validate individual functions or logic in isolation from external dependencies. This is the default value.|
|**IntegrationTest**|runtime version 16.0|Specifies that the codeunit contains integration tests, which verify interactions between multiple components or systems.|
|**Uncategorized**|runtime version 16.0|Specifies that the codeunit is not yet categorized.|
|**AITest**|runtime version 16.0|Specifies that the codeunit contains AI tests, which validate behavior driven by artificial intelligence, for example, accuracy.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `TestType` property is used to categorize the type of tests implemented in a codeunit according to the primary purpose and scope of the test. This categorization helps organize tests and understand their purpose within the application. By specifying the appropriate test type, developers can ensure that their tests are run in the correct context and with the right dependencies.


## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  