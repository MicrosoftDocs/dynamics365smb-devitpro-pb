---
title: "XmlText Data Type"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# XmlText Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents the text content of an element or attribute.


The following methods are available on the XmlText data type.


|Method name|Description|
|-----------|-----------|
|[Create(String)](xmltext-create-method.md)|Creates an XmlText node.|

The following methods are available on instances of the XmlText data type.

|Method name|Description|
|-----------|-----------|
|[AddAfterSelf(Any,...)](xmltext-addafterself-method.md)|Adds the specified content immediately after this node.|
|[AddBeforeSelf(Any,...)](xmltext-addbeforeself-method.md)|Adds the specified content immediately before this node.|
|[AsXmlNode()](xmltext-asxmlnode-method.md)|Converts the node to an XmlNode.|
|[GetDocument(var XmlDocument)](xmltext-getdocument-method.md)|Gets the XmlDocument for this node.|
|[GetParent(var XmlElement)](xmltext-getparent-method.md)|Gets the parent XmlElement of this node.|
|[Remove()](xmltext-remove-method.md)|Removes this node from its parent element.|
|[ReplaceWith(Any,...)](xmltext-replacewith-method.md)|Replaces this node with the specified content.|
|[SelectNodes(String, var XmlNodeList)](xmltext-selectnodes-string-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectNodes(String, XmlNamespaceManager, var XmlNodeList)](xmltext-selectnodes-string-xmlnamespacemanager-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectSingleNode(String, var XmlNode)](xmltext-selectsinglenode-string-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectSingleNode(String, XmlNamespaceManager, var XmlNode)](xmltext-selectsinglenode-string-xmlnamespacemanager-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[Value([String])](xmltext-value-method.md)|Gets or sets the value of this node.|
|[WriteTo(OutStream)](xmltext-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, OutStream)](xmltext-writeto-xmlwriteoptions-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(var Text)](xmltext-writeto-text-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, var Text)](xmltext-writeto-xmlwriteoptions-text-method.md)|Serializes and saves the current node to the given variable.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  