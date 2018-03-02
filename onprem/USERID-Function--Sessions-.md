---
title: "USERID Function (Sessions)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 32e7226c-1977-4963-9101-0d3fde4cdbb0
caps.latest.revision: 14
manager: edupont
---
# USERID Function (Sessions)
Gets the user name of the user account that is logged on to the current session.  
  
## Syntax  
  
```  
  
ID := USERID  
```  
  
## Property Value/Return Value  
 Type: Text or Code  
  
 This string contains the value of the **User Name** field in table 2000000120, the **User** table, for the current user.  
  
## Example  
 This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|User|Text|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|The client was started by %1.|  
  
```  
User := USERID;  
MESSAGE(Text000, User);  
```  
  
 The following is an example of the output of the previous code:  
  
 **The system was started by cronus\\simon.**  
  
## See Also  
 [USERSECURITYID Function](USERSECURITYID-Function.md)   
 [SID Function \(Database\)](SID-Function--Database-.md)   
 [Database](Database.md)