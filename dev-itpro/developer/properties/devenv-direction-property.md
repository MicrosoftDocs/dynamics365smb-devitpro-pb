---
title: "Direction Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 5ba9f526-82cc-4d2b-bc82-afa34618667f
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# Direction Property
Sets the XMLport to import, export, or import and export data in XML format.  
  
## Applies To  
 XMLports  
  
## Property Value  
  
|**Value**|**Description**|  
|---------------|---------------------|  
|**Import**|The XMLPort only imports data.|  
|**Export**|The XMLPort only exports data.|  
|**Both (default)**|The XMLPort can import and export data.<br /><br /> If the XMLPort uses a request page, as specified by the [UseRequestPage Property](devenv-userequestpage-property.md), then an option appears on the request page that enables the users to choose to import or export data. Note: Request pages show when the XMLport is run from an action page or the Run method in AL code. Does not show with Export Import methods<br /><br /> If the XMLPort does not use a request, then XMLPort defaults to **Import**, unless you specify the direction by Import parameter of the run method.|  
 
## Syntax
```
Direction = Import;
```

## See Also  
 [Properties](devenv-properties.md)