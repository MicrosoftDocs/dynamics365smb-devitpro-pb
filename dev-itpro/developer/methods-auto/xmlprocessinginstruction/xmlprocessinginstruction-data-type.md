---
title: "XmlProcessingInstruction Data Type"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# XmlProcessingInstruction Data Type
> **Version**: _Available from runtime version 1.0._

Represents a processing instruction, which XML defines to keep processor-specific information in the text of the document.


The following methods are available on the XmlProcessingInstruction data type.


|Method name|Description|
|-----------|-----------|
|[Create(String, String)](xmlprocessinginstruction-create-method.md)|Creates an XmlProcessingInstruction node.|

The following methods are available on instances of the XmlProcessingInstruction data type.

|Method name|Description|
|-----------|-----------|
|[GetData(var Text)](xmlprocessinginstruction-getdata-method.md)|Gets the content of the processing instruction, excluding the target.|
|[SetData(String)](xmlprocessinginstruction-setdata-method.md)|Sets the content of the processing instruction, excluding the target.|
|[GetTarget(var Text)](xmlprocessinginstruction-gettarget-method.md)|Gets the target of the processing instruction.|
|[SetTarget(String)](xmlprocessinginstruction-settarget-method.md)|Sets the target of the processing instruction.|
|[AsXmlNode()](xmlprocessinginstruction-asxmlnode-method.md)|Converts the node to an XmlNode.|
|[GetParent(var XmlElement)](xmlprocessinginstruction-getparent-method.md)|Gets the parent XmlElement of this node.|
|[GetDocument(var XmlDocument)](xmlprocessinginstruction-getdocument-method.md)|Gets the XmlDocument for this node.|
|[AddAfterSelf(Any,...)](xmlprocessinginstruction-addafterself-method.md)|Adds the specified content immediately after this node.|
|[AddBeforeSelf(Any,...)](xmlprocessinginstruction-addbeforeself-method.md)|Adds the specified content immediately before this node.|
|[ReplaceWith(Any,...)](xmlprocessinginstruction-replacewith-method.md)|Replaces this node with the specified content.|
|[Remove()](xmlprocessinginstruction-remove-method.md)|Removes this node from its parent element.|
|[WriteTo(OutStream)](xmlprocessinginstruction-writeto-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, OutStream)](xmlprocessinginstruction-writeto-xmlwriteoptions-outstream-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(var Text)](xmlprocessinginstruction-writeto-text-method.md)|Serializes and saves the current node to the given variable.|
|[WriteTo(XmlWriteOptions, var Text)](xmlprocessinginstruction-writeto-xmlwriteoptions-text-method.md)|Serializes and saves the current node to the given variable.|
|[SelectSingleNode(String, var XmlNode)](xmlprocessinginstruction-selectsinglenode-string-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectSingleNode(String, XmlNamespaceManager, var XmlNode)](xmlprocessinginstruction-selectsinglenode-string-xmlnamespacemanager-xmlnode-method.md)|Selects the first XmlNode that matches the XPath expression.|
|[SelectNodes(String, var XmlNodeList)](xmlprocessinginstruction-selectnodes-string-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|
|[SelectNodes(String, XmlNamespaceManager, var XmlNodeList)](xmlprocessinginstruction-selectnodes-string-xmlnamespacemanager-xmlnodelist-method.md)|Selects a list of nodes matching the XPath expression.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  