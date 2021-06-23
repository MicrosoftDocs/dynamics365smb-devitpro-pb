---
title: "System.CodeCoverageLog Method"
description: "Starts and stops the logging of code."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# System.CodeCoverageLog Method
> **Version**: _Available or changed with runtime version 1.0._

Starts and stops the logging of code. You can also use this method to retrieve the current logging status.


## Syntax
```AL
[IsActive := ]  System.CodeCoverageLog([NewIsActive: Boolean] [, MultiSession: Boolean])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*[Optional] NewIsActive*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** starts code logging;**false** stops code logging.
        
*[Optional] MultiSession*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


## Return Value
*[Optional] IsActive*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** is code logging is active;**false** otherwise.
      


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)