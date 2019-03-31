---
title: "WORKDATE Method (Date)"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
ms.assetid: 8b0806a4-0972-483a-a356-7298708925e5
author: SusanneWindfeldPedersen
manager: edupont
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

 

# WORKDATE Method (Date)
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

 The new work date.  

## Remarks  
<!--NAV
If you do not set a value for the *NewDate* parameter, then the method returns the work date that is specified by the **Set Work Date** option on the **Application** menu ![Application Menu button in menu bar](media/ApplicationMenuIcon.png "ApplicationMenuIcon") in the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)]. If there is no work date selected,  then the current system date is returned.  
-->

 To set the work date to follow the calendar day so that the work date is always the current date, set *NewDate* to `TODAY` or `0D`. If you explicitly set *NewDate* to the current date, then the work date will also follow the calendar day.  

## Example  
 This example shows how to use the WORKDATE method. This example requires that you create the following global variable and text constant.  

|Variable|DataType|  
|----------|----------------|  
|NewDate|Date|  

|Name|ConstValue|  
|----------|----------------|  
|Text000|The new work date is: %1|  
  

```  
NewDate := WORKDATE(010118D);  
MESSAGE(Text000, NewDate);  
```  

The code sets the work date to January 1, 2018, and returns the new date in a message. On a computer that has the regional format set to English \(United States\), the message window displays the following:  

 **The work date is: 01/01/18**  

## See Also  
 [Date and Time Methods](devenv-Date-and-Time-Methods.md)
