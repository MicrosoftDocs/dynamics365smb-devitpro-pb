---
title: "DataSourceContext.CodeunitId() Method"
description: "Gets the ID of the codeunit that is providing the test data for the current test case."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataSourceContext.CodeunitId() Method
> **Version**: _Available or changed with runtime version 18.0._

Gets the ID of the codeunit that is providing the test data for the current test case.


## Syntax
```AL
CodeunitId :=   DataSourceContext.CodeunitId()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*DataSourceContext*  
&emsp;Type: [DataSourceContext](datasourcecontext-data-type.md)  
An instance of the [DataSourceContext](datasourcecontext-data-type.md) data type.  

## Return Value
*CodeunitId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The codeunit ID of the data source.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[DataSourceContext data type](datasourcecontext-data-type.md)  
[Test codeunits and test methods in AL](../../devenv-test-codeunits-and-test-methods.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)