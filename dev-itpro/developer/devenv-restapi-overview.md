---
title: "HTTP, JSON, TextBuilder, and XML API Overview"
description: "Overview of the API capabilities."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# HTTP, JSON, TextBuilder, and XML API Overview
With the API for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] you have HTTP, JSON, TextBuilder, and XML classes available for accessing services. The following table shows the classes that are available. 

## API reference

|Class|Description|
|-----|-----------|
|[HttpClient](methods-auto/httpclient/httpclient-data-type.md)|Provides a base class for sending HTTP requests and receiving HTTP responses from a resource identified by a Uniform Resource Identifier (URI).|
|[HttpContent](methods-auto/httpcontent/httpcontent-data-type.md)|A base class representing an HTTP entity body and content headers.|
|[HttpHeaders](methods-auto/httpheaders/httpheaders-data-type.md)|The HttpHeaders class contains a collection of headers and their values.|
|[HttpRequestMessage](methods-auto/httprequestmessage/httprequestmessage-data-type.md)|Represents an HTTP request message.|
|[HttpReponseMessage](methods-auto/httpresponsemessage/httpresponsemessage-data-type.md)|Represents an HTTP response message.|
|[JsonArray](methods-auto/jsonarray/jsonarray-data-type.md)|JsonArray is a container for any well-formed JSON array. A default JsonArray contains an empty JSON array.|
|[JsonObject](methods-auto/jsonobject/jsonobject-data-type.md)|JsonObject object is a container for any well-formed JSON object. A default JsonObject contains an empty JSON object.|
|[JsonToken](methods-auto/jsontoken/jsontoken-data-type.md)|JsonToken object is a container for any well-formed JSON data. A default JsonToken contains the JSON value of NULL.|
|[JsonValue](methods-auto/jsonvalue/jsonvalue-data-type.md)|JsonValue object is a container for any well-formed JSON object. A default JsonValue is set to the JSON value of NULL.|
|[TextBuilder](methods-auto/textbuilder/textbuilder-data-type.md)|TextBuilder can performantly concatenate multiple bigger strings together.|
|[XmlAttribute](methods-auto/xmlattribute/xmlattribute-data-type.md)|Represents an attribute.|
|[XmlAttributeCollection](methods-auto/xmlattributecollection/xmlattributecollection-data-type.md)|Represents a collection of attributes associated with an XmlElement.|
|[XmlCData](methods-auto/xmlcdata/xmlcdata-data-type.md)|Represents the CDATA section.|
|[XmlComment](methods-auto/xmlcomment/xmlcomment-data-type.md)|Represents the content of an XML comment.|
|[XmlDeclaration](methods-auto/xmldeclaration/xmldeclaration-data-type.md)|Represents the XML declaration node.|
|[XmlDocument](methods-auto/xmldocument/xmldocument-data-type.md)|Represents an XML document. This class can be used to load, validate, edit, add, and position XML in a document.|
|[XmlDocumentType](methods-auto/xmldocumenttype/xmldocumenttype-data-type.md)|Represents the document type declaration.|
|[XmlElement](methods-auto/xmlelement/xmlelement-data-type.md)|Represents an element.|
|[XmlNamespaceManager](methods-auto/xmlnamespacemanager/xmlnamespacemanager-data-type.md)|Resolves, adds, and removes namespaces to a collection and provides scope management for these namespaces.|
|[XmlNameTable](methods-auto/xmlnametable/xmlnametable-data-type.md)|Table of automized string object.|
|[XmlNode](methods-auto/xmlnode/xmlnode-data-type.md)|Represents a single node in the XML document.|
|[XmlNodeList](methods-auto/xmlnodelist/xmlnodelist-data-type.md)|Represents an ordered collection of nodes.|
|[XmlProcessingInstruction](methods-auto/xmlprocessinginstruction/xmlprocessinginstruction-data-type.md)|Represents a processing instruction, which XML defines to keep processor-specific information in the text of the document.|
|[XmlText](methods-auto/xmltext/xmltext-data-type.md)|Represents the text content of an element or attribute.|


## See Also
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Data Types and Methods in AL](methods-auto/library.md)
