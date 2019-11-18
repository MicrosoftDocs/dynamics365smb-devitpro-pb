---
title: "Configuring Microsoft Dynamics NAV Help Server"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 95087fdf-28ee-4d6b-9153-87f6857325bc
caps.latest.revision: 10
---
# Configuring Microsoft Dynamics NAV Help Server
[!INCLUDE[navnow](includes/navnow_md.md)] Help deploys to a [!INCLUDE[navnow](includes/navnow_md.md)] Help Server, which is a website that installs on the specified server. The website includes Search and other navigation, and it provides context-sensitive Help for [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. You can configure each client to access Help on any [!INCLUDE[navnow](includes/navnow_md.md)] Help Server. Depending on your deployment architecture, you can choose to set up a dedicated Help Server that all clients connect to, or you can choose to deploy customer-specific Help Servers. You can deploy a Help Server under either http or https protocols.  
  
## Deploying the Help Server  
 The [!INCLUDE[navnow](includes/navnow_md.md)] Help Server is an installation component that you can choose from the **Custom** option of [!INCLUDE[navnow](includes/navnow_md.md)] Setup. When you choose to install the Help Server, a website is created on the specified server. If Internet Information Services \(IIS\) are not present on the server, Setup installs this and other prerequisites. When the Setup program is finished, the website is set up with a folder for each language in your version of [!INCLUDE[navnow](includes/navnow_md.md)]. However, the Help content consists of many files, and therefore, the content is not fully available until after several minutes. Exactly how much time it takes to make the content available depends on the number of Help files that must be added to the website.  
  
 You can add solution-specific and customer-specific Help, and you can add as many languages to the Help Server as your deployment requires. When accessed from [!INCLUDE[navnow](includes/navnow_md.md)], Help displays in the language that the current client uses. If that language is not available, the Help Server defaults to English.  
  
### Configuration Settings  
 When you install the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server, you must specify the following information.  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|Install location|Specifies where the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server is installed, such as **C:\\inetpub\\wwwroot**.|  
|Port|Specifies the TCP listening port for the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server, such as 49000.<br /><br /> The valid range is 1-65535.|  
  
 Then, when you install [!INCLUDE[nav_server](includes/nav_server_md.md)], the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], or the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you must specify where the Help Server is located as described in the following table.  
  
|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|Server|Specifies the location of the computer that hosts the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server, such as *MyWebServer*.<br /><br /> If the value of the HelpServer setting starts with "http," then the HelpServer port setting is ignored and the entire value is used to create the base of the help url. This enable you to set up a server that uses https or that includes a subpath, as in the following examples:<br /><br /> https://myserver.com<br /><br /> -or-<br /><br /> https://myserver.com:45672/navhelp/financeapp<br /><br /> If the Help Server setting does not begin with "http," then [!INCLUDE[navnow](includes/navnow_md.md)] will format the url as follows: https://\<HelpServer value>:\<HelpServerPort value>.|  
|Port|Specifies the TCP listening port for the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server, such as 49000.|  
  
 For [!INCLUDE[nav_windows](includes/nav_windows_md.md)] users, this configuration is stored in the ClientUserSetting.config file. For more information, see [Configuring the Windows Client](Configuring-the-Windows-Client.md).  
  
### Configuring the Website  
 The [!INCLUDE[navnow](includes/navnow_md.md)] Help Server deploys as a website that you can configure like any other website. For example, you must make the website available to your users by granting them permission to access the website. By default, users that you set up in [!INCLUDE[navnow](includes/navnow_md.md)] can access the website, because [!INCLUDE[navnow](includes/navnow_md.md)] Setup enables Windows authentication and anonymous authentication. For example, if your [!INCLUDE[navnow](includes/navnow_md.md)] deployment uses Windows authentication, you can add the relevant domain group to the IIS users group. If you want to use other types of authentication, you can set up NET authorization rules, for example.  
  
 The website for the Help Server contains several folders as described in the following table.  
  
|Folder|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|App\_GlobalResources|Contains the localized strings for the website itself.|  
|bin|Contains the Microsoft.Dynamics.Nav.WebHelp.dll assembly that provides core functionality for the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server.|  
|css|Contains the stylesheets for the website.|  
|help|Contains the Help content with a subfolder for each language module in your deployment, an **en** folder, and a **local** folder.<br /><br /> The locale-specific Help content is in locale-specific folders. For example, in the Danish version of [!INCLUDE[navnow](includes/navnow_md.md)], the Help Server website includes a **da-DK** folder with the Help content in Danish.<br /><br /> The **en** folder contains Help content in the non-locale-specific version. This is the version of the Help that [!INCLUDE[navnow](includes/navnow_md.md)] defaults to if the client locale cannot be found.<br /><br /> The **local** folder contains pictures and other supporting files for the Help content.|  
|images|Contains icons for the website.|  
|js|Contains support files for the website.|  
  
 Help is installed as CAB files, which self-extract when the installation is completed, such as htmlhelp.en.cab.  
  
 If you want to add your own Help content to the Help Server website, you can add the relevant HTML files to the relevant locale-specific folder.  
  
 Each locale-specific Help folder contains a ToC.xml file that defines the navigation pane on the website, the table of contents. If you want to add your Help content to the table of contents file, you can edit the ToC.xml file in the XML editor of your choice, such as Notepad or Visual Studio.  
  
 In a multitenant deployment, the Help links that open a specific page in [!INCLUDE[navnow](includes/navnow_md.md)] do not work by default. To convert all of the hyperlinks in your existing Help, you can use a search-and-replace tool to find the links that look like this example:  
  
```  
<a href="DynamicsNAV:////runpage?Page=536" alt=  
```  
  
 and replace them with:  
  
```  
<a href="DynamicsNAV://///runpage?Page=536" alt=  
```  
  
## See Also  
 [Microsoft Dynamics NAV Help Server](Microsoft-Dynamics-NAV-Help-Server.md)   
 [Help Table of Contents](Help-Table-of-Contents.md)   
 [Upgrading Your Existing Help Content](Upgrading-Your-Existing-Help-Content.md)   
 [Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Configuring the Windows Client](Configuring-the-Windows-Client.md)   
 [Configuring the Microsoft Dynamics NAV Web Server and Client](Configuring-the-Microsoft-Dynamics-NAV-Web-Server-and-Client.md)   
 [Demo Option](Demo-Option.md)