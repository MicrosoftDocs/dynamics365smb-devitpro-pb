---
title: "INIT Method (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# INIT Method
Populates the instance of a SessionsSettings with the current client user's personalization properties (such as Profile ID and Company) that are stored in the database.

## Syntax  

```  
SessionSettings.INIT
```  

## Remarks  
The method gets the data from the following fields in system table **2000000073 User Personalization**: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone. In the SessionSettings object, the data is stored in properties that correspond to the fields of the system table.

After you call the INIT method, you can change the values in the object by calling the following methods:
-   [COMPANY](devenv-company-method-sessionsettings.md)
-   [LANGUAGEID](devenv-languageid-method-sessionsettings.md)
-   [LOCALID method](devenv-localeid-method-sessionsettings.md)
-   [PROFILEAPPID](devenv-profileappid-method-sessionsettings.md)
-   [PROFILEID](devenv-profileid-method-sessionsettings.md)
-   [PROFILESYSTEMSCOPE](devenv-profilesystemscope-method-sessionsettings.md)
-   [TIMEZONE](devenv-timezone-method-sessionsettings.md)

The INIT method is useful before calling the [REQUESTSESSIONUPDATE](devenv-requestsessionupdate-method.md) method to ensure that all properties are initialized before sending the request to the server instance to start a new client session.

## Example  
This example uses the INIT method to create a SessionSettings object that includes the current client user's personalization settings from the database, and uses the COMPANY method to set the company to 'MyCompany'. Then, the REQUESTSESSIONUPDATE method sends a request to the client to abandon the current client session and start a new session that uses the personalization settings in the SessionSettings object.

```
var
  MySessionSettings : SessionSettings;
  begin
    MySessionSettings.INIT
    MySessionSettings.COMPANY('MyCompany');
    MySessionSettings.REQUESTSESSIONUPDATE(false);
  end;  
```  

## See Also  
[COMPANY Method](devenv-company-method-sessionsettings.md)  
[REQUESTSESSIONUPDATE method](devenv-requestsessionupdate-method.md)  
[SessionSettings Data Type](../datatypes/devenv-sessionsettings-data-type.md)  
