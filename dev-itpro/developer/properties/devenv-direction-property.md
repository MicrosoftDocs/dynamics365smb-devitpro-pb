---
title: "Direction Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Direction Property
Sets the XMLport to import, export, or import and export data in XML format.  
  
## Applies to  

- XMLports  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**Import**|The XMLPort only imports data.|  
|**Export**|The XMLPort only exports data.|  
|**Both (default)**|The XMLPort can import and export data.<br /><br /> If the XMLPort uses a request page, as specified by the [UseRequestPage Property](devenv-userequestpage-property.md), then an option appears on the request page that enables the users to choose to import or export data. 

> [!NOTE]  
> Request pages show when the XMLport is run from an action page or the `Run` method in AL code. Request pages do not show with Export or Import methods<br /><br /> If the XMLPort does not use a request, then XMLPort defaults to **Import**, unless you specify the direction by Import parameter of the `Run` method.|  
 
## Syntax

```
Direction = Import;
```

## See Also  

[Properties](devenv-properties.md)