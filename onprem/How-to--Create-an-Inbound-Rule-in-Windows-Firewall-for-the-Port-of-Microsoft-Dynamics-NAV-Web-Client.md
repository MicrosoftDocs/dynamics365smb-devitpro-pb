---
title: Windows Firewall Inbound Rule for Web Client Port
description: This topic describes how to modify Windows Firewall to allow inbound communication on the port that is used by the Web Client. 
ms.date: 10/01/2018
ms.topic: article
author: jswymer
---
# Creating an Inbound Rule in Windows Firewall for the Port of Microsoft Dynamics NAV Web Client
This procedure describes how to modify Windows Firewall to allow inbound communication on the port that is used by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. By default, the port is 8080. You use this procedure after you install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on a computer that is running Windows 7 or if you change the [!INCLUDE[nav_web](includes/nav_web_md.md)] port to a port other than 8080.  
  
### To create an inbound rule  
  
1.  On the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], on the **Start** menu, choose **Control Panel**, choose **System and Security**, and then choose **Windows Firewall**.  
  
2.  In the navigation pane, choose **Advanced settings**.  
  
3.  In the **Windows Firewall with Advanced Settings** window, in the navigation pane, choose **Inbound Rules**, and then in the Actions pane, choose **New Rule**.  
  
4.  On the **Rule Type** page, choose **Port**, and then choose the **Next** button.  
  
5.  On the **Protocol and Ports** page, choose **Specific local ports**, and then enter the port number. For example, enter 8080 for the default port of the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
6.  Choose the **Next** button.  
  
7.  On the **Action** page, choose **Allow the connection**, and then choose the **Next** button.  
  
8.  On the **Profile** page, choose the profiles, and then choose the **Next** button.  
  
9. On the **Name** page, type a name for the rule, and then choose the **Finish** button.  
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)