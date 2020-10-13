---
title: "Query Triggers"
description: "Query triggers in AL for Business Central."
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Query Triggers
This topic describes the AL triggers that are available for queries. Triggers are typically used to perform calculations and verification. Triggers let you control how data is selected and retrieved in a more complex and effective way than you can achieve by using properties.  

## Query object triggers  
 The following table lists the triggers that apply to the query object.  

|Trigger|Runs|  
|-------------|--------------|  
|[OnBeforeOpen](devenv-onbeforeopen-trigger.md)|Before the query object is run and the dataset is generated. For example, you can use the **OnBeforeOpen** trigger to apply filters using the **SETFILTER** method.|  

## See Also  
[Query Object](../devenv-query-object.md)  
[Triggers](devenv-triggers.md)  
[SETFILTER Method (Query)](../methods/devenv-setfilter-method-query.md)  
[Report Triggers](devenv-report-triggers.md)  
