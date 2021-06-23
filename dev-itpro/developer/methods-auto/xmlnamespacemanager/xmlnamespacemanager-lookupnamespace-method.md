---
title: "XmlNamespaceManager.LookupNamespace Method"
description: "Gets the namespace URI for the specified prefix."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# XmlNamespaceManager.LookupNamespace Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the namespace URI for the specified prefix.


## Syntax
```AL
[Ok := ]  XmlNamespaceManager.LookupNamespace(Prefix: String, var Result: Text)
```
## Parameters
*XmlNamespaceManager*  
&emsp;Type: [XmlNamespaceManager](xmlnamespacemanager-data-type.md)  
An instance of the [XmlNamespaceManager](xmlnamespacemanager-data-type.md) data type.  

*Prefix*  
&emsp;Type: [String](../string/string-data-type.md)  
The prefix whose namespace URI you want to resolve. To match the default namespace, pass an empty string.
        
*Result*  
&emsp;Type: [Text](../text/text-data-type.md)  
The namespace URI for prefix.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[XmlNamespaceManager Data Type](xmlnamespacemanager-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)