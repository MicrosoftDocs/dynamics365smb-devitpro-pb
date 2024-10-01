---
title: "SessionSettings.ProfileSystemScope([Boolean]) Method"
description: "Gets or sets the profile scope property in a SessionSettings object."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SessionSettings.ProfileSystemScope([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0 until version 13.0 where it was deprecated for the following reason: "System profiles have been deprecated. All profiles are now in the Tenant. Setting this value to true has no effect."_

Gets or sets the profile scope property in a SessionSettings object.


## Syntax
```AL
[ProfileSystemScope := ]  SessionSettings.ProfileSystemScope([NewProfileScope: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*SessionSettings*  
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)  
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.  

*[Optional] NewProfileScope*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the profile applies to the system or to a tenant only. **true** sets the profile to apply to the system; **false** sets the profile to apply to a tenant only.  


## Return Value
*[Optional] ProfileSystemScope*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the profile applies to the system; **false** if the profile applies to a tenant.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The ProfileSystemScope property in a SessionSettings object corresponds to the **Scope** field in the in the system table **2000000073 User Personalization**.

## Example
This example creates a SessionSettings object, and then uses the ProfileSystemScope method to set the profile scope to apply to the system. This example requires a SessionSettings data type variable.

```al
var
  MySessionSettings : SessionSettings;
begin
  MySessionSettings.ProfileSystemScope(true);
end;  
```  

## Related information
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)