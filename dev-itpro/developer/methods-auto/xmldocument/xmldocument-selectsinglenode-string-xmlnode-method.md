---
title: "XmlDocument.SelectSingleNode Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# XmlDocument.SelectSingleNode Method
> **Version**: _Available from runtime version 1.0._

Selects the first XmlNode that matches the XPath expression.


## Syntax
```
[Ok := ]  XmlDocument.SelectSingleNode(XPath: String, var Node: XmlNode)
```
## Parameters
*XmlDocument*
&emsp;Type: [XmlDocument](xmldocument-data-type.md)
An instance of the [XmlDocument](xmldocument-data-type.md) data type.

*XPath*  
&emsp;Type: [String](../string/string-data-type.md)  
The XPath expression.
        
*Node*  
&emsp;Type: [XmlNode](../xmlnode/xmlnode-data-type.md)  
The first XmlNode that matches the XPath query.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlDocument Data Type](xmldocument-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)