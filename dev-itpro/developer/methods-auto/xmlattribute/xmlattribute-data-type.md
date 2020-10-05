---
title: "XmlAttribute Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# XmlAttribute Data Type
Represents an XML attribute.


The following methods are available on the XmlAttribute data type.


|Method name|Description|
|-----------|-----------|
|[Create(String, String)](xmlattribute-create-string-string-method.md)|Creates an XmlAttribute node.|
|[Create(String, String, String)](xmlattribute-create-string-string-string-method.md)|Creates an XmlAttribute node.|
|[CreateNamespaceDeclaration(String, String)](xmlattribute-createnamespacedeclaration-method.md)|Creates an attribute that represents a namespace declaration.|

The following methods are available on instances of the XmlAttribute data type.

|Method name|Description|
|-----------|-----------|
|[Name()](xmlattribute-name-method.md)|The qualified name of the attribute. |
|[LocalName()](xmlattribute-localname-method.md)|Gets the local name of the attribute.|
|[NamespaceUri()](xmlattribute-namespaceuri-method.md)|Gets the namespace URI of the attribute.|
|[NamespacePrefix()](xmlattribute-namespaceprefix-method.md)|Gets the prefix of the attribute (if any).|
|[IsNamespaceDeclaration()](xmlattribute-isnamespacedeclaration-method.md)|Determines if this attribute is a namespace declaration.|
|[Value([String])](xmlattribute-value-method.md)|Gets or sets the value of the attribute.|
|[AsXmlNode()](xmlattribute-asxmlnode-method.md)|Converts the node to an XmlNode.|
|[GetParent(var XmlElement)](xmlattribute-getparent-method.md)|Gets the parent XmlElement of this node.|
|[GetDocument(var XmlDocument)](xmlattribute-getdocument-method.md)|Gets the XmlDocument for this node.|
|[AddAfterSelf(Any,...)](xmlattribute-addafterself-method.md)|Adds the specified content immediately after this node.|
|[AddBeforeSelf(Any,...)](xmlattribute-addbeforeself-method.md)|Adds the specified content immediately before this node.|
|[ReplaceWith(Any,...)](xmlattribute-replacewith-method.md)|Replaces this node with the specified content.|
|[Remove()](xmlattribute-remove-method.md)|Removes this node from its parent element.|
|[WriteTo(OutStream)](xmlattribute-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, OutStream)](xmlattribute-writeto-xmlwriteoptions-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(var Text)](xmlattribute-writeto-text-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, var Text)](xmlattribute-writeto-xmlwriteoptions-text-method.md)|Serializes and saves the current node to the given variable.|
|[SelectSingleNode(String, var XmlNode)](xmlattribute-selectsinglenode-string-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectSingleNode(String, XmlNamespaceManager, var XmlNode)](xmlattribute-selectsinglenode-string-xmlnamespacemanager-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectNodes(String, var XmlNodeList)](xmlattribute-selectnodes-string-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectNodes(String, XmlNamespaceManager, var XmlNodeList)](xmlattribute-selectnodes-string-xmlnamespacemanager-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  