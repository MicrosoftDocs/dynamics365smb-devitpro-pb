---
title: "USERSECURITYID Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 563f1dd2-17b5-476d-aa96-24a949594d3c
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# USERSECURITYID Method
Gets the unique identifier of the user that is logged on to the current session.  
  
## Syntax  
  
```  
  
USID := USERSECURITYID  
```  
  
## Property Value/Return Value  
 Type: Text or Code  
  
 The ID that is assigned to the user by the application. This is the value of the **User Security ID** field in table 2000000120, the **User** table, for the current user.  
  
## Example  
 This example requires that you create the following global variables and text constant.  
  
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
 [USERID Method \(Sessions\)](devenv-USERID-Method-Sessions.md)   
 [SID Method \(Database\)](devenv-SID-Method-Database.md)   
 [Database Methods](devenv-database-methods.md)