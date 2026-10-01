---
title: "DataSourceContext.AppId() Method"
description: "Gets the ID of the app in which the test function is defined."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataSourceContext.AppId() Method
> **Version**: _Available or changed with runtime version 18.0._

Gets the ID of the app in which the test function is defined.


## Syntax
```AL
AppId :=   DataSourceContext.AppId()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*DataSourceContext*  
&emsp;Type: [DataSourceContext](datasourcecontext-data-type.md)  
An instance of the [DataSourceContext](datasourcecontext-data-type.md) data type.  

## Return Value
*AppId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The app ID of the extension containing the test function.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[DataSourceContext data type](datasourcecontext-data-type.md)  
[Test codeunits and test methods in AL](../../devenv-test-codeunits-and-test-methods.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)