---
title: "CreateNamespaceDeclaration Method"
ms.author: solsen
ms.custom: na
ms.date: 12/20/2017
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

 

# CreateNamespaceDeclaration Method
Creates an attribute that represents a namespace declaration.  
```  
XmlAttribute := XmlAttribute.CreateNamespaceDeclaration(Prefix, NamespaceUri)  
```  
## Parameters
*Prefix*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The prefix of the attribute (if any).  
  
*NamespaceUri*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The URI of the attribute. If the prefix is xmlns, then this parameter must be http://www.w3.org/2000/xmlns/; otherwise an exception is thrown.  
  
## Return Value
*XmlAttribute*  
&emsp;Type: [XmlAttribute](xmlattribute-class.md)   
  
## See Also
[XmlAttribute](xmlattribute-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
