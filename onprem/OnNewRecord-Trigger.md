---
title: "OnNewRecord Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 680810f5-425f-483d-b574-4fe1db644b51
caps.latest.revision: 11
manager: edupont
---
# OnNewRecord Trigger
Executed after a new record is initialized, but before users can make entries.  
  
## Syntax  
  
```  
  
OnNewRecord(BelowxRec)  
```  
  
## Return Value  
 *BelowxRec*  
 \(Boolean\) This return value indicates whether the new record was inserted after the last record in the table \(xRec\). If **false**, the record was inserted between an existing record and the last record. If **true**, the record was inserted below the last record in the table \(xRec\).  
  
## Applies To  
 Pages  
  
## Remarks  
 Use this trigger to initialize a new record or other variables on the page.  
  
 If an error occurs in the trigger code a popup dialog shows an error message. When the dialog is closed, the user can enter new data.  
  
> [!NOTE]  
>  The OnNewRecord trigger does not support calls to control add-in methods and properties because the trigger is invoked before the page is instantiated. For more information see, [Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md).  
  
## See Also  
 [Triggers](Triggers.md)