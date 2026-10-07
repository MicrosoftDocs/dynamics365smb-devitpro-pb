---
title: "TestHandlerContext data type"
description: "Provides context information about a test codeunit or procedure being run."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHandlerContext data type
> **Version**: _Available or changed with runtime version 18.0._

Provides context information about a test codeunit or procedure being run. Used as a parameter in ITestHandler interface methods.



## Instance methods
The following methods are available on instances of the TestHandlerContext data type.

|Method name|Description|
|-----------|-----------|
|[CodeunitId()](testhandlercontext-codeunitid-method.md)|Gets the ID of the test codeunit being run.|
|[CodeunitName()](testhandlercontext-codeunitname-method.md)|Gets the fully qualified name of the test codeunit being run.|
|[ProcedureName()](testhandlercontext-procedurename-method.md)|Gets the name of the test procedure being run. Empty for codeunit-level events.|
|[Skip(Text)](testhandlercontext-skip-method.md)|Marks the current test case or procedure to be skipped. When called from a before-hook (OnBeforeTestCaseRun or OnBeforeTestProcedureRun), the test body is not executed and the case is reported as skipped. Calling it from an after-hook has no effect.|
|[Success()](testhandlercontext-success-method.md)|Gets whether the test codeunit or procedure completed successfully. Only meaningful in OnAfter events.|
|[TestCaseName()](testhandlercontext-testcasename-method.md)|Gets the name of the test case being run. Only populated for data-driven test case events.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
[Test codeunits and test methods in AL](../../devenv-test-codeunits-and-test-methods.md)  
[TestDataSource attribute](../../attributes/devenv-testdatasource-attribute.md)  
[DataSourceContext data type](../datasourcecontext/datasourcecontext-data-type.md)  