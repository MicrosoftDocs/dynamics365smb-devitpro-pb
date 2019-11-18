---
title: Add Web Server Instance
description: This topic describes how to use the Dynamics NAV Administration Shell to add a Dynamics NAV web server instance on a computer or a virtual machine.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dc7646f1-c449-4281-af5d-8bb95ff33b08
caps.latest.revision: 10
---
# How to Add a Microsoft Dynamics NAV Web Server Instance
This topic describes how to use the [!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell to add a [!INCLUDE[navnow](includes/navnow_md.md)] web server instance on a computer or virtual machine. The [!INCLUDE[nav_shell](includes/nav_shell_md.md)] includes the New-NAVWebServerInstance cmdlet that creates an application on IIS for the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

### To add a [!INCLUDE[navnow](includes/navnow_md.md)] web server instance  

1.  On the computer or virtual machine that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], run **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell** as an Administrator.  

    1.  Choose **Start**, in the **Search** box, type **[!INCLUDE[navnow](includes/navnow_md.md)] Administration Shell**.  

    2.  Right-click the related link, and then choose **Run as Administrator**.  

2.  At the command prompt, type the following command:  

    ```  
    New-NAVWebServerInstance -WebServerInstance <MyWebApp> -Server <NAVServer> -ServerInstance <NAVServerInstance> -ClientServicesCredentialType <NAVCredentialType>  
    ```  

     Change the following parameter values.  

    |Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------|---------------------------------------|  
    |*\<MyWebApp>*|Specifies the name that you want to give the [!INCLUDE[nav_web](includes/nav_web_md.md)] application instance. This name will become part of the URL for the [!INCLUDE[nav_web](includes/nav_web_md.md)] application, for example, *https://MyWebServer:8080/MyWebApp* or *https://MyWebServer:8080/MyWebApp/WebClient* (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions).|  
    |*\<NAVServer>*|Specifies the name of the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)] to connect the [!INCLUDE[navnow](includes/navnow_md.md)] web server to.|  
    |*\<NAVServerInstance>*|Specifies the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to connect the web server instance to.|  
    |*\<NAVCredentialType>*|Specifies the credential type that is configured for the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)]. Valid options are **NavUserPassword**, **Windows**, **UserName**, and **AccessControlService**. The default value is **NavUserPassword**. **Important:**  The credential type must match the credential type that is used by the [!INCLUDE[navnow](includes/navnow_md.md)] web server to authenticate [!INCLUDE[nav_web](includes/nav_web_md.md)] users. For more information, see [Configuring the Credential Type on the Microsoft Dynamics NAV Web Client Web Site](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md#WebClient).|  

    > [!NOTE]  
    >  The command that is shown includes only the required parameters of the NAVWebServerInstance cmdlet. The cmdlet has several other parameters that can be used to configure the web server instance. For more information about the syntax and parameters, see New-NAVWebServerInstance cmdlet topic in the Administration Cmdlets for [!INCLUDE[navnow](includes/navnow_md.md)] section of the Technical Reference.  

3.  Press Enter to run the cmdlet.  

     A new [!INCLUDE[navnow](includes/navnow_md.md)] web server instance with the specified name is added to the [!INCLUDE[nav_web](includes/nav_web_md.md)] site on IIS.  

    > [!NOTE]  
    >  If you want to change the configuration of the new [!INCLUDE[navnow](includes/navnow_md.md)] web server instance after it has been added, modify the [!INCLUDE[web_server_settings_file_md.md](includes/web_server_settings_file_md.md)]. For more information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md).  

## Example  
 This example creates a new [!INCLUDE[navnow](includes/navnow_md.md)] web server instance that is named MyNavApp. The [!INCLUDE[navnow](includes/navnow_md.md)] web server instance connects to the [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)] server instance on the MyNavServer computer.  

```  
New-NAVWebServerInstance -WebServerInstance MyNavApp –Server MyNavServer –ServerInstance nav_server_instance –Company MyNavCompany -ClientServicesCredentialType NavUserPassword  
```  

 To open the [!INCLUDE[nav_web](includes/nav_web_md.md)] for this example, open the following URL in a web browser:  

 **https://mymachine.cloudapp.net/MyNavApp**  

## See Also  
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [How to: Set Up Multiple Web Server Instances for the Microsoft Dynamics NAV Web Client](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [How to: Add a Microsoft Dynamics NAV Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Server-Instance.md)   
 [How to: Add a Microsoft Dynamics NAV Database](How-to--Add-a-Microsoft-Dynamics-NAV-Database.md)   
 [How to: Add a Microsoft Dynamics NAV Company](How-to--Add-a-Microsoft-Dynamics-NAV-Company.md)
