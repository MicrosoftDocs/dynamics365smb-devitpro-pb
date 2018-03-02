---
title: "REQUESTSESSIONUPDATE Function (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: jswymer
---
# REQUESTSESSIONUPDATE Function
Passes a SessionSettings object to the client to request a new session that uses the user personalization properties that are set in the object. The current client session is abandoned and a new session is started.  

## Syntax  

```  
SessionSettings.REQUESTSESSIONUPDATE(SaveSettings)  
```  

#### Parameters  
 *SaveSettings*  
 Type: Boolean  

Specifies whether to save the personalization properties in the SessionSettings object to the table **2000000073 User Personalization** in the database for the current client user. **true** saves the settings; **false** does not.

If you set this parameter to **true**, before sending the request to the client, the server instance will store the property values of the SessionSettings object to the corresponding fields in the table **2000000073 User Personalization**.

If you set this to **false**, when the new client session is closed, the next time the user signs in, the session will return to the previous personalization settings. This enables you to use the SessionSettings object to temporarily change the personalization settings for the current session.

## Remarks  
Within the scope of the REQUESTSESSIONUPDATE function, it is not recommended to run code after the REQUESTSESSIONUPDATE function call that requires client communication because the current client session will be abandoned.

Before the REQUESTSESSIONUPDATE function is called, be sure that all user personalization properties in the SessionSettings object have values; otherwise the system default values will be used for empty properties. To help, you can use the INIT function to populate the object with the values in the database.

## Example  
This example uses the INIT function to create a SessionSettings object that includes the current client user's personalization settings from the database, and then uses the COMPANY function to set the company to 'MyCompany'. Finally, the REQUESTSESSIONUPDATE function sends a request that saves the SessionSettings object property values to the database and starts a new client session that uses the new company.

The code requires that you create the following C/AL variable.  

|Variable|DataType|  
|--------------|--------------|  
|MySessionSettings|SessionSettings|  


```
    MySessionSettings.INIT
    MySessionSettings.COMPANY('MyCompany');
    MySessionSettings.REQUESTSESSIONUPDATE(true);  
```  

## See Also  
[INIT Function](init-function-sessionsettings.md)  
[COMPANY Function](company-function-sessionsettings.md)  
[SessionSettings Data Type](sessionsettings-data-type.md)  
