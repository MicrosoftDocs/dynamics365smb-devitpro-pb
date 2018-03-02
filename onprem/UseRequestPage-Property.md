---
title: "UseRequestPage Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1f39b9ea-fa15-484a-a179-9f3f63e36820
caps.latest.revision: 8
manager: edupont
---
# UseRequestPage Property
Sets whether a request page is presented to the user.  
  
## Applies To  
  
-   Reports  
  
-   XMLports  
  
## Property Value  
 **Yes** if you want to show a request page; otherwise, **No**. The default is **Yes**.  
  
## Remarks  
 If UseRequestPage is **No**, then a request page is not shown. The user cannot choose a sort order or set filters.  
  
 You can override the setting of the UseRequestPage property at runtime by setting the *ReqWindow* parameter of the [REPORT.RUN Function](REPORT-RUN-Function.md), [REPORT.RUNMODAL Function](REPORT-RUNMODAL-Function.md), or [RUN Function \(XMLport\)](RUN-Function--XMLport-.md).