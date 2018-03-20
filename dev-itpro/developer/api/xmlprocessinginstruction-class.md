---
title: "XmlProcessingInstruction Class"
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

 

# XmlProcessingInstruction Class
Represents a processing instruction, which XML defines to keep processor-specific information in the text of the document.

The following methods are available on the XmlProcessingInstruction class.  
  
|Method name|Description|  
|-----------|-----------|  
|[XmlProcessingInstruction.Create(String, String)](xmlprocessinginstruction-create-method.md)|Creates an XmlProcessingInstruction node.|  
|[XmlProcessingInstruction.GetData(Text)](xmlprocessinginstruction-getdata-method.md)|Gets the content of the processing instruction, excluding the target.|  
|[XmlProcessingInstruction.SetData(String)](xmlprocessinginstruction-setdata-method.md)|Sets the content of the processing instruction, excluding the target.|  
|[XmlProcessingInstruction.GetTarget(Text)](xmlprocessinginstruction-gettarget-method.md)|Gets the target of the processing instruction.|  
|[XmlProcessingInstruction.SetTarget(String)](xmlprocessinginstruction-settarget-method.md)|Sets the target of the processing instruction.|  
|[XmlProcessingInstruction.AsXmlNode()](xmlprocessinginstruction-asxmlnode-method.md)|Converts the node to an XmlNode.|  
|[XmlProcessingInstruction.GetParent(XmlElement)](xmlprocessinginstruction-getparent-method.md)|Gets the parent XmlElement of this node.|  
|[XmlProcessingInstruction.GetDocument(XmlDocument)](xmlprocessinginstruction-getdocument-method.md)|Gets the XmlDocument for this node.|  
|[XmlProcessingInstruction.AddAfterSelf(Joker)](xmlprocessinginstruction-addafterself-method.md)|Adds the specified content immediately after this node.|  
|[XmlProcessingInstruction.AddBeforeSelf(Joker)](xmlprocessinginstruction-addbeforeself-method.md)|Adds the specified content immediately before this node.|  
|[XmlProcessingInstruction.ReplaceWith(Joker)](xmlprocessinginstruction-replacewith-method.md)|Replaces this node with the specified content.|  
|[XmlProcessingInstruction.Remove()](xmlprocessinginstruction-remove-method.md)|Removes this node from its parent element.|  
|[XmlProcessingInstruction.WriteTo(OutStream)](xmlprocessinginstruction-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlProcessingInstruction.WriteTo(Text)](xmlprocessinginstruction-writeto-text-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlProcessingInstruction.SelectSingleNode(String, XmlNode)](xmlprocessinginstruction-selectsinglenode-xpath-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlProcessingInstruction.SelectSingleNode(String, XmlNamespaceManager, XmlNode)](xmlprocessinginstruction-selectsinglenode-xpath-namespacemanager-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlProcessingInstruction.SelectNodes(String, XmlNodeList)](xmlprocessinginstruction-selectnodes-xpath-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlProcessingInstruction.SelectNodes(String, XmlNamespaceManager, XmlNodeList)](xmlprocessinginstruction-selectnodes-xpath-namespacemanager-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  

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
[XmlNode](xmlnode-class.md)  
[XmlNodeList](xmlnodelist-class.md)  
[XmlText](xmltext-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
