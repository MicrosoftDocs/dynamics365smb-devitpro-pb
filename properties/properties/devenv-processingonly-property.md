---
title: "ProcessingOnly Property"
ms.date: 10/01/2020
ms.suite: na
ms.topic: article
---

# ProcessingOnly Property

Sets the value that indicates whether a report produces printed output or only processes data.  
  
## Applies to  
  
- Reports  
- Settings  
  
## Property Value

**True** if you want a report that will not produce output; otherwise, **false**. The default is **false**. 

## Syntax

```AL
ProcessingOnly = true;
``` 
  
## Remarks  

If **ProcessingOnly** is **true**, then the **Print** and **Preview** options on the request page are replaced by an **OK** button.  
  
## See Also  

[Properties](devenv-properties.md)