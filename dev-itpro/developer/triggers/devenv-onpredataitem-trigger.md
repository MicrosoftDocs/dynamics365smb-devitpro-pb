---
title: "OnPreDataItem Trigger"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 4b6df5e3-5346-4171-8113-54e098e4bc02
author: SusanneWindfeldPedersen
---


# OnPreDataItem Trigger
Executed before a data item is processed.  

## Applies To  
 Data items  

## Remarks  
 This trigger is executed before a data item is processed, but after the associated variable is initialized and table views and filters are set.  

 You can use this trigger to add additional filtering beyond what is established by the [DataItemLink Property (Reports)](../properties/devenv-dataitemlink-reports-property.md) or [DataItemTableView Property](../properties/devenv-dataitemtableview-property.md). For example, use this trigger if you need to filter an indented data item based on the result of a calculation. Use the [SETRANGE Record)](../methods/devenv-setrange-method-record.md) or [SETFILTER Record)](../methods/devenv-setfilter-method-record.md)  to add extra delimiters.  

## See Also  
 [DataItemLink Property (Reports)](../properties/devenv-dataitemlink-reports-property.md)   
 [DataItemTableView Property](../properties/devenv-dataitemtableview-property.md)   
 [SETRANGE Method Record)](../methods/devenv-setrange-method-record.md)   
 [SETFILTER Method Record)](../methods/devenv-setfilter-method-record.md)
