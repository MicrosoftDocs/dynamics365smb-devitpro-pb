---
title: "Company Function (SessionSettings)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamicsnav-2017
author: jswymer
---

# COMPANY Function
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
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then calls the COMPANY function to change the company to 'MyCompany'. Finally, the REQUESTSESSIONUPDATE function sends a request to the client to abandon the current session and start a new session that uses the new company. This example requires a SessionSettings data type variable.

The code requires that you create the following C/AL variable.  

|Variable|DataType|  
|--------------|--------------|  
|MySessionSettings|SessionSettings|  


```
    MySessionSettings.INIT;
    MySessionSettings.COMPANY('MyCompany');
    MySessionSettings.REQUESTSESSIONUPDATE(false);
```  

## See Also  
[INIT Function](init-function-sessionsettings.md)  
[REQUESTSESSIONUPDATE Function](requestsessionupdate-function-sessionsettings.md)  
[SessionSettings Data Type](sessionsettings-data-type.md)  
