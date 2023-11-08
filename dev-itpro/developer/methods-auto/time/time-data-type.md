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
  
The following are examples of valid assignments of times to a Time variable *MyTime*. Time must be set by specifying hours, minutes, and seconds. Milliseconds are optional.
  
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

Microsoft SQL Server stores information about both date and time in columns of the datetime type. [!INCLUDE [prod_short](../../includes/prod_short.md)] uses only the time part and inserts a constant value for the date: 01-01-1754.  
  
The [!INCLUDE [prod_short](../../includes/prod_short.md)] undefined time is represented by the same value as an undefined date. The undefined date is represented by the earliest valid datetime in SQL Server, which is 01-01-1753 00:00:00:000.

## Comparing time values

The comparison of time values does not work if you compare the time value before writing to the database with the time value that was written to the database.
The cause of the problem is that in [!INCLUDE [prod_short](../../includes/prod_short.md)] DateTime and Time values are rounded by SQL Server (see [datetime in Transact-SQL](https://learn.microsoft.com/sql/t-sql/data-types/datetime-transact-sql)). This means that a DateTime or Time value can change just because it was written to the database, and the comparison with the original value then runs on error.

For comparison of two time values, a procedure like the following should be used:

```al
procedure CompareTime(TimeA: Time; TimeB: Time): Integer
begin
    // Compares the specified Time values for equality within a small threshold.
    // Returns 1 if TimeA > TimeB, -1 if TimeB > TimeA, and 0 if they are equal.

    // The threshold must be used to compensate for the varying levels of precision
    // when storing DateTime values. An example of this is the T-SQL datetime type,
    // which has a precision that goes down to the nearest 0, 3, or 7 milliseconds.

    case true of
        TimeA = TimeB:
            exit(0);
        TimeA = 0T:
            exit(-1);
        TimeB = 0T:
            exit(1);
        Abs(TimeA - TimeB) < 10:
            exit(0);
        TimeA > TimeB:
            exit(1);
        else
            exit(-1);
    end;
end;
```
  
## See Also

[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
