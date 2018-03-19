---
title: "HasNamespace Method"
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

 

# HasNamespace Method
Gets a value indicating whether the supplied prefix has a namespace defined for the current pushed scope.  
```  
HasNamespace := XmlNamespaceManager.HasNamespace(Prefix)  
```  
## Parameters
*Prefix*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The prefix of the namespace you want to find.  
  
## Return Value
*HasNamespace*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  
  
## See Also
[XmlNamespaceManager](xmlnamespacemanager-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
