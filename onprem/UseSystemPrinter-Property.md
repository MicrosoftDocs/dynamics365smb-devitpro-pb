---
title: "UseSystemPrinter Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1b00de44-adbd-4c8e-ad19-bee606f69f48
caps.latest.revision: 5
manager: edupont
---
# UseSystemPrinter Property
Sets which printer is suggested when the report is run.  
  
## Applies To  
 Reports  
  
## Property Value  
 **Yes** if you want the system default printer to be used; otherwise, **No**. The default is **No**.  
  
## Remarks  
 The user will be able to select another printer at runtime if the [UseRequestPage Property](UseRequestPage-Property.md) is **Yes**.  
  
 If the UseSystemPrinter property is set to **No**, but there is no specific printer defined for the User/Report combination, the system default printer will be suggested.  
  
## See Also  
 [UseRequestPage Property](UseRequestPage-Property.md)