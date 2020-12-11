---
title: "SessionSettings.Init Method"
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
# SessionSettings.Init Method
> **Version**: _Available from runtime version 1.0._

Populates the instance of a SessionsSettings with the current client user's personalization properties (such as Profile ID and Company) that are stored in the database.


## Syntax
```
 SessionSettings.Init()
```

## Parameters
*SessionSettings*
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The method gets the data from the following fields in system table **2000000073 User Personalization**: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone. In the SessionSettings object, the data is stored in properties that correspond to the fields of the system table.

After you call the INIT method, you can change the values in the object by calling the following methods:
-   [COMPANY](../../methods/devenv-company-method-sessionsettings.md)
-   [LANGUAGEID](../../methods/devenv-languageid-method-sessionsettings.md)
-   [LOCALID method](../../methods/devenv-localeid-method-sessionsettings.md)
-   [PROFILEAPPID](../../methods/devenv-profileappid-method-sessionsettings.md)
-   [PROFILEID](../../methods/devenv-profileid-method-sessionsettings.md)
-   [PROFILESYSTEMSCOPE](../../methods/devenv-profilesystemscope-method-sessionsettings.md)
-   [TIMEZONE](../../methods/devenv-timezone-method-sessionsettings.md)

The INIT method is useful before calling the [REQUESTSESSIONUPDATE](../../methods/devenv-requestsessionupdate-method.md) method to ensure that all properties are initialized before sending the request to the server instance to start a new client session.

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
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)