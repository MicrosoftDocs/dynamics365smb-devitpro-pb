---
title: "SessionSettings.Company Method"
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
# SessionSettings.Company Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the company property in a SessionSettings object.


## Syntax
```
[Company := ]  SessionSettings.Company([NewCompanyName: String])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*SessionSettings*
&emsp;Type: [SessionSettings](sessionsettings-data-type.md)
An instance of the [SessionSettings](sessionsettings-data-type.md) data type.

*NewCompanyName*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the name of the company in the SessionSettings object. The company must already exist in the database, otherwise you will get an error at runtime.
        


## Return Value
*Company*
&emsp;Type: [String](../string/string-data-type.md)
The name of the company that is set in the SessionSettings object.
      


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The company property in the SessionSettings object corresponds to the **Company** field in the in the system table **2000000073 User Personalization**.

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then calls the Company method to change the company to 'MyCompany'. Finally, the RequestSessionUpdate method sends a request to the client to abandon the current session and start a new session that uses the new company. This example requires a SessionSettings data type variable.

```al
var
  MySessionSettings : SessionSettings;
begin
  MySessionSettings.Init;
  MySessionSettings.Company('MyCompany');
  MySessionSettings.RequestSessionUpdate(false);
end;  
```  


## See Also
[SessionSettings Data Type](sessionsettings-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)