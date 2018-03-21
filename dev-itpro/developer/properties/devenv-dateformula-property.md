---
title: "DateFormula Property"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/12/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d6bda43c-b5b4-4243-ac85-4b55cd2fe202
caps.latest.revision: 9
---

 

# DateFormula Property
Sets a date formula used to verify that the date the user enters is correct.  

## Applies To  

-   Table Fields  

-   Page Fields  

## Remarks  
 The following table shows the syntax that is used to create the date formula.  

|Syntax|Description|  
|------------|---------------------------------------|  
|**30D**|30 days|  
|**2W**|2 weeks|  
|**CM+10D**|Current month plus 10 days|  
|**CM+1M**|Current month plus one month|  
|**CQ+1M+20D**|Current quarter plus one month plus 20 days|  
|**CW+1W**|Current week plus one week|  
|**D15**|On the 15th of each month|  

 In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], weeks begin on Monday and end on Sunday.  

 For fields, this property only applies to text fields. In earlier versions of [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], the property also applied to code fields, but this has been deprecated.

> [!NOTE]  
>  We recommend that you do not use this property. Use the [DateFormula Data Type](../datatypes/devenv-date-formula-data-type.md) instead.  

## See Also  
 [DateFormula Data Type](../datatypes/devenv-date-formula-data-type.md)
