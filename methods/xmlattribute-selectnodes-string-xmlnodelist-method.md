---
title: "SelectNodes Method"
ms.author: solsen
ms.custom: na
ms.date: 07/27/2018
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
# SelectNodes Method
Selects a list of nodes matching the XPath expression.

## Syntax
```
[Ok := ]  XmlAttribute.SelectNodes(XPath: String, var NodeList: XmlNodeList)
```
## Parameters
*XmlAttribute*  
&emsp;Type: [XmlAttribute](xmlattribute-data-type.md)  
An instance of the [XmlAttribute](xmlattribute-data-type.md) data type.  
*XPath*  
&emsp;Type: [String](string-data-type.md)  
The XPath expression.  
*NodeList*  
&emsp;Type: [XmlNodeList](xmlnodelist-data-type.md)  
An XmlNodeList containing a collection of nodes matching the XPath expression.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlAttribute Data Type](xmlattribute-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)