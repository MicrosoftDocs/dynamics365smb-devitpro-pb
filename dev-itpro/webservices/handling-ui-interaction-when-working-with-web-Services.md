---
title: "Handling UI Interaction When Working with Web Services"
description: Descibes how UI methods can make web service call fail. 
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
---
# Handling UI Interaction When Working with Web Services

Whether you are publishing or consuming web services, exceptions and dialog boxes that may be displayed while code runs must be handled correctly. Exceptions must be handled to prevent the system from ending the web service client execution. You can handle exceptions in the following ways:  
  
-   Writing conditional code inside [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  
  
-   Writing the code in the web service client application.  
  
 The most robust solution is to use both methods.  
  
## Publishing web service endpoints

When publishing a web service endpoint, you must make sure that the AL code that you are publishing does not assume the ability to interact with a user through the UI. You can use the [GUIALLOWED Method](../developer/methods-auto/library.md) to suppress UI interactions. For example, you can use this method to determine whether a codeunit is being called from the client or from a web service client. You must make sure to suppress errors when a codeunit is called from a web service client.  
  
When implementing a conditional code check in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you should implement the check only around code that could cause an error. You should not encapsulate the whole business logic.  

[!INCLUDE[callback_exception_no_ui_note](../includes/include-callback-exception-no-ui-note.md)]

  
### AL methods that throw exceptions in web service endpoints

[!INCLUDE[callback_exceptions_no_ui](../includes/include-callback-exceptions-no-ui.md)]

  
## Consuming Web Services  

You must handle exceptions in client code that calls a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web service. Appropriate exception capturing code should be included around any call to a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web service. 

For more information about common HTTP status codes and how to deal with them in your client code, see [Troubleshooting web service errors](./web-service-troubleshooting.md).
  
## See Also  
[Troubleshooting web service errors](web-service-troubleshooting.md)   
[Web Services Overview](web-services.md)   
[Publish a Web Service](publish-web-service.md)  