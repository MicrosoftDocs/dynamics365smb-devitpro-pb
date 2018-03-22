---
title: "Replace Method"
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

# Replace Method
Replaces all occurrences of a specified string in this instance with another specified string.  
```  
[Ok := ] TextBuilder.Replace(OldText, NewText)  
```  
## Parameters
*OldText*    
&emsp;Type: [Text](../datatypes/devenv-text-data-type.md)  
The string to replace.  
  
*NewText*    
&emsp;Type: [Text](../datatypes/devenv-text-data-type.md)  
The string that replaces OldText.  
  
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
