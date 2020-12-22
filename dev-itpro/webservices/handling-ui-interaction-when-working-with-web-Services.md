---
title: "Handling UI Interaction When Working with Web Services"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Handling UI Interaction When Working with Web Services

Whether you are publishing or consuming web services, exceptions and dialog boxes that may be displayed while code runs must be handled correctly. Exceptions must be handled to prevent the system from ending the web service client execution. You can handle exceptions in the following ways:  
  
-   Writing conditional code inside [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  
  
-   Writing the code in the web service client application.  
  
 The most robust solution is to use both methods.  
  
## Publishing Web Services  
 When publishing a web service, you must make sure that the code that you are publishing does not assume the ability to interact with a user through the UI. You can use the [GUIALLOWED Method](../developer/methods/devenv-GUIALLOWED-Method.md) to suppress the UI. For example, you can use this method to determine whether a codeunit is being called from the client or from a web service client. You must make sure to suppress errors when a codeunit is called from a web service client.  
  
 When implementing a conditional code check in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you should implement the check only around code that could cause an error. You should not encapsulate the whole business logic.  
  
> [!NOTE]  
>  The server returns the following exception when trying to invoke a dialog UI through a web service: **Microsoft.Dynamics.Nav.Types.Exceptions.NavNCLCallbackNotAllowedException: Callback functions are not allowed.**  
  
### AL Keywords That Can Cause Faults or Exceptions  
Variables of the [Dialog Data Type](../developer/datatypes/devenv-Dialog-Data-Type.md) or any of the methods listed as dialog methods can cause callback not allowed exceptions when they are called from a web service application. The [Message Method (Dialog)](../developer/methods-auto/dialog/dialog-message-method.md) is the only method in this category that does not cause an exception.  
  
 Other keywords that you should not use are:  
  
- PAGE.RUN  
  
- PAGE.RUNMODAL  
  
- ACTIVATE  
  
- REPORT.RUN  
  
- REPORT.RUNMODAL  
  
- HYPERLINK  
  
- FILE.UPLOAD  
  
- FILE.DOWNLOAD  
  
You should also avoid operations on client-side Automation and .NET Framework interoperability objects.  
  
## Consuming Web Services  
You must handle exceptions in client code that calls a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web service. Appropriate exception capturing code should be included around any call to a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web service.  
  
## See Also  
 [Web Services Overview](web-services.md)   
 [Publish a Web Service](publish-web-service.md)