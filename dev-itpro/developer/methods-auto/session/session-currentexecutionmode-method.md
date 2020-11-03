---
title: "Session.CurrentExecutionMode Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Session.CurrentExecutionMode Method
Specifies the mode in which the session is running.


## Syntax
```
ExecutionMode :=   Session.CurrentExecutionMode()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
> [!NOTE]  
> This method can be invoked without specifying the data type name.  


## Return Value
*ExecutionMode*  
&emsp;Type: [ExecutionMode](../executionmode/executionmode-option.md)  
The mode in which the session is running.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example requires that you create a variable named Mode that has a DataType of ExecutionMode.  

```  
Mode := CURRENTEXECUTIONMODE;   
MESSAGE('Current execution mode is %1.', Mode); 
```

## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)