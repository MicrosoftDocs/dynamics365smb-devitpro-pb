---
title: "Preserving Data When Working with a Statically Generated Proxy"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 03afd382-51a5-46c5-ba74-80a4b6d0f54c
caps.latest.revision: 6
manager: edupont
---
# Preserving Data When Working with a Statically Generated Proxy
You can lose data if you develop a web service client that interacts with a statically generated proxy. Similarly, a client web service cannot detect if a field has been added to or removed from a page since a proxy was last generated. This topic describes an approach for avoiding this pitfall.  
  
## Avoiding Data Loss by Building the Proxy with Your Client Application  
 To avoid data loss due to a statically generated proxy, automatically generate your proxy whenever you build your client.  
  
 Assume you have published page 21, Customer Card, as a SOAP web service with **Customer** as the **Service Name** value. Add a service reference to this web service from a C\# console application and insert the following code in the `Main` method:  
  
```c#  
static void Main(string[] args)  
{  
  CustomerService.Customer_Service svc   
      = new CustomerService.Customer_Service();  
  svc.UseDefaultCredentials = true;  
  Customer c = svc.Read("01121212");  
  Console.WriteLine(c.Name);  
  Console.ReadKey();  
}  
```  
  
 When you run the application, you will see the following output \(assuming the [!INCLUDE[demolong](includes/demolong_md.md)]\):  
  
```  
Spotsmeyer's Furnishings  
```  
  
 Then go back to page 21 and set the **Name** property for the control that is bound to the **Name** field to **CustomerName**, and save the page.  
  
 Finally, switch back to the console application without updating the web reference and run the code. Instead of getting an error message that indicates that the web request does not match the web service description, you do not get an error message, and `Console.WriteLine` shows an empty line.  
  
## See Also  
 [Microsoft Dynamics NAV Web Services Overview](Microsoft-Dynamics-NAV-Web-Services-Overview.md)