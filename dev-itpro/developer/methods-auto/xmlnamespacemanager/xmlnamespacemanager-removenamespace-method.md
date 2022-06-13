---
title: "XmlNamespaceManager.RemoveNamespace(Text, Text) Method"
description: "Removes the given namespace for the given prefix."
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
# XmlNamespaceManager.RemoveNamespace(Text, Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Removes the given namespace for the given prefix.


## Syntax
```AL
 XmlNamespaceManager.RemoveNamespace(Prefix: Text, Uri: Text)
```
## Parameters
*XmlNamespaceManager*  
&emsp;Type: [XmlNamespaceManager](xmlnamespacemanager-data-type.md)  
An instance of the [XmlNamespaceManager](xmlnamespacemanager-data-type.md) data type.  

*Prefix*  
&emsp;Type: [Text](../text/text-data-type.md)  
The prefix for the namespace.
        

*Uri*  
&emsp;Type: [Text](../text/text-data-type.md)  
The namespace to remove for the given prefix. The namespace removed is from the current namespace scope. Namespaces outside the current scope are ignored.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNamespaceManager Data Type](xmlnamespacemanager-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)