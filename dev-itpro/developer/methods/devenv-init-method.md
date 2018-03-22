---
title: "INIT Method (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# INIT Method
Creates an instance of a SessionsSettings object that includes the client user's personalization settings that are currently stored in the database.

## Syntax  

```  
SessionSettings.INIT
```  

## Remarks  
The method gets the data from the following fields in system table 2000000073 User Personalization: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone.

## Example  
 This example shows how to remove the sign from a negative numeric value. This example requires that you create the following variables and text constant.  

|Variable name|DataType|  
|-------------------|--------------|  
|x|Decimal|  
|y|Decimal|  

|Text constant name|ENU Value|  
|------------------------|---------------|  
|Text000|x = %1, y = %2|  

```  
x := -10.235; // x is assigned a negative value  
y := ABS(x); // y is assigned the value of x without sign  
MESSAGE(Text000, x, y);  
```  

 The message window displays the following:  

 **x = -10.235, y = 10.235**  

## See Also  
[REQUESTSESSIONUPDATE method](devenv-requestsessionupdate-method.md)  
