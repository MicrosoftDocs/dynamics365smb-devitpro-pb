---
title: Internet Explorer Client Configuration
description: For Dynamics NAV Client, Internet Explorer must be configured to allow JavaScript and cookies. JavaScript enables web pages to be interactive.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0c43029c-6c85-41b4-9107-bbb4f384e357
caps.latest.revision: 12
---
# Configuring Internet Explorer for Dynamics NAV Clients
To open the [!INCLUDE[nav_web](includes/nav_web_md.md)], Internet Explorer must be configured to allow *JavaScript* and *cookies*. JavaScript is a programming language for making web pages interactive. Cookies are small files that are stored on your computer. Cookies contain small amounts of data that is specific to a website, or in this case, the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

 This topic describes how to enable JavaScript and cookies in Internet Explorer. For other browsers, refer to the instructions provided by the manufacturer.  

> [!NOTE]  
>  For a complete list of supported versions of Internet Explorer and other browsers, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

### To enable JavaScript in Internet Explorer  

1.  Open Internet Explorer.  

2.  On the **Tools** menu, choose **Internet Options**.  

3.  Choose the **Security** tab.  

4.  In the **Select a zone to view or change security settings** box, choose **Internet** or **Local intranet**.  

    -   Choose **Internet** if you are accessing [!INCLUDE[navnow](includes/navnow_md.md)] over the public Internet.  

    -   Choose **Local intranet** if you are accessing [!INCLUDE[navnow](includes/navnow_md.md)] over a private network such as a business or corporate network.  

5.  Choose the **Custom Level** button.  

6.  Scroll down until you see the **Scripting** section.  

7.  Under **Active Scripting**, choose **Enable**.  

8.  Choose the **OK** button.  

9. If you see a confirmation window that asks whether you want to change the settings for this zone, choose the **Yes** button.  

10. Choose the **OK** button.  

11. Refresh the browser.  

### To enable cookies in Internet Explorer  

1.  Open Internet Explorer.  

2.  On the **Tools** menu, choose **Internet Options**.  

3.  Choose the **Privacy** tab.  

4.  Choose the **Advanced** button.  

5.  On the **Advanced Privacy Settings** window, select **Override automatic cookie handling**.  

6.  Under **First-party Cookies**, choose **Accept**.  

     This saves cookies from [!INCLUDE[nav_web](includes/nav_web_md.md)] on your computer.  

7.  Under **Third-party Cookies**, choose one of the options. The [!INCLUDE[nav_web](includes/nav_web_md.md)] will operate correctly even if you choose **Block**. You should select the option that meets your security requirements.  

    > [!NOTE]  
    >  Third-party cookies are cookies from websites other than [!INCLUDE[nav_web](includes/nav_web_md.md)] sites.  

8.  Choose the **OK** button.  

9. Refresh the browser.  

## See Also  
 [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md)   
 [Microsoft Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md)   
 [How to: Configure Mozilla Firefox for Microsoft Dynamics NAV Clients](How-to--Configure-Mozilla-Firefox-for-Microsoft-Dynamics-NAV-Clients.md)
