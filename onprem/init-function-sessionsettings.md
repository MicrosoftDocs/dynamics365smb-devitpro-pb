---
title: "INIT Function (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: jswymer
---
# INIT Function
Populates the instance of a SessionsSettings with the current client user's personalization properties (such as Profile ID and Company) that are stored in the database.

## Syntax  

```  
SessionSettings.INIT
```  

## Remarks  
The function gets the data from the following fields in system table **2000000073 User Personalization**: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone. In the SessionSettings object, the data is stored in properties that correspond to the fields of the system table.

After you call the INIT function, you can change the values in the object by calling the following methods:
-   [COMPANY](company-function-sessionsettings.md)
-   [LANGUAGEID](languageid-function-sessionsettings.md)
-   [LOCALID function](localeid-function-sessionsettings.md)
-   [PROFILEAPPID](profileappid-function-sessionsettings.md)
-   [PROFILEID](profileid-function-sessionsettings.md)
-   [PROFILESYSTEMSCOPE](profilesystemscope-function-sessionsettings.md)
-   [TIMEZONE](timezone-function-sessionsettings.md)

The INIT function is useful before calling the [REQUESTSESSIONUPDATE](requestsessionupdate-function-sessionsettings.md) function to ensure that all properties are initialized before sending the request to the server instance to start a new client session.

## Example  
This example uses the INIT function to create a SessionSettings object that includes the current client user's personalization settings from the database, and uses the COMPANY function to set the company to 'MyCompany'. Then, the REQUESTSESSIONUPDATE function sends a request to the client to abandon the current client session and start a new session that uses the personalization settings in the SessionSettings object.

The code requires that you create the following C/AL variable.  

|Variable|DataType|  
|--------------|--------------|  
|MySessionSettings|SessionSettings|  


```
    MySessionSettings.INIT
    MySessionSettings.COMPANY('MyCompany');
    MySessionSettings.REQUESTSESSIONUPDATE(false);
```  

## See Also  
[COMPANY Function](company-function-sessionsettings.md)  
[REQUESTSESSIONUPDATE function](requestsessionupdate-function-sessionsettings.md)  
[SessionSettings Data Type](sessionsettings-data-type.md)  
