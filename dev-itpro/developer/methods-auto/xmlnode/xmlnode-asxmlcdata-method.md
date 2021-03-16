---
title: "XmlNode.AsXmlCData Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# XmlNode.AsXmlCData Method
> **Version**: _Available from runtime version 1.0._

Converts the node to an XmlCData node. The operation will fail if the node is not an XmlCData.


## Syntax
```
XmlCData :=   XmlNode.AsXmlCData()
```

## Parameters
*XmlNode*
&emsp;Type: [XmlNode](xmlnode-data-type.md)
An instance of the [XmlNode](xmlnode-data-type.md) data type.

## Return Value
*XmlCData*
&emsp;Type: [XmlCData](../xmlcdata/xmlcdata-data-type.md)
An XmlCData value that references the current XmlNode.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNode Data Type](xmlnode-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)