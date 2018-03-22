---
title: "UseRequestPage Property"
ms.custom: na
ms.date: 06/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1f39b9ea-fa15-484a-a179-9f3f63e36820
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# UseRequestPage Property
Sets whether a request page is presented to the user.  
  
## Applies To  
  
-   Reports  
  
-   XMLports  
  
## Property Value  
 **True** if you want to show a request page; otherwise, **false**. The default is **true**.  
  
## Remarks  
 If UseRequestPage is **false**, then a request page is not shown. The user cannot choose a sort order or set filters.  
  
 You can override the setting of the UseRequestPage property at runtime by setting the *ReqWindow* parameter of the [REPORT.RUN Method](../methods/devenv-report-run-method.md), [REPORT.RUNMODAL Method](../methods/devenv-report-runmodal-method.md), or [RUN Method \(XMLport\)](../methods/devenv-run-method-XMLport.md).