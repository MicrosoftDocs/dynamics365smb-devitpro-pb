---
title: "LANGUAGEID Method (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: SusanneWindfeldPedersen
---

 

# LANGUAGEID Method
Gets or sets the language ID property in a SessionSettings object.  

## Syntax  

```  
[CurrLanguageId :=] SessionSettings.LANGUAGEID([NewLanguageId])  
```  

#### Parameters  
*NewLanguageId*  
Type: Integer  

Specifies the language ID to set in the SessionSettings object. The value must be a valid Windows language ID, which is typically a 4-digit value such as 1033 for English or 1030 for Danish. The default value is 1033.

## Return Value  
Type: Integer  

The language ID that is set in the SessionSettings object.  

## Remarks  
The langauge ID in the SessionSettings object corresponds to the **Language ID** field in the system table **2000000073 User Personalization**.

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then uses the LANGUAGEID method to change the language ID to '1030'. Finally, the REQUESTSESSIONUPDATE method sends a request to the client to abandon the current client session and start a new session that uses the new language. This example requires a SessionSettings data type variable.

```
var
  MySessionSettings : SessionSettings;
  begin
    MySessionSettings.INIT;
    MySessionSettings.LANGUAGEID(1030);
    MySessionSettings.REQUESTSESSIONUPDATE(false);
  end;  
```  

## See Also  
[INIT Method](devenv-init-method-sessionsettings.md)  
[REQUESTSESSIONUPDATE Method](devenv-requestsessionupdate-method.md)  
[SessionSettings Data Type](../datatypes/devenv-sessionsettings-data-type.md)  
