---
title: "Query Triggers"
ms.custom: na
ms.date: 03/16/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 8577e3f5-1ddf-4171-bb89-9fee33d4fe8f
author: SusanneWindfeldPedersen
manager: edupont
---


# Query Triggers
This topic describes the AL triggers that are available for queries. Triggers are typically used to perform calculations and verification. Triggers let you control how data is selected and retrieved in a more complex and effective way than you can achieve by using properties.  

## Query Object Triggers  
 The following table lists the triggers that apply to the query object.  

|Trigger|Executes|  
|-------------|--------------|  
|[OnBeforeOpen](devenv-onbeforeopen-trigger.md)|Before the query object is run and the dataset is generated. For example, you can use the **OnBeforeOpen** trigger to apply filters using the **SETFILTER** method.|  

## See Also  
 [Triggers](devenv-triggers.md)  
 [SETFILTER Method (Query)](../methods/devenv-setfilter-method-query.md)  
 [Report Triggers](devenv-report-triggers.md)  
