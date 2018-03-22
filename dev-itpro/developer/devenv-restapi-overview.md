---
title: "HTTP, JSON, TextBuilder, and XML API Overview"
description: "Overview of the API capabilities."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# HTTP, JSON, TextBuilder, and XML API Overview
With the API for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] you have HTTP, JSON, TextBuilder, and XML classes available for accessing services. The following table shows the classes that are available. 

## API reference

|Class|Description|
|-----|-----------|
|[HttpClient](api/httpclient-class.md)|Provides a base class for sending HTTP requests and receiving HTTP responses from a resource identified by a Uniform Resource Identifier (URI).|
|[HttpContent](api/httpcontent-class.md)|A base class representing an HTTP entity body and content headers.|
|[HttpHeaders](api/httpheaders-class.md)|The HttpHeaders class contains a collection of headers and their values.|
|[HttpRequestMessage](api/httprequestmessage-class.md)|Represents an HTTP request message.|
|[HttpReponseMessage](api/httpresponsemessage-class.md)|Represents an HTTP response message.|
|[JsonArray](api/jsonarray-class.md)|JsonArray is a container for any well-formed JSON array. A default JsonArray contains an empty JSON array.|
|[JsonObject](api/jsonobject-class.md)|JsonObject object is a container for any well-formed JSON object. A default JsonObject contains an empty JSON object.|
|[JsonToken](api/jsontoken-class.md)|JsonToken object is a container for any well-formed JSON data. A default JsonToken contains the JSON value of NULL.|
|[JsonValue](api/jsonvalue-class.md)|JsonValue object is a container for any well-formed JSON object. A default JsonValue is set to the JSON value of NULL.|
|[TextBuilder](api/textbuilder-class.md)|TextBuilder can performantly concatenate multiple bigger strings together.|
|[XmlAttribute](api/xmlattribute-class.md)|Represents an attribute.|
|[XmlAttributeCollection](api/xmlattributecollection-class.md)|Represents a collection of attributes associated with an XmlElement.|
|[XmlCData](api/xmlcdata-class.md)|Represents the CDATA section.|
|[XmlComment](api/xmlcomment-class.md)|Represents the content of an XML comment.|
|[XmlDeclaration](api/xmldeclaration-class.md)|Represents the XML declaration node.|
|[XmlDocument](api/xmldocument-class.md)|Represents an XML document. This class can be used to load, validate, edit, add, and position XML in a document.|
|[XmlDocumentType](api/xmldocumenttype-class.md)|Represents the document type declaration.|
|[XmlElement](api/xmlelement-class.md)|Represents an element.|
|[XmlNamespaceManager](api/xmlnamespacemanager-class.md)|Resolves, adds, and removes namespaces to a collection and provides scope management for these namespaces.|
|[XmlNameTable](api/xmlnametable-class.md)|Table of automized string object.|
|[XmlNode](api/xmlnode-class.md)|Represents a single node in the XML document.|
|[XmlNodeList](api/xmlnodelist-class.md)|Represents an ordered collection of nodes.|
|[XmlProcessingInstruction](api/xmlprocessinginstruction-class.md)|Represents a processing instruction, which XML defines to keep processor-specific information in the text of the document.|
|[XmlText](api/xmltext-class.md)|Represents the text content of an element or attribute.|


## See Also
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[AL Development Environment](devenv-reference-overview.md)  