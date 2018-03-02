---
title: "GUIALLOWED Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fa6b2950-62ed-4a4f-9fa0-1e32d49682f5
caps.latest.revision: 10
manager: edupont
---
# GUIALLOWED Function
Checks whether the C/AL code can show any information on the screen.  
  
## Syntax  
  
```  
  
[Ok :=] GUIALLOWED  
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 If the return value is **true**, then the GUI is available.  
  
 If the return value is **false**, then the C/AL code is running on Microsoft Dynamics NAV Application Server and no GUI is available.  
  
## Remarks  
 User Portal Application Server accepts GUIALLOWED.  
  
## Example  
 This example shows how to use the GUIALLOWED function.  
  
 This example requires that you create the following text constant in the C/AL Globals window.  
  
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
>  If the [MESSAGE Function \(Dialog\)](MESSAGE-Function--Dialog-.md) or the [ERROR Function \(Dialog\)](ERROR-Function--Dialog-.md) is called when the code is running on Microsoft Dynamics NAV Application Server, then the message is written to the event log of the operating system.  
  
## See Also  
 [APPLICATIONPATH Function](APPLICATIONPATH-Function.md)   
 [HYPERLINK Function](HYPERLINK-Function.md)   
 [SLEEP Function](SLEEP-Function.md)   
 [TEMPORARYPATH Function](TEMPORARYPATH-Function.md)