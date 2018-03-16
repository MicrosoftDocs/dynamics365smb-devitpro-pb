---
title: "XmlNamespaceManager Class"
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

 

# XmlNamespaceManager Class
Resolves, adds, and removes namespaces to a collection and provides scope management for these namespaces.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the XmlNamespaceManager class.  
  
|Method name|Description|  
|-----------|-----------|  
|[XmlNamespaceManager.NameTable(XmlNameTable)](xmlnamespacemanager-nametable-property.md)|Gets or sets the XmlNameTable associated with this object.|  
|[XmlNamespaceManager.AddNamespace(String, String)](xmlnamespacemanager-addnamespace-method.md)|Adds the given namespace to the collection.|  
|[XmlNamespaceManager.HasNamespace(String)](xmlnamespacemanager-hasnamespace-method.md)|Gets a value indicating whether the supplied prefix has a namespace defined for the current pushed scope.|  
|[XmlNamespaceManager.LookupNamespace(String, Text)](xmlnamespacemanager-lookupnamespace-method.md)|Gets the namespace URI for the specified prefix.|  
|[XmlNamespaceManager.LookupPrefix(String, Text)](xmlnamespacemanager-lookupprefix-method.md)|Finds the prefix declared for the given namespace URI.|  
|[XmlNamespaceManager.RemoveNamespace(String, String)](xmlnamespacemanager-removenamespace-method.md)|Removes the given namespace for the given prefix.|  
|[XmlNamespaceManager.PushScope()](xmlnamespacemanager-pushscope-method.md)|Pushes a namespace scope onto the stack.|  
|[XmlNamespaceManager.PopScope()](xmlnamespacemanager-popscope-method.md)|Pops a namespace scope off the stack.|  

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
[XmlNameTable](xmlnametable-class.md)  
[XmlNode](xmlnode-class.md)  
[XmlNodeList](xmlnodelist-class.md)  
[XmlProcessingInstruction](xmlprocessinginstruction-class.md)  
[XmlText](xmltext-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
