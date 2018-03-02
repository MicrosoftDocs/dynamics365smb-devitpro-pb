---
title: "OnPreReport Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 069bf4ef-0cbd-4416-856f-a6eebf068e98
caps.latest.revision: 6
---
# OnPreReport Trigger
Executed before a report is run.  
  
## Applies To  
 Reports  
  
## Remarks  
 This trigger executes after the request page is run. The table views and filters for the report data items are set while this trigger is executed. As this trigger is executed after the request page is processed, you have access to any filters the user has set. If you want to print the settings of these filters in the report, you can retrieve them using the following text string.  
  
```  
ReportFilter := SomeRecord.GETFILTERS;  
```  
  
 Use the ReportFilter text string as the source expression for a control in a section of the report.  
  
## See Also  
 [GETFILTERS Function \(Record\)](GETFILTERS-Function--Record-.md)