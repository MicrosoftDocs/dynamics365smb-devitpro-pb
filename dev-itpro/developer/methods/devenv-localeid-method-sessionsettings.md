---
title: "LOCALEID Method (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: SusanneWindfeldPedersen
---

 

# LOCALEID Method
Gets or sets the locale ID property in a SessionSettings object.  

## Syntax  

```  
[CurrLocaleId :=] SessionSettings.LOCALEID([NewLocaleId])  
```  

#### Parameters  
*NewLocaleId*  
Type: Integer  

Specifies the locale ID to set in the SessionSettings object. The value must be a valid Windows locale ID.

## Return Value  
Type: Integer  

The locale ID that is set in the SessionSettings object.  

## Remarks  
The locale ID in the SessionSettings object corresponds to the **Locale ID** field in the system table **2000000073 User Personalization** for the client session user.

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then uses the LOCALEID method to set the locale ID to '1033'. Finally, the REQUESTSESSIONUPDATE method sends a request to the client to abandon the current client session and start a new session that uses the new locale ID. This example requires a SessionSettings data type variable.

```
var
  MySessionSettings : SessionSettings;
  begin
    MySessionSettings.INIT;
    MySessionSettings.LOCALEID(1033);
    MySessionSettings.REQUESTSESSIONUPDATE(false);
  end;  
```  

## See Also  
[INIT Method](devenv-init-method-sessionsettings.md)  
[REQUESTSESSIONUPDATE Method](devenv-requestsessionupdate-method.md)  
[SessionSettings Data Type](../datatypes/devenv-sessionsettings-data-type.md)   
