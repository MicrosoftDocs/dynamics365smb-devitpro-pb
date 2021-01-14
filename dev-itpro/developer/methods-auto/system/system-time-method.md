---
title: "System.Time Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# System.Time Method
> **Version**: _Available from runtime version 1.0._

Gets the current time from the operating system.


## Syntax
```
Time :=   System.Time()
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*Time*
&emsp;Type: [Time](../time/time-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

The time that is returned is different for the [!INCLUDE[webclient](../../includes/webclient.md)] and [!INCLUDE[nav_windows](../../includes/nav_windows_md.md)]. For the Web client, the time is determined by the Regional Setting that is set under **MySetting** in the client. The very first time a user signs in, the system automatically determines the Regional Setting based on the user's browser/computer. For the Windows client, TIME returns the current day of the computer that is running the client, as determined by the date and time settings of the operating system.

 You can only use the TIME method to retrieve the time from the operating system. You cannot use it to set the time in the operating system.  
  
## Example  

``` 
var
    Text000: Label 'The current system time is %1.";
begin
    Message(Text000, TIME);  
end;
```  
  
 On a computer that has the regional format set to English \(United States\), the message window could display the following:  
  
 **The current system time is 11:15:46 AM.**  

 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)