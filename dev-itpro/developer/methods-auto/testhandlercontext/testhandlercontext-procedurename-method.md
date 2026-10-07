---
title: "TestHandlerContext.ProcedureName() Method"
description: "Gets the name of the test procedure being run."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHandlerContext.ProcedureName() Method
> **Version**: _Available or changed with runtime version 18.0._

Gets the name of the test procedure being run. Empty for codeunit-level events.


## Syntax
```AL
ProcedureName :=   TestHandlerContext.ProcedureName()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestHandlerContext*  
&emsp;Type: [TestHandlerContext](testhandlercontext-data-type.md)  
An instance of the [TestHandlerContext](testhandlercontext-data-type.md) data type.  

## Return Value
*ProcedureName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name of the test procedure.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestHandlerContext data type](testhandlercontext-data-type.md)  
[Test codeunits and test methods in AL](../../devenv-test-codeunits-and-test-methods.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)