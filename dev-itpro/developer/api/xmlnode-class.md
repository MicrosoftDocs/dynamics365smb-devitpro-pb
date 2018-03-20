---
title: "XmlNode Class"
ms.author: solsen
ms.custom: na
ms.date: 12/27/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 1
manager: edupont
author: SusanneWindfeldPedersen
---

 

# XmlNode Class
Represents a single node in the XML document.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the XmlNode class.  
  
|Method name|Description|  
|-----------|-----------|  
|[XmlNode.IsXmlAttribute](xmlnode-isxmlattribute-property.md)|Gets a value indicating whether this node is an XmlAttribute.|  
|[XmlNode.IsXmlCData](xmlnode-isxmlcdata-property.md)|Gets a value indicating whether this node is an XmlCData.|  
|[XmlNode.IsXmlComment](xmlnode-isxmlcomment-property.md)|Gets a value indicating whether this node is an XmlComment.|  
|[XmlNode.IsXmlDeclaration](xmlnode-isxmldeclaration-property.md)|Gets a value indicating whether this node is an XmlDeclaration.|  
|[XmlNode.IsXmlDocument](xmlnode-isxmldocument-property.md)|Gets a value indicating whether this node is an XmlDocument.|  
|[XmlNode.IsXmlDocumentType](xmlnode-isxmldocumenttype-property.md)|Gets a value indicating whether this node is an XmlDocumentType.|  
|[XmlNode.IsXmlElement](xmlnode-isxmlelement-property.md)|Gets a value indicating whether this node is an XmlElement.|  
|[XmlNode.IsXmlProcessingInstruction](xmlnode-isxmlprocessinginstruction-property.md)|Gets a value indicating whether this node is an XmlProcessingInstruction.|  
|[XmlNode.IsXmlText](xmlnode-isxmltext-property.md)|Gets a value indicating whether this node is an XmlText.|  
|[XmlNode.GetParent(XmlElement)](xmlnode-getparent-method.md)|Gets the parent XmlElement of this node.|  
|[XmlNode.GetDocument(XmlDocument)](xmlnode-getdocument-method.md)|Gets the XmlDocument for this node.|  
|[XmlNode.AddAfterSelf(Joker)](xmlnode-addafterself-method.md)|Adds the specified content immediately after this node.|  
|[XmlNode.AddBeforeSelf(Joker)](xmlnode-addbeforeself-method.md)|Adds the specified content immediately before this node.|  
|[XmlNode.ReplaceWith(Joker)](xmlnode-replacewith-method.md)|Replaces this node with the specified content.|  
|[XmlNode.Remove()](xmlnode-remove-method.md)|Removes this node from its parent element.|  
|[XmlNode.WriteTo(OutStream)](xmlnode-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlNode.WriteTo(Text)](xmlnode-writeto-text-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlNode.SelectSingleNode(String, XmlNode)](xmlnode-selectsinglenode-xpath-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlNode.SelectSingleNode(String, XmlNamespaceManager, XmlNode)](xmlnode-selectsinglenode-xpath-namespacemanager-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlNode.SelectNodes(String, XmlNodeList)](xmlnode-selectnodes-xpath-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlNode.SelectNodes(String, XmlNamespaceManager, XmlNodeList)](xmlnode-selectnodes-xpath-namespacemanager-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlNode.AsXmlAttribute()](xmlnode-asxmlattribute-method.md)|Converts the node to an XmlAttribute node. The operation will fail if the node is not an XmlAttribute.|  
|[XmlNode.AsXmlCData()](xmlnode-asxmlcdata-method.md)|Converts the node to an XmlCData node. The operation will fail if the node is not an XmlCData.|  
|[XmlNode.AsXmlComment()](xmlnode-asxmlcomment-method.md)|Converts the node to an XmlComment node. The operation will fail if the node is not an XmlComment.|  
|[XmlNode.AsXmlDeclaration()](xmlnode-asxmldeclaration-method.md)|Converts the node to an XmlDeclaration node. The operation will fail if the node is not an XmlDeclaration.|  
|[XmlNode.AsXmlDocument()](xmlnode-asxmldocument-method.md)|Converts the node to an XmlDocument node. The operation will fail if the node is not an XmlDocument.|  
|[XmlNode.AsXmlDocumentType()](xmlnode-asxmldocumenttype-method.md)|Converts the node to an XmlDocumentType node. The operation will fail if the node is not an XmlDocumentType.|  
|[XmlNode.AsXmlElement()](xmlnode-asxmlelement-method.md)|Converts the node to an XmlElement node. The operation will fail if the node is not an XmlElement.|  
|[XmlNode.AsXmlProcessingInstruction()](xmlnode-asxmlprocessinginstruction-method.md)|Converts the node to an XmlProcessingInstruction node. The operation will fail if the node is not an XmlProcessingInstruction.|  
|[XmlNode.AsXmlText()](xmlnode-asxmltext-method.md)|Converts the node to an XmlText node. The operation will fail if the node is not an XmlText.|  

## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[XmlAttribute](xmlattribute-class.md)  
[XmlAttributeCollection](xmlattributecollection-class.md)  
[XmlCData](xmlcdata-class.md)  
[XmlComment](xmlcomment-class.md)  
[XmlDeclaration](xmldeclaration-class.md)  
[XmlDocument](xmldocument-class.md)  
[XmlDocumentType](xmldocument-class.md)  
[XmlElement](xmlelement-class.md)  
[XmlNamespaceManager](xmlnamespacemanager-class.md)  
[XmlNameTable](xmlnametable-class.md)  
[XmlNodeList](xmlnodelist-class.md)  
[XmlProcessingInstruction](xmlprocessinginstruction-class.md)  
[XmlText](xmltext-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
