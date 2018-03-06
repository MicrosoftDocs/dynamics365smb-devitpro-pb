---
title: "How to: Set Up Multiple Web Server Instances for the Microsoft Dynamics NAV Web Client"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
ms.assetid: 28566a8f-eccf-4344-bc00-1df9b6918783
caps.latest.revision: 29
manager: edupont
---
# How to: Set Up Multiple Web Server Instances for the Microsoft Dynamics NAV Web Client

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md).

When you install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], a website with a web server instance for the [!INCLUDE[nav_web](includes/nav_web_md.md)] is added on Internet Information Services \(IIS\). There may be scenarios when you want to set up multiple [!INCLUDE[nav_web](includes/nav_web_md.md)] instances on the [!INCLUDE[nav_web](includes/nav_web_md.md)] website. For example, you could set up a separate [!INCLUDE[nav_web](includes/nav_web_md.md)] instance for the different companies.  
  
 To add a new [!INCLUDE[nav_web](includes/nav_web_md.md)] application, you use the [!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell and run the New-NAVWebServerInstance cmdlet to add a new web server instance. The resultant [!INCLUDE[navnow](includes/navnow_md.md)] web server has the following characteristics:  
  
-   A virtual directory instance with an underlying web application is added to the [!INCLUDE[nav_web](includes/nav_web_md.md)] website. The [!INCLUDE[nav_web](includes/nav_web_md.md)] application has its own web.config file that you can modify to change the configuration of the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
-   You can configure IIS settings, such as application pool. You can also configure [!INCLUDE[navnow](includes/navnow_md.md)] settings, such as the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance or company. These setting must be configured separately for each web server instance.  
  
-   The new web server instance has the same URL as other instances under the parent website, except that it includes the instance name that you specify with the New-NavWebServerInstance cmdlet.  
  
     For example, the URL for the default [!INCLUDE[nav_web](includes/nav_web_md.md)] is http://MyNavWebServer:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient. The URL for the new [!INCLUDE[nav_web](includes/nav_web_md.md)] instance, which you name MyCompany, would be http://MyNavWebServer:8080/MyCompany/WebClient.  
  
 You can run the cmdlet multiple times to create additional [!INCLUDE[navnow](includes/navnow_md.md)] web server instances on the server.  
  
> [!NOTE]  
>  You cannot nest applications. Only one level of applications under a website is allowed.  
  
 For more information about [!INCLUDE[navnow](includes/navnow_md.md)] web server instances on IIS, see [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md).  
  
### To add a web server instance  
  
1.  \(Optional\) Modify the instanceweb.config file.  
  
     For more information, see [Modifying the Microsoft Dynamics NAV Settings in the Instanceweb.config File](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client-2017.md#ModifyInstanceweb)  
  
    > [!NOTE]  
    >  You would typically follow this step if you were adding multiple [!INCLUDE[nav_web](includes/nav_web_md.md)] instances to save time configuring each instance.  
  
2.  On the computer that is running IIS, run [!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell as an Administrator.  
  
     On the **Start** menu, right-click **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell**, and then choose **Run as Administrator**.  
  
3.  At the command prompt, type the following command.  
  
    ```  
    New-NAVWebServerInstance -WebServerInstance MyWebApp -Server NAVServer -ServerInstance NAVServerInstance  
    ```  
  
    -   Change *MyWebApp* to the name that you want to give the virtual directory for the web server instance. This name will become part of the URL for the [!INCLUDE[nav_web](includes/nav_web_md.md)] application, for example, http://MyWebServer:8080/MyWebApp/WebClient.  
  
    -   Change *NAVServer* to the name of the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)] to which you want to connect.  
  
    -   Change *NAVServerInstance* to the name of the instance on the [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
    > [!NOTE]  
    >  This command only sets the required parameters of the NAVWebServerInstance cmdlet. The cmdlet has several other parameters that can use to configure the web server instance. For more information about the syntax and parameters, see New-NAVWebServerInstance.  
  
4.  Press Enter to run the cmdlet.  
  
     A new web server instance is added.  
  
    > [!NOTE]  
    >  If you want to change the configuration of the new [!INCLUDE[navnow](includes/navnow_md.md)] web server instance, modify the web.config file. For more information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md).  
  
##  <a name="ModifyInstanceweb"></a> Modifying the Microsoft Dynamics NAV Settings in the Instanceweb.config File  
 The [!INCLUDE[navnow](includes/navnow_md.md)] web server instances that you add with the New-NavWebServerInstance cmdlet use the instanceweb.config file as a template file to create the actual web.config file for the instance. Modifying the instanceweb.config file enables you to configure the [!INCLUDE[navnow](includes/navnow_md.md)] settings in advance, and then pass the settings to new web server instances when they are created.  
  
 By default, the instanceweb.config file is located in the [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Web Client folder of the computer on which [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] are installed.  
  
#### To modify the [!INCLUDE[navnow](includes/navnow_md.md)] settings in the instanceweb.config file  
  
1.  On the computer that you installed the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], open the instanceweb.config file in a text editor, such as Notepad.  
  
2.  Locate the `<DynamicsNAVSettings>` element.  
  
3.  Change the parameter values as needed.  
  
     For more information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md).  
  
4.  Save the web.config file.  
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
 [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md)