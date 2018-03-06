---
title: "Report and Data Item Triggers"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7b87c648-7204-4513-babe-0a49d7996f19
caps.latest.revision: 11
---
# Report and Data Item Triggers
In reports, triggers are typically used to perform calculations and verification. Triggers let you control how data is selected and retrieved in a more complex and effective way than you can achieve by using properties.  
  
## Report Triggers  
 The following table lists triggers that apply to the report itself.  
  
|Trigger|Executed|  
|-------------|--------------|  
|[OnInitReport Trigger](OnInitReport-Trigger.md)|When the report is loaded.|  
|[OnPreReport Trigger](OnPreReport-Trigger.md)|Before the report is run, but after the **RequestPage** has been run.|  
|[OnPostReport Trigger](OnPostReport-Trigger.md)|After the report has run, but not if the report was stopped manually or by the [QUIT Function \(Report, XMLport\)](QUIT-Function--Report--XMLport-.md).|  
  
## Data Item Triggers  
 The following table lists triggers that apply to each data item on the report.  
  
|Trigger|Executed|  
|-------------|--------------|  
|[OnPreDataItem Trigger](OnPreDataItem-Trigger.md)|Before the data item is processed, but after the associated variable has been initialized.|  
|[OnAfterGetRecord \(Data Items\) Trigger](OnAfterGetRecord--Data-Items--Trigger.md)|When a record has been retrieved from the table.|  
|[OnPostDataItem Trigger](OnPostDataItem-Trigger.md)|When the data item has been iterated for the last time.|  
  
## See Also  
 [Report Triggers](Report-Triggers.md)   
 [Triggers](Triggers.md)