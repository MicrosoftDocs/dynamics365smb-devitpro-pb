---
title: "CLEARALL Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: fb0e152f-fd73-453d-8a8a-10b2b9bd0dbc
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CLEARALL Method
Clears all internal variables \(except REC variables\), keys, and filters in the object and in any associated objects, such as reports, pages, codeunits, and so on that contain AL code.  
  
## Syntax  
  
```  
  
CLEARALL  
```  
  
## Remarks  
 CLEARALL works by calling the [CLEAR Method](devenv-CLEAR-Method.md) repeatedly on each variable. However, this is not the case with codeunits, where the CLEARALL method works by calling CLEARALL inside the codeunit. It deletes the contents of the codeunit, whereas CLEAR only deletes the reference to the codeunit.  
  
 CLEARALL does not affect or change values for variables in single instance codeunits.  
  
 When a method is called repeatedly in the same transaction, the system retains all values for variables and filters in memory between calls. For example, this is used to assign numbers to entry numbers when posting. When you do not want to retain the values in memory, use the CLEARALL method to clear them.  
  
 For information about the initial values of cleared variables, see the [CLEAR Method](devenv-CLEAR-Method.md). Take into consideration that fields in a record will be initialized with the [InitValue Property](../properties/devenv-InitValue-Property.md) of the field.  
  
## See Also  
 [CLEAR Method](devenv-CLEAR-Method.md)   
 [COPYSTREAM Method](devenv-COPYSTREAM-Method.md)   
 [EVALUATE Method](devenv-EVALUATE-Method.md)