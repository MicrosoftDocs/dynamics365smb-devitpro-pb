---
title: "Web Services Authentication"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 25774773-f5ce-44f5-9bf3-07827d5996a7
caps.latest.revision: 14
---
# Web Services Authentication
When users send a request for a web service, they are authenticated according to the credential type that is configured for [!INCLUDE[nav_server](includes/nav_server_md.md)]. To access a web service, users must provide valid credentials for the credential type being used. If [!INCLUDE[navnow](includes/navnow_md.md)] is configured for Windows credential type, then users are automatically authenticated against the Windows account that their computer is running under, and they are not prompted for their credentials. For other credential types, users are prompted to enter a user name and password.  
  
 If your solution uses NavUserPassword or AccessControlService as the credential type, users can access data through SOAP and OData web services if they specify a password or a web service access key. You set up the user accounts in the **User Card** window based on how they will access [!INCLUDE[navnow](includes/navnow_md.md)] data. For example, if you set up a user account that will allow an external application to read [!INCLUDE[navnow](includes/navnow_md.md)] data through a web service, you can generate a web service access key and specify that in the **User Card** window for the relevant user accounts. Then, you add the access key to the configuration of the application that consumes the web service. In contrast, when users access [!INCLUDE[navnow](includes/navnow_md.md)] data through a web service in Microsoft Excel, for example, they specify a password instead of a web service access key.  
  
 [!INCLUDE[navnow](includes/navnow_md.md)] also supports OAuth authentication on OData and SOAP endpoints. OAuth is an open standard for authentication that provides client applications with secure delegated access to server resources. OAuth enables you to extend single sign-on with Office 365 to [!INCLUDE[navnow](includes/navnow_md.md)] web services.  
  
|To|See|  
|--------|---------|  
|Learn about how to create users and configure the credential type for [!INCLUDE[nav_server](includes/nav_server_md.md)].|[Users and Credential Types](Users-and-Credential-Types.md)|  
|Learn about how to use a web access key to authenticate SOAP and OData web services.|[How to: Use an Access Key for SOAP and OData Web Service Authentication](How-to--Use-an-Access-Key-for-SOAP-and-OData-Web-Service-Authentication.md)|  
|Learn about OAuth authentication on [!INCLUDE[navnow](includes/navnow_md.md)] web services.|[Using OAuth to Authenticate Microsoft Dynamics NAV Web Services \(Odata and SOAP\)](http://go.microsoft.com/fwlink/?LinkID=510894)|  
  
> [!IMPORTANT]  
>  If the [!INCLUDE[nav_server](includes/nav_server_md.md)] is configured to use NavUserPassword or AccessControlService authentication, then the username, password, and access key can be exposed if the SOAP or OData data traffic is intercepted and the connection string is decoded. To avoid this condition, configure SOAP and OData web services to use Secure Socket Layer \(SSL\). For more information, see [Walkthrough: Configuring Web Services to Use SSL \(SOAP and OData\)](Walkthrough--Configuring-Web-Services-to-Use-SSL--SOAP-and-OData-.md)  
  
 When [!INCLUDE[navnow](includes/navnow_md.md)] data is consumed by a web service, users cannot be authenticated if their user name or password contains Unicode characters. This is a limitation in the basic authentication mechanism that is defined in the HTTP/1.1 specification.  
  
 The same limitation applies to exposing [!INCLUDE[navnow](includes/navnow_md.md)] data in external products such as a browser or a Microsoft .NET Framework assembly.  
  
## See Also  
 [Web Services Authentication](Web-Services-Authentication.md)   
 [Microsoft Dynamics NAV Web Services Overview](Microsoft-Dynamics-NAV-Web-Services-Overview.md)   
 [SOAP Web Services](SOAP-Web-Services.md)   
 [OData Web Services](OData-Web-Services.md)   
 [Users and Credential Types](Users-and-Credential-Types.md)