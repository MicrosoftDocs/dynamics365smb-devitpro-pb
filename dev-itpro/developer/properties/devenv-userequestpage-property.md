---
title: "UseRequestPage Property"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# UseRequestPage Property
Sets whether a request page is presented to the user.  
  
## Applies To  
  
- Reports  
- XMLports  
  
## Property Value  
**True** if you want to show a request page; otherwise, **false**. The default is **true**.

## Syntax
```
UseRequestPage = false;
```  
  
## Remarks  

If `UseRequestPage` is **false**, then a request page is not shown. The user cannot choose a sort order or set any filters. To run an XMLport without using a Request page, this property must be set to **false**.
  
You can override the setting of the `UseRequestPage` property at runtime by setting the *ReqWindow* parameter of the [Report.Run Method](../methods/devenv-report-run-method.md), [Report.RunModal Method](../methods/devenv-report-runmodal-method.md), or [XmlPort.Run Method](../methods/devenv-run-method-XMLport.md).