---
title: "Create Method"
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

 

# Create Method
Creates an XmlDeclaration node.  
```  
XmlDeclaration := XmlDeclaration.Create(Version, Encoding, Standalone)  
```  
## Parameters
*Version*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The version of the XML, usually "1.0".  
  
*Encoding*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The encoding for the XML document.  
  
*Standalone*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
A string containing "yes" or "no" that specifies whether the XML is standalone or requires external entities to be resolved.  
  
## Return Value
*XmlDeclaration*  
&emsp;Type: [XmlDeclaration](xmldeclaration-class.md)  
  
## See Also
[XmlDeclaration](xmldeclaration-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
