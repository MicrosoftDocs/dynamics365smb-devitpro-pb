---
title: "Create Method"
ms.author: solsen
ms.custom: na
ms.date: 07/30/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Create Method
Creates an XmlProcessingInstruction node.

## Syntax
```
XmlProcessingInstruction :=   XmlProcessingInstruction.Create(Target: String, Data: String)
```
## Parameters
*Target*  
&emsp;Type: [String](string-data-type.md)  
The target of the processing instruction.  
*Data*  
&emsp;Type: [String](string-data-type.md)  
The content of the processing instruction, excluding the target.  


## Return Value
*XmlProcessingInstruction*  
&emsp;Type: [XmlProcessingInstruction](xmlprocessinginstruction-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlProcessingInstruction Data Type](xmlprocessinginstruction-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)