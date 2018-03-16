---
title: "XmlElement Class"
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

 

# XmlElement Class
Represents an element.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the XmlElement class. 
  
|Method name|Description|  
|-----------|-----------|  
|[XmlElement.Create(String)](xmlelement-create-name-method.md)|Creates an XmlElement node.|  
|[XmlElement.Create(String, String)](xmlelement-create-localname-namespaceuri-method.md)|Creates an XmlElement node.|  
|[XmlElement.Create(String, String, Joker)](xmlelement-create-localname-namespaceuri-content-method.md)|Creates an XmlElement node.|  
|[XmlElement.Create(String, Joker)](xmlelement-create-name-content-method.md)|Creates an XmlElement node.|  
|[XmlElement.HasAttributes](xmlelement-hasattributes-property.md)|Gets a boolean value indicating whether the current node has any attributes.|  
|[XmlElement.HasElements](xmlelement-haselements-property.md)|Gets a value indicating whether this element has at least one attribute.|  
|[XmlElement.IsEmpty](xmlelement-isempty-property.md)|Gets a value indicating whether this element contains no content.|  
|[XmlElement.Name](xmlelement-name-property.md)|Gets the fully qualified name of this element.|  
|[XmlElement.LocalName](xmlelement-localname-property.md)|Gets the local name of this element.|  
|[XmlElement.NamespaceUri](xmlelement-namespaceuri-property.md)|Gets the namespace URI of this element.|  
|[XmlElement.InnerXml](xmlelement-innerxml-property.md)|Gets the markup representing only the child nodes of this node.|  
|[XmlElement.GetNamespaceOfPrefix(String, Text)](xmlelement-getnamespaceofprefix-method.md)|Gets the namespace associated with a particular prefix for this element.|  
|[XmlElement.GetPrefixOfNamespace(String, Text)](xmlelement-getprefixofnamespace-method.md)|Gets the prefix associated with a namespace URI for this element.|  
|[XmlElement.RemoveAllAttributes()](xmlelement-removeallattributes-method.md)|Removes the attributes of this element.|  
|[XmlElement.RemoveAttribute(String)](xmlelement-removeattribute-name-method.md)|Removes the specified attribute from this element.|  
|[XmlElement.RemoveAttribute(String, String)](xmlelement-removeattribute-localname-namespaceuri-method.md)|Removes the specified attribute from this element.|  
|[XmlElement.RemoveAttribute(XmlAttribute)](xmlelement-removeattribute-attribute-method.md)|Removes the specified attribute from this element.|  
|[XmlElement.SetAttribute(String, String)](xmlelement-setattribute-name-value-method.md)|Sets the value of the specified attribute or create it if is not part of the element's attribute collection.|  
|[XmlElement.SetAttribute(String, String, String)](xmlelement-setattribute-localname-namespaceuri-value-method.md)|Sets the value of the specified attribute or create it if is not part of the element's attribute collection.|  
|[XmlElement.Attributes()](xmlelement-attributes-method.md)|Gets a collection of the attributes of this element.|  
|[XmlElement.AsXmlNode()](xmlelement-asxmlnode-method.md)|Converts the node to an XmlNode.|  
|[XmlElement.GetParent(XmlElement)](xmlelement-getparent-method.md)|Gets the parent XmlElement of this node.|  
|[XmlElement.GetDocument(XmlDocument)](xmlelement-getdocument-method.md)|Gets the XmlDocument for this node.|  
|[XmlElement.AddAfterSelf(Joker)](xmlelement-addafterself-method.md)|Adds the specified content immediately after this node.|  
|[XmlElement.AddBeforeSelf(Joker)](xmlelement-addbeforeself-method.md)|Adds the specified content immediately before this node.|  
|[XmlElement.ReplaceWith(Joker)](xmlelement-replacewith-method.md)|Replaces this node with the specified content.|  
|[XmlElement.Remove()](xmlelement-remove-method.md)|Removes this node from its parent element.|  
|[XmlElement.WriteTo(OutStream)](xmlelement-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlElement.WriteTo(Text)](xmlelement-writeto-text-method.md)|Serializes and saves the current node to the given variable.|  
|[XmlElement.SelectSingleNode(String, XmlNode)](xmlelement-selectsinglenode-xpath-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlElement.SelectSingleNode(String, XmlNamespaceManager, XmlNode)](xmlelement-selectsinglenode-xpath-namespacemanager-node-method.md)|Selects the first XmlNode that matches the XPath expression.|  
|[XmlElement.SelectNodes(String, XmlNodeList)](xmlelement-selectnodes-xpath-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlElement.SelectNodes(String, XmlNamespaceManager, XmlNodeList)](xmlelement-selectnodes-xpath-namespacemanager-nodelist-method.md)|Selects a list of nodes matching the XPath expression.|  
|[XmlElement.Add(Joker)](xmlelement-add-method.md)|Adds the specified content as a child of this element.|  
|[XmlElement.AddFirst(Joker)](xmlelement-addfirst-method.md)|Adds the specified content at the start of the child list of this element.|  
|[XmlElement.ReplaceNodes(Joker)](xmlelement-replacenodes-method.md)|Replaces the children nodes of this element with the specified content.|  
|[XmlElement.RemoveNodes()](xmlelement-removenodes-method.md)|Removes the child nodes from this element.|  
|[XmlElement.GetChildNodes()](xmlelement-getchildnodes-method.md)|Gets a list containing the child elements for this element, in document order.|  
|[XmlElement.GetChildElements()](xmlelement-getchildelements--method.md)|Gets a list containing the child elements for this element, in document order.|  
|[XmlElement.GetChildElements(String)](xmlelement-getchildelements-name-method.md)|Gets a list containing the child elements for this element, in document order.|  
|[XmlElement.GetChildElements(String, String)](xmlelement-getchildelements-localname-namespaceuri-method.md)|Gets a list containing the child elements for this element, in document order.|  
|[XmlElement.GetDescendantNodes()](xmlelement-getdescendantnodes-method.md)|Gets a list containing the descendant nodes for this element, in document order.|  
|[XmlElement.GetDescendantElements()](xmlelement-getdescendantelements--method.md)|Gets a list containing the descendant elements for this element, in document order.|  
|[XmlElement.GetDescendantElements(String)](xmlelement-getdescendantelements-name-method.md)|Gets a list containing the descendant elements for this element, in document order.|  
|[XmlElement.GetDescendantElements(String, String)](xmlelement-getdescendantelements-localname-namespaceuri-method.md)|Gets a list containing the descendant elements for this element, in document order.|  

## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[XmlAttribute](xmlattribute-class.md)  
[XmlAttributeCollection](xmlattributecollection-class.md)  
[XmlCData](xmlcdata-class.md)  
[XmlComment](xmlcomment-class.md)  
[XmlDeclaration](xmldeclaration-class.md)  
[XmlDocument](xmldocument-class.md)  
[XmlDocumentType](xmldocument-class.md)  
[XmlNamespaceManager](xmlnamespacemanager-class.md)  
[XmlNameTable](xmlnametable-class.md)  
[XmlNode](xmlnode-class.md)  
[XmlNodeList](xmlnodelist-class.md)  
[XmlProcessingInstruction](xmlprocessinginstruction-class.md)  
[XmlText](xmltext-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  