---
title: "SessionSettings.ProfileSystemScope Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# SessionSettings.ProfileSystemScope Method
Gets or sets the profile scope property in a SessionSettings object.


## Syntax
```
[ProfileSystemScope := ]  SessionSettings.ProfileSystemScope([NewProfileScope: Boolean])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*SessionSettings*  
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)  
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.  

*NewProfileScope*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the profile applies to the system or to a tenant only. **true** sets the profile to apply to the system; **false** sets the profile to apply to a tenant only.  


## Return Value
*ProfileSystemScope*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the profile applies to the system; **false** if the profile applies to a tenant.
        


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The PROFILESYSTEMSCOPE property in a SessionSettings object corresponds to the **Scope** field in the in the system table **2000000073 User Personalization**.

## Example
This example creates a SessionSettings object, and then uses the PROFILESYSTEMSCOPE method to set the profile scope to apply to the system. This example requires a SessionSettings data type variable.

```
var
  MySessionSettings : SessionSettings;
begin
  MySessionSettings.PROFILESYSTEMSCOPE(true);
end;  
```  

## See Also
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)