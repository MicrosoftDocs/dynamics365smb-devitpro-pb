---
title: "Time Data Type"
description: "Denotes a time ranging from 00:00:00.000 to 23:59:59.999."
ms.author: solsen
ms.custom: na
ms.date: 07/13/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Time Data Type
> **Version**: _Available or changed with runtime version 1.0._

Denotes a time ranging from 00:00:00.000 to 23:59:59.999. An undefined or blank time is specified by 0T.




[//]: # (IMPORTANT: END>DO_NOT_EDIT)

The displayed text format of the time is determined by your Regional and Language Options in Windows.  
  
The following are examples of valid assignments of times to a Time variable *MyTime*. Time must be set by specifying hours, minutes, and seconds. 
  
```al
MyTime := 0T;  
MyTime := 115900T;  
Message(Format(MyTime));  
MyTime := 115934T;  
Message(Format(MyTime));  
MyTime := 115934.444T;  
Message(Format(MyTime));  
MyTime := 235900T;  
Message(Format(MyTime));  
MyTime := 030000T;  
Message(Format(MyTime));  
```  
  
The following shows what the message windows display accordingly on a computer with the regional format set to English (United States) for the syntax examples above.  
  
**11:59:00 AM**
  
**11:59:34 AM**
  
**11:59:34.444 AM**

**11:59:00 PM**
  
**3:00:00 AM**

## SQL Server

Microsoft SQL Server stores information about both date and time in columns of the DATETime type. [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] uses only the time part and inserts a constant value for the date: 01-01-1754.  
  
The [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] undefined time is represented by the same value as an undefined date. The undefined date is represented by the earliest valid DateTime in SQL Server, which is 01-01-1753 00:00:00:000.  
  
## See Also

[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  