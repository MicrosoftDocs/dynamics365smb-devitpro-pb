---
title: "XmlNamespaceManager.RemoveNamespace Method"
description: "Removes the given namespace for the given prefix."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# XmlNamespaceManager.RemoveNamespace Method
> **Version**: _Available or changed with runtime version 1.0._

Removes the given namespace for the given prefix.


## Syntax
```
 XmlNamespaceManager.RemoveNamespace(Prefix: String, Uri: String)
```
## Parameters
*XmlNamespaceManager*  
&emsp;Type: [XmlNamespaceManager](xmlnamespacemanager-data-type.md)  
An instance of the [XmlNamespaceManager](xmlnamespacemanager-data-type.md) data type.  

*Prefix*  
&emsp;Type: [String](../string/string-data-type.md)  
The prefix for the namespace.
        
*Uri*  
&emsp;Type: [String](../string/string-data-type.md)  
The namespace to remove for the given prefix. The namespace removed is from the current namespace scope. Namespaces outside the current scope are ignored.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNamespaceManager Data Type](xmlnamespacemanager-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)