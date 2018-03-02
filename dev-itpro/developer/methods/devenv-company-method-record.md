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

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COMPANY Method
Gets or sets the company in a SessionSettings object.  

## Syntax  

```  

[CurrCompanyName :=] SessionSettings.COMPANY([NewCompanyName])  
```  

#### Parameters  
 *NewCompanyName*  
 Type: Text  

Specifies the name of the company in the SessionSettings object.  

## Property Value/Return Value  
 Type: Text  

 The name of the company that is in the SessionSettings objecte.  

## Example  
The following example returns the current company in the SessionSettings object. The return value is stored in the *CurrCompany* variable and displayed in a message box. This example requires that you create the following global variables and text constant.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Customer|  
|IsAscending|Boolean|Not applicable|  

|Text constant name|Data type|ENU value|  
|------------------------|---------------|---------------|  
|Text000|Text|Is the current sort order ascending?:  %1|  

```  

MySettings.INIT;  
CurrCompany := MySettings.Company;  

MESSAGE(Text000, IsAscending);  
```  
This example requires that you create the following global variables
```  
var
    MySessionSettings : SessionSettings;
    Text000 : Text(The current company is:  %1);  
```  
s the current sort order ascending?:  %1

## Example  
 The following example sets the current sort order to descending by setting the *SetAscending* parameter to **false**. The value displayed in the message box is **false**.  

```  

IsAscending := MyRecord.ASCENDING(FALSE);  
MESSAGE(Text000, IsAscending);  
```  

## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)
