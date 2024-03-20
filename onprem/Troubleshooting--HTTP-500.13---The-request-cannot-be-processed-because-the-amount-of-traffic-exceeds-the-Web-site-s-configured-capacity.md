---
title: "Troubleshooting: HTTP 500.13 - The request cannot be processed because the amount of traffic exceeds the Web site&#39;s configured capacity"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: b212ce99-2ab4-40f3-b386-5a2019647da5
caps.latest.revision: 9
---
# Troubleshooting: HTTP 500.13 - The request cannot be processed because the amount of traffic exceeds the Web site&#39;s configured capacity
When you try to preview a report or open a report as a PDF from the [!INCLUDE[nav_web](includes/nav_web_md.md)], you get an error message that is similar the following:  
  
 **HTTP Error 500.13 - Internal Server Error**  
  
 **The request cannot be processed because the amount of traffic exceeds the Web site's configured capacity.**  
  
## Resolution  
 This error can occur when too many users are running reports at the same time. By default, there is a limit of 50 concurrent report sessions. If this limit is exceeded, then an error occurs.  
  
 To resolve this error, change the web.config file of the [!INCLUDE[nav_web](includes/nav_web_md.md)] to increase the limit on concurrent report sessions.  
  
#### To change the maximum concurrent report sessions in the web.config file  
  
1.  In a text editor, such as Notepad, open the web.config file for the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
     The web.config file is located on the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. The default folder is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Web Client.  
  
2.  In the `<appsettings>` element, add the following element.  
  
    ```  
    <add key="MaxNumberOfConcurrentReportProcessing" value="nn"  
    ```  
  
     Replace `nn` with an integer that specifies the maximum number of concurrent reporting sessions allowed.  
  
    > [!IMPORTANT]  
    >  The number of report sessions that are running at the same time can affect the performance and reliability of the [!INCLUDE[nav_web](includes/nav_web_md.md)]. We recommend that you increase the value slightly, for example from 50 to 75, and then evaluate the performance and increase or decrease as necessary.  
  
3.  Save the web.config file.  
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)