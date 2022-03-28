---
title: "XmlElement.GetPrefixOfNamespace(Text, var Text) Method"
description: "Gets the prefix associated with a namespace URI for this element."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlElement.GetPrefixOfNamespace(Text, var Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the prefix associated with a namespace URI for this element.


## Syntax
```AL
[Ok := ]  XmlElement.GetPrefixOfNamespace(Namespace: Text, var Result: Text)
```
## Parameters
*XmlElement*  
&emsp;Type: [XmlElement](xmlelement-data-type.md)  
An instance of the [XmlElement](xmlelement-data-type.md) data type.  

*Namespace*  
&emsp;Type: [Text](../text/text-data-type.md)  
A namespace URI to look up.
        

*Result*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string that contains the namespace prefix.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlElement Data Type](xmlelement-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)