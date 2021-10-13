---
title: "Entering Criteria in Filters"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Entering Criteria in Filters
When you enter criteria, you can use all the numbers and letters that you can normally use in the field. In addition, you can use some special symbols or mathematical expressions. Here are the available formats:  
  
|**Symbol**|**Meaning**|**Sample Expression**|**Records Displayed**|  
|-|-|-|-|   
|=|Equal to|377|Number 377|  
|||BLUE|Those with the BLUE code, for example, the BLUE warehouse code|  
|||22|A datetime: from 22-current month-current year 0:00:00 to 22-current month-current year 22:59:59|  
|||22 10|An exact datetime: 22-01-01 10:00:00|  
|..|Interval|1100..2100|Numbers 1100 through 2100|  
|||..2500|Up to and including 2500|  
|||..12 31 00|Dates up to and including 12 31 00|  
|||P8..|Information for accounting period 8 and thereafter|  
|||..23|From the beginning of time until 23-current month-current year 23:59:59|  
|||23..|From 23-current month-current year 0:00:00 until the end of time|  
|||22..23|From 22-current month-current year 0:00:00 until 23-current month-current year 23:59:59|  
|&#124;|Either/or|1200&#124;1300|Those with number 1200 or 1300|  
|&|And|<2000&>1000|Numbers that are less than 2000 and greater than 1000.<br /><br /> The & sign cannot be used by itself with numbers because no record can have two numbers.|  
|<>|Not equal to|\<>0|All numbers except 0|  
|>|Greater than|>1200|Numbers greater than 1200|  
|>=|Greater than or equal to|>=1200|Numbers greater than or equal to 1200|  
|<|Less than|<1200|Numbers less than 1200|  
|<=|Less than or equal to|<=1200|Numbers less than or equal to 1200|  
|*|An indefinite number of unknown characters|*Co*|Texts that contain "Co"|  
|||*Co|Texts that end with "Co"|  
|||Co*|Texts that begin with "Co"|  
|?|One unknown character|Hans?n|Texts such as Hansen or Hanson|  
||Calculate before rest|30&#124;\(>=10&\<=20\)|Those with number 30 or with a number from 10 through 20 (the result of the calculation within the parentheses)|  
|@|Ignore case (either uppercase or lowercase allowed)|@location|Texts such as LOCATION, location or Location|  
  
 You can also combine the various format expressions:  
  
|Expression|Description|  
|-|-|  
|5999&#124;8100..8490|Include any records with the number 5999 or a number from the interval 8100 through 8490.|  
|..1299&#124;1400..|Include records with a number less than or equal to 1299 or a number equal to 1400 or greater (all numbers except 1300 through 1399).|  
|>50&<100|Include records with numbers that are greater than 50 and less than 100 (numbers 51 through 99).|  
|*C*&*D\*|Texts containing both C and D.|  
|@*co?*|Texts containing co, CO, Co, cO, such as cot, cope and incorporated.<br /><br /> CO, cO, Co or co must be present, followed by at least one character, but there can be an indefinite number of characters before and after these, and case is unimportant.|  
  
> [!NOTE]  
>  It is important that you enter only meaningful filters. For example, it is possible to specify an interval that does not exist, and the program cannot check this for you. In order to enter meaningful filters, you must know the sorting rules followed by this program.  

