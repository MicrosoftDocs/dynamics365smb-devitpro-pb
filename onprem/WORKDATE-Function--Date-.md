---
title: WORKDATE Function | Date
description: Set the work date to follow the calendar day so that the work date is always the current date, set NewDate to TODAY or 0D.
ms.custom: na
ms.date: 10/24/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8b0806a4-0972-483a-a356-7298708925e5
caps.latest.revision: 13
manager: edupont
---
# WORKDATE Function (Date)
Gets and sets the work date for the current session.  
  
## Syntax  
  
```  
  
[WorkDate]:= WORKDATE([NewDate])  
```  
  
#### Parameters  
 *NewDate*  
 Type: Date  
  
 The new work date you want to set.  
  
## Property Value/Return Value  
 Type: Date  
  
 The current work date.  
  
## Remarks  
 If you do not set a value for the *NewDate* parameter, then the function returns the work date that is specified by the **Set Work Date** option on the **Application** menu ![Application Menu button in menu bar](media/ApplicationMenuIcon.png "ApplicationMenuIcon") in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. If there is no work date selected,  then the current system date is returned.  
  
 To set the work date to follow the calendar day so that the work date is always the current date, set *NewDate* to `TODAY` or `0D`. If you explicitly set *NewDate* to the current date, then the work date will also follow the calendar day.  
  
## Example  
 This example shows how to use the WORKDATE function. This example requires that you create the following text constant in the **C/AL Globals** window.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The work date is: %1|  
  
```  
WORKDATE(010114D);  
MESSAGE(Text000, WORKDATE);  
```  
  
 The first line of code sets the work date to January 1, 2014. In the second line of code, the WORKDATE function returns the current work date. On a computer that has the regional format set to English \(United States\), the message window displays the following:  
  
 **The work date is: 01/01/14**  
  
## See Also  
 [Date and Time Functions](Date-and-Time-Functions.md)