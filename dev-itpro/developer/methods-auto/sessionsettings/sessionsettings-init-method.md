---
title: "SessionSettings.Init() Method"
description: "Populates the instance of a SessionsSettings with the current client user's personalization properties (such as Profile ID and Company) that are stored in the database."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# SessionSettings.Init() Method
> **Version**: _Available or changed with runtime version 1.0._

Populates the instance of a SessionsSettings with the current client user's personalization properties (such as Profile ID and Company) that are stored in the database.


## Syntax
```AL
 SessionSettings.Init()
```

## Parameters
*SessionSettings*  
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)  
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The method gets the data from the following fields in system table **2000000073 User Personalization**: App ID, Company, Language ID, Locale ID, Profile ID, Scope, and Time Zone. In the SessionSettings object, the data is stored in properties that correspond to the fields of the system table.

After you call the Init method, you can change the values in the object by calling the following methods:

- [Company](sessionsettings-company-method.md)
- [LanguageId](sessionsettings-languageid-method.md)
- [LocalId method](sessionsettings-localeid-method.md)
- [ProfileAppId](sessionsettings-profileappid-method.md)
- [ProfileId](sessionsettings-profileid-method.md)
- [ProfileSystemScope](sessionsettings-profilesystemscope-method.md)
- [TimeZone](sessionsettings-timezone-method.md)

The Init method is useful before calling the [RequestSessionUpdate](sessionsettings-requestsessionupdate-method.md) method to ensure that all properties are initialized before sending the request to the server instance to start a new client session.

## Example  
This example uses the Init method to create a SessionSettings object that includes the current client user's personalization settings from the database, and uses the Company method to set the company to 'MyCompany'. Then, the RequestSessionUpdate method sends a request to the client to abandon the current client session and start a new session that uses the personalization settings in the SessionSettings object.

```al
var
  MySessionSettings : SessionSettings;
begin
  MySessionSettings.Init
  MySessionSettings.Company('MyCompany');
  MySessionSettings.RequestSessionUpdate(false);
end;  
```  


## See Also
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)