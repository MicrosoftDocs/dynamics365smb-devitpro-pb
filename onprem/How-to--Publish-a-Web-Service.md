---
title: "How to: Publish a Web Service"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ec2afaf4-94cd-41ea-a1f0-11bd55462919
caps.latest.revision: 42
translation.priority.ht: 
  - da-dk
  - de-at
  - de-ch
  - de-de
  - en-au
  - en-ca
  - en-gb
  - en-in
  - en-nz
  - es-es
  - es-mx
  - fi-fi
  - fr-be
  - fr-ca
  - fr-ch
  - fr-fr
  - is-is
  - it-ch
  - it-it
  - nb-no
  - nl-be
  - nl-nl
  - ru-ru
  - sv-se
---
# How to: Publish a Web Service
Web services are a lightweight way to make application functionality available to a variety of external systems and users. In [!INCLUDE[prodshort](../developer/includes/prodshort.md)] , you can expose pages, codeunits, and queries as web services. When you publish [!INCLUDE[prodshort](../developer/includes/prodshort.md)] objects as web services, they are immediately available on the network.  
  
 You can set up a web service in the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. You must then publish the web service so that it is available to service requests over the network. Users can discover web services by pointing a browser at the computer that is running [!INCLUDE[server](../developer/includes/server.md)] and requesting a list of available services. When you publish a web service, it is immediately available over the network for authenticated users. All authorized users can access metadata for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] web services, but only users who have sufficient [!INCLUDE[prodshort](../developer/includes/prodshort.md)] permissions can access actual data.  
  
## Creating and Publishing a Web Service  
 The following steps explain how to create and publish a web service.  
  
#### To create and publish a web service  
  
1.  Open the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  
  
2.  In the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], in the **Search** box, enter **Web Services**, and then choose the related link.  
  
     In the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], choose the **Search for Page or Report** button, enter **Web Services**, and then choose the related link.  
  
3.  In the **Web Services** page, choose **New**.  
  
4.  In the **Object Type** column, select **Codeunit**, **Page**, or **Query**.  
  
    > [!NOTE] 
    >  **Codeunit** and **Page** are valid types for SOAP web services. **Page** and **Query** are valid types for OData web services.  
  
5.  In the **Object ID** column, select the object ID of the object that you want to expose. For example, to expose the customer card as a web service, enter **21**.  
  
     If the database contains multiple companies, you can choose an object ID that is specific to one of the companies.  
  
6.  In the **Service Name** field, assign a name to the web service. For example, if you expose the customer card as a web service, enter **Customers**.  
  
    > [!NOTE] 
    >  The service name is visible to consumers of your web service and is the basis for identifying and distinguishing web services, so you should make the name meaningful. If you are setting up integration with Microsoft Outlook using codeunit 5313, then you must use **DynamicsNAVsynchOutlook** as the service name.  
  
7.  Select the check box in the **Published** column.  
  
     When you publish the web service, in the **OData URL** and **SOAP URL** fields, you can see the URLs that are generated for the web service. You can test the web service immediately by choosing the links in the **OData URL** and **SOAP URL** fields. Optionally, you can copy the value of the field and save it for later use.  
  
 After you publish a web service, it is available on the [!INCLUDE[server](../developer/includes/server.md)] computer that you were connected to when you published. The web service is available across all [!INCLUDE[server](../developer/includes/server.md)] instances running on the server computer.  
  
 You can verify the availability of that web service by using a browser, or you can choose the link in the **OData URL** and **SOAP URL** fields in the **Web Services** window. The following procedure illustrates how you can verify the availability of the web service for later use.  
  
#### To verify the availability of a web service  
  
1.  In your browser, enter the relevant URL. The following table illustrates the types of URLs that you can enter. For SOAP web services, use the following format for your URI.  
  
    |Web service type|Syntax|Example|  
    |----------------------|------------|-------------|  
    |SOAP|https://*Server*:*SOAPWebServicePort*/*ServerInstance*/WS/*CompanyName*/services/|https://localhost:7047/[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]/WS/CRONUS International Ltd./services/|  
    |OData|https://*Server*:*ODataWebServicePort*/*ServerInstance*/OData/Company\('*CompanyName*'\)|https://localhost:7048/[!INCLUDE[serverinstance](../developer/includes/serverinstance.md)]/OData/Company\('CRONUS International Ltd.'\)|  
  
     The company name is case-sensitive.  
  
2.  Review the information that is displayed in the browser. Verify that you can see the name of the web service that you have created.  
  
 When you access a web service, and you want to write data back to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] , you must specify the company name. You can specify the company as part of the URI as shown in the examples, or you can specify the company as part of the query parameters. For example, the following URIs point to the same OData web service and are both valid URIs.  
  
```  
https://localhost:7048/nav_server_instance/OData/Company('CRONUS International Ltd.')/Customer  
```  
  
```  
https://localhost:7048/nav_server_instance/OData/Customer?company='CRONUS International Ltd.'  
```  
  
## See Also  
[Web Service Walkthroughs](Web-Service-Walkthroughs.md)
