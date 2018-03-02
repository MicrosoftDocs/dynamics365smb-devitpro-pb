---
title: "xRec and CurrFieldNo"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 81d47468-96bd-4875-806f-35de330ba149
caps.latest.revision: 6
---
# xRec and CurrFieldNo
When a user-defined function or a trigger is executed on a table object, xRec and CurrFieldNo are set differently, depending on how the function or trigger is executed. The following tables explain what happens in the different scenarios.  
  
## User-Defined Function  
 The following table explains what happens to xRec and CurrFieldNo when a user-defined function on a table object is called from either external or internal C/AL code. External C/AL code means that the calling code is in a different object. Internal C/AL code means that the calling code is in the same object \(another function in the same object\).  
  
|Execution initiated by|xRec value|CurrFieldNo value|  
|----------------------------|----------------|-----------------------|  
|External C/AL code|Empty|0|  
|Internal C/AL code|Unchanged|Unchanged|  
  
## Triggers  
 The following table explains what happens to xRec and CurrFieldNo when a trigger is called from either external or internal C/AL code. External C/AL code means that the calling code is in a different object. Internal C/AL code means that the calling code is in the same object \(another function in the same object\).  
  
|Scenario|xRec value|CurrFieldNo Value|  
|--------------|----------------|-----------------------|  
|VALIDATE trigger called by external C/AL code that calls the VALIDATE function|Copy of Rec before assignment in VALIDATE trigger|Field number of field being validated|  
|VALIDATE trigger called by internal C/AL code that calls the VALIDATE function|Unchanged|Unchanged|  
|Any table or function called by C/AL that initiates a call to a trigger other than VALIDATE|Copy of Rec before trigger is executed|0|