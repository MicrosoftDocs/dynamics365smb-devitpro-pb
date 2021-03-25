---
title: "XmlDocument Data Type"
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
# XmlDocument Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents an XML document.


The following methods are available on the XmlDocument data type.


|Method name|Description|
|-----------|-----------|
|[Create()](xmldocument-create--method.md)|Creates an XmlDocument.|
|[Create(Any,...)](xmldocument-create-joker-method.md)|Creates an XmlDocument.|
|[ReadFrom(String, var XmlDocument)](xmldocument-readfrom-string-xmldocument-method.md)|Reads and parses the XML document from the given data source.|
|[ReadFrom(String, XmlReadOptions, var XmlDocument)](xmldocument-readfrom-string-xmlreadoptions-xmldocument-method.md)|Reads and parses the XML document from the given data source.|
|[ReadFrom(InStream, var XmlDocument)](xmldocument-readfrom-instream-xmldocument-method.md)|Reads and parses the XML document from the given data source.|
|[ReadFrom(InStream, XmlReadOptions, var XmlDocument)](xmldocument-readfrom-instream-xmlreadoptions-xmldocument-method.md)|Reads and parses the XML document from the given data source.|

The following methods are available on instances of the XmlDocument data type.

|Method name|Description|
|-----------|-----------|
|[Add(Any,...)](xmldocument-add-method.md)|Adds the specified content as a child of this document.|
|[AddAfterSelf(Any,...)](xmldocument-addafterself-method.md)|Adds the specified content immediately after this node.|
|[AddBeforeSelf(Any,...)](xmldocument-addbeforeself-method.md)|Adds the specified content immediately before this node.|
|[AddFirst(Any,...)](xmldocument-addfirst-method.md)|Adds the specified content at the start of the child list of this document.|
|[AsXmlNode()](xmldocument-asxmlnode-method.md)|Converts the node to an XmlNode.|
|[GetChildElements()](xmldocument-getchildelements--method.md)|Gets a list containing the child elements for this document, in document order.|
|[GetChildElements(String)](xmldocument-getchildelements-string-method.md)|Gets a list containing the child elements for this document, in document order.|
|[GetChildElements(String, String)](xmldocument-getchildelements-string-string-method.md)|Gets a list containing the child elements for this document, in document order.|
|[GetChildNodes()](xmldocument-getchildnodes-method.md)|Gets a list containing the child elements for this document, in document order.|
|[GetDeclaration(var XmlDeclaration)](xmldocument-getdeclaration-method.md)|Gets the XML declaration for this document.|
|[GetDescendantElements()](xmldocument-getdescendantelements--method.md)|Gets a list containing the descendant elements for this document, in document order.|
|[GetDescendantElements(String)](xmldocument-getdescendantelements-string-method.md)|Gets a list containing the descendant elements for this document, in document order.|
|[GetDescendantElements(String, String)](xmldocument-getdescendantelements-string-string-method.md)|Gets a list containing the descendant elements for this document, in document order.|
|[GetDescendantNodes()](xmldocument-getdescendantnodes-method.md)|Gets a list containing the descendant nodes for this document, in document order.|
|[GetDocument(var XmlDocument)](xmldocument-getdocument-method.md)|Gets the XmlDocument for this node.|
|[GetDocumentType(var XmlDocumentType)](xmldocument-getdocumenttype-method.md)|Gets the Document Type Definition (DTD) for this document.|
|[GetParent(var XmlElement)](xmldocument-getparent-method.md)|Gets the parent XmlElement of this node.|
|[GetRoot(var XmlElement)](xmldocument-getroot-method.md)|Gets the root element of the XML tree for this document.|
|[NameTable()](xmldocument-nametable-method.md)|Gets the XmlNameTable associated with this document.|
|[Remove()](xmldocument-remove-method.md)|Removes this node from its parent element.|
|[RemoveNodes()](xmldocument-removenodes-method.md)|Removes the child nodes from this document.|
|[ReplaceNodes(Any,...)](xmldocument-replacenodes-method.md)|Replaces the children nodes of this document with the specified content.|
|[ReplaceWith(Any,...)](xmldocument-replacewith-method.md)|Replaces this node with the specified content.|
|[SelectNodes(String, var XmlNodeList)](xmldocument-selectnodes-string-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectNodes(String, XmlNamespaceManager, var XmlNodeList)](xmldocument-selectnodes-string-xmlnamespacemanager-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectSingleNode(String, var XmlNode)](xmldocument-selectsinglenode-string-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectSingleNode(String, XmlNamespaceManager, var XmlNode)](xmldocument-selectsinglenode-string-xmlnamespacemanager-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SetDeclaration(XmlDeclaration)](xmldocument-setdeclaration-method.md)|Sets the XML declaration for this document.|
|[WriteTo(OutStream)](xmldocument-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, OutStream)](xmldocument-writeto-xmlwriteoptions-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(var Text)](xmldocument-writeto-text-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, var Text)](xmldocument-writeto-xmlwriteoptions-text-method.md)|Serializes and saves the current node to the given variable.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  