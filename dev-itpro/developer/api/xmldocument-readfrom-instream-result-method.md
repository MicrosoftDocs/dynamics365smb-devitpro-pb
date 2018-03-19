---
title: "ReadFrom Method"
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

 

# ReadFrom Method
Read and parse the XML document from the given data source.  
```  
[Ok := ] XmlDocument.ReadFrom(InStream, Result)  
```  
## Parameters
*InStream*    
&emsp;Type: [InStream](../datatypes/devenv-instream-and-outstream-data-types.md)  
A stream containing an XML document.  
  
*Result*    
&emsp;Type: [XmlDocument](xmldocument-class.md)  
The XmlDocument parsed from the given data source.  
  
## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
If you omit this optional return value and the operation does not execute successfully, a run-time error will occur.  
  
## See Also
[XmlDocument](xmldocument-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
