---
title: "GUIALLOWED Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: fa6b2950-62ed-4a4f-9fa0-1e32d49682f5
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GUIALLOWED Method
Checks whether the AL code can show any information on the screen.  

## Syntax  

```  

[Ok :=] GUIALLOWED  
```  

## Property Value/Return Value  
 Type: Boolean  

 If the return value is **true**, then the GUI is available.  

 If the return value is **false**, then the AL code is running on Microsoft Dynamics NAV Application Server and no GUI is available.  

## Remarks  
 User Portal Application Server accepts GUIALLOWED.  

## Example  
 This example shows how to use the GUIALLOWED method.  

 This example requires that you create the following global text constant.  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Code is running on a client.|  

```  
IF GUIALLOWED THEN  
 MESSAGE(Text000);  
```  

 If the code runs on a client, which means that the user interface is available, a message box will appear with the following message.  

 **Code is running on a client**  

 If the code runs on Microsoft Dynamics NAV Application Server, then the message will not be displayed.  

> [!NOTE]  
>  If the [MESSAGE Method \(Dialog\)](devenv-MESSAGE-Method-Dialog.md) or the [ERROR Method \(Dialog\)](devenv-ERROR-Method-Dialog.md) is called when the code is running on Microsoft Dynamics NAV Application Server, then the message is written to the event log of the operating system.  

## See Also  
 [APPLICATIONPATH Method](devenv-APPLICATIONPATH-Method.md)   
 [HYPERLINK Method](devenv-HYPERLINK-Method.md)   
 [SLEEP Method](devenv-SLEEP-Method.md)   
 [TEMPORARYPATH Method](devenv-TEMPORARYPATH-Method.md)
