---
title: "GetDescendantElements Method"
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

 

# GetDescendantElements Method
Gets a list containing the descendant elements for this document, in document order.  
```  
DescendantElements := XmlDocument.GetDescendantElements(Name)  
```  
## Parameters
*Name*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The fully qualified name of the elements to retrieve.  
  
## Return Value
*DescendantElements*  
&emsp;Type: [XmlNodeList](xmlnodelist-class.md)  
  
## See Also
[XmlDocument](xmldocument-class.md)  
[XmlNodeList](xmlnodelist-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
