---
title: "SessionSettings.RequestSessionUpdate Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# SessionSettings.RequestSessionUpdate Method
> **Version**: _Available or changed with runtime version 1.0._

Passes a SessionSettings object to the client to request a new session that uses the user personalization properties that are set in the object. The current client session is abandoned and a new session is started.


## Syntax
```
 SessionSettings.RequestSessionUpdate(saveSettings: Boolean)
```
## Parameters
*SessionSettings*
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.

*saveSettings*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  

Specifies whether to save the personalization properties in the SessionSettings object to the table **2000000073 User Personalization** in the database for the current client user. **true** saves the settings; **false** does not.
If you set this parameter to **true**, before sending the request to the client, the server instance will store the property values of the SessionSettings object to the corresponding fields in the table **2000000073 User Personalization**.
If you set this to **false**, when the new client session is closed, the next time the user signs in, the session will return to the previous personalization settings. This enables you to use the SessionSettings object to temporarily change the personalization settings for the current session.
        



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
Within the scope of the RequestSessionUpdate method, it is not recommended to run code after the RequestSessionUpdate method call that requires client communication because the current client session will be abandoned.

Before the RequestSessionUpdate method is called, be sure that all user personalization properties in the SessionSettings object have values; otherwise the system default values will be used for empty properties. To help, you can use the Init method to populate the object with the values in the database.

## Example  
This example uses the Init method to create a SessionSettings object that includes the current client user's personalization settings from the database, and then uses the Company method to set the company to 'MyCompany'. Finally, the RequestSessionUpdate method sends a request that saves the SessionSettings object property values to the database and starts a new client session that uses the new company.

```al
var
  MySessionSettings : SessionSettings;
begin
  MySessionSettings.Init
  MySessionSettings.Company('MyCompany');
  MySessionSettings.RequestSessionUpdate(true);
end;  
```  


## See Also
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)