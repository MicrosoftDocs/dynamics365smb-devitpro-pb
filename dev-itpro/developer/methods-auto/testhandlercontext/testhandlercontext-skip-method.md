---
title: "TestHandlerContext.Skip(Text) Method"
description: "Marks the current test case or procedure to be skipped."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHandlerContext.Skip(Text) Method
> **Version**: _Available or changed with runtime version 18.0._

Marks the current test case or procedure to be skipped. When called from a before-hook (OnBeforeTestCaseRun or OnBeforeTestProcedureRun), the test body is not executed and the case is reported as skipped. Calling it from an after-hook has no effect.


## Syntax
```AL
 TestHandlerContext.Skip(Reason: Text)
```
## Parameters
*TestHandlerContext*  
&emsp;Type: [TestHandlerContext](testhandlercontext-data-type.md)  
An instance of the [TestHandlerContext](testhandlercontext-data-type.md) data type.  

*Reason*  
&emsp;Type: [Text](../text/text-data-type.md)  
The reason the case is being skipped, surfaced in the test result and log.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestHandlerContext data type](testhandlercontext-data-type.md)  
[Test codeunits and test methods in AL](../../devenv-test-codeunits-and-test-methods.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)