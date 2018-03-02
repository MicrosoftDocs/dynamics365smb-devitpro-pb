---
title: "USERSECURITYID Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 563f1dd2-17b5-476d-aa96-24a949594d3c
caps.latest.revision: 2
manager: edupont
---
# USERSECURITYID Function
Gets the unique identifier of the user that is logged on to the current session.  
  
## Syntax  
  
```  
  
USID := USERSECURITYID  
```  
  
## Property Value/Return Value  
 Type: Text or Code  
  
 The ID that is assigned to the user by the application. This is the value of the **User Security ID** field in table 2000000120, the **User** table, for the current user.  
  
## Example  
 This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|User|Text|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|The client was started by a user with the ID %1.|  
  
```  
User := USERSECURITYID;  
MESSAGE(Text000, User);  
```  
  
 The following is an example of the output of the previous code:  
  
 **The client was started by a user with the ID 1049f495-27ba-46a5-acca-ecf92324fbf8.**  
  
## See Also  
 [USERID Function \(Sessions\)](USERID-Function--Sessions-.md)   
 [SID Function \(Database\)](SID-Function--Database-.md)   
 [Database](Database.md)