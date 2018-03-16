---
title: "EnsureCapacity Method"
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 12/18/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 1
manager: edupont
author: SusanneWindfeldPedersen
---

# EnsureCapacity Method
Ensures that the capacity of this instance of StringBuilder is at least the specified value.  
```  
[Ok := ] TextBuilder.EnsureCapacity(NewCapacity)  
```  
## Parameters
*NewCapacity*    
&emsp;Type: [Integer](../datatypes/devenv-integer-data-type.md)  
The minimum capacity to ensure.  
  
## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
If you omit this optional return value and the operation does not execute successfully, a run-time error will occur.  
  
## See Also
[TextBuilder](textbuilder-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
