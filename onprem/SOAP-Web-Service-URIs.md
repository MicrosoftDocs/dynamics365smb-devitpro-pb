---
title: "SOAP Web Service URIs"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4a2d24b4-adef-4d7a-be37-e9d1022eb758
caps.latest.revision: 8
manager: edupont
---
# SOAP Web Service URIs
Web service users can discover published web services by pointing a browser or a tool such as the Web Services Discovery Tool at the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)] and getting a list of available services. For SOAP web services, you typically enter a URI in a browser to view a list of available [!INCLUDE[navnow](includes/navnow_md.md)] web services or to view a schema for a particular web service.  
  
## URIs for SOAP Web Services  
 To display all published SOAP web services that are exposed by a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, use a URI of the following type:  
  
```  
http://<Server>:<Port>/<ServerInstance>/WS/<CompanyName>/services  
```  
  
 The following example displays all published SOAP web services that are exposed for the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
```  
http://localhost:7047/DynamicsNAV/WS/CRONUS%20International%20Ltd/services  
```  
  
 To view the schema for a particular service, use a URI of the following type:  
  
```  
http://<Server>:<Port>/<ServerInstance>/WS/<CompanyName>/Page/<servicename>  
```  
  
 The following example displays the schema for the Customer service for the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
```  
http://localhost:7047/DynamicsNAV/WS/CRONUS%20International%20Ltd/Page/Customer  
```  
  
 You can also use a URI for a codeunit web service, as shown in the following example:  
  
```  
http://localhost:7047/DynamicsNAV/WS/CRONUS%20International%20Ltd/Codeunit/Letters  
```  
  
## See Also  
 [Web Service Walkthroughs](Web-Service-Walkthroughs.md)