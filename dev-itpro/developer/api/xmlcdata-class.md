---
title: "XmlCData Class"
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

 

# XmlCData Class
Represents the CDATA section.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the XmlCData class.  
  
|Method name|Description|  
|-----------|-----------|  
|[XmlCData.Create(String)](xmlcdata-create-method.md)|Creates an XmlCData node.|  
|[XmlCData.Value(String)](xmlcdata-value-property.md)|Gets or sets the value of this node.|  
|[XmlCData.AsXmlNode()](xmlcdata-asxmlnode-method.md)|Converts the node to an XmlNode.|  
|[XmlCData.GetParent(XmlElement)](xmlcdata-getparent-method.md)|Gets the parent XmlElement of this node.|  
|[XmlCData.GetDocument(XmlDocument)](xmlcdata-getdocument-method.md)|Gets the XmlDocument for this node.|  
|[XmlCData.AddAfterSelf(Joker)](xmlcdata-addafterself-method.md)|Adds the specified content immediately after this node.|  
|[XmlCData.AddBeforeSelf(Joker)](xmlcdata-addbeforeself-method.md)|Adds the specified content immediately before this node.|  
|[XmlCData.ReplaceWith(Joker)](xmlcdata-replacewith-method.md)|Replaces this node with the specified content.|  
|[XmlCData.Remove()](xmlcdata-remove-method.md)|Removes this node from its parent element.|  
|[XmlCData.WriteTo(OutStream)](xmlcdata-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlCData.WriteTo(Text)](xmlcdata-writeto-text-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlCData.SelectSingleNode(String, XmlNode)](xmlcdata-selectsinglenode-xpath-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlCData.SelectSingleNode(String, XmlNamespaceManager, XmlNode)](xmlcdata-selectsinglenode-xpath-namespacemanager-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlCData.SelectNodes(String, XmlNodeList)](xmlcdata-selectnodes-xpath-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlCData.SelectNodes(String, XmlNamespaceManager, XmlNodeList)](xmlcdata-selectnodes-xpath-namespacemanager-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  

## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[XmlAttribute](xmlattribute-class.md)  
[XmlAttributeCollection](xmlattributecollection-class.md)  
[XmlComment](xmlcomment-class.md)  
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
