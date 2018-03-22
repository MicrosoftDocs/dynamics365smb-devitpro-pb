---
title: "TableNo Property"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e28a2f89-b24f-4191-aa37-12d3a9901b88
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---

 

# TableNo Property
Sets the source table number, if any, for this codeunit.  
  
## Applies To  
 Codeunits  
  
## Remarks  
 Use the lookup to select the appropriate table number. If the codeunit can apply to any table, then choose Undefined.  
  
 If you specify a table number for this property, then you can use the CurrRec global variable in the codeunit and use the [Codeunit.RUN Method \(Codeunit\)](../methods/devenv-codeunit.RUN-method-codeunit.md) to execute the code unit  
  
## See Also  
 [Codeunit.RUN Method \(Codeunit\)](../methods/devenv-codeunit.RUN-method-codeunit.md)