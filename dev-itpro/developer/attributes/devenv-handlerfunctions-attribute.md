---
title: "HandlerFunctions Attribute"
description: "Specifies the handler methods that are used by the test method."
ms.author: solsen
ms.custom: na
ms.date: 06/08/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# HandlerFunctions Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies the handler methods that are used by the test method.

## Applies To

- Method

> [!NOTE]
> The HandlerFunctions attribute can only be set inside codeunits with the **SubType property** set to Test.


## Syntax
```
[HandlerFunctions(HandlerNames: String)]
```

### Parameters

*HandlerNames*  
&emsp;Type: [String](../methods-auto/string/string-data-type.md)  
The names of the handler methods used by the test method.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  