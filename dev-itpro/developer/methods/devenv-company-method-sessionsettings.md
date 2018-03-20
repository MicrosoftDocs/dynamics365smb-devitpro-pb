---
title: "Company Method (SessionSettings)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: SusanneWindfeldPedersen
---

 

# COMPANY Method
Gets or sets the company property in a SessionSettings object.  

## Syntax  

```  
[CurrCompanyName :=] SessionSettings.COMPANY([NewCompanyName])  
```  

#### Parameters  
*NewCompanyName*  
Type: Text  

Specifies the name of the company in the SessionSettings object. The company must already exist in the database, otherwise you will get an error at runtime.

## Property Value/Return Value  
Type: Text  

The name of the company that is set in the SessionSettings object.  

## Remarks
The company property in the SessionSettings object corresponds to the **Company** field in the in the system table **2000000073 User Personalization**.

## Example
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then calls the COMPANY method to change the company to 'MyCompany'. Finally, the REQUESTSESSIONUPDATE method sends a request to the client to abandon the current session and start a new session that uses the new company. This example requires a SessionSettings data type variable.

```
var
  MySessionSettings : SessionSettings;
  begin
    MySessionSettings.INIT;
    MySessionSettings.COMPANY('MyCompany');
    MySessionSettings.REQUESTSESSIONUPDATE(false);
  end;  
```  

## See Also  
[INIT Method](devenv-init-method-sessionsettings.md)  
[REQUESTSESSIONUPDATE Method](devenv-requestsessionupdate-method.md)  
[SessionSettings Data Type](../datatypes/devenv-sessionsettings-data-type.md)  
