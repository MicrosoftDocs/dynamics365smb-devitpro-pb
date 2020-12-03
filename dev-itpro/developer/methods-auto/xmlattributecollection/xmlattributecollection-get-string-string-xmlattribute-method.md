---
title: "XmlAttributeCollection.Get Method"
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
# XmlAttributeCollection.Get Method
> **Version**: _Available from runtime version 1.0._

Gets the specified attribute.


## Syntax
```
[Ok := ]  XmlAttributeCollection.Get(LocalName: String, NamespaceUri: String, var Result: XmlAttribute)
```
## Parameters
*XmlAttributeCollection*
&emsp;Type: [XmlAttributeCollection](xmlattributecollection-data-type.md)
An instance of the [XmlAttributeCollection](xmlattributecollection-data-type.md) data type.

*LocalName*  
&emsp;Type: [String](../string/string-data-type.md)  
The local name of the attribute to retrieve.
        
*NamespaceUri*  
&emsp;Type: [String](../string/string-data-type.md)  
The namespace URI of the attribute to retrieve.
        
*Result*  
&emsp;Type: [XmlAttribute](../xmlattribute/xmlattribute-data-type.md)  
Variable containing the requested XmlAttribute if the operation is successful.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlAttributeCollection Data Type](xmlattributecollection-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)