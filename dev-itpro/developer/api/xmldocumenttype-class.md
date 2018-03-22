---
title: "XmlDocumentType Class"
ms.author: solsen
ms.custom: na
ms.date: 12/21/2017
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

 

# XmlDocumentType Class
Represents the document type declaration.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the XmlDocumentType class.  
  
|Method name|Description|  
|-----------|-----------|  
|[XmlDocumentType.Create(String)](xmldocumenttype-create-name-method.md)|Creates an XmlDocumentType node.|  
|[XmlDocumentType.Create(String, String)](xmldocumenttype-create-name-publicid-method.md)|Creates an XmlDocumentType node.|  
|[XmlDocumentType.Create(String, String, String)](xmldocumenttype-create-name-publicid-systemid-method.md)|Creates an XmlDocumentType node.|  
|[XmlDocumentType.Create(String, String, String, String)](xmldocumenttype-create-name-publicid-systemid-internalsubset-method.md)|Creates an XmlDocumentType node.|  
|[XmlDocumentType.GetName(Text)](xmldocumenttype-getname-method.md)|Gets the name for this Document Type Definition (DTD).|  
|[XmlDocumentType.SetName(String)](xmldocumenttype-setname-method.md)|Sets the name for this Document Type Definition (DTD).|  
|[XmlDocumentType.GetSystemId(Text)](xmldocumenttype-getsystemid-method.md)|Gets the system identifier for this Document Type Definition (DTD).|  
|[XmlDocumentType.SetSystemId(String)](xmldocumenttype-setsystemid-method.md)|Sets the system identifier for this Document Type Definition (DTD).|  
|[XmlDocumentType.GetInternalSubset(Text)](xmldocumenttype-getinternalsubset-method.md)|Gets the internal subset for this Document Type Definition (DTD).|  
|[XmlDocumentType.SetInternalSubset(String)](xmldocumenttype-setinternalsubset-method.md)|Sets the internal subset for this Document Type Definition (DTD).|  
|[XmlDocumentType.GetPublicId(Text)](xmldocumenttype-getpublicid-method.md)|Gets the public identifier for this Document Type Definition (DTD).|  
|[XmlDocumentType.SetPublicId(String)](xmldocumenttype-setpublicid-method.md)|Sets the public identifier for this Document Type Definition (DTD).|  
|[XmlDocumentType.AsXmlNode()](xmldocumenttype-asxmlnode-method.md)|Converts the node to an XmlNode.|  
|[XmlDocumentType.GetParent(XmlElement)](xmldocumenttype-getparent-method.md)|Gets the parent XmlElement of this node.|  
|[XmlDocumentType.GetDocument(XmlDocument)](xmldocumenttype-getdocument-method.md)|Gets the XmlDocument for this node.|  
|[XmlDocumentType.AddAfterSelf(Joker)](xmldocumenttype-addafterself-method.md)|Adds the specified content immediately after this node.|  
|[XmlDocumentType.AddBeforeSelf(Joker)](xmldocumenttype-addbeforeself-method.md)|Adds the specified content immediately before this node.|  
|[XmlDocumentType.ReplaceWith(Joker)](xmldocumenttype-replacewith-method.md)|Replaces this node with the specified content.|  
|[XmlDocumentType.Remove()](xmldocumenttype-remove-method.md)|Removes this node from its parent element.|  
|[XmlDocumentType.WriteTo(OutStream)](xmldocumenttype-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlDocumentType.WriteTo(Text)](xmldocumenttype-writeto-text-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlDocumentType.SelectSingleNode(String, XmlNode)](xmldocumenttype-selectsinglenode-xpath-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlDocumentType.SelectSingleNode(String, XmlNamespaceManager, XmlNode)](xmldocumenttype-selectsinglenode-xpath-namespacemanager-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlDocumentType.SelectNodes(String, XmlNodeList)](xmldocumenttype-selectnodes-xpath-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlDocumentType.SelectNodes(String, XmlNamespaceManager, XmlNodeList)](xmldocumenttype-selectnodes-xpath-namespacemanager-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  

## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[XmlAttribute](xmlattribute-class.md)  
[XmlAttributeCollection](xmlattributecollection-class.md)  
[XmlCData](xmlcdata-class.md)  
[XmlComment](xmlcomment-class.md)  
[XmlDeclaration](xmldeclaration-class.md)  
[XmlDocument](xmldocument-class.md)  
[XmlElement](xmlelement-class.md)  
[XmlNamespaceManager](xmlnamespacemanager-class.md)  
[XmlNameTable](xmlnametable-class.md)  
[XmlNode](xmlnode-class.md)  
[XmlNodeList](xmlnodelist-class.md)  
[XmlProcessingInstruction](xmlprocessinginstruction-class.md)  
[XmlText](xmltext-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  