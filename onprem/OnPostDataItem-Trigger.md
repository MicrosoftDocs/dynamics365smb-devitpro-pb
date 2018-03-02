---
title: "OnPostDataItem Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6f6f0242-f97d-4062-bf00-4ba88ca1ebb2
caps.latest.revision: 8
manager: edupont
---
# OnPostDataItem Trigger
Executed after a data item is processed.  
  
## Applies To  
 Data items  
  
## Remarks  
 This trigger executes after the last record in the data item is processed but before the [OnPostReport Trigger](OnPostReport-Trigger.md) or the [OnPostXMLport Trigger](OnPostXMLport-Trigger.md) is executed, if it is the last data item of the report or XMLport.  
  
 Use this trigger to perform any cleanup or post processing needed after a data item is processed. For example, if you create a non-printing report where records are updated, you can update all the records with the modification date like this.  
  
```  
MODIFYALL("Modification Date",TODAY);   
```  
  
## See Also  
 [OnPostReport Trigger](OnPostReport-Trigger.md)