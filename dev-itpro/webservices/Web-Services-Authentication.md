---
title: "Web Services Authentication"
description: Learn about authenticating web services in business Central
ms.custom: na
ms.date: 01/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Web Services Authentication
When users send a request for a web service, they're authenticated according to the credential type that is configured for [!INCLUDE[server](../developer/includes/server.md)]. To access a web service, users must provide valid credentials for the credential type being used. If [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is configured for Windows credential type, then users are automatically authenticated against the Windows account that their computer is running under. In this case, they aren't prompted for their credentials. For other credential types, users are prompted to enter a user name and password. 

## About NavUserPassword and AccessControlService credential types
  
If your solution uses NavUserPassword or AccessControlService as the credential type, users can access data through SOAP and OData web services if they specify a password or a web service access key. You set up the user accounts in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client, based on how they will access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data. For example, if you set up a user account that will allow an external application to read [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data through a web service, you can generate a web service access key and specify that key for the relevant user accounts. Then, you add the access key to the configuration of the application that consumes the web service. In contrast, when users access [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data through a web service in Microsoft Excel, for example, they specify a password instead of a web service access key.  
  
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] also supports OAuth authentication on OData and SOAP endpoints. OAuth is an open standard for authorization that provides client applications with secure delegated access to server resources. OAuth enables you to extend single sign-on with Microsoft 365 to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services. For more information, see [Using OAuth to Authorize Business Central Web Services \(OData and SOAP\)](authenticate-web-services-using-oauth.md).  

> [!IMPORTANT] 
> If the [!INCLUDE[server](../developer/includes/server.md)] is configured to use NavUserPassword or AccessControlService authentication, then the username, password, and access key can be exposed if the SOAP or OData data traffic is intercepted and the connection string is decoded. To avoid this condition, configure SOAP and OData web services to use Secure Socket Layer \(SSL\). 
  
## Unicode characters in user name or password  
When [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data is consumed by a web service, users can't be authenticated if their user name or password contains Unicode characters. This is a limitation in the basic authentication mechanism that is defined in the HTTP/1.1 specification.  
  
The same limitation applies to exposing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data in external products such as a browser or a Microsoft .NET Framework assembly.

## How to use an Access Key for SOAP and OData Web Service Authentication

If your solution is configured for NavUserPassword or AccessControlService authentication, then you can configure [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user accounts to include an access key that can be used instead of a password to authenticate SOAP and OData web service requests. A web service access key is a random 44 character string that is associated with the user account. Because it can only be used for SOAP and OData web services, it doesn't require the same level of protection as a password.  
  
### Generate a Web Service Access Key
  
Follow these instructions to generate a web service access key for a user. You perform these steps from the user setup in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client.

1. Choose the ![Lightbulb that opens the Tell Me feature](../media/search_small.png "Tell me what you want to do") icon, enter **Users**, choose the related link, and then open the user account that you want to edit. 
  
2. In the **Web Service Access** section, select the **Web Service Access Key** field.  
  
3. In the **Set the Web Service Access Key** window, if you do not want the key to expire, select the **Key Never Expires** check box. If you want the key to expire, set the **Key Expiration Date** field to the date.  
  
4. Choose the **OK** button.  
  
    The access key is automatically generated. If you're signed in as the user that you just modified, the key appears in the **Web Service Access Key** field. Otherwise, the key is masked so only asterisks (*) are shown.
  
### Implement the Web Service Access Key

Typically, you would create a user account strictly for web services, and then use the account's credentials, which include the user name and access key, in a web service application. For example, if you develop your own web service application, then you can design your application to programmatically pass the credentials to the web service. Some applications let you provide the connection credentials through a user interface. The steps for implementing the web service access key are done in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client.  

1. Create a user specifically for web services.  
  
    For more information, see [Manage Users and Permissions](/dynamics365/business-central/ui-how-users-permissions).  
  
2. Sign in as the new user, and generate a web service access key in the user account.  
  
3. Use the access key in the web service application.  
  
    |To|See|  
    |--------|---------|  
    |Learn how to use code to pass the user name and web access key to a web service|[Passing Credentials for Authentication to Web Services](https://go.microsoft.com/fwlink/?LinkID=259554)|
  
## See Also

 [Web Services Overview](web-services.md)  
 [SOAP Web Services](SOAP-Web-Services.md)  
 [OData Web Services](OData-Web-Services.md)  
 [Authentication and Credential Types](../administration/users-credential-types.md)