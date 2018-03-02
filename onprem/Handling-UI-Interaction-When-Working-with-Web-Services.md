---
title: "Handling UI Interaction When Working with Web Services"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0673f763-2753-4b43-ab8c-cb8571e76a30
caps.latest.revision: 25
manager: edupont
---
# Handling UI Interaction When Working with Web Services
Whether you are publishing or consuming web services, exceptions and dialog boxes that may be displayed while code runs must be handled correctly. Exceptions must be handled to prevent the system from ending the web service client execution. You can handle exceptions in the following ways:  
  
-   Writing conditional code inside [!INCLUDE[navnow](includes/navnow_md.md)].  
  
-   Writing the code in the web service client application.  
  
 The most robust solution is to use both methods.  
  
## Publishing Web Services  
 When publishing a web service, you must make sure that the code that you are publishing does not assume the ability to interact with a user through the UI. You can use the [GUIALLOWED Function](GUIALLOWED-Function.md) to suppress the UI. For example, you can use this function to determine whether a codeunit is being called from the [!INCLUDE[rtc](includes/rtc_md.md)] or from a web service client. You must make sure to suppress errors when a codeunit is called from a web service client.  
  
 When implementing a conditional code check in [!INCLUDE[navnow](includes/navnow_md.md)], you should implement the check only around code that could cause an error. You should not encapsulate the whole business logic.  
  
> [!NOTE]  
>  The server returns the following exception when trying to invoke a dialog UI through a web service: **Microsoft.Dynamics.Nav.Types.Exceptions.NavNCLCallbackNotAllowedException: Callback functions are not allowed.**  
  
### C/AL Keywords That Can Cause Faults or Exceptions  
 Variables of the [Dialog Data Type](Dialog-Data-Type.md) or any of the functions listed as dialog functions can cause callback not allowed exceptions when they are called from a web service application. The [MESSAGE Function \(Dialog\)](MESSAGE-Function--Dialog-.md) is the only function in this category that does not cause an exception.  
  
 Other keywords that you should not use are:  
  
-   PAGE.RUN  
  
-   PAGE.RUNMODAL  
  
-   ACTIVATE  
  
-   REPORT.RUN  
  
-   REPORT.RUNMODAL  
  
-   HYPERLINK  
  
-   FILE.UPLOAD  
  
-   FILE.DOWNLOAD  
  
 You should also avoid operations on client-side Automation and .NET Framework interoperability objects.  
  
## Consuming Web Services  
 You must handle exceptions in client code that calls a [!INCLUDE[navnow](includes/navnow_md.md)] web service. Appropriate exception capturing code should be included around any call to a [!INCLUDE[navnow](includes/navnow_md.md)] web service.  
  
## See Also  
 [Microsoft Dynamics NAV Web Services Overview](Microsoft-Dynamics-NAV-Web-Services-Overview.md)   
 [How to: Publish a Web Service](How-to--Publish-a-Web-Service.md)