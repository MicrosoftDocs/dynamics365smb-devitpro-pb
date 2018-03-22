---
title: "Get Method"
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 12/20/2017
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

# Get Method
Gets the specified attribute.  
```  
[Ok := ] XmlAttributeCollection.Get(Index, Result)  
```  
## Parameters
*Index*    
&emsp;Type: [Integer](../datatypes/devenv-integer-data-type.md)  
The index of the attribute to retrieve.  
  
*Result*    
&emsp;Type: [XmlAttribute](xmlattribute-class.md)   
Variable containing the requested XmlAttribute if the operation is successful.  
  
## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
If you omit this optional return value and the operation does not execute successfully, a run-time error will occur.  
  
## See Also
[XmlAttribute](xmlattribute-class.md)  
[XmlAttributeCollection](xmlattributecollection-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions Using the New Development Environment](../devenv-dev-overview.md)  
