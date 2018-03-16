---
title: "XmlComment Class"
ms.author: solsen
ms.custom: na
ms.date: 12/20/2017
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

 

# XmlComment Class
Represents the content of an XML comment.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the XmlComment class.  
  
|Method name|Description|  
|-----------|-----------|  
|[XmlComment.Create(String)](xmlcomment-create-method.md)|Creates an XmlComment node.|  
|[XmlComment.Value(String)](xmlcomment-value-property.md)|Gets or sets the string value of this comment.|  
|[XmlComment.AsXmlNode()](xmlcomment-asxmlnode-method.md)|Converts the node to an XmlNode.|  
|[XmlComment.GetParent(XmlElement)](xmlcomment-getparent-method.md)|Gets the parent XmlElement of this node.|  
|[XmlComment.GetDocument(XmlDocument)](xmlcomment-getdocument-method.md)|Gets the XmlDocument for this node.|  
|[XmlComment.AddAfterSelf(Joker)](xmlcomment-addafterself-method.md)|Adds the specified content immediately after this node.|  
|[XmlComment.AddBeforeSelf(Joker)](xmlcomment-addbeforeself-method.md)|Adds the specified content immediately before this node.|  
|[XmlComment.ReplaceWith(Joker)](xmlcomment-replacewith-method.md)|Replaces this node with the specified content.|  
|[XmlComment.Remove()](xmlcomment-remove-method.md)|Removes this node from its parent element.|  
|[XmlComment.WriteTo(OutStream)](xmlcomment-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlComment.WriteTo(Text)](xmlcomment-writeto-text-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlComment.SelectSingleNode(String, XmlNode)](xmlcomment-selectsinglenode-xpath-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlComment.SelectSingleNode(String, XmlNamespaceManager, XmlNode)](xmlcomment-selectsinglenode-xpath-namespacemanager-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlComment.SelectNodes(String, XmlNodeList)](xmlcomment-selectnodes-xpath-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlComment.SelectNodes(String, XmlNamespaceManager, XmlNodeList)](xmlcomment-selectnodes-xpath-namespacemanager-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  

## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[XmlAttribute](xmlattribute-class.md)  
[XmlAttributeCollection](xmlattributecollection-class.md)  
[XmlCData](xmlcdata-class.md)  
[XmlDeclaration](xmldeclaration-class.md)  
[XmlDocument](xmldocument-class.md)  
[XmlDocumentType](xmldocument-class.md)  
[XmlElement](xmlelement-class.md)  
[XmlNamespaceManager](xmlnamespacemanager-class.md)  
[XmlNameTable](xmlnametable-class.md)  
[XmlNode](xmlnode-class.md)  
[XmlNodeList](xmlnodelist-class.md)  
[XmlProcessingInstruction](xmlprocessinginstruction-class.md)  
[XmlText](xmltext-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
