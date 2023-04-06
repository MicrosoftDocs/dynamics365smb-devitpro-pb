---
title: "Client Types"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b2ec4d43-d798-4a37-bc36-91f05fc53418
caps.latest.revision: 24
---
# Client Types
The following [!INCLUDE[navnow](includes/navnow_md.md)] clients interact with the [!INCLUDE[navnow](includes/navnow_md.md)] database through [!INCLUDE[nav_server](includes/nav_server_md.md)]:  
  
-   [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
  
-   [!INCLUDE[nav_web](includes/nav_web_md.md)]  
  
-   [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)]  
  
 Of these client types, the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is the only one that you explicitly install and configure with [!INCLUDE[navnow](includes/navnow_md.md)] Setup.  
  
 In addition, the following service types also interact with the [!INCLUDE[navnow](includes/navnow_md.md)] database through [!INCLUDE[nav_server](includes/nav_server_md.md)]:  
  
-   SOAP web services  
  
-   OData web services  
  
-   NAS services  
  
 You can configure a server instance for [!INCLUDE[rtc](includes/rtc_md.md)]s, SOAP and OData web services, and NAS connections using either the [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md) or [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md).  
  
##  <a name="WinClient"></a> [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
 The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is an intuitive and versatile Windows application that developers, partners, administrators, and super users can customize to support the job functions of a full range of work roles in an organization.  
  
 For each role, the Microsoft Certified Partner or developer creates a customizable Role Center that displays key information required for relevant employees and makes their day-to-day tasks easier to complete. Users run the [!INCLUDE[rtc](includes/rtc_md.md)] to find the information and data entry points that their jobs require.  
  
 The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is installed when you select the [Demo Option](Demo-Option.md), [Client Option](Client-Option.md), or [Developer Option](Developer-Option.md) in [!INCLUDE[navnow](includes/navnow_md.md)] Setup. The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is available in a 32-bit version and 64-bit version. The 32-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] can be run on either a 32-bit or 64-bit version of a Windows operating system. The 64-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] can only be run on a 64-bit version of a Windows operating system. On a 64-bit Windows operating system, the 64-bit version of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is used by default, but you can to run the 32-bit version as well. For more information, see [Running 32-Bit Microsoft Dynamics Windows Client on 64-Bit Windows](Running-32-Bit-Microsoft-Dynamics-Windows-Client-on-64-Bit-Windows.md).  
  
## [!INCLUDE[nav_web](includes/nav_web_md.md)]  
 The [!INCLUDE[nav_web](includes/nav_web_md.md)] is an alternative to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that enables you to access [!INCLUDE[navnow](includes/navnow_md.md)] data over the Internet. From a web browser, you can view and edit data by using an interface that is similar to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Install the Web Server components to get the software that you need to set up a [!INCLUDE[nav_web](includes/nav_web_md.md)]. For more information, see [Microsoft Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md).  
  
## [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)]  
 The [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] allow users in small and medium sized businesses to access data from a tablet or a phone. Developing for [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] is very similar to developing for the [!INCLUDE[nav_web](includes/nav_web_md.md)] using the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. For more information, see [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md).  
  
## SOAP Web Services  
 SOAP web services allow full flexibility for building operation-centric services. This includes industry standard interoperability, as well as channel and host plug-ability. For web services that must interoperate with Java or use channels other than HTTP, SOAP services are the only option. Windows Communication Framework \(WCF\) has supported SOAP services since its initial release in .NET Framework 3.0, and .NET Framework 4 adds additional support and default bindings to make it easier to build SOAP services using WCF. You define and publish [!INCLUDE[navnowlong](includes/navnowlong_md.md)] SOAP web services in the [!INCLUDE[rtc](includes/rtc_md.md)], and manage them from the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. See [SOAP Web Services](SOAP-Web-Services.md) for further information.  
  
## OData Web Services  
 OData services are recommended for client applications that require a uniform, flexible, general purpose. They are less suited for applications that are primarily method-oriented or in which data operations are constrained to certain prescribed patterns. OData supports Representational State Transfer \(REST\)-based data services, which enable resources, identified using Uniform Resource Identifiers \(URIs\), and defined in an abstract data model \(EDM\), to be published and edited by web clients within corporate networks and across the Internet using simple Hypertext Transfer Protocol \(HTTP\) messages. OData services are lightweight, with functionality often referenced directly in the URI. You define and publish [!INCLUDE[navnowlong](includes/navnowlong_md.md)] OData web services in the [!INCLUDE[rtc](includes/rtc_md.md)], and manage them from the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. See [OData Web Services](OData-Web-Services.md) for further information.  
  
## NAS Services  
 NAS services are a middle-tier server component that executes business logic without a user interface or user interaction. NAS services are intended for task scheduling, client offloading, and specialized integration scenarios. NAS services replace the NAV Application Server \(NAS\) available in earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)]. You manage NAS services from the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. See [Configuring NAS Services](Configuring-NAS-Services.md) for further information.  
  
## See Also  
 [Product and Architecture Overview](Product-and-Architecture-Overview.md)   
 [Installation Options](Installation-Options.md)   
 [Web Service Alternatives: SOAP and OData](Web-Service-Alternatives:-SOAP-and-OData.md)   
 [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)
