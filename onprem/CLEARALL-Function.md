---
title: "CLEARALL Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fb0e152f-fd73-453d-8a8a-10b2b9bd0dbc
caps.latest.revision: 5
manager: edupont
---
# CLEARALL Function
Clears all internal variables \(except REC variables\), keys, and filters in the object and in any associated objects, such as reports, pages, codeunits, and so on that contain C/AL code.  
  
## Syntax  
  
```  
  
CLEARALL  
```  
  
## Remarks  
 CLEARALL works by calling the [CLEAR Function](CLEAR-Function.md) repeatedly on each variable. However, this is not the case with codeunits, where the CLEARALL function works by calling CLEARALL inside the codeunit. It deletes the contents of the codeunit, whereas CLEAR only deletes the reference to the codeunit.  
  
 CLEARALL does not affect or change values for variables in single instance codeunits.  
  
 When a function is called repeatedly in the same transaction, the system retains all values for variables and filters in memory between calls. For example, this is used to assign numbers to entry numbers when posting. When you do not want to retain the values in memory, use the CLEARALL function to clear them.  
  
 For information about the initial values of cleared variables, see the [CLEAR Function](CLEAR-Function.md). Take into consideration that fields in a record will be initialized with the [InitValue Property](InitValue-Property.md) of the field.  
  
## See Also  
 [CLEAR Function](CLEAR-Function.md)   
 [COPYSTREAM Function](COPYSTREAM-Function.md)   
 [EVALUATE Function](EVALUATE-Function.md)