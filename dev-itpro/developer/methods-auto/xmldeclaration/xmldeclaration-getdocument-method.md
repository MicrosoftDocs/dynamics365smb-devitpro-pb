---
title: "XmlDeclaration.GetDocument Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlDeclaration.GetDocument Method
Gets the XmlDocument for this node.


## Syntax
```
[Ok := ]  XmlDeclaration.GetDocument(var Document: XmlDocument)
```
## Parameters
*XmlDeclaration*  
&emsp;Type: [XmlDeclaration](xmldeclaration-data-type.md)  
An instance of the [XmlDeclaration](xmldeclaration-data-type.md) data type.  

*Document*  
&emsp;Type: [XmlDocument](../xmldocument/xmldocument-data-type.md)  
The owning XmlDocument of this node.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDeclaration Data Type](xmldeclaration-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)