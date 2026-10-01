---
title: "DataSourceContext data type"
description: "Represents the context passed to a data source codeunit that implements the ITestDataSource interface."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataSourceContext data type
> **Version**: _Available or changed with runtime version 18.0._

Represents the context passed to a data source codeunit that implements the ITestDataSource interface.



## Instance methods
The following methods are available on instances of the DataSourceContext data type.

|Method name|Description|
|-----------|-----------|
|[AppId()](datasourcecontext-appid-method.md)|Gets the ID of the app in which the test function is defined.|
|[CodeunitId()](datasourcecontext-codeunitid-method.md)|Gets the ID of the codeunit that is providing the test data for the current test case.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
[Test codeunits and test methods in AL](../../devenv-test-codeunits-and-test-methods.md)  
[TestDataSource attribute](../../attributes/devenv-testdatasource-attribute.md)  
[TestHandlerContext data type](../testhandlercontext/testhandlercontext-data-type.md)  