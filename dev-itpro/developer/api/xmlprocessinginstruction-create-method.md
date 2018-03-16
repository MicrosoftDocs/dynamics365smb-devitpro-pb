---
title: "Create Method"
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

 

# Create Method
Creates an XmlProcessingInstruction node.  
```  
XmlProcessingInstruction := XmlProcessingInstruction.Create(Target, Data)  
```  
## Parameters
*Target*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The target of the processing instruction.  
  
*Data*    
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)  
The content of the processing instruction, excluding the target.  
  
## Return Value
*XmlProcessingInstruction*  
&emsp;Type: [XmlProcessingInstruction](xmlprocessinginstruction-class.md)  
  
## See Also
[XmlProcessingInstruction](xmlprocessinginstruction-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
