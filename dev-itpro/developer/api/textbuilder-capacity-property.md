---
title: "Capacity Property"
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 12/18/2017
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

# Capacity Property
Gets or sets the maximum number of characters that can be contained in the memory allocated by the current instance.  
```  
[OldCapacity := ] TextBuilder.Capacity([NewCapacity])  
```  
## Parameters
*NewCapacity*    
&emsp;Type: [Integer](../datatypes/devenv-integer-data-type.md)  
The maximum number of characters that can be contained in the memory allocated by the current instance. Its value can range from Length to MaxCapacity.  
  
## Property Value
*OldCapacity*  
&emsp;Type: [Integer](../datatypes/devenv-integer-data-type.md)  
  
## See Also
[TextBuilder](textbuilder-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
