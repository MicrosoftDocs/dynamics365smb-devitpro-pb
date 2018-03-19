---
title: "Create Method"
ms.author: solsen
ms.custom: na
ms.date: 12/21/2017
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

 

# Create Method
Creates an XmlElement node.  
```  
XmlElement := XmlElement.Create(LocalName, NamespaceUri, Content,...)  
```  
## Parameters
*LocalName*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The local name of the element to create.  
  
*NamespaceUri*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The namespace URI of the element to create.  
  
*Content*    
&emsp;Type: Joker  
The content to add to the element to create.  
  
## Return Value
*XmlElement*  
&emsp;Type: [XmlElement](xmlelement-class.md)  
  
## See Also
[XmlElement](xmlelement-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
