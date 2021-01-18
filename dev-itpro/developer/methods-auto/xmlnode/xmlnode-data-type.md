---
title: "XmlNode Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/09/2020
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
# XmlNode Data Type
> **Version**: _Available from runtime version 1.0._

Represents a XML node which can either be for instance an XML attribute, an XML element or a XML document.



The following methods are available on instances of the XmlNode data type.

|Method name|Description|
|-----------|-----------|
|[AddAfterSelf(Any,...)](xmlnode-addafterself-method.md)|Adds the specified content immediately after this node.|
|[AddBeforeSelf(Any,...)](xmlnode-addbeforeself-method.md)|Adds the specified content immediately before this node.|
|[AsXmlAttribute()](xmlnode-asxmlattribute-method.md)|Converts the node to an XmlAttribute node. The operation will fail if the node is not an XmlAttribute.|
|[AsXmlCData()](xmlnode-asxmlcdata-method.md)|Converts the node to an XmlCData node. The operation will fail if the node is not an XmlCData.|
|[AsXmlComment()](xmlnode-asxmlcomment-method.md)|Converts the node to an XmlComment node. The operation will fail if the node is not an XmlComment.|
|[AsXmlDeclaration()](xmlnode-asxmldeclaration-method.md)|Converts the node to an XmlDeclaration node. The operation will fail if the node is not an XmlDeclaration.|
|[AsXmlDocument()](xmlnode-asxmldocument-method.md)|Converts the node to an XmlDocument node. The operation will fail if the node is not an XmlDocument.|
|[AsXmlDocumentType()](xmlnode-asxmldocumenttype-method.md)|Converts the node to an XmlDocumentType node. The operation will fail if the node is not an XmlDocumentType.|
|[AsXmlElement()](xmlnode-asxmlelement-method.md)|Converts the node to an XmlElement node. The operation will fail if the node is not an XmlElement.|
|[AsXmlProcessingInstruction()](xmlnode-asxmlprocessinginstruction-method.md)|Converts the node to an XmlProcessingInstruction node. The operation will fail if the node is not an XmlProcessingInstruction.|
|[AsXmlText()](xmlnode-asxmltext-method.md)|Converts the node to an XmlText node. The operation will fail if the node is not an XmlText.|
|[GetDocument(var XmlDocument)](xmlnode-getdocument-method.md)|Gets the XmlDocument for this node.|
|[GetParent(var XmlElement)](xmlnode-getparent-method.md)|Gets the parent XmlElement of this node.|
|[IsXmlAttribute()](xmlnode-isxmlattribute-method.md)|Gets a value indicating whether this node is an XmlAttribute.|
|[IsXmlCData()](xmlnode-isxmlcdata-method.md)|Gets a value indicating whether this node is an XmlCData.|
|[IsXmlComment()](xmlnode-isxmlcomment-method.md)|Gets a value indicating whether this node is an XmlComment.|
|[IsXmlDeclaration()](xmlnode-isxmldeclaration-method.md)|Gets a value indicating whether this node is an XmlDeclaration.|
|[IsXmlDocument()](xmlnode-isxmldocument-method.md)|Gets a value indicating whether this node is an XmlDocument.|
|[IsXmlDocumentType()](xmlnode-isxmldocumenttype-method.md)|Gets a value indicating whether this node is an XmlDocumentType.|
|[IsXmlElement()](xmlnode-isxmlelement-method.md)|Gets a value indicating whether this node is an XmlElement.|
|[IsXmlProcessingInstruction()](xmlnode-isxmlprocessinginstruction-method.md)|Gets a value indicating whether this node is an XmlProcessingInstruction.|
|[IsXmlText()](xmlnode-isxmltext-method.md)|Gets a value indicating whether this node is an XmlText.|
|[Remove()](xmlnode-remove-method.md)|Removes this node from its parent element.|
|[ReplaceWith(Any,...)](xmlnode-replacewith-method.md)|Replaces this node with the specified content.|
|[SelectNodes(String, var XmlNodeList)](xmlnode-selectnodes-string-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectNodes(String, XmlNamespaceManager, var XmlNodeList)](xmlnode-selectnodes-string-xmlnamespacemanager-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectSingleNode(String, var XmlNode)](xmlnode-selectsinglenode-string-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectSingleNode(String, XmlNamespaceManager, var XmlNode)](xmlnode-selectsinglenode-string-xmlnamespacemanager-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[WriteTo(OutStream)](xmlnode-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, OutStream)](xmlnode-writeto-xmlwriteoptions-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(var Text)](xmlnode-writeto-text-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, var Text)](xmlnode-writeto-xmlwriteoptions-text-method.md)|Serializes and saves the current node to the given variable.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  