---
title: "System.WorkDate Method"
description: "Gets and sets the work date for the current session."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# System.WorkDate Method
> **Version**: _Available or changed with runtime version 1.0._

Gets and sets the work date for the current session.


## Syntax
```AL
[WorkDate := ]  System.WorkDate([NewDate: Date])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*[Optional] NewDate*  
&emsp;Type: [Date](../date/date-data-type.md)  
The new work date you want to set.  


## Return Value
*[Optional] WorkDate*  
&emsp;Type: [Date](../date/date-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

<!--NAV
If you do not set a value for the *NewDate* parameter, then the method returns the work date that is specified by the **Set Work Date** option on the **Application** menu ![Application Menu button in menu bar](media/ApplicationMenuIcon.png "ApplicationMenuIcon") in the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)]. If there is no work date selected,  then the current system date is returned.  
-->

To set the work date to follow the calendar day so that the work date is always the current date, set *NewDate* to `Today` or `0D`. If you explicitly set *NewDate* to the current date, then the work date will also follow the calendar day.  

## Example

This example shows how to use the WorkDate method. 
 
```al
var
    NewDate: Date;
    Text000: Label 'The new work date is: %1';
begin
    NewDate := WorkDate(20180101D);  
    Message(Text000, NewDate);  
end;
```  

The code sets the work date to January 1, 2018, and returns the new date in a message. On a computer that has the regional format set to English \(United States\), the message window displays the following:  

 **The work date is: 01/01/18**


## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)