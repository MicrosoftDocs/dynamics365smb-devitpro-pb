---
title: "Query Triggers"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8577e3f5-1ddf-4171-bb89-9fee33d4fe8f
caps.latest.revision: 5
manager: edupont
---
# Query Triggers
This topic describes the C/AL triggers that are available for queries. Triggers are typically used to perform calculations and verification. Triggers let you control how data is selected and retrieved in a more complex and effective way than you can achieve by using properties.  
  
## Query Object Triggers  
 The following table lists the triggers that apply to the query object.  
  
|Trigger|Executes|  
|-------------|--------------|  
|OnBeforeOpen|Before the query object is run and the dataset is generated. For example, you can use the **OnBeforeOpen** trigger to apply filters using the **SETFILTER** function.|  
  
## See Also  
 [Queries](Queries.md)   
 [SETFILTER Function \(Query\)](SETFILTER-Function--Query-.md)