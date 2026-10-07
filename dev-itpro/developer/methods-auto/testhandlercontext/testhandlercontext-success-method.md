---
title: "TestHandlerContext.Success() Method"
description: "Gets whether the test codeunit or procedure completed successfully."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHandlerContext.Success() Method
> **Version**: _Available or changed with runtime version 18.0._

Gets whether the test codeunit or procedure completed successfully. Only meaningful in OnAfter events.


## Syntax
```AL
Success :=   TestHandlerContext.Success()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestHandlerContext*  
&emsp;Type: [TestHandlerContext](testhandlercontext-data-type.md)  
An instance of the [TestHandlerContext](testhandlercontext-data-type.md) data type.  

## Return Value
*Success*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
True if the test completed successfully.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestHandlerContext data type](testhandlercontext-data-type.md)  
[Test codeunits and test methods in AL](../../devenv-test-codeunits-and-test-methods.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)