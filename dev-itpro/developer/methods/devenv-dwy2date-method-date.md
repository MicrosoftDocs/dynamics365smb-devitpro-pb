---
title: "DWY2DATE Method (Date)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d50741b1-25f6-421b-9dec-2fd07a25196d
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DWY2DATE Method (Date)
Gets a Date that is based on a week day, a week, and a year.  
  
## Syntax  
  
```  
  
Date := DWY2DATE(WeekDay [, Week] [, Year]))  
```  
  
#### Parameters  
 *Weekday*  
 Type: Integer  
  
 The number of the day in the week \(1-7\). Monday is day number 1.  
  
 *Week*  
 Type: Integer  
  
 The number of the week. Week 1 is the first week of the year that has four or more days in the year. If you omit this optional parameter, the current week is used as the default.  
  
 *Year*  
 Type: Integer  
  
 The four-digit number of the year. If you omit this optional parameter, the year of the current week is used as the default.  
  
## Property Value/Return Value  
 Type: Date  
  
 The resulting date.  
  
## Remarks  
 A special situation occurs if the week \(*Week*\) that is input into DWY2DATE spans two years. Depending on *Weekday*, the year of the output *Date* can differ from the input year. This scenario is shown in the following code example.  
  
## Example  
 The input week in this example spans two years. This code example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|DayOfWeek|Integer|  
|Week|Integer|  
|Year|Integer|  
|OutputDate|Date|  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|Day %1 of week %2 in the year %3 is the date %4.|  
  
```  
DayOfWeek := 1;  
Week := 1;  
Year := 2014;  
OutputDate := DWY2DATE(DayOfWeek, Week, Year);  
MESSAGE(Text000, DayOfWeek, Week, Year, OutputDate);  
```  
  
 On a computer that has the regional format set to English \(United States\), the message window displays the following:  
  
 **Day 1 of week 1 in the year 2014 is the date: 12/30/13.**  
  
 The example shows that the first day of the week in the first week of the year 2014 is regarded as the date December 30, 2013. The first week of the year 2014 is the first week that has four or more days in the year 2014. That week starts on Monday, December 30, 2013, and ends on Sunday, January 5, 2014.  
  
## Example  
 The input week in this example spans two years. This code example requires that you create the following global variables and text constants.  
  
|Variable name|Data type|  
|-------------------|---------------|  
|DayOfWeek|Integer|  
|Week|Integer|  
|Year|Integer|  
|OutputDate|Date|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Day %1 of week %2 in the year %3 is the date %4.|  
  
```  
DayOfWeek := 1;  
Week := 1;  
Year := 2016;  
OutputDate := DWY2DATE(DayOfWeek, Week, Year);  
MESSAGE(Text000, DayOfWeek, Week, Year, OutputDate);  
```  
  
 On a computer that has the regional format set to English \(United States\), the message window displays the following:  
  
 **Day 1 of week 1 in the year 2016 is the date: 01/04/16.**  
  
 The example shows that the first day of the week in the first week of the year 2016 is regarded as the date January 4, 2016. The first week of the year 2016 is the first week that has four or more days in the year 2016. That week starts on Monday, January 4, 2016, and ends on Sunday, January 11, 2015.  
  
## Example  
 This example shows how to use the DWY2DATE method without specifying the optional *Year* parameter. The output in this example depends on the day on which you run the code. This code example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|DayOfWeek|Integer|  
|Week|Integer|  
|OutputDate|Date|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Day %1 of week %2 is the date %3.|  
  
```  
DayOfWeek := 1;  
Week := 1;  
OutputDate := DWY2DATE(DayOfWeek, Week);  
MESSAGE(Text000, DayOfWeek, Week, OutputDate);  
```  
  
 On a computer that has the regional format set to English \(United States\), if you ran the code on January 1, 2014, then the message window displays the following:  
  
 **Day 1 of week 1 is the date: 12/30/13.**  
  
 If you do not specify the year, then the year of the current week is used. On January 1, 2014, the current week is the week that starts on December 30, 2013 and ends on January 5, 2014. This week has four days in 2014 so the year of the current week is 2014. The first day of the first week of 2014 is 12/30/13.  
  
 On a computer that has the regional format set to English \(United States\), if you ran the code on January 1, 2016, then the message window displays the following:  
  
 **Day 1 of week 1 is the date: 12/29/14.**  
  
 On January 1, 2016, the current week is the week that starts on December 28, 2015 and ends on January 3, 2016. This week has four days in 2015 so the year of the current week is 2015. The first day of the first week of 2015 is 12/29/14.  
  
## See Also  
 [Date and Time Methods](devenv-Date-and-Time-Methods.md)