---
title: System Requirements for Business Central 2021 Release Wave 1
description: This article provides the specifications of minimum hardware and software requirements to install and run Business Central version 18 on-premises.
ms.custom: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 01/13/2021
author: jswymer
---
# System Requirements for [!INCLUDE[prod_long](../developer/includes/prod_long.md)] 2021 Release Wave 1

The following sections list the minimum hardware and software requirements to install and run [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises (version 18). **Minimum** means that later versions \(such as SP1, SP2, or R2 versions\) of a required software product are also supported.  

> [!NOTE]  
> [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs some software if it's not already present in the target computer. For more information, see the "Additional Information" section for each component.  

## CLIENT COMPONENTS

## <a name="WebClient"></a> Web Client

The following table shows the minimum system requirements for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Web client on-premises.

|Specification|Requirement|
|------|-----|  
|Supported browsers|Recommended browsers:<ul><li>New Microsoft Edge, latest version</li><li>Google Chrome for Windows, latest version</li><li>Mozilla Firefox for Windows, latest version</li><li>Safari for macOS, latest version</li></ul>Other supported browsers:<ul><li>Internet Explorer 11, latest version</li><li>Microsoft Edge Legacy, latest version</li></ul>Cookies and JavaScript must be enabled in the browser.|

<!--
## <a name="NavApps"></a> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Tablet Client and Phone Client \(in a Browser\)

The following table shows the minimum system requirements for the [!INCLUDE[nav_tablet](../developer/includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](../developer/includes/nav_phone_md.md)] running in a desktop browser when used for development and testing purposes.  

|||  
|------|-----|  
|Server component|Identical to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Web client.|  
|Supported browsers|Identical to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Web client.|  
-->
##  <a name="DynNAVApp"></a> [!INCLUDE[nav_uni_app_md](../developer/includes/nav_uni_app_md.md)]

 The following table shows the minimum system requirements for the [!INCLUDE[nav_uni_app](../developer/includes/nav_uni_app_md.md)].  

For the latest information, see the app in the Windows Store, App Store, or Google Play.  
[![Windows Store](../developer/media/install-mobile-app/windowsstore.png)](https://go.microsoft.com/fwlink/?LinkId=734848)
[![App Store](../developer/media/install-mobile-app/appstore.png)](https://go.microsoft.com/fwlink/?LinkId=734847) [![Google Play](../developer/media/install-mobile-app/googleplay.png)](https://go.microsoft.com/fwlink/?LinkId=734849)  

|Specification|Requirement|  
|------|-----|  
|Supported operating systems|<ul><li>Windows 10 S, Home, Pro, Enterprise, or Education \(32-bit and 64-bit editions\).</li><li>Android 6.0 or higher (tablet and phone).</li><li> iOS 10.0 or higher (iPad and iPhone).</li></ul>|  
|Additional hardware|<ul><li>1-GB RAM for Android and Windows.</li></ul>|  
|Additional information|<ul><li>Device diagonal screen size 7" for tablets.</li><li>Screen resolution 960 × 510 for tablets.</li><li>Device diagonal screen size 4" for phones.</li><li>Screen resolution 854 x 480 for phones.</li></ul>|  

## <a name="Office"></a> Microsoft Office Applications

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises offers various features that require Office apps to be available on client devices. The following table shows the minimum system requirements for the features. 

|Specification|Requirement|  
|------|-----|  
|Excel|<ul><li>Sending data to Excel requires Microsoft Office 2019, Excel for web, or Excel mobile app for iOS or Android&trade;trade;.</li><li>Editing in Excel using the Excel Add-In requires Microsoft Office 2019 or Excel for web.</li></ul>|  
|Word|<ul><li>Microsoft Office 2019, Word for web, or Word mobile app for iOS or Android&trade;trade;.</li></ul>|
|Outlook|Please see [Business Inbox in Microsoft Outlook](system-requirement-business-central-v17.md#BusInboxOutlook).|  
|Additional software|<ul><li>A third-party telephony or VoIP app such as Skype or Microsoft Teams is required for placing calls from [!INCLUDE[prod_short](../developer/includes/prod_short.md)].|  

## AL Development

The following table shows the minimum system requirements for customizing or extending [!INCLUDE[prod_short](../developer/includes/prod_short.md)] using the AL language in Visual Studio Code.

|Specification|Requirement|
|-----|-----|
|Supported operating systems|<ul><li>Windows Server 2019</li><li>Windows Server, version 1809 or later</li><li>Windows 10</li></ul>For information about the supported versions and their lifecycles, see [Windows lifecycle fact sheet](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).|
|Required software|<ul><li>[Visual Studio Code](https://code.visualstudio.com/Download)</li><li>[AL language extension](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al)</li></ul>|
|Hardware resources|<ul><li>Hard disk space: 500 MB.</li><li>CPU: four cores minimum</li><li>Memory:<br />16 GB for development only. <br />16 GB for developing and locally deploying small extensions (<1000 objects>).<br />32-64 GB for developing and locally deploying large extensions (>1000 objects).</li></ul>|
|Reports|<ul><li>For creating and editing RDL report layouts:<ul><li>Report Builder for SQL Server 2016, or</li><li>Visual Studio 2017 with [Microsoft Rdlc Report Designer for Visual Studio](https://go.microsoft.com/fwlink/?linkid=857038) installed.</li></ul></li><li>For creating and editing Word report layouts:<ul><li>Word 2016 or later</li></ul></li></ul>|  

For more information, see [Getting Started with AL](../developer/devenv-get-started.md).

## SERVER COMPONENTS

## <a name="NavServerReqs"></a> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server

The following table shows the minimum system requirements for [!INCLUDE[server](../developer/includes/server.md)].  

|Specification|Requirement|  
|-----|-----|  
|Supported operating systems|<ul><li>Windows 10 Pro, Enterprise, or Education \(64-bit edition\)</li><li>Windows Server 2019  (Datacenter, Standard)</li><li>Windows Server, version 1809 or later (Datacenter, Standard)</li><li>Windows Server 2016 (Datacenter, Standard)</li></ul>For information about the supported versions and their lifecycles, see [Windows lifecycle fact sheet](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).|
|Hardware resources|<ul><li>Hard disk space: 500 MB.</li><li>Memory: 2 GB.|  
|[!INCLUDE[crm](../developer/includes/crm_md.md)] integration|<ul><li>Windows Identity Framework.<br />For a list of supported [!INCLUDE[crm](../developer/includes/crm_md.md)] versions, see [Microsoft Dynamics 365 for Sales Integration Requirements](system-requirement-business-central.md#CRM).|  
|Additional software|<ul><li>Microsoft .NET Framework 4.8</li><li>Windows PowerShell 4.0.|  
|Additional information|<ul><li>[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer:<ul><li>Microsoft .NET Framework 4.8</li><li>Windows Identity Framework.</li></ul></li></ul>|  

## <a name="WebServer"></a> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Web Server Components

|Specification|Requirement|  
|----|----|  
|Supported operating systems|<ul><li>Windows 10 Pro, Enterprise, or Education \(64-bit edition)</li><li>Windows Server 2019 (Datacenter, Standard)</li><li>Windows Server, version 1809 or later (Datacenter, Standard)</li><li>Windows Server 2016 (Datacenter, Standard)</li></ul>For information about the supported versions and their lifecycles, see [Windows lifecycle fact sheet](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).|  
|Web server|<ul><li>Internet Information Services 10.|   
|Additional software|<ul><li>Microsoft .NET Framework 4.8</li><li>Windows PowerShell 4.0.|  
|Additional information|<ul><li>[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer.<ul><li>Microsoft .NET Core 1.0 Windows Server Hosting. This software is installed by [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] if not already present.</li><li>Microsoft .NET Framework 4.8</li><li>Internet Information Services 10 is installed with the required features enabled.</li></ul></li><li>For more information about configuring IIS, see [Configuring IIS](configure-iis.md)</li></ul>|  

## <a name="SQLReq"></a>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] Database Components

The following table shows the minimum system requirements for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database components.  

|Specification|Requirement|  
|----|-----|  
|Hardware resources|For more information, see [Hardware and Software Requirements for Installing SQL Server](https://go.microsoft.com/fwlink/?LinkId=622999). From this page, you can also access requirements for other versions of SQL Server.|  
|Database| Business Central supports database compatibility levels 150, 140, or 130. See https://docs.microsoft.com/en-us/sql/t-sql/statements/alter-database-transact-sql-compatibility-level?view=sql-server-ver15 for details on SQL Server Database compatibility levels. |  
|Service Packs and Cumulative Updates| Unless explicitly stated, all released Service Packs and Cumulative Updates of the above Microsoft SQL Server versions are supported. it's recommended to always be on the latest released Service Pack and Cumulative Update.|
|Additional information|[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer:<ul><li>SQL Server 2016 Express \(64-bit edition\).<br>If the operating system on the target computer doesn't support SQL Server 2016 Express, Setup displays a pre-requisite warning. In this case, you should exit Setup. Then, update the operating system on the computer to one that does support SQL Server 2016 Express and run Setup again.</li></ul>|  

<!--expected removal ## <a name="HelpServer"></a> [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Help Server Requirements

The following table shows the minimum system requirements for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Help Server.  

|Specification|Requirement|  
|-----|-----|  
|Supported operating systems|<ul><li>Windows 10 Pro, Enterprise, or Education \(64-bit editions\)</li><li>Windows Server 2019 (Datacenter, Standard)</li><li>Windows Server, version 1809 or later (Datacenter, Standard)</li><li>Windows Server 2016  (Datacenter, Standard)</li></ul>For information about the supported versions and their lifecycles, see [Windows lifecycle fact sheet](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).|  
|Hardware resource|<ul><li>Hard disk space: 500 MB.</li><li>Memory: 2 GB.</li></ul>|  
|Web server|<ul><li>Internet Information Services 10.</li></ul>|  
|Additional software|<ul><li>Microsoft .NET Framework 4.8</li></ul>|  
|Additional information|<ul><li>[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer.<ul><li>Microsoft .NET Framework 4.8</li><li>Internet Information Services 10.</li></ul></li><li>Windows Search must be enabled on the computer that you install the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Help Server on.</li></ul>|  
-->

## ADDITIONAL COMPONENTS AND FEATURES

## <a name="ADCS"></a> Automated Data Capture System  

The following table shows the minimum system requirements for Automated Data Capture System \(ADCS\) for [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

|Specification|Requirement|  
|-----|-----|  
|Additional software|<ul><li>MSXML version 6.0.</li><li>Telnet or Microsoft Windows HyperTerminal.</li><li>VT100 Plug-in for each computer on which you install ADCS.</li><li>Microsoft Loopback Adapter.</li></ul>|  
|Additional information|<ul><li>VT100 Plug-in acts as a virtual Telnet server.</li><li>Starting with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 1, the VT100 Plug-in for ADCS is no longer included on installation media. You can use VT100 Plug-in from previous releases. However, remember to test that it works properly.</li><li> HyperTerminal is no longer included with Windows.</li></ul>|  

## <a name="BusInboxOutlook"></a>Business Inbox in Microsoft Outlook

The following table shows the minimum system requirements for using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as your business inbox in Outlook.

|Specification|Requirement|  
|-----|-----|
|Supported Outlook Applications |<ul><li>Outlook 2019 or later</li><li>Outlook on the web<!--Outlook Web App--></li><li>Outlook Web App for iPad</li><li>Outlook Web App for iPhone</li><li> Outlook Web App for Android&trade;trade;.</li></ul>|
|Supported Exchange Servers|<ul><li>Exchange Online</li><li>Exchange Server 2019<br />In deployments that use Exchange Server, the Exchange PowerShell endpoint must be accessible by [!INCLUDE[server](../developer/includes/server.md)].</li></ul>|
|Supported Authentication|<ul><li>The [!INCLUDE[server](../developer/includes/server.md)] must be configured to run with NavUserPassword, ACS, or AAD Credentials Type.<br /> Also, the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] must be configured for Secure Sockets Layer (SSL).</li></ul>|
|Supported Browsers|<ul><li>When using Outlook on the web<!--the Outlook Web App (Microsoft Outlook Web App)-->, your computer must be running a supported browser listed in the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] Requirements.</li></ul>|
|Supported Operating Systems|<ul><li>When using Outlook Web App for iPad, iPhone, or Android&trade;, your mobile device must use a supported operating system that's listed in the [[!INCLUDE[nav_uni_app_md](../developer/includes/nav_uni_app_md.md)]](#DynNAVApp) section.</li></ul>|  

## <a name="Outlook"></a>Microsoft Outlook Legacy Add-In

The following table shows the minimum system requirements for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] legacy Add-In for Outlook for synchronization with Outlook.

|Specification|Requirement| 
|-----|-----|  
|Supported Outlook Applications |<ul><li>Outlook 2019.</li></ul>|
|Supported Exchange Servers|<ul><li>Exchange Server 2019</li><li>Exchange Online.</li></ul>|  

## <a name="CRM"></a>Microsoft Dynamics 365 for Sales Integration

The following table shows the product version requirements for integrating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with [!INCLUDE[crm](../developer/includes/crm_md.md)], and the versions in which users can view the availability of items in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] from [!INCLUDE[crm](../developer/includes/crm_md.md)].  

|Sales/Dynamics NAV/Business Central|2016/Update 1/online|Sales Enterprise (v8.x)|Sales Enterprise and Sales Professional (v9.x)|  
|---|----|---|---|---|
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

## <a name="SharePointApp"></a>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an App for SharePoint

The following table shows the minimum system requirements for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an App for SharePoint.  

|Specification|Requirement|  
|-|-|  
|Supported SharePoint servers|<ul><li>SharePoint Server 2016</li><li>SharePoint Online.</li></ul>|  

## See Also

[Welcome to the Developer and IT-Pro Help for Business Central](../index.md)  
[Product and Architecture Overview](product-and-architecture-overview.md)  
[Deployment](Deployment.md)  
