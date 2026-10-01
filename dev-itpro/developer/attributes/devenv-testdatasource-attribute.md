---
title: "TestDataSource attribute"
description: "Specifies that the test method is data-driven."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# TestDataSource attribute
> **Version**: _Available or changed with runtime version 18.0._

Specifies that the test method is data-driven. The runtime iterates the test cases supplied by the data provider and calls the method once per case. The method receives an object of interface ITestContext, or a user-defined interface that extends it.


## Applies to

- Method

> [!NOTE]
> The **TestDataSource** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

```AL
[TestDataSource(DataSource: Integer, DataSetIdentifier: Text)]
```

### Arguments
*DataSource*  
&emsp;Type: [Integer](../methods-auto/integer/integer-data-type.md)  
The codeunit that implements ITestDataSource and supplies test data rows for this method.  

*DataSetIdentifier*  
&emsp;Type: [Text](../methods-auto/text/text-data-type.md)  
A string passed to ITestDataSource.ListTestCases and GetTestCase so that one provider codeunit can serve multiple test methods.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Test codeunits and test methods in AL](../devenv-test-codeunits-and-test-methods.md)  
[DataSourceContext data type](../methods-auto/datasourcecontext/datasourcecontext-data-type.md)  
[TestHandlerContext data type](../methods-auto/testhandlercontext/testhandlercontext-data-type.md)  