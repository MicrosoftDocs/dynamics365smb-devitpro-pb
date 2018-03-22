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
Creates an XmlAttribute.  
```  
XmlAttribute := XmlAttribute.Create(Name, Value)  
```  
## Parameters
*Name*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The qualified name of the attribute. If the name is of the form {namespace}localName, it will be qualified with the given namespace.  
  
*Value*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The value of the attribute.  
  
## Return Value
*XmlAttribute*  
&emsp;Type: [XmlAttribute](xmlattribute-class.md) 
  
## See Also
[XmlAttribute](xmlattribute-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
