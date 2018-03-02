---
title: "GETLASTERROROBJECT Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8465a42a-a195-4fa4-a431-4e7b3bf00847
caps.latest.revision: 6
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETLASTERROROBJECT Method
Gets the last [System.Exception](http://go.microsoft.com/fwlink/?LinkID=396510) object that occurred.  
  
## Syntax  
  
```  
  
DotNet := GETLASTERROROBJECT  
```  
  
## Property Value/Return Value  
 Type: DotNet  
  
 A System.Exception object that contains the last exception that occurred.  
  
 If no exception has occurred, then method returns a NULL object.  
  
## Remarks  
 You use this method to retrieve and handle the last exception that occurred in the application. The System.Exception object exposes several members that enable you to get detailed information about the exception, such Exception.InnerException and Exception.Message.  
  
## Example  
 This example uses the GETLASTERROROBJECT method to get an exception object that occurs. In this example, the Microsoft .NET Framework objects are executed by MyCodeunit. The AL code uses the InnerException property of the System.Exception object to identify whether the inner exception has the type WebException and returns an exception message accordingly.  
  
 This example requires that you create the following variables.  
  
|Variable name constant|Data Type|SubType|  
|----------------------------|---------------|-------------|  
|MyCodeunt|Codeunit|MyCodeunit|  
|Exception|DotNet|'mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Exception|  
|WebException|DotNet|'System, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'.System.Net.WebException|  
  
```  
IF NOT MyCodeunit.RUN THEN BEGIN  
    Exception := GETLASTERROROBJECT;  
  
    IF NOT Exception.InnerException.GetType.Equals(WebException.GetType) THEN  
        ERROR(Exception.Message);  
  
    WebException := Exception.InnerException;  
    ERROR(WebException.Message);  
END;  
```  
  
## See Also  
 [Error Handling Methods](devenv-error-handling-methods.md)