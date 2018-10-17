---
title: "AddFirst Method"
ms.author: solsen
ms.custom: na
ms.date: 09/30/2018
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
# AddFirst Method
Adds the specified content at the start of the child list of this element.

## Syntax
```
[Ok := ]  XmlElement.AddFirst(Content: Any,...)
```
## Parameters
*XmlElement*  
&emsp;Type: [XmlElement](xmlelement-data-type.md)  
An instance of the [XmlElement](xmlelement-data-type.md) data type.  

*Content*  
&emsp;Type: [Any](any-data-type.md)  
The content to be added as a child of this element.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlElement Data Type](xmlelement-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)