---
title: "SessionSettings.ProfileAppId Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# SessionSettings.ProfileAppId Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the ID of an extension, which provides a profile, in a SessionSettings object.


## Syntax
```
[ProfileAppId := ]  SessionSettings.ProfileAppId([NewProfileAppId: Guid])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*SessionSettings*
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.

*NewProfileAppId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
Sets the GUID of the extension that provides the profile. The value must be a valid GUID for an extension in the system table **2000000072 Profile**.
        


## Return Value
*ProfileAppId*
&emsp;Type: [Guid](../guid/guid-data-type.md)
The ID of the extension that is set in the SessionSettings object.
    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
A profile can be included as part of an extension, instead of being defined as part of the base application. In order to properly identify a profile from an extension in the SessionSettings object, you must specify the extension ID, by using the ProfileAppId method, and the profile ID, by using [ProfileId method](../../methods/devenv-profileid-method-sessionsettings.md).

The ProfileAppId property in a SessionSettings object corresponds to the **App ID** field in the in the system table **2000000073 User Personalization**

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then uses the ProfileAppId method and ProfileId method to set the object to use the profile that has the ID 'MyExtensionProfile', which is provided in the extension that has the ID '12345678-1234-1234-1234-1234567890AB'. Finally, the RequestSessionUpdate method sends a request to the client to abandon the current client session and start a new session that uses the new profile. This example requires a SessionSettings data type variable.

```al
var
  MySessionSettings : SessionSettings;
begin
  MySessionSettings.Init;
  MySessionSettings.ProfileId('MyExtensionProfile');
  MySessionSettings.ProfileAppId('12345678-1234-1234-1234-1234567890AB');
  MySessionSettings.RequestSessionUpdate(false);
end;  
```  


## See Also
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)