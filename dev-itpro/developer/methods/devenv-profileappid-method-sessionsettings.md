---
title: "PROFILEAPPID Method (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: SusanneWindfeldPedersen
---

 

# PROFILEAPPID Method
Gets or sets the ID of an extension, which provides a profile, in a SessionSettings object.  

## Syntax  

```  
[CurrProfileAppId :=] SessionSettings.PROFILEAPPID([NewProfileAppId])  
```  

#### Parameters  
*NewProfileAppId*  
Type: GUID  

Sets the GUID of the extension that provides the profile. The value must be a valid GUID for an extension in the system table **2000000072 Profile**.

## Return Value  
Type: GUID  

The ID of the extension that is set in the SessionSettings object.  

## Remarks
A profile can be included as part of an extension, instead of being defined as part of the base application. In order to properly identify a profile from an extension in the SessionSettings object, you must specify the extension ID, by using the PROFILEAPPID method, and the profile ID, by using [PROFILEID method](devenv-profileid-method-sessionsettings.md).

The PROFILEAPPID property in a SessionSettings object corresponds to the **App ID** field in the in the system table **2000000073 User Personalization**

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then uses the PROFILEAPPID method and PROFILEID method to set the object to use the profile that has the ID 'MyExtensionProfile', which is provided in the extension that has the ID '12345678-1234-1234-1234-1234567890AB'. Finally, the REQUESTSESSIONUPDATE method sends a request to the client to abandon the current client session and start a new session that uses the new profile. This example requires a SessionSettings data type variable.

```
var
  MySessionSettings : SessionSettings;
  begin
    MySessionSettings.INIT;
    MySessionSettings.PROFILEID('MyExtensionProfile');
    MySessionSettings.PROFILEAPPID('12345678-1234-1234-1234-1234567890AB');
    MySessionSettings.REQUESTSESSIONUPDATE(false);
  end;  
```  

## See Also  
[INIT Method](devenv-init-method-sessionsettings.md)  
[PROFILEID Method](devenv-profileid-method-sessionsettings.md)  
[REQUESTSESSIONUPDATE Method](devenv-requestsessionupdate-method.md)  
[SessionSettings Data Type](../datatypes/devenv-sessionsettings-data-type.md)  
