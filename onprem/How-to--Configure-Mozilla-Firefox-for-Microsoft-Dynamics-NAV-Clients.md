---
title: Configure Mozilla Firefox for Client
description: Mozilla Firefox browser must be configured to allow cookies and JavaScript. The web client address should be added as a trusted URI - Unified Resource Identifier.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Configuring Mozilla Firefox for Dynamics NAV Clients
This topic describes how to configure Mozilla Firefox web browser to work with the [!INCLUDE[nav_web](includes/nav_web_md.md)]. To open the client, Firefox must be configured to allow cookies and JavaScript. In addition, the address of the [!INCLUDE[nav_web](includes/nav_web_md.md)] must be configured as a trusted unified resource identifier \(URI\) in Firefox.  

-   [Enabling Cookies in Firefox](How-to--Configure-Mozilla-Firefox-for-Microsoft-Dynamics-NAV-Clients.md#Cookies)  

-   [Enabling JavaScript in Firefox](How-to--Configure-Mozilla-Firefox-for-Microsoft-Dynamics-NAV-Clients.md#Java)  

-   [Configuring the Microsoft Dynamics NAV Web Client Address as a Trusted URI in Firefox](How-to--Configure-Mozilla-Firefox-for-Microsoft-Dynamics-NAV-Clients.md#Address)  

##  <a name="Cookies"></a> Enabling Cookies in Firefox  
 Cookies are small files that are stored on your computer. Cookies contain small amounts of data that is specific to a website, or in this case, the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

#### To enable cookies in Firefox  

1.  Open Firefox.  

2.  At the top of the browser window, choose the **Firefox** button, choose **Options**, and then choose **Options** again.  

3.  Choose the **Privacy** tab.  

4.  Under **History**, set the **Firefox will** box to **Use custom settings for history**.  

5.  Do one of the following.  

    |If you want to|Then|  
    |--------------------|----------|  
    |Allow cookies from all websites|1.  Select **Accept cookies from sites**.<br />2.  Choose the **OK** button.|  
    |Allow cookies only from the [!INCLUDE[nav_web](includes/nav_web_md.md)] site|1.  Select **Exceptions**.<br />2.  In the **Address of the website** box, type the address of the [!INCLUDE[nav_web](includes/nav_web_md.md)], for example: **https://myNAVServer:8080//[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]** or **https://myNAVServer:8080//[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient** (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions). <br />3.  Choose **Allow**.<br />     The [!INCLUDE[nav_web](includes/nav_web_md.md)] address appears in the **Site** list.<br />4.  Choose **Close**, and then choose the **OK** button.|  

##  <a name="Java"></a> Enabling JavaScript in Firefox  
 JavaScript is a programming language for making web pages interactive.  

#### To enable JavaScript in Firefox  

1.  Open Firefox.  

2.  At the top of the browser window, choose the **Firefox** button, choose **Options**, and then choose **Options** again.  

3.  Choose the **Content** tab.  

4.  Select the **Enable JavaScript** check box, and then choose the **OK** button.  

##  <a name="Address"></a> Configuring the Microsoft Dynamics NAV Web Client Address as a Trusted URI in Firefox  
 If the [!INCLUDE[nav_web](includes/nav_web_md.md)] is configured to use Windows authentication, then to open the [!INCLUDE[nav_web](includes/nav_web_md.md)] from a computer other than the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you must add the [!INCLUDE[nav_web](includes/nav_web_md.md)] address to the trusted URI list in Firefox. Otherwise, you will receive one of the following errors when you try to open the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

 **A server error occurred, and the content cannot be displayed. Refresh the page or open a new browser window.**  

 **401 - Unauthorized: Access is denied due to invalid credentials.**  

 There are two different trusted URI lists that you can add the [!INCLUDE[nav_web](includes/nav_web_md.md)] address to: network.negotiate-auth.trusted-uris and network.automatic-ntlm-auth.trusted-uris. The list that you use will depend on the authentication provider that is used by the website that is running the [!INCLUDE[nav_web](includes/nav_web_md.md)]. Use the following guidelines to determine which list to use:  

-   If the website uses the negotiate authentication provider, then add the [!INCLUDE[nav_web](includes/nav_web_md.md)] address to the network.negotiate-auth.trusted-uris list.  

     The negotiate authentication uses Kerberos authentication if it is configured on clients. If the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] are running on separate computers, then add the address to this list.  

-   If the website uses the NTLM authentication provider, then add the [!INCLUDE[nav_web](includes/nav_web_md.md)] address to the network.automatic-ntlm-auth.trusted-uris list.  

-   If you do not know which authentication provider is used, then add the [!INCLUDE[nav_web](includes/nav_web_md.md)] address to both lists.  

#### To configure the [!INCLUDE[nav_web](includes/nav_web_md.md)] address in Firefox  

1.  Open Firefox.  

2.  In the address box, type **about:config**.  

3.  To add the address to the **network.automatic-ntlm-auth.trusted-uris** list, do the following:  

    1.  In the **Search** box, enter **network.automatic**, and then double-click the line **network.automatic-ntlm-auth.trusted-uris**.  

    2.  In the **Enter string value** dialog box, type the address that you use to open the [!INCLUDE[nav_web](includes/nav_web_md.md)], for example, **https://myNAVServer:8080//[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]** or **https://myNAVServer:8080//[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient** (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions).

    3.  Choose the **OK** button.  

    > [!NOTE]  
    >  If there is already an address in the box, separate the existing address and the [!INCLUDE[nav_web](includes/nav_web_md.md)] address by using a comma.  

4.  To add the address to the **network.negotiate-auth.trusted-uris** list, do the following:  

    1.  In the **Search box**, enter **network.negotiate**, and then double-click the line **network.negotiate-auth.trusted-uris**.  

    2.  In the **Enter string value** dialog box, type the address that you use to open the [!INCLUDE[nav_web](includes/nav_web_md.md)], for example, **https://myNAVServer:8080//[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]** or **https://myNAVServer:8080//[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient** (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions).

    3.  Choose the **OK** button.  

5.  Close and restart Firefox.  

## See Also  
 [Microsoft Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md)   
 [How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md)   
 [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md)   
 [How to: Configure Internet Explorer for Microsoft Dynamics NAV Clients](How-to--Configure-Internet-Explorer-for-Microsoft-Dynamics-NAV-Clients.md)
