---
title: "QUIT Function (Report, XMLport)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5ec8d038-e2b8-433a-9b33-8096ade4bae9
caps.latest.revision: 7
manager: edupont
---
# QUIT Function (Report, XMLport)
Aborts the processing of a report or XMLport.  
  
## Syntax  
  
```  
  
QUIT  
```  
  
## Remarks  
 When you use the QUIT function, the report or XMLport is exited without committing any changes that were made to the database during the execution. The [OnPostReport Trigger](OnPostReport-Trigger.md) or [OnPostXMLport Trigger](OnPostXMLport-Trigger.md) trigger will not be called.  
  
## Example  
 The following example shows how to use the QUIT function to abort an execution without committing any changes that were made during the processing.  
  
```  
  
// Do some database processing.  
CurrReport.QUIT;  
  
```  
  
## See Also  
 [Report Data Type](Report-Data-Type.md)   
 [XMLport Data Type](XMLport-Data-Type.md)