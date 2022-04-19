---
title: "XmlDocumentType Data Type"
description: "Represents an XML document type."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# XmlDocumentType Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents an XML document type.


The following methods are available on the XmlDocumentType data type.


|Method name|Description|
|-----------|-----------|
|[Create(Text)](xmldocumenttype-create-string-method.md)|Creates an XmlDocumentType node.|
|[Create(Text, Text)](xmldocumenttype-create-string-string-method.md)|Creates an XmlDocumentType node.|
|[Create(Text, Text, Text)](xmldocumenttype-create-string-string-string-method.md)|Creates an XmlDocumentType node.|
|[Create(Text, Text, Text, Text)](xmldocumenttype-create-string-string-string-string-method.md)|Creates an XmlDocumentType node.|

The following methods are available on instances of the XmlDocumentType data type.

|Method name|Description|
|-----------|-----------|
|[AddAfterSelf(Any,...)](xmldocumenttype-addafterself-method.md)|Adds the specified content immediately after this node.|
|[AddBeforeSelf(Any,...)](xmldocumenttype-addbeforeself-method.md)|Adds the specified content immediately before this node.|
|[AsXmlNode()](xmldocumenttype-asxmlnode-method.md)|Converts the node to an XmlNode.|
|[GetDocument(var XmlDocument)](xmldocumenttype-getdocument-method.md)|Gets the XmlDocument for this node.|
|[GetInternalSubset(var Text)](xmldocumenttype-getinternalsubset-method.md)|Gets the internal subset for this Document Type Definition (DTD).|
|[GetName(var Text)](xmldocumenttype-getname-method.md)|Gets the name for this Document Type Definition (DTD).|
|[GetParent(var XmlElement)](xmldocumenttype-getparent-method.md)|Gets the parent XmlElement of this node.|
|[GetPublicId(var Text)](xmldocumenttype-getpublicid-method.md)|Gets the public identifier for this Document Type Definition (DTD).|
|[GetSystemId(var Text)](xmldocumenttype-getsystemid-method.md)|Gets the system identifier for this Document Type Definition (DTD).|
|[Remove()](xmldocumenttype-remove-method.md)|Removes this node from its parent element.|
|[ReplaceWith(Any,...)](xmldocumenttype-replacewith-method.md)|Replaces this node with the specified content.|
|[SelectNodes(Text, var XmlNodeList)](xmldocumenttype-selectnodes-string-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectNodes(Text, XmlNamespaceManager, var XmlNodeList)](xmldocumenttype-selectnodes-string-xmlnamespacemanager-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectSingleNode(Text, var XmlNode)](xmldocumenttype-selectsinglenode-string-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectSingleNode(Text, XmlNamespaceManager, var XmlNode)](xmldocumenttype-selectsinglenode-string-xmlnamespacemanager-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SetInternalSubset(Text)](xmldocumenttype-setinternalsubset-method.md)|Sets the internal subset for this Document Type Definition (DTD).|
|[SetName(Text)](xmldocumenttype-setname-method.md)|Sets the name for this Document Type Definition (DTD).|
|[SetPublicId(Text)](xmldocumenttype-setpublicid-method.md)|Sets the public identifier for this Document Type Definition (DTD).|
|[SetSystemId(Text)](xmldocumenttype-setsystemid-method.md)|Sets the system identifier for this Document Type Definition (DTD).|
|[WriteTo(OutStream)](xmldocumenttype-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, OutStream)](xmldocumenttype-writeto-xmlwriteoptions-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(var Text)](xmldocumenttype-writeto-text-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, var Text)](xmldocumenttype-writeto-xmlwriteoptions-text-method.md)|Serializes and saves the current node to the given variable.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  