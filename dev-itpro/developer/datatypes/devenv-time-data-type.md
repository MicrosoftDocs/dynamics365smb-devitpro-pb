---
title: "Time Data Type"
ms.custom: na
ms.date: 06/08/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 0b0cdfc3-6d6e-4580-9fa6-2e18d12bcec5
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---
# Time Data Type
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
  
 The following shows what the message windows display on a computer with the regional format set to English (United States).  
  
 **11:59:00 AM**  
  
 **11:59:34 AM**  
  
 **11:59:34.444 AM**  
  
 **3:00:00 AM**  
  
## SQL Server  
 Microsoft SQL Server stores information about both date and time in columns of the DATETIME type. [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] uses only the time part and inserts a constant value for the date: 01-01-1754.  
  
 The [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] undefined time is represented by the same value as an undefined date. The undefined date is represented by the earliest valid DATETIME in SQL Server, which is 01-01-1753 00:00:00:000.  
  
## Methods
The following methods are supported for the Time data type:

[TIME method (Time)](../methods/devenv-time-method-time.md)   
[VARIANT2TIME method](../methods/devenv-variant2time-method.md)   
[CREATEDATETIME method (DateTime)](../methods/devenv-createdatetime-method-datetime.md)   
[DT2TIME method (DateTime)](../methods/devenv-dt2time-method-datetime.md)

## See Also  
[AL Data Types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  