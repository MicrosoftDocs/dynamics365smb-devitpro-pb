---
title: System Requirements for Business Central 2020 Release Wave 2
description: This article provides the specifications of minimum hardware and software requirements to install and run Business Central on-premises.
ms.custom: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 05/06/2020
author: jswymer
---
# System Requirements for [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2020 Release Wave 2

The following sections list the minimum hardware and software requirements to use or connect to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, and to install and run [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises (version 17). **Minimum** means that later versions \(such as SP1, SP2, or R2 versions\) of a required software product are also supported.  

> [!NOTE]  
>  [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs some software if it'sn't already present in the target computer. For more information, see the "Additional Information" section for each component.  

## CLIENT COMPONENTS

## <a name="WebClient"></a> Web Client

The following table shows the minimum system requirements for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Web client on-premises.  

|||  
|------|-----|  
|Supported browsers|Recommended browsers:<ul><li>New Microsoft Edge for Windows</li><li>Google Chrome 81.0 for Windows</li><li>Mozilla Firefox 75.0 for Windows</li><li>Safari 12.0 for macOS</li></ul>Other supported browsers:<ul><li>Internet Explorer 11</li><li>Microsoft Edge Legacy</li></ul>Cookies and JavaScript must be enabled in the browser.|
|Business inbox in Outlook|<ul><li>Microsoft Office 365, Microsoft Office 2019, or Microsoft Office 2016.</li></ul>|  
|Sending data to Excel|<ul><li>Microsoft Office 365, Microsoft Office 2019, or Microsoft Office 2016.</li></ul>|  
|Editing in Excel using the Excel Add-in |<ul><li>Excel 2019, Excel 2016, or Excel Online.<br /><br />For more information, see [Exporting Your Business Data to Excel](/dynamics365/business-central/about-export-data).</li></ul>|  
|SharePoint Online links|<ul><li>Microsoft Office 2019, Microsoft Office 2016, or Microsoft Office 365.</li></ul>|  
|Printing reports to Excel or Word|<ul><li>Microsoft Office 2019, Microsoft Office 2016, or Microsoft Office 365.</li></ul>|  
|Additional information|If you experience problems using the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], you can try to turn off browser tools, such as translator tools that may run in the background.|  

##  <a name="DynNAVApp"></a> [!INCLUDE[nav_uni_app_md](../developer/includes/nav_uni_app_md.md)]

 The following table shows the minimum system requirements for the [!INCLUDE[nav_uni_app](../developer/includes/nav_uni_app_md.md)].  

For the latest information, see the app in the Windows Store, App Store, or Google Play.  
[![Windows Store](../developer/media/install-mobile-app/windowsstore.png)](https://go.microsoft.com/fwlink/?LinkId=734848)
[![App Store](../developer/media/install-mobile-app/appstore.png)](https://go.microsoft.com/fwlink/?LinkId=734847) [![Google Play](../developer/media/install-mobile-app/googleplay.png)](https://go.microsoft.com/fwlink/?LinkId=734849)  

|||  
|------|-----|  
|Supported operating systems|<ul><li>Windows 10 S, Home, Pro, Enterprise, or Education \(32-bit and 64-bit editions\).</li><li>Android 7.0 or later (tablet and phone).</li><li> iOS 11.0 or later (iPad and iPhone).</li></ul>|  
|Additional hardware|<ul><li>1-GB RAM for Android and Windows.</li></ul>|  
|Additional software|<ul><li>A third-party telephony or VoIP app such as Skype is required for placing calls from [!INCLUDE[prodshort](../developer/includes/prodshort.md)].</li><li>A third-party email program such as Outlook is required for sending emails from [!INCLUDE[prodshort](../developer/includes/prodshort.md)].</li><li>Microsoft Office 2019, Office 2016, or Office 365 is required for sending data to Microsoft Excel or to Microsoft Word.</li></ul>|  
|Additional information|<ul><li>Device diagonal screen size 7" for tablets.</li><li>Screen resolution 960 × 510 for tablets.</li><li>Device diagonal screen size 4" for phones.</li><li>Screen resolution 854 x 480 for phones.</li></ul>|  

## AL Development

The following table shows the minimum system requirements for customizing or extending [!INCLUDE[prodshort](../developer/includes/prodshort.md)] using the AL language in Visual Studio Code.

|||
|-----|-----|
|Supported operating systems|<ul><li>Window Server 2016.</li><li>Windows 10 - [supported versions](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).</ul></li>|
|Required software|<ul><li>[Visual Studio Code](https://code.visualstudio.com/Download)</li><li>[AL language extension](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al)</li></ul>|
|Hardware resources|<ul><li>Hard disk space: 500 MB.</li><li>CPU: four cores minimum</li><li>Memory:<br />16 GB for development only. <br />16 GB for developing and locally deploying small extensions (<1000 objects>).<br />32-64 GB for developing and locally deploying large extensions (>1000 objects).</li></ul>|
|Reports|<ul><li>For creating and editing RDL report layouts:<ul><li>Report Builder for SQL Server 2016, or</li><li>Visual Studio 2017 with [Microsoft Rdlc Report Designer for Visual Studio](https://go.microsoft.com/fwlink/?linkid=857038) installed.</li></ul></li><li>For creating and editing Word report layouts:<ul><li>Word 2016 or later</li></ul></li></ul>|  

For more information, see [Getting Started with AL](../developer/devenv-get-started.md).

## SERVER COMPONENTS

## <a name="NavServerReqs"></a> [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Server

The following table shows the minimum system requirements for [!INCLUDE[server](../developer/includes/server.md)].  

|||  
|-----|-----|  
|Supported operating systems|<ul><li>Windows 10 Pro, Enterprise, or Education \(64-bit edition\).</li><li>Windows Server, version 1809 or later (Datacenter, Standard).</li></ul>|
|Hardware resources|<ul><li>Hard disk space: 500 MB.</li><li>Memory: 2 GB.|  
|[!INCLUDE[crm](../developer/includes/crm_md.md)] integration|<ul><li>Windows Identity Framework.<br />For a list of supported [!INCLUDE[crm](../developer/includes/crm_md.md)] versions, see [Microsoft Dynamics 365 for Sales Integration Requirements](system-requirement-business-central.md#CRM).|  
|Additional software|<ul><li>Microsoft .NET Framework 4.8</li><li>Windows PowerShell 4.0.|  
|Additional information|<ul><li>[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer:<ul><li>Microsoft .NET Framework 4.8</li><li>Windows Identity Framework.</li></ul></li></ul>|  

## <a name="WebServer"></a> [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Web Server Components

|||  
|----|----|  
|Supported operating systems|<ul><li>Windows 10 Pro, Enterprise, or Education \(64-bit edition\).</li><li>Windows Server, version 1809 or later (Datacenter, Standard)</li></ul>.|  
|Web server|<ul><li>Internet Information Server 10, Internet Information Server 8.5, or Internet Information Server 8.0.|   
|Additional software|<ul><li>Microsoft .NET Framework 4.8</li><li>Windows PowerShell 4.0.|  
|Additional information|<ul><li>[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer.<ul><li>Microsoft .NET Core 1.0 Windows Server Hosting. This software is installed by [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] if not already present.</li><li>Microsoft .NET Framework 4.8</li><li>Internet Information Server 10, Internet Information Server 8.5, or Internet Information Server 8.0. The version depends on the operating system. Internet Information Server is installed with the required features enabled.</li></ul></li><li>For more information about configuring IIS, see [Configuring IIS](configure-iis.md)</li></ul>|  

## <a name="SQLReq"></a>[!INCLUDE[prodshort](../developer/includes/prodshort.md)] Database Components for SQL Server

The following table shows the minimum system requirements for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database components for SQL Server.  

|||  
|----|-----|  
|Supported operating systems|<ul><li>Windows 10 Pro, Enterprise, or Education \(64-bit edition\).</li><li>Windows Server, version 1809 or later (Datacenter, Standard).</li></ul> |  
|Hardware resources|For more information, see [Hardware and Software Requirements for Installing SQL Server](https://go.microsoft.com/fwlink/?LinkId=622999). From this page, you can also access requirements for other versions of SQL Server.|  
|SQL Server|<ul><li>Microsoft SQL Server 2019 Express, Standard, or Enterprise.</li> <li>Microsoft SQL Server 2017 Express, Standard, or Enterprise.</li> <li>Microsoft SQL Server 2016 Express, Standard, or Enterprise (Service Pack 2 or later).</li><li>Azure SQL Database Managed Instance, Elastic Pool, or Single Database.</li></ul>|  
|Service Packs and Cumulative Updates| Unless explicitly stated, all released Service Packs and Cumulative Updates of the above Microsoft SQL Server versions are supported. it's recommended to always be on the latest released Service Pack and Cumulative Update.|
|Additional information|[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer:<ul><li>SQL Server 2016 Express \(64-bit edition\).<br>If the operating system on the target computer doesn't support SQL Server 2016 Express, Setup displays a pre-requisite warning. In this case, you should exit Setup. Then, update the operating system on the computer to one that does support SQL Server 2016 Express and run Setup again.</li></ul>|  

## <a name="HelpServer"></a> [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Help Server Requirements

The following table shows the minimum system requirements for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Help Server.  

|||  
|-----|-----|  
|Supported operating systems|<ul><li>Windows 10 Pro, Enterprise, or Education \(64-bit editions\).</li><li>Windows Server, version 1809 or later (Datacenter, Standard).</li></ul>|  
|Hardware resource|<ul><li>Hard disk space: 500 MB.</li><li>Memory: 2 GB.</li></ul>|  
|Web server|<ul><li>Internet Information Server 10, Internet Information Server 8.5, or Internet Information Server 8.0.</li></ul>|  
|Additional software|<ul><li>Microsoft .NET Framework 4.8</li></ul>|  
|Additional information|<ul><li>[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer.<ul><li>Microsoft .NET Framework 4.8</li><li>Internet Information Server 10, Internet Information Server 8.5, or Internet Information Server 8.0. The version depends on the operating system. it's installed with the required features enabled.</li></ul></li><li>Windows Search must be enabled on the computer that you install the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Help Server on.</li></ul>|  

## ADDITIONAL COMPONENTS AND FEATURES

## <a name="ADCS"></a> Automated Data Capture System  

The following table shows the minimum system requirements for Automated Data Capture System \(ADCS\) for [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

|||  
|-----|-----|  
|Additional software|<ul><li>MSXML version 6.0.</li><li>Telnet or Microsoft Windows HyperTerminal.</li><li>VT100 Plug-in for each computer on which you install ADCS.</li><li>Microsoft Loopback Adapter.</li></ul>|  
|Additional information|<ul><li>VT100 Plug-in acts as a virtual Telnet server.</li><li>Starting with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2020 release wave 1, the VT100 Plug-in for ADCS is no longer included on installation media. You can use VT100 Plug-in from previous releases. However, remember to test that it works properly.</li><li> HyperTerminal is no longer included with Windows.</li></ul>|  

## <a name="BusInboxOutlook"></a>Business Inbox in Microsoft Outlook

The following table shows the minimum system requirements for using [!INCLUDE[prodshort](../developer/includes/prodshort.md)] as your business inbox in Outlook.

|||  
|-----|-----|
|Supported Outlook Applications |<ul><li>Outlook 2016 or later</li><li>Outlook Web App</li><li>Outlook Web App for iPad</li><li>Outlook Web App for iPhone</li><li> Outlook Web App for Android.</li></ul>|
|Supported Exchange Servers|<ul><li>Exchange Online</li><li>Exchange Server 2019</li><li>Exchange Server 2016<br />In deployments that use Exchange Server, the Exchange PowerShell endpoint must be accessible by [!INCLUDE[server](../developer/includes/server.md)].</li></ul>|
|Supported Authentication|<ul><li>The [!INCLUDE[server](../developer/includes/server.md)] must be configured to run with NavUserPassword, ACS, or AAD Credentials Type.<br /> Also, the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] must be configured for Secure Sockets Layer (SSL).</li></ul>|
|Supported Browsers|<ul><li>When using the Outlook Web App (Microsoft Outlook Web App), your computer must be running a supported browser listed in the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] Requirements.</li></ul>|
|Supported Operating Systems|<ul><li>When using Outlook Web App for iPad, iPad, or Android, your mobile device must use a supported Operating System listed in [!INCLUDE[nav_uni_app_md](../developer/includes/nav_uni_app_md.md)] Requirements.</li></ul>|  

## <a name="Outlook"></a>Microsoft Outlook Add-In

The following table shows the minimum system requirements for the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Add-In for Outlook for synchronization with Outlook.

|||  
|-----|-----|  
|Supported Outlook Applications |<ul><li>Outlook 2019</li><li>Outlook 2016</li></ul>|
|Supported Exchange Servers|<ul><li>Exchange Server 2019</li><li>Exchange Server 2016</li><li>Exchange Online.</li></ul>|  

## <a name="CRM"></a>Microsoft Dynamics 365 for Sales Integration

The following table shows the product version requirements for integrating [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with [!INCLUDE[crm](../developer/includes/crm_md.md)], and the versions in which users can view the availability of items in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] from [!INCLUDE[crm](../developer/includes/crm_md.md)].  

||||||  
|---|----|---|---|---|
|Sales/Dynamics NAV/Business Central|2016/Update 1/online|Sales Enterprise (v8.x)|Sales Enterprise and Sales Professional (v9.x)|
|Dynamics NAV 2016|Supported *** |Supported *** |Supported *** |
|Dynamics NAV 2017|Supported *|Supported *|Supported *|
|Dynamics NAV 2018|Supported *|Supported *|Supported *|
|Business Central (online)|Not supported |Supported *|Supported *|
|Business Central (on-premises)|Supported *|Supported *|Supported *|  

Legend:  
* "*" item availability capability is supported.  
* "**" integration solution can be installed from the Dynamics NAV 2016 DVD, but viewing item availability isn't supported.  
* "***" viewing item availability isn't supported  

> [!Note] 
> AD, IFD and Claims authentication types are supported for the 2016 on-premises version of [!INCLUDE[crm](../developer/includes/crm_md.md)]. OAuth and Office 365 authentication are supported for the 2016 Update 1 and online versions of [!INCLUDE[crm](../developer/includes/crm_md.md)]. For more information about authentication types, see [Connection strings in XRM tooling to connect to Dynamics 365](https://msdn.microsoft.com/library/mt608573.aspx).

## <a name="SharePointApp"></a>[!INCLUDE[prodshort](../developer/includes/prodshort.md)] as an App for SharePoint

The following table shows the minimum system requirements for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] as an App for SharePoint.  

|||  
|-|-|  
|Supported operating systems|<ul><li>Windows Server, version 1809 or later (Datacenter, Standard).</li></ul>|  
|Additional software|<ul><li>SharePoint 2013 Service Pack 1.</li><li>SharePoint Online.</li></ul>|  

## See Also

[Welcome to the Developer and IT-Pro Help for Business Central](../index.md)  
[Product and Architecture Overview](product-and-architecture-overview.md)  
[Deployment](Deployment.md)  
