---
title: "SelectSingleNode Method"
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
# SelectSingleNode Method
Selects the first XmlNode that matches the XPath expression.

## Syntax
```
[Ok := ]  XmlCData.SelectSingleNode(XPath: String, NamespaceManager: XmlNamespaceManager, var Node: XmlNode)
```
## Parameters
*XmlCData*  
&emsp;Type: [XmlCData](xmlcdata-data-type.md)  
An instance of the [XmlCData](xmlcdata-data-type.md) data type.  

*XPath*  
&emsp;Type: [String](string-data-type.md)  
The XPath expression.
        
*NamespaceManager*  
&emsp;Type: [XmlNamespaceManager](xmlnamespacemanager-data-type.md)  
An XmlNamespaceManager to use for resolving namespaces for prefixes in the XPath expression.
        
*Node*  
&emsp;Type: [XmlNode](xmlnode-data-type.md)  
The first XmlNode that matches the XPath query.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlCData Data Type](xmlcdata-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)