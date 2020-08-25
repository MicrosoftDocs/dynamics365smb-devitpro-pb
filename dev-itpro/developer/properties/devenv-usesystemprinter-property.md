---
title: "UseSystemPrinter Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1b00de44-adbd-4c8e-ad19-bee606f69f48
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# UseSystemPrinter Property
Sets which printer is suggested when the report is run.  
  
## Applies To  
 Reports  
  
## Property Value  
 **True** if you want the system default printer to be used; otherwise, **false**. The default is **false**.  

## Syntax
```
UseSystemPrinter = true;
```
  
## Remarks  
 The user will be able to select another printer at runtime if the [UseRequestPage Property](devenv-userequestpage-property.md) is **true**.  
  
 If the UseSystemPrinter property is set to **false**, but there is no specific printer defined for the User/Report combination, the system default printer will be suggested.  
  
## See Also  
 [UseRequestPage Property](devenv-userequestpage-property.md)