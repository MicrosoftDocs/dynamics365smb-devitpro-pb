---
title: "OnPostReport Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bc317b67-0417-44c8-9e40-b8bdcf274c43
caps.latest.revision: 7
manager: edupont
---
# OnPostReport Trigger
Executed after a report is run.  
  
## Applies To  
 Reports  
  
## Remarks  
 This trigger is executed after all data items are processed. The trigger is not run if the report was stopped manually or by using the QUIT function before processing had concluded.  
  
 Because this trigger is executed after the report is processed, you can use it to inform users about the result of the report run. For example, if some records could not be processed, you could inform the user of this using the following code in this trigger.  
  
```  
IF ProblemsInReport THEN  
MESSAGE(Text000, NumberOfErrors);  
```  
  
 Create the following text constant in the **C/AL Globals** window.  
  
|**Text constant**|**ENU value**|  
|-----------------------|-------------------|  
|Text000|'%1 records were not processed'|  
  
 Because this trigger is executed before the End Write Transaction, you can also give the user the opportunity to roll back changes to the database by leaving the report with the [QUIT Function \(Report, XMLport\)](QUIT-Function--Report--XMLport-.md).  
  
## See Also  
 [QUIT Function \(Report, XMLport\)](QUIT-Function--Report--XMLport-.md)