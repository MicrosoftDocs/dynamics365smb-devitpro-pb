---
title: "XmlDeclaration Data Type"
description: "Represents an XML declaration."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# XmlDeclaration Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents an XML declaration.


The following methods are available on the XmlDeclaration data type.


|Method name|Description|
|-----------|-----------|
|[Create(String, String, String)](xmldeclaration-create-method.md)|Creates an XmlDeclaration node.|

The following methods are available on instances of the XmlDeclaration data type.

|Method name|Description|
|-----------|-----------|
|[AddAfterSelf(Any,...)](xmldeclaration-addafterself-method.md)|Adds the specified content immediately after this node.|
|[AddBeforeSelf(Any,...)](xmldeclaration-addbeforeself-method.md)|Adds the specified content immediately before this node.|
|[AsXmlNode()](xmldeclaration-asxmlnode-method.md)|Converts the node to an XmlNode.|
|[Encoding([String])](xmldeclaration-encoding-method.md)|Gets or sets the encoding of the XML document.|
|[GetDocument(var XmlDocument)](xmldeclaration-getdocument-method.md)|Gets the XmlDocument for this node.|
|[GetParent(var XmlElement)](xmldeclaration-getparent-method.md)|Gets the parent XmlElement of this node.|
|[Remove()](xmldeclaration-remove-method.md)|Removes this node from its parent element.|
|[ReplaceWith(Any,...)](xmldeclaration-replacewith-method.md)|Replaces this node with the specified content.|
|[SelectNodes(String, var XmlNodeList)](xmldeclaration-selectnodes-string-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectNodes(String, XmlNamespaceManager, var XmlNodeList)](xmldeclaration-selectnodes-string-xmlnamespacemanager-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectSingleNode(String, var XmlNode)](xmldeclaration-selectsinglenode-string-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectSingleNode(String, XmlNamespaceManager, var XmlNode)](xmldeclaration-selectsinglenode-string-xmlnamespacemanager-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[Standalone([String])](xmldeclaration-standalone-method.md)|Gets or sets the standalone property for this document.|
|[Version([String])](xmldeclaration-version-method.md)|Gets or sets the version property for this document.|
|[WriteTo(OutStream)](xmldeclaration-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, OutStream)](xmldeclaration-writeto-xmlwriteoptions-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(var Text)](xmldeclaration-writeto-text-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, var Text)](xmldeclaration-writeto-xmlwriteoptions-text-method.md)|Serializes and saves the current node to the given variable.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  