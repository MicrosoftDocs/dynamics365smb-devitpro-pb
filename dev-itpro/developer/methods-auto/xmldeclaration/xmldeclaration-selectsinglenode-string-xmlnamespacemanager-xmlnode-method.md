---
title: "XmlDeclaration.SelectSingleNode(Text, XmlNamespaceManager, var XmlNode) Method"
description: "Selects the first XmlNode that matches the XPath expression."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlDeclaration.SelectSingleNode(Text, XmlNamespaceManager, var XmlNode) Method
> **Version**: _Available or changed with runtime version 1.0._

Selects the first XmlNode that matches the XPath expression.


## Syntax
```AL
[Ok := ]  XmlDeclaration.SelectSingleNode(XPath: Text, NamespaceManager: XmlNamespaceManager, var Node: XmlNode)
```
## Parameters
*XmlDeclaration*  
&emsp;Type: [XmlDeclaration](xmldeclaration-data-type.md)  
An instance of the [XmlDeclaration](xmldeclaration-data-type.md) data type.  

*XPath*  
&emsp;Type: [Text](../text/text-data-type.md)  
The XPath expression.  

*NamespaceManager*  
&emsp;Type: [XmlNamespaceManager](../xmlnamespacemanager/xmlnamespacemanager-data-type.md)  
An XmlNamespaceManager to use for resolving namespaces for prefixes in the XPath expression.  

*Node*  
&emsp;Type: [XmlNode](../xmlnode/xmlnode-data-type.md)  
The first XmlNode that matches the XPath query.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[XmlDeclaration Data Type](xmldeclaration-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)