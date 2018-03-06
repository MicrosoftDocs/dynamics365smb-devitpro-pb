---
title: "TIMEZONE Function (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: jswymer
---
# TIMEZONE Function
Gets or sets the time zone property in a SessionSettings object.  

## Syntax  

```  
[CurrTimeZone :=] SessionSettings.TIMEZONE([NewTimeZone])  
```  

#### Parameters  
*NewTimeZone*  
Type: Text  

Specifies the time zone property in the SessionsSettings object.

The value must be a valid Windows time zone name, such as **UTC** or **Pacific Standard Time**. For a list of Windows time zones, see [Time Zone IDs](https://msdn.microsoft.com/en-us/library/gg154758.aspx).

The available time zones are defined in your computer's system registry under HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones.

## Return Value  
Type: Text  

The time zone set in the SessionSettings object.

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then uses the TIMEZONE function to set the time zone to 'UTC' (Coordinated Universal Time). Finally, the REQUESTSESSIONUPDATE function sends a request to the client to abnandon the current session and start a new session that uses the new profile ID. This example requires a SessionSettings data type variable.

The code requires that you create the following C/AL variable.  

|Variable|DataType|  
|--------------|--------------|  
|MySessionSettings|SessionSettings|  

```  
    MySessionSettings.INIT;
    MySessionSettings.TIMEZONE('UTC');
    MySessionSettings.REQUESTSESSIONUPDATE(false);
```  

## See Also  
[REQUESTSESSIONUPDATE function](requestsessionupdate-function-sessionsettings.md)  
