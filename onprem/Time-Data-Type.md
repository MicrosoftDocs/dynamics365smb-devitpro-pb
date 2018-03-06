---
title: Time Data Type
description: The Time data type denotes a time within a given range. The display of the time is determined by your Regional and Language Options in Windows.
ms.custom: na
ms.date: 10/30/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0b0cdfc3-6d6e-4580-9fa6-2e18d12bcec5
caps.latest.revision: 11
manager: edupont
---
# Time Data Type in Dynamics NAV
Denotes a time ranging from 00:00:00.000 to 23:59:59.999. An undefined or blank time is specified by 0T.  
  
 The displayed text format of the time is determined by your Regional and Language Options in Windows.  
  
 The following are examples of valid assignments of times to a Time variable *MyTime*.  
  
```  
MyTime := 0T;  
MyTime := 1159T;  
MESSAGE(FORMAT(MyTime));  
MyTime := 115934T;  
MESSAGE(FORMAT(MyTime));  
MyTime := 115934.444T;  
MESSAGE(FORMAT(MyTime));  
MyTime := 0300T;  
MESSAGE(FORMAT(MyTime));  
```  
  
 The following shows what the message windows display on a computer with the regional format set to English \(United States\).  
  
 **11:59:00 AM**  
  
 **11:59:34 AM**  
  
 **11:59:34.444 AM**  
  
 **3:00:00 AM**  
  
## SQL Server  
 Microsoft SQL Server stores information about both date and time in columns of the DATETIME type. [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] uses only the time part and inserts a constant value for the date: 01-01-1754.  
  
 The [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] undefined time is represented by the same value as an undefined date. The undefined date is represented by the earliest valid DATETIME in SQL Server, which is 01-01-1753 00:00:00:000.  
  
## See Also  
 [TIME Function \(Time\)](TIME-Function--Time-.md)   
 [VARIANT2TIME Function](VARIANT2TIME-Function.md)   
 [CREATEDATETIME Function \(DateTime\)](CREATEDATETIME-Function--DateTime-.md)   
 [DT2TIME Function \(DateTime\)](DT2TIME-Function--DateTime-.md)