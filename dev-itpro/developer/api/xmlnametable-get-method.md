---
title: "Get Method"
ms.author: solsen
ms.custom: na
ms.date: 12/27/2017
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

 

# Get Method
Gets the atomized string with the specified value.  
```  
[Ok := ] XmlNameTable.Get(Key, Result)  
```  
## Parameters
*Key*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The name to find.  
  
*Result*    
&emsp;Type: [Text](../datatypes/devenv-text-data-type.md)  
The atomized string object if the string has been atomized.  
  
## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
If you omit this optional return value and the operation does not execute successfully, a run-time error will occur.  
  
## See Also
[XmlNameTable](xmlnametable-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
