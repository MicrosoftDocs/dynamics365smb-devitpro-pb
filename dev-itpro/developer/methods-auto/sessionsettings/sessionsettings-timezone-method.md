---
title: "SessionSettings.TimeZone Method"
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
# SessionSettings.TimeZone Method
Gets or sets the time zone property in a SessionSettings object.


## Syntax
```
[TimeZone := ]  SessionSettings.TimeZone([NewTimeZone: String])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*SessionSettings*  
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)  
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.  

*NewTimeZone*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the time zone property in the SessionsSettings object. The value must be a valid Windows time zone name, such as **UTC** or **Pacific Standard Time**.  


## Return Value
*TimeZone*  
&emsp;Type: [String](../string/string-data-type.md)  
The time zone set in the SessionSettings object.
        


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then uses the TIMEZONE method to set the time zone to 'UTC' (Coordinated Universal Time). Finally, the REQUESTSESSIONUPDATE method sends a request to the client to abnandon the current session and start a new session that uses the new profile ID. This example requires a SessionSettings data type variable.

```
var
  MySessionSettings : SessionSettings;
begin
  MySessionSettings.INIT;
  MySessionSettings.TIMEZONE('UTC');
  MySessionSettings.REQUESTSESSIONUPDATE(false);
end;  
```  


## See Also
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)