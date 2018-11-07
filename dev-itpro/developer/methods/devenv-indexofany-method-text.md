---
title: "INDEXOFANY Method"
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 1
manager: edupont
author: SusanneWindfeldPedersen
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

# INDEXOFANY Method
 Reports the one-based index of the first occurrence of the specified string in this instance. The search starts at a specified character position.  
```  
Index := Text.INDEXOFANY(Values, [StartIndex])  
```  
## Parameters
*Values*    
&emsp;Type: Text  
The collection of characters to seek.  
  
*StartIndex*    
&emsp;Type: Integer  
The one-based search starting position.  
  
## Return Value
*Index*  
&emsp;Type: Integer  
  
## See Also
[Text Data Type](../datatypes/devenv-text-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions Using the New Development Environment](../devenv-dev-overview.md)  
