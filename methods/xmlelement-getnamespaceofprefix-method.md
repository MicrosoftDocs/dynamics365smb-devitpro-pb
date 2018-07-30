---
title: "GetNamespaceOfPrefix Method"
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
# GetNamespaceOfPrefix Method
Gets the namespace associated with a particular prefix for this element.

## Syntax
```
[Ok := ]  XmlElement.GetNamespaceOfPrefix(Prefix: String, var Result: Text)
```
## Parameters
*XmlElement*  
&emsp;Type: [XmlElement](xmlelement-data-type.md)  
An instance of the [XmlElement](xmlelement-data-type.md) data type.  
*Prefix*  
&emsp;Type: [String](string-data-type.md)  
A string that contains the namespace prefix to look up.  
*Result*  
&emsp;Type: [Text](text-data-type.md)  
The namespace URI associated with the given prefix for this element.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlElement Data Type](xmlelement-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)