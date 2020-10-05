---
title: "System.Date2DWY Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.Date2DWY Method
Gets the day of the week, week number, or year of a Date Data Type.


## Syntax
```
Number :=   System.Date2DWY(Date: Date, Value: Integer)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Date*  
&emsp;Type: [Date](../date/date-data-type.md)  
The input date.  
*Value*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies what the function returns. The valid options are 1, 2, and 3.
- The value 1 corresponds to day of the week (1-7, Monday = 1).
- The value 2 corresponds to week number (1-53).
- The value 3 corresponds to year.
        


## Return Value
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The resulting day of the week, week number, or year.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When the input date to the **DATE2DWY** method is in a week that spans two years, the **DATE2DWY** method computes the output year as the year that has the most days. For example, the input date is 010114. This date is in a week that starts on Monday, December 29, 2013, and ends Sunday, January 4, 2014. The week has three days in 2008 and four days in 2014. So the output year is 2014.

> [!IMPORTANT]
> Date2DWY always uses the **ISO week-numbering year** scheme for the week, regardless of the server or device configuration. This means that week 01 of a year is the week that includes the first Thursday of the Gregorian year. Or in other words, the week that includes 4 January.

## Example

This example shows a special case that occurs when you use the **DATE2DWY** method in a week that spans two years. 
 
```  
var
    InputDate: Date;
    DayOfWeek: Integer;
    WeekNumber: Integer;
    Year: Integer;
    Text000: Label 'The date %1 corresponds to:\\';
    Text001: Label 'The day of the week: %2\\';
    Text002: Label 'The week number: %3\\';
    Text003: Label 'The year: %4';
begin
    InputDate := 20140101D;  
    DayOfWeek := DATE2DWY(InputDate, 1);  
    WeekNumber := DATE2DWY(InputDate, 2);  
    Year := DATE2DWY(InputDate, 3);  
    MESSAGE(Text000 + Text001 + Text002 + Text003, InputDate, DayOfWeek, WeekNumber, Year);  
end;
```  
  
 The message window displays the following information:  
  
 **The date 01/01/14 corresponds to:**  
  
 **The day of the week: 4**  
  
 **The week number: 1**  
  
 **The year: 2014**  
  
 This example shows that the date 01/01/14 is regarded as day number 4 \(Thursday\) in week number 1 in the year 2014.  
  

## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
