---
title: Microsoft Report Viewer Web Client Configuration
description: Dynamics NAV reports should be configured by adding the ASP.NET web handler file to the web.config file for Microsoft Report Viewer to display reports.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4d817dd2-4a6d-4728-a2bc-a7a19f371be6
caps.latest.revision: 26
---
# Configuring Microsoft Report Viewer for Dynamics NAV Web Client
The [!INCLUDE[nav_web](includes/nav_web_md.md)] uses Microsoft Report Viewer to display [!INCLUDE[navnow](includes/navnow_md.md)] reports. Before you can do this, Microsoft Report Viewer must be configured on a web site of  the [!INCLUDE[nav_web](includes/nav_web_md.md)]. To configure Microsoft Report Viewer, you add the ASP.NET web handler file for Microsoft Report Viewer to the web.config file of the [!INCLUDE[nav_web](includes/nav_web_md.md)] site.  
  
> [!NOTE]  
>  By default, Microsoft Report Viewer is configured. The following procedure is only required if you have removed the Microsoft Report Viewer configuration from the web.config file for the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 Report Viewer also includes an option that lets users save a report as a Microsoft Excel, Microsoft Word, or PDF file. This functionality is not enabled by default. If you want to be able to save reports, you must configure the Report Viewer to save reports. For more information, see [Configuring Report Viewer to Save Reports as Excel XLSX, Word DOCX, or PDF Files](How-to--Configure-Microsoft-Report-Viewer-for-the-Microsoft-Dynamics-NAV-Web-Client.md#Save).  
  
### To configure Microsoft Report Viewer  
  
1.  On the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], open the web.config file for the web server instance for the [!INCLUDE[nav_web](includes/nav_web_md.md)]. Use a text editor, such as Notepad.  
  
     The web.config file is located in the physical path of the web application on Internet Information Services \(IIS\). By default, the path is *%systemroot%\\inetpub\\wwwroot\\\[VirtualDirectoryName\]\\WebClient*. For example, the folder for the default [!INCLUDE[nav_web](includes/nav_web_md.md)] application is %systemroot%\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\\WebClient.  
  
2.  In the `<handlers></handlers>` element of the web.config file, add the following code for the Microsoft Report Viewer handler.  
  
    ```  
    <add name="ReportViewerWebControl" verb="*" path="Reserved.ReportViewerWebControl.axd" type="Microsoft.Reporting.WebForms.HttpHandler, Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" resourceType="Unspecified" />  
    ```  
  
3.  Save the web.config file.  
  
##  <a name="Save"></a> Configuring Report Viewer to Save Reports as Excel XLSX, Word DOCX, or PDF Files  
 You can set up the Print Preview for reports to include an option that enables users to save a report as an Excel XLSX, Word DOCX, or PDF file. Microsoft Report Viewer uses the Temp folder of the user account that is used as the application pool identity of the [!INCLUDE[nav_web](includes/nav_web_md.md)]. To set up the save as Excel and Word options, the user account must have read, write, and modify permission to the folder. If the user account does not have the correct permissions, then the saved file will be empty.  
  
<!--
> [!NOTE]  
>  If your company uses Microsoft Office 365, the temporary files are stored in the location that is specified for the Office 365 document library. For more information, see [Integrating with Office 365 and SharePoint Online](Integrating-with-Office-365-and-SharePoint-Online.md).  -->
  
#### To configure Report Viewer to save reports as Excel XLSX, Word DOCX, or PDF files  
  
1.  Open the web.config file for the [!INCLUDE[nav_web](includes/nav_web_md.md)] application that contains the [!INCLUDE[navnow](includes/navnow_md.md)] settings. Use a text editor, such as Notepad.  
  
     The web.config file is located in the physical path of the virtual directory for the [!INCLUDE[nav_web](includes/nav_web_md.md)] application on IIS. By default, the path is *%systemroot%\\inetpub\\wwwroot\\\[VirtualDirectoryName\]*. For example, the folder for the default [!INCLUDE[nav_web](includes/nav_web_md.md)] application is %systemroot%\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].  
  
2.  On the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], grant users read, write, and modify permission to the user account’s Temp folder that is used as the identity of the application pool for [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
    > [!NOTE]  
    >  This step is not required if you only want to enable saving reports as PDF files.  
  
     For the [!INCLUDE[nav_web](includes/nav_web_md.md)], the default user account is ApplicationPoolIdentity and the folder is *C:\\Users\\Web Client Application Pool\\AppData\\Local\\Temp\\*.  
  
    > [!TIP]  
    >  To determine the application pool identity, open Internet Information Services Manager, and then choose **Application Pools** in the **Connections** pane.  
  
## See Also  
 [Configuring Microsoft Dynamics NAV Web Client by Modifying the Web.config File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)
