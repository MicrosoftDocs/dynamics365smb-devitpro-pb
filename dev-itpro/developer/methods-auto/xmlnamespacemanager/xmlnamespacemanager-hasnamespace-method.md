---
title: "XmlNamespaceManager.HasNamespace Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# XmlNamespaceManager.HasNamespace Method
Gets a value indicating whether the supplied prefix has a namespace defined for the current scope.


## Syntax
```
HasNamespace :=   XmlNamespaceManager.HasNamespace(Prefix: String)
```
## Parameters
*XmlNamespaceManager*  
&emsp;Type: [XmlNamespaceManager](xmlnamespacemanager-data-type.md)  
An instance of the [XmlNamespaceManager](xmlnamespacemanager-data-type.md) data type.  

*Prefix*  
&emsp;Type: [String](../string/string-data-type.md)  
The prefix of the namespace you want to find.  


## Return Value
*HasNamespace*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the supplied prefix has a namespace defined for the current scope, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNamespaceManager Data Type](xmlnamespacemanager-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)