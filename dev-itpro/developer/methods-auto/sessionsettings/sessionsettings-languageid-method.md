---
title: "SessionSettings.LanguageId Method"
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
# SessionSettings.LanguageId Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the language ID property in a SessionSettings object.


## Syntax
```
[LanguageId := ]  SessionSettings.LanguageId([NewLanguageId: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*SessionSettings*
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.

*NewLanguageId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the language ID to set in the SessionSettings object. The value must be a valid Windows language ID, which is typically a 4-digit value such as 1033 for English or 1030 for Danish. The default value is 1033.
        


## Return Value
*LanguageId*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The language ID that is set in the SessionSettings object.
      


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The langauge ID in the SessionSettings object corresponds to the **Language ID** field in the system table **2000000073 User Personalization**.

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then uses the LanguageId method to change the language ID to '1030'. Finally, the RequestSessionUpdate method sends a request to the client to abandon the current client session and start a new session that uses the new language. This example requires a SessionSettings data type variable.

```al
var
  MySessionSettings : SessionSettings;
begin
  MySessionSettings.Init;
  MySessionSettings.LanguageId(1030);
  MySessionSettings.RequestSessionUpdate(false);
end;  
```  


## See Also
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)