---
title: "System Requirements for Microsoft Dynamics NAV 2017"
description: This article provides the specifications of minimum hardware and software requirements to install and run Microsoft Dynamics NAV 2017.
author: edupont04
ms.custom: na
ms.date: 10/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
ms.assetid: 014e3285-02be-459c-9a54-eae45ea71e04

---
# System Requirements for Microsoft Dynamics NAV 2017

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](System-Requirements-for-Microsoft-Dynamics-NAV.md).

The following sections list the specifications of minimum hardware and software requirements to install and run [!INCLUDE[navnowlong](includes/navnowlong_md.md)]. **Minimum** means that later versions \(such as SP1, SP2, or R2 versions\) of a required software product are also supported.  

**Client components**  

-   [Microsoft Dynamics NAV Windows Client Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#WinClient)  

-   [Microsoft Dynamics NAV Development Environment Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#DevEnv)  

-   [Microsoft Dynamics NAV Web Client Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#WebClient)  

-   [Microsoft Dynamics NAV Tablet Client and Phone Client (in a Browser) Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#NavApps)  

-   [Microsoft Dynamics NAV Universal App Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#DynNAVApp)  

**Server components**  

-   [Microsoft Dynamics NAV Server Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#NavServerReqs)  

-   [Microsoft Dynamics NAV Web Server Components Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#WebServer)  

-   [Microsoft Dynamics NAV Database Components for SQL Server Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#SQLReq)  

-   [Microsoft Dynamics NAV Help Server Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#HelpServer)  

**Additional components and features**  

-   [Microsoft Dynamics NAV as an App for SharePoint Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#SharePointApp)  

-   [Automated Data Capture System Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#ADCS)  

-   [Business Inbox in Microsoft Outlook Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#BusInboxOutlook)  

-   [Microsoft Outlook Add-In Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#Outlook)  

-   [Microsoft Dynamics CRM Integration Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#CRM)  

-   [Automated Deployment on Microsoft Azure Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#Azure)  

> [!NOTE]  
>  [!INCLUDE[navnow](includes/navnow_md.md)] Setup installs some software if it is not already present in the target computer. For more information, see the "Additional Information" section for each component.  

##  <a name="WinClient"></a> Microsoft Dynamics NAV Windows Client Requirements  
 The following table shows the minimum system requirements for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

|||  
|-|-|  
|Supported operating systems|-   Windows 10 Pro, Enterprise, or Education \(32-bit and 64-bit editions\).<br />-   Windows 8.1 Professional or Enterprise \(32-bit and 64-bit editions\).<br />-   Windows Server 2016 Standard, Essentials, or Datacenter.<br />-   Windows Server 2012 R2 Standard or Essentials \(64-bit edition\).<br />-   Windows Server 2012 Standard or Essentials \(64-bit edition\).|  
|Hardware resources|-   Hard disk space: 200 MB.<br />-   Memory: 1 GB.|  
|Reports|-   Microsoft Report Viewer 2015 to run reports that use RDLC report layouts.<br />-   SQL Server Report Builder 3.0 for Microsoft SQL Server 2014 or Microsoft SQL Server 2012 SP1 to edit RDLC report layouts.<br />-   Microsoft Word 2013 or later to edit the layouts.|  
|Instant messaging and Telephony API|-   Microsoft Lync 2013 or Microsoft Lync 2010.|  
|Outlook client integration and mail merge|-   Microsoft Office 365, Microsoft Office 2016, Microsoft Office 2013 Service Pack 1 \(SP1\), or Microsoft Office 2010 Service Pack 2 \(SP2\).|  
|Import and export with Microsoft Excel and Office XML, and SharePoint links|-   Microsoft Office 2016, Microsoft Office 2013 SP1, Microsoft Office 2010 SP2, or Microsoft Office 365.|  
|Editing in Excel using the Excel Add-in |Excel 2016,<br /><br />For more information, see [Setting up the Excel Add-In for Editing Dynamics NAV Data](configuring-dynamics-nav-excel-addin.md).|  
|OneNote integration|-   Microsoft Office 2016, Microsoft Office 2013 SP1, or Microsoft Office 2010 SP2.|  
|Email logging|-   Active Directory and Microsoft Exchange Server 2010 or Microsoft Exchange Server 2013.<br />-   Microsoft Exchange Online, or Exchange Online as part of an Office 365 subscription.|  
|Additional software|-   Microsoft .NET Framework 4.5.2.|  
|Additional information|<ul><li>[!INCLUDE[navnow](includes/navnow_md.md)] Setup installs the following software if it is not already present in the target computer:<br /><br /> <ul><li>Microsoft .NET Framework 4.5.2.</li><li>Microsoft Report Viewer2015.</li></ul></li><li>The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is available in a 32-bit version and 64-bit version. On a 32-bit Windows operating system, the 32-bit version is run. On a 64-bit Windows operating system, the 64-bit version is run by default; however, you can also run the 32-bit version if it is required.</li><li>[!INCLUDE[navnow](includes/navnow_md.md)] Setup can only install the Excel Add-in if Excel is present on the target computer.</li><li>Outlook synchronization is not supported on 64-bit versions of Office.</li><li>**Note:** We’ve had reports that .NET framework 4.7 can cause the Windows client environment to crash. In this case the solution is to uninstall .NET framework 4.7.</li></ul>|  

##  <a name="DevEnv"></a> Microsoft Dynamics NAV Development Environment Requirements  
 The following table shows the minimum system requirements for the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  

|||  
|-|-|  
|Supported operating systems|-   Windows 10 Pro, Enterprise, or Education \(32-bit and 64-bit editions\).<br />-   Windows 8.1 Professional or Enterprise \(32-bit and 64-bit editions\).<br />-   Windows Server 2016 Standard, Essentials, or Datacenter.<br />-   Windows Server 2012 R2 Standard or Essentials \(64-bit edition\).<br />-   Windows Server 2012 Standard or Essentials \(64-bit edition\).|  
|Hardware resources|-   Hard disk space: 200 MB.<br />-   Memory: 1 GB.|  
|Reports|<ul><li>Microsoft Report Viewer 2015 to run reports that use RDLC report layouts.</li><li>Microsoft Visual Studio or SQL Server Report Builder for creating and editing RDLC report layouts. The following versions and editions are supported:<br /><br /> <ul><li>Microsoft Visual Studio 2015 Professional or Enterprise edition with SQL Server Data Tools installed. **Important:**          Before you install Visual Studio, install Microsoft .NET Framework 4.6; otherwise, an error will occur when you compile or run RDLC reports. For more information, see [Report error "Visual Basic Command Line Compiler has stopped working"](http://go.microsoft.com/fwlink/?LinkID=722862).</li><li>Microsoft Visual Studio 2013 Professional, Premium, or Ultimate edition.</li><li>Microsoft Visual Studio 2012 Professional, Premium, or Ultimate edition.</li><li>SQL Server Report Builder 3.0 for Microsoft SQL Server 2014 or Microsoft SQL Server 2012 SP1.</li></ul></li><li>SQL Server Report Builder 3.0 for Microsoft SQL Server 2014 or Microsoft SQL Server 2012 SP1 to upgrade reports.</li><li>Word 2013 or later to create Word report layouts.</li></ul>|  
|Additional software|-   Microsoft .NET Framework 4.5.2.|  
|Additional information|<ul><li>[!INCLUDE[navnow](includes/navnow_md.md)] Setup installs the following software if it is not already present in the target computer:<br /><br /> <ul><li>Microsoft .NET Framework 4.5.2.</li><li>SQL Server Native Client 11.0.</li><li>Microsoft Report Viewer2015.</li><li>SQL Server Report Builder 3.0 for Microsoft SQL Server 2014. This is not installed if a version of SQL Server Report Builder or Microsoft Visual Studio is already present on the target computer</li></ul></li><li>If the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] are on the same computer, then only a 64-bit operating system is supported.</li><li>**Note:** We’ve had reports that .NET framework 4.7 can cause the Windows client environment to crash. In this case the solution is to uninstall .NET framework 4.7.</li></ul>|  

##  <a name="WebClient"></a> Microsoft Dynamics NAV Web Client Requirements  
 The following table shows the minimum system requirements for the [!INCLUDE[navnow](includes/navnow_md.md)] Web client.  

|||  
|-|-|  
|Supported browsers|-   Microsoft Edge.<br />-   Internet Explorer 11.<br />-   Google Chrome 53.0 for Windows.<br />-   Mozilla Firefox 49.0 for Windows.<br />-   Safari 9.0 and 10.0 on OSX.<br /><br /> For a list of browser limitations, see [Browser Limitations with the Microsoft Dynamics NAV Web Client](Browser-Limitations-with-the-Microsoft-Dynamics-NAV-Web-Client.md).|  
|Business inbox in Outlook|-   Microsoft Office 365.|  
|Sending data to Excel|-   Microsoft Office 2016, Microsoft Office 2013 SP1, Microsoft Office 2010 SP2, or Microsoft Office 365.|  
|Editing in Excel using the Excel Add-in |Excel 2016.<br /><br />For more information, see [Setting up the Excel Add-In for Editing Dynamics NAV Data](configuring-dynamics-nav-excel-addin.md).|  
|SharePoint Online links|-   Microsoft Office 2016, Microsoft Office 2013 SP1, Microsoft Office 2010 SP2, or Microsoft Office 365.|  
|Printing reports to Excel or Word|-   Microsoft Office 2016, Microsoft Office 2013 SP1, Microsoft Office 2010 SP2, or Microsoft Office 365.|  
|Additional information|-   The browser must be able to install the Report Viewer ActiveX control to be able to print.<br />-   If you experience problems using the [!INCLUDE[nav_web](includes/nav_web_md.md)], you can try to turn off browser tools, such as translator tools that may run in the background.|  

##  <a name="NavApps"></a> Microsoft Dynamics NAV Tablet Client and Phone Client \(in a Browser\) Requirements  
 The following table shows the minimum system requirements for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] running in a browser when used for development and testing purposes.  

|||  
|-|-|  
|Server component|Identical to the [!INCLUDE[navnow](includes/navnow_md.md)] Web client.|  
|Supported browsers|The following desktop browsers are supported:<br /><br /> -   Microsoft Edge<br />-   Internet Explorer 11 \(build 11.0.9600.17239\) for Windows 10 and for Windows 8.1 \(32-bit and 64-bit versions\).<br />-   Google Chrome 53.0 for Windows.<br />-   Mozilla Firefox 49.0 for Windows.|  

##  <a name="DynNAVApp"></a> Microsoft Dynamics NAV Universal App Requirements  
 The following table shows the minimum system requirements for the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)]. For the latest information, see [Dynamics NAV for Windows](http://go.microsoft.com/fwlink/?LinkId=509974), [Dynamics NAV for iPad and iPhone](http://go.microsoft.com/fwlink/?LinkId=509975), and [Dynamics NAV for Android tablet and Android phone](http://go.microsoft.com/fwlink/?LinkId=509976).  

|||  
|-|-|  
|Supported operating systems|-   Windows 10 Home, Pro, Enterprise, or Education \(32-bit and 64-bit editions\).<br />-   Android 5.0 or higher (tablet and phone).<br />-   iOS 9.0 or higher (iPad and iPhone).<br />-   Windows Phone 8.1 or higher.<br />|  
|Additional hardware|-   1 GB RAM for Android and Windows.|  
|Additional software|-   A third-party telephony or VoIP app such as Skype or Lync is required for placing calls from [!INCLUDE[navnow](includes/navnow_md.md)].<br />-   A third-party email program such as Outlook is required for sending emails from [!INCLUDE[navnow](includes/navnow_md.md)].<br />-   Microsoft Office 2013 SP1 or Microsoft Office 365 is required for sending data to Microsoft Excel or to Microsoft Word.|  
|Additional information|-   Device diagonal screen size 7” for tablets.<br />-   Screen resolution 960 × 510 for tablets.<br /> -   Device diagonal screen size 4” for phones.<br />-   Screen resolution 854 x 480 for phones.|  

##  <a name="NavServerReqs"></a> Microsoft Dynamics NAV Server Requirements  
 The following table shows the minimum system requirements for [!INCLUDE[nav_server](includes/nav_server_md.md)].  

|||  
|-|-|  
|Supported operating systems|-   Windows 10 Pro, Enterprise, or Education \(64-bit edition\).<br />-   Windows 8.1 Professional or Enterprise \(64-bit edition\).<br />-   Windows Server 2016 Standard, Essentials, or Datacenter.<br />-   Windows Server 2012 R2 Standard or Essentials \(64-bit edition\).<br />-   Windows Server 2012 Standard or Essentials \(64-bit edition\).|  
|Hardware resources|-   Hard disk space: 500 MB.<br />-   Memory: 2 GB.|  
|Reports|-   Microsoft Report Viewer 2015 for Save as Excel, Save as PDF, and Save as Word functionality.|  
|[!INCLUDE[crm](includes/crm_md.md)] integration|-   Windows Identity Framework.<br />     For a list of supported [!INCLUDE[crm](includes/crm_md.md)] versions, see [Microsoft Dynamics 365 for Sales Integration Requirements](System-Requirements-for-Microsoft-Dynamics-NAV.md#CRM).|  
|Additional software| - Microsoft .NET Framework 3.5.1.<br /> - Microsoft .NET Framework 4.5.2.<br />-   Windows PowerShell 3.0.|  
|Additional information|<ul><li>[!INCLUDE[navnow](includes/navnow_md.md)] Setup installs the following software if it is not already present on the target computer:<br /><br /> <ul><li>Microsoft .NET Framework 4.5.2.</li><li>Microsoft Report Viewer 2015.</li><li>Windows Identity Framework.</li></ul></li></ul>|  

##  <a name="WebServer"></a> Microsoft Dynamics NAV Web Server Components Requirements  

|||  
|-|-|  
|Supported operating systems|-   Windows 10 Pro, Enterprise, or Education \(64-bit edition\).<br />-   Windows 8.1 Professional or Enterprise \(64-bit edition\).<br />-   Windows Server 2016 Standard, Essentials, or Datacenter.<br />-   Windows Server 2012 R2 Standard or Essentials \(64-bit edition\).<br />-   Windows Server 2012 Standard or Essentials \(64-bit edition\).|  
|Web server|<ul><li>Internet Information Server 10, Internet Information Server 8.5, Internet Information Server 8.0, or Internet Information Server 7.5.|  
|Reports|-   Microsoft Report Viewer 2015 to run reports that use RDLC report layouts.|  
|Additional software|-   Microsoft .NET Framework 4.5.2.<br />-   Windows PowerShell 3.0.|  
|Additional information|<ul><li>[!INCLUDE[navnow](includes/navnow_md.md)] Setup installs the following software if it is not already present on the target computer.<br /><br /> <ul><li>Microsoft .NET Framework 4.5.2.</li><li>Internet Information Server 10, Internet Information Server 8.5, Internet Information Server 8.0, or Internet Information Server 7.5 depending in the operating system, with the required features enabled.</li></ul></li><li>For more information about installing IIS, see [How to: Install Internet Information Services for Microsoft Dynamics NAV Web Client](how-to--install-and-configure-internet-information-services-for-microsoft-dynamics-nav-web-client.md).</li><li>To avoid crashes on the IIS server with many concurrent users, download and install the update from here [Update for the .NET Framework 4.5 in Windows 8, Windows RT, and Windows Server 2012](http://go.microsoft.com/fwlink/?LinkId=313427).</li></ul>|  

##  <a name="SQLReq"></a> Microsoft Dynamics NAV Database Components for SQL Server Requirements  
 The following table shows the minimum system requirements for [!INCLUDE[navnow](includes/navnow_md.md)] database components for SQL Server.  

|||  
|-|-|  
|Supported operating systems|-   Windows 10 Pro, Enterprise, or Education \(64-bit edition\).<br />-   Windows 8.1 Professional or Enterprise \(64-bit edition\).<br />-   Windows Server 2016 Standard, Essentials, or Datacenter.<br />-   Windows Server 2012 R2 Standard or Essentials \(64-bit edition\).<br />-   Windows Server 2012 Standard or Essentials \(64-bit edition\). |  
|Hardware resources|For more information, see [Hardware and Software Requirements for Installing SQL Server 2016](http://go.microsoft.com/fwlink/?LinkId=622999). From this page, you can also access requirements for other versions of SQL Server.|  
|SQL Server|-   Microsoft SQL Server 2017 Express, Standard or Enterprise.<br/> -   Microsoft SQL Server 2016 Express, Standard or Enterprise.<br/>-   Microsoft SQL Server 2014 Express, Standard or Enterprise.<br />-   Microsoft SQL Server 2012 Service Pack 2 Express, Standard, or Enterprise \(64-bit editions only\).<br />-   Azure SQL Database V12 Standard and Premium service tiers.<br /><br /> For more information, see [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md).|  
|Service Packs and Cumulative Updates| Unless explicitly stated, all released Service Packs and Cumulative Updates of the above Microsoft SQL Server versions are supported. It is recommended to always be on the latest released Service Pack and Cumulative Update.|
|Additional information|[!INCLUDE[navnow](includes/navnow_md.md)] Setup installs the following software if it is not already present on the target computer:<br /><br /> <ul><li>SQL Server 2016 Express \(64-bit edition\).<br>If the operating system on the target computer does not support SQL Server 2016 Express, Setup displays a pre-requisite warning. In this case you should exit Setup and then update the operating system on the computer to one that does support SQL Server 2016 Express. Then run Setup again.</li></ul>|  

##  <a name="HelpServer"></a> Microsoft Dynamics NAV Help Server Requirements  
 The following table shows the minimum system requirements for the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server.  

|||  
|-|-|  
|Supported operating systems|-   Windows 10 Pro, Enterprise, or Education \(64-bit editions\).<br />-   Windows 8.1 Professional or Enterprise \(64-bit edition\).<br />-   Windows Server 2016 Standard, Essentials, or Datacenter.<br />-   Windows Server 2012.<br />-   Windows Server 2012 Essentials.|  
|Hardware resource|-   Hard disk space: 500 MB.<br />-   Memory: 2 GB.|  
|Web server|<ul><li>Internet Information Server 10, Internet Information Server 8.5, Internet Information Server 8.0, or Internet Information Server 7.5. The following features must be enabled:<br /><br /> <ul><li>.NET Extensibility 4.5.2.</li><li>ASP .NET 4.5.</li><li>ISAPI Extensions.</li><li>ISAPI Filters.</li><li>Request Filtering.</li><li>Windows Authentication.</li><li>Static Content.</li><li>HTTP Activation.</li></ul></li></ul>|  
|Additional software|-   Microsoft .NET Framework 4.5.2.|  
|Additional information|<ul><li>[!INCLUDE[navnow](includes/navnow_md.md)] Setup installs the following software if it is not already present on the target computer.<br /><br /> <ul><li>Microsoft .NET Framework 4.5.2.</li><li>Internet Information Server 10, Internet Information Server 8.5, Internet Information Server 8.0, or Internet Information Server 7.5, depending on the operating system, with the required features enabled.</li></ul></li><li>For more information about installing IIS, see [How to: Install Internet Information Services for Microsoft Dynamics NAV Web Client](http://go.microsoft.com/fwlink/?LinkId=265466)</li><li>Windows Search must be enabled on the computer that you install the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server on. If you install on Windows Server 2012, and Windows Search is not enabled as a file service, [!INCLUDE[navnow](includes/navnow_md.md)] Setup adds the service. However, the changes do not take effect until the computer has restarted.</li></ul>|  

##  <a name="ADCS"></a> Automated Data Capture System Requirements  
 The following table shows the minimum system requirements for Automated Data Capture System \(ADCS\) for [!INCLUDE[navnow](includes/navnow_md.md)].  

|||  
|-|-|  
|Additional software|-   MSXML version 6.0.<br />-   Telnet or Microsoft Windows HyperTerminal.<br />-   VT100 Plug-in for each computer on which you install ADCS.<br />-   Microsoft Loopback Adapter.|  
|Additional information|-   HyperTerminal is no longer included with Windows. For more information, see [What happened to HyperTerminal?](http://go.microsoft.com/fwlink/?LinkId=222571) in the Windows Help.<br />-   VT100 Plug-in acts as a virtual Telnet server.|  

##  <a name="BusInboxOutlook"></a> Business Inbox in Microsoft Outlook Requirements  
The following table shows the minimum system requirements for using [!INCLUDE[navnow_md](includes/navnow_md.md)] as your business inbox in Outlook.

|||  
|-|-|  
|Supported Outlook Applications |Outlook 2013 or later, Outlook Web App, OWA for iPad, OWA for iPhone, and OWA for Android.|
|Supported Exchange Servers|Exchange Online, Exchange Server 2016, or Exchange Server 2013.<br />In deployments that use Exchange Server, the Exchange PowerShell endpoint must be accessible by [!INCLUDE[nav_server](includes/nav_server_md.md)].|
|Supported Authentication|The [!INCLUDE[nav_server_md](includes/nav_server_md.md)] must be configured to run with NavUserPassword, ACS, or AAD Credentials Type.<br /> Also, the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] must be configured for Secure Sockets Layer (SSL).|
|Supported Browsers|When using the Outlook Web App (OWA), your computer must be running a supported browser listed in the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] Requirements.|
|Supported Operating Systems|When using OWA for iPad, OWA for iPad, or OWA for Android, your mobile device must use a supported Operating System listed in [!INCLUDE[nav_uni_app_md](includes/nav_uni_app_md.md)] Requirements.|  

##  <a name="Outlook"></a> Microsoft Outlook Add-In Requirements  
The following table shows the minimum system requirements for the [!INCLUDE[navnow_md](includes/navnow_md.md)] Add-In for Outlook for synchronization with Outlook.

|||  
|-|-|  
|Supported Outlook Applications |Outlook 2016, Outlook 2013 SP1, or Outlook 2010 SP2 \(32-bit edition\).|
|Supported Exchange Servers|Exchange Server 2016, Exchange Server 2013, or Exchange Online.|  


##  <a name="CRM"></a> Microsoft Dynamics 365 for Sales Integration Requirements  
 The following table shows the system requirements for integrating [!INCLUDE[navnow](includes/navnow_md.md)] with [!INCLUDE[crm](includes/crm_md.md)].  

|||  
|-|-|  
|Additional software|-   Microsoft Dynamics CRM Online 2016, Microsoft Dynamics CRM Online 2016 Update 1, or Microsoft Dynamics CRM 2016. <br/>-   Microsoft Dynamics CRM Online 2015, Microsoft Dynamics CRM Online 2015 Update 1, or Microsoft Dynamics CRM 2015.|
|Additional information|- Item Availability is not supported on Dynamics CRM 2015, versions Update 1 and Online.<BR/> You can obtain the item availability support by running the DynamicsNAVIntegrationSolution.zip file on the Dynanmics NAV 2016 product DVD.<BR/> For more information, see [How to: Prepare Microsoft Dynamics 365 for Sales for Integration](How-to-prepare-Dynamics-CRM-for-Integration.md).      |  

##  <a name="SharePointApp"></a> Microsoft Dynamics NAV as an App for SharePoint Requirements  
 The following table shows the minimum system requirements for [!INCLUDE[navnow](includes/navnow_md.md)] as an App for SharePoint.  

|||  
|-|-|  
|Supported operating systems|-   Windows Server 2016 Standard, Essentials, or Datacenter.<br />- Windows Server 2012 R2 Standard or Datacenter \(64-bit edition\).<br />-   Windows Server 2012 Standard or Datacenter \(64-bit edition\).|  
|Additional software|-   SharePoint 2013 Service Pack 1.<br />-   SharePoint Online.|  

##  <a name="Azure"></a> Automated Deployment on Microsoft Azure Requirements  
 Automated deployment of [!INCLUDE[navnow](includes/navnow_md.md)] on Microsoft Azure by using the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] is only supported on Azure virtual machines that are running Windows Server 2012. For additional requirements for specific [!INCLUDE[navnow](includes/navnow_md.md)] components, refer to the other sections in this topic.

## See Also
[Welcome to the Developer and IT-Pro Help for Microsoft Dynamics NAV](index.md)  
[Product and Architecture Overview](Product-and-Architecture-Overview.md)  
[Installation Options](Installation-Options.md)  
[Client Types](Client-Types.md)  
[How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)  
