---
title: "How to: Use OData to Return-Obtain an AtomPub Document"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 291c3d3e-1140-48b5-81f6-96a84f3885cb
caps.latest.revision: 21
manager: edupont
---
# How to: Use OData to Return-Obtain an AtomPub Document
When you register an OData web service, you expose an OData service that can be accessed from a uniform resource identifier \(URI\) by using a web browser or any other HTTP client. OData clients can use Atom Publishing Protocol \(AtomPub\) documents to interact with [!INCLUDE[navnow](includes/navnow_md.md)] data. AtomPub is a simple HTTP-based protocol for creating and updating web resources. It is related to the Atom Syndication Format, which is XML for web feeds. In these procedures, you obtain different kinds of AtomPub documents or feeds from a [!INCLUDE[navnow](includes/navnow_md.md)] OData web service. AtomPub documents and feeds are XML.  
  
> [!NOTE]  
>  To use the URIs in this topic, you must have access to the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## Obtaining an AtomPub Document or Feed  
 Depending on how you construct your URI, you can return an AtomPub document or an AtomPub feed. A feed is a request for data that can change over time. For example, this can be news content or other kinds of information. In the case of [!INCLUDE[navnow](includes/navnow_md.md)], the information is database content.  
  
#### To obtain an AtomPub document or feed  
  
1.  Register and publish a page web service by using the [!INCLUDE[rtc](includes/rtc_md.md)]. For more information, see [Walkthrough: Creating and Interacting with a Page Web Service \(OData\)](Walkthrough--Creating-and-Interacting-with-a-Page-Web-Service--OData-.md).  
  
     The AtomPub documents that are shown in the walkthrough are based on the page 21, the **Customer Card** page, with **Customer** as the service name. The concepts and steps are the same for any [!INCLUDE[rtc](includes/rtc_md.md)] page that you register and publish as a web service.  
  
    > [!NOTE]  
    >  You can also register and publish a [!INCLUDE[navnow](includes/navnow_md.md)] query as a web service.  
  
2.  Start Windows Internet Explorer. In the **Address** field, enter a URI in this format:  
  
    ```  
    http://<Server>:<WebServicePort>/<ServerInstance>/OData  
    ```  
  
     If [!INCLUDE[nav_server](includes/nav_server_md.md)] is running on the local computer with the default [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and OData port, then the address is:  
  
    ```  
    http://localhost:7048/nav_server_instance/OData  
    ```  
  
     The browser should now show the web service that you have published in the format of an AtomPub document:  
  
     ![Basic AtomPub document for a page](media/BasAtomPub.JPG "BasAtomPub")  
  
3.  If you have multiple companies, then you can modify your URI to return a feed that enumerates all available companies:  
  
    ```  
    http://localhost:7048/nav_server_instance/OData/Company  
    ```  
  
    > [!IMPORTANT]  
    >  You must modify your Internet Explorer settings to display the actual XML for a feed instead of the feed content that has changed. Choose **Internet Options**, choose **Content**, choose **Feeds and Web Slices**, and then clear the **Turn on feed reading view** check box. Restart Internet Explorer to enable the new setting.  
  
## Obtaining a Keyed Service Entry  
 With a keyed service entry, you specify content from a particular row in a [!INCLUDE[navnow](includes/navnow_md.md)] table. The AtomPub document will contain information that is specific to that row. This procedure assumes that you have registered and published a page web service in the previous procedure.  
  
#### To obtain a keyed service entry  
  
1.  Start Windows Internet Explorer. In the **Address** field, enter a URI in the following format to get the entry for the [!INCLUDE[demoname](includes/demoname_md.md)] company:  
  
    ```  
    http://localhost:7048/nav_server_instance/OData/Company('CRONUS-International-Ltd.')  
    ```  
  
2.  To get the data feed for the Customer table in the [!INCLUDE[demoname](includes/demoname_md.md)] company database, enter a URI in the following format:  
  
    ```  
    http://localhost:7048/nav_server_instance/OData/Company('CRONUS-International-Ltd.')/Customer  
    ```  
  
3.  To additionally constrain data to a specific keyed customer in the Customer table, enter a URI in the following format, using the customer no. for the record you want. The example uses customer no. 01121212:  
  
    ```  
    http://localhost:7048/nav_server_instance/OData/Company('CRONUS-International-Ltd.')/Customer('01121212')  
    ```  
  
## Obtaining a Filtered Data Feed  
 With a filtered data feed, you use special syntax in the URI to define a query on the available data. For details on the specific filters available for [!INCLUDE[navnow](includes/navnow_md.md)] OData web service applications and the syntax for using them, see [Using Filter Expressions in OData URIs](Using-Filter-Expressions-in-OData-URIs.md).  
  
#### To obtain a filtered service data feed  
  
1.  Start Windows Internet Explorer. In the **Address** field, enter a URI in the following format to get the entry for the [!INCLUDE[demoname](includes/demoname_md.md)] company:  
  
    ```  
  
    http://localhost:7048/nav_server_instance/OData/Company('CRONUS-International-Ltd.')/Customer?$filter=City-eq-'Birmingham'  
    ```  
  
## See Also  
 [OData Web Services](OData-Web-Services.md)