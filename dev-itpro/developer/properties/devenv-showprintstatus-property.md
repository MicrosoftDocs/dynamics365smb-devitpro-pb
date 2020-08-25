---
title: "ShowPrintStatus Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 3c256f96-bbef-4138-9b68-ae7aab80e3c8
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

 

# ShowPrintStatus Property
Sets whether a window that shows the printing status of a report when it is run is displayed.  
  
## Applies To  
 Reports  
  
## Property Value  
 **True** if a status window is shown; otherwise, **false**. The default is **true**.  

## Syntax
```
ShowPrintStatus = false;
```
  
## Remarks  
 Apart from showing the progress of the report, the window also contains a **Cancel** button that will cause the processing and printing of the report to terminate, when clicked. If you set ShowPrintStatus to **false**, the user will not be able to stop the report prematurely.  
  
 If the [ProcessingOnly Property](devenv-processingonly-property.md) is **true**, there will be no status dialog box, even if ShowPrintStatus is **true**. If you need a status dialog box, you must create one yourself.  
  
## See Also  
 [Properties](devenv-properties.md)    
 [ProcessingOnly Property](devenv-processingonly-property.md)