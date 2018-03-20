---
title: "PADRIGHT Method"
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 07/20/2017
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

# PADRIGHT Method
Returns a new string that left-aligns the characters in this string by padding them with spaces on the right, for a specified total length.  
```  
Result := Text.PADRIGHT(Count, [Char])  
```  
## Parameters
*Count*    
&emsp;Type: Integer  
The number of characters in the resulting string, equal to the number of original characters plus any additional padding characters.  
  
*Char*    
&emsp;Type: Char  
A padding character.  
  
## Return Value
*Result*  
&emsp;Type: Text  
  
## See Also
[Text Data Type](../datatypes/devenv-text-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions Using the New Development Environment](../devenv-dev-overview.md)  
