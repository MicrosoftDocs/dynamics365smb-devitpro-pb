---
title: "ProcessingOnly Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# ProcessingOnly Property
Sets the value that indicates whether a report produces printed output or only processes data.  
  
## Applies To  
  
-   Reports  
  
-   Settings  
  
## Property Value  
 **True** if you want a report that will not produce output; otherwise, **false**. The default is **false**. 

## Syntax
```
ProcessingOnly = true;
``` 
  
## Remarks  
 If **ProcessingOnly** is **true**, then the **Print** and **Preview** options on the request page are replaced by an **OK** button.  
  
## See Also  
 [Properties](devenv-properties.md)