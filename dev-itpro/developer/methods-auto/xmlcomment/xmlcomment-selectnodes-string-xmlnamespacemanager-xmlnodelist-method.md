---
title: "XmlComment.SelectNodes Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlComment.SelectNodes Method
> **Version**: _Available or changed with runtime version 1.0._

Selects a list of nodes matching the XPath expression.


## Syntax
```
[Ok := ]  XmlComment.SelectNodes(XPath: String, NamespaceManager: XmlNamespaceManager, var NodeList: XmlNodeList)
```
## Parameters
*XmlComment*
&emsp;Type: [XmlComment](xmlcomment-data-type.md)
An instance of the [XmlComment](xmlcomment-data-type.md) data type.

*XPath*  
&emsp;Type: [String](../string/string-data-type.md)  
The XPath expression.
        
*NamespaceManager*  
&emsp;Type: [XmlNamespaceManager](../xmlnamespacemanager/xmlnamespacemanager-data-type.md)  
An XmlNamespaceManager to use for resolving namespaces for prefixes in the XPath expression.
        
*NodeList*  
&emsp;Type: [XmlNodeList](../xmlnodelist/xmlnodelist-data-type.md)  
An XmlNodeList containing a collection of nodes matching the XPath expression.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlComment Data Type](xmlcomment-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)