---
title: "LOCALEID Function (SessionSettings)"
ms.custom: na
ms.date: 01/06/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: jswymer
---
# LOCALEID Function
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
This example creates a SessionSettings object that is populated with the current client user's personalization data, and then uses the LOCALEID function to set the locale ID to '1033'. Finally, the REQUESTSESSIONUPDATE function sends a request to the client to abandon the current client session and start a new session that uses the new locale ID. This example requires a SessionSettings data type variable.

The code requires that you create the following C/AL variable.  

|Variable|DataType|  
|--------------|--------------|  
|MySessionSettings|SessionSettings|  


```
    MySessionSettings.INIT;
    MySessionSettings.LOCALEID(1033);
    MySessionSettings.REQUESTSESSIONUPDATE(false);
```  

## See Also  
[INIT Function](init-function-sessionsettings.md)  
[REQUESTSESSIONUPDATE Function](requestsessionupdate-function-sessionsettings.md)  
[SessionSettings Data Type](sessionsettings-data-type.md)   
