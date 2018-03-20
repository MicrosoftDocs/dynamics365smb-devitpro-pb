---
title: "QuickEntry Property"
ms.custom: na
ms.date: 06/16/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 6d7713f7-4d68-4989-8ed5-4dec80ae7334
caps.latest.revision: 12
author: SusanneWindfeldPedersen
---

 

# QuickEntry Property
Specifies if the page control should have input focus. The default value of the property is **true**. To specify that a control can be skipped, change this value to **false**.  
  
> [!NOTE]  
>  Specifying an expression as the value of the property is not supported.  
  
## Applies To  
 Page fields  
  
## Remarks  
 Apply this property setting to page controls that can be skipped for a faster entry of data. The **QuickEntry** property is respected when you use the Enter key. Tabbing through a page will sequentially give input focus to all page controls.  
  
 On pages, you use the **QuickEntry** property for groups, parts, fields, and action controls. You can enable or disable them either statically by setting the property to **true** or **false**, or dynamically by using a Boolean variable or a Boolean field on the page. The Boolean field on the page can be either a true/false Boolean or a Boolean expression, such as “Credit Limit > Sales YTD”.  
    
## See Also  
 [Properties](devenv-properties.md)