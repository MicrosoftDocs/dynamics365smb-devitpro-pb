---
title: "Occurrence Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 8257f098-a61b-4053-9f88-a3f95e0ec7d2
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# Occurrence Property
Sets a value that specifies whether an attribute must occur in the data that is being imported or exported.  
  
## Applies To  
 - Field attributes in XMLports  
 - Text attributes in XMLports
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**Required (default)**|If the attribute must be part of the data.|  
|**Optional**|If the attribute does not have to be part of the data.|  

## Syntax
```
Occurrence = Optional;
```
  
## Remarks  
 This property is primarily used to ensure that the XML data that you are importing conforms to the data structure in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].  
  
## See Also  
 [Properties](devenv-properties.md)