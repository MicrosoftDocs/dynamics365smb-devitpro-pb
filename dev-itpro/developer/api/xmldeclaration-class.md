---
title: "XmlDeclaration Class"
ms.author: solsen
ms.custom: na
ms.date: 07/20/2017
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

 

# XmlDeclaration Class
Represents the XML declaration node.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the XmlDeclaration class.  
  
|Method name|Description|  
|-----------|-----------|  
|[XmlDeclaration.Create(String, String, String)](xmldeclaration-create-method.md)|Creates an XmlDeclaration node.|  
|[XmlDeclaration.Encoding(String)](xmldeclaration-encoding-property.md)|Gets or sets the encoding of the XML document.|  
|[XmlDeclaration.Standalone(String)](xmldeclaration-standalone-property.md)|Gets or sets the standalone property for this document.|  
|[XmlDeclaration.Version(String)](xmldeclaration-version-property.md)|Gets or sets the version property for this document.|  
|[XmlDeclaration.AsXmlNode()](xmldeclaration-asxmlnode-method.md)|Converts the node to an XmlNode.|  
|[XmlDeclaration.GetParent(XmlElement)](xmldeclaration-getparent-method.md)|Gets the parent XmlElement of this node.|  
|[XmlDeclaration.GetDocument(XmlDocument)](xmldeclaration-getdocument-method.md)|Gets the XmlDocument for this node.|  
|[XmlDeclaration.AddAfterSelf(Joker)](xmldeclaration-addafterself-method.md)|Adds the specified content immediately after this node.|  
|[XmlDeclaration.AddBeforeSelf(Joker)](xmldeclaration-addbeforeself-method.md)|Adds the specified content immediately before this node.|  
|[XmlDeclaration.ReplaceWith(Joker)](xmldeclaration-replacewith-method.md)|Replaces this node with the specified content.|  
|[XmlDeclaration.Remove()](xmldeclaration-remove-method.md)|Removes this node from its parent element.|  
|[XmlDeclaration.WriteTo(OutStream)](xmldeclaration-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlDeclaration.WriteTo(Text)](xmldeclaration-writeto-text-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlDeclaration.SelectSingleNode(String, XmlNode)](xmldeclaration-selectsinglenode-xpath-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlDeclaration.SelectSingleNode(String, XmlNamespaceManager, XmlNode)](xmldeclaration-selectsinglenode-xpath-namespacemanager-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlDeclaration.SelectNodes(String, XmlNodeList)](xmldeclaration-selectnodes-xpath-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlDeclaration.SelectNodes(String, XmlNamespaceManager, XmlNodeList)](xmldeclaration-selectnodes-xpath-namespacemanager-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  

## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[XmlAttribute](xmlattribute-class.md)  
[XmlAttributeCollection](xmlattributecollection-class.md)  
[XmlCData](xmlcdata-class.md)  
[XmlComment](xmlcomment-class.md)  
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
