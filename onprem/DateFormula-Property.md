---
title: "DateFormula Property"
author: edupont04
manager: edupont04
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
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

|Syntax|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|**30D**|30 days|  
|**2W**|2 weeks|  
|**CM+10D**|Current month plus 10 days|  
|**CM+1M**|Current month plus one month|  
|**CQ+1M+20D**|Current quarter plus one month plus 20 days|  
|**CW+1W**|Current week plus one week|  
|**D15**|On the 15th of each month|  

 In [!INCLUDE[navnow](includes/navnow_md.md)], weeks begin on Monday and end on Sunday.  

 For fields, this property only applies to text fields. In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], the property also applied to code fields, but this has been deprecated.

> [!NOTE]  
>  We recommend that you do not use this property. Use the [DateFormula Data Type](DateFormula-Data-Type.md) instead.  

## See Also  
 [DateFormula Data Type](DateFormula-Data-Type.md)
