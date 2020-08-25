---
title: "ClearOnLookup Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a627fc31-d854-4204-8b75-20152d397ca5
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

 

# ClearOnLookup Property
Sets a value that determines whether the current contents of the field are deleted before the value that is selected via the lookup is added.  
  
## Applies to  
  
-   Fields  

  
## Property Value  
 **True** if current contents of the field are replaced; otherwise, **false** if the contents are pasted. The default value is **true** for all fields except FlowFilters fields.  

## Syntax
```
ClearOnLookup = true;
```
  
## See Also  
 [FlowFilter Overview](../devenv-flowfilter-overview.md)