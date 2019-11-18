---
title: "How to: Use an Access Key for SOAP and OData Web Service Authentication"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# How to: Use an Access Key for SOAP and OData Web Service Authentication
If your solution is configured for NavUserPassword or AccessControlService authentication, then you can configure [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user accounts to include an access key that can be used instead of a password to authenticate SOAP and OData web service requests. A web service access key is a random 44 character string that is associated with the user account. Because it can only be used for SOAP and OData web services, it does not require the same level of protection as a password.  
  
## Generating a Web Service Access Key  
  
#### To generate a web service access key for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user  
  
1.  In the [!INCLUDE[rtc](../developer/includes/rtc_md.md)] in the **Search** box, enter **Users**, and then choose the **Users** link in the Results list.  
  
     The **Users** page opens.  
  
    > [!NOTE] 
    >  For more information about how to create a user, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  
  
2.  Select a user and choose **Edit** in the ribbon.  
  
3.  In the **Web Service Access** section, choose the **AssistEdit** button that is next the **Web Service Access Key** field.  
  
4.  In the **Set the Web Service Access Key** window, if you do not want the key to expire, select the **Key Never Expires** check box. If you want the key to expire, set the **Key Expiration Date** field to the date.  
  
5.  Choose the **OK** button.  
  
     The access key is automatically generated and appears in the **Web Service Access Key** field.  
  
## Implementing the Web Service Access Key  
 Typically, you would create a user account strictly for web services, and then use the account's credentials, which include the user name and access key, in a web service application. For example, if you develop your own web service application, then you can design your application to programmatically pass the credentials to the web service. Some applications, such as Microsoft Excel PowerPivot, let you provide the connection credentials through a user interface. The key tasks for implementing the web service access key are as follows.  
  
#### To implement a web service access key  
  
1.  Create a user specifically for web services.  
  
     For more information, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  
  
2.  Generate a web service access key in the user account.  
  
3.  Use the access key in the web service application.  
  
    |To|See|  
    |--------|---------|  
    |Learn how to use the web access key in Excel PowerPivot|[Walkthrough: Viewing Page Data in Excel Using PowerPivot \(OData\)](Walkthrough--Viewing-Page-Data-in-Excel-Using-PowerPivot--OData.md)|  
    |Learn how to use code to pass the user name and web access key to a web service|[Passing Credentials for Authentication to Web Services](https://go.microsoft.com/fwlink/?LinkID=259554)|  
  
## See Also  
 [Web Services Authentication](Web-Services-Authentication.md)   
 [Web Services Overview](web-services.md)   
 [SOAP Web Services](SOAP-Web-Services.md)   
 [OData Web Services](OData-Web-Services.md)   
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)