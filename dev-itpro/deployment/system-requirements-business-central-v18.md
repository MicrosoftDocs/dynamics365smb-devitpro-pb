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
|Supported browsers|<ul><li>New Microsoft Edge, latest version</li><li>Google Chrome for Windows, latest version</li><li>Mozilla Firefox for Windows, latest version</li><li>Safari for macOS, latest version</li></ul>Cookies and JavaScript must be enabled in the browser.|

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
|Supported operating systems|<ul><li>Windows 10 S, Home, Pro, Enterprise, or Education \(32-bit and 64-bit editions\).</li><li>Android (tablet and phone): The latest three major versions and their updates.</li><li> iOS (iPad and iPhone): The latest three major versions and their updates.</li></ul>|  
|Additional hardware|<ul><li>1-GB RAM for Android and Windows.</li></ul>|  
|Additional information|<ul><li>Device diagonal screen size 7" for tablets.</li><li>Screen resolution 960 × 510 for tablets.</li><li>Device diagonal screen size 4" for phones.</li><li>Screen resolution 854 x 480 for phones.</li></ul>|  

## <a name="Office"></a> Microsoft Office Applications

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises offers various features that require Office apps to be available on client devices. The following table shows the minimum system requirements for the features. 

|Specification|Requirement|  
|------|-----|  
|Excel|<ul><li>Sending data to Excel requires Excel 2019, Excel on the web, or Excel mobile app for iOS or Android&trade;.</li><li>Editing in Excel using the Excel Add-In requires Microsoft Office 2019 or Excel on the web.</li></ul>|  
|Word|<ul><li>Microsoft Office 2019, Word for the web, or Word mobile app for iOS or Android&trade;.</li></ul>|
|Outlook|Please see [Business Inbox in Microsoft Outlook](system-requirement-business-central-v18.md#BusInboxOutlook).|  
|Additional software|<ul><li>A third-party telephony or VoIP app such as Microsoft Teams is required for placing calls from [!INCLUDE[prod_short](../developer/includes/prod_short.md)].|  

## AL Development

The following table shows the minimum system requirements for customizing or extending [!INCLUDE[prod_short](../developer/includes/prod_short.md)] using the AL language in Visual Studio Code.

|Specification|Requirement|
|-----|-----|
|Supported operating systems|<ul><li>Windows Server 2019</li><li>Windows Server, version 1809 or later</li><li>Windows 10</li></ul>For information about the supported versions and their lifecycles, see [Windows lifecycle fact sheet](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).|
|Required software|<ul><li>[Visual Studio Code](https://code.visualstudio.com/Download)</li><li>[AL language extension](https://marketplace.visualstudio.com/items?itemName=ms-dynamics-smb.al)</li></ul>|
|Hardware resources|<ul><li>Hard disk space: 500 MB.</li><li>CPU: four cores minimum</li><li>Memory:<br />16 GB for development only. <br />16 GB for developing and locally deploying small extensions (<1000 objects>).<br />32-64 GB for developing and locally deploying large extensions (>1000 objects).</li></ul>|
|Reports|<ul><li>For creating and editing RDL report layouts:<ul><li>Report Builder for SQL Server 2016, or</li><li>Visual Studio 2017 with [Microsoft Rdlc Report Designer for Visual Studio](https://go.microsoft.com/fwlink/?linkid=857038) installed.</li></ul></li><li>For creating and editing Word report layouts:<ul><li>Word 2019 or later</li></ul></li></ul>|  

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
|Supported operating systems|<ul><li>Windows 10 Pro, Enterprise, or Education \(64-bit edition)</li><li>Windows Server 2019 (Datacenter, Standard)</li><li>Windows Server, version 2004 or later (Datacenter, Standard)</li><li>Windows Server 2016 (Datacenter, Standard)</li></ul>For information about the supported versions and their lifecycles, see [Windows lifecycle fact sheet](https://support.microsoft.com/help/13853/windows-lifecycle-fact-sheet).|  
|Web server|<ul><li>Internet Information Services 10.|   
|Additional software|<ul><li>Microsoft .NET Framework 4.8</li><li>Windows PowerShell 4.0.|  
|Additional information|<ul><li>[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] installs the following software if it's not already present on the target computer.<ul><li>Microsoft .NET Core 2.1.14 Windows Server Hosting. This software is installed by [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] if not already present.</li><li>Microsoft .NET Framework 4.8</li><li>Internet Information Services 10 is installed with the required features enabled.</li></ul></li><li>For more information about configuring IIS, see [Configuring IIS](configure-iis.md)</li></ul>|  

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
|Supported Outlook Applications |<ul><li>Outlook 2019</li><li>Outlook on the web</li><li>Outlook for iOS</li><li>Outlook for Android&trade;.</li></ul>|
|Supported Exchange Servers|<ul><li>Exchange Online</li><li>Exchange Server 2019<br />In deployments that use Exchange Server, the Exchange PowerShell endpoint must be accessible by [!INCLUDE[server](../developer/includes/server.md)].</li></ul>|
|Supported Authentication|<ul><li>The [!INCLUDE[server](../developer/includes/server.md)] must be configured to run with NavUserPassword, ACS, or AAD Credentials Type.<br /> Also, the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] must be configured for Secure Sockets Layer (SSL).</li></ul>|
|Supported Browsers|<ul><li>When using Outlook on the web, your computer must be running a supported browser listed in the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)] Requirements.</li></ul>|
|Supported Operating Systems|<ul><li>When using Outlook for iOS or Outlook for Android&trade;, your mobile device must use a supported operating system that's listed in the [[!INCLUDE[nav_uni_app_md](../developer/includes/nav_uni_app_md.md)]](#DynNAVApp) section.</li></ul>|  

## <a name="Outlook"></a>Microsoft Outlook Legacy Add-In

The following table shows the minimum system requirements for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] legacy Add-In for Outlook for synchronization with Outlook.

|Specification|Requirement| 
|-----|-----|  
|Supported Outlook Applications |<ul><li>Outlook 2019.</li></ul>|
|Supported Exchange Servers|<ul><li>Exchange Server 2019</li><li>Exchange Online.</li></ul>|  

## <a name="CRM"></a>Microsoft Dataverse and Dynamics 365 for Sales Integration

The following table shows the product version requirements for integrating Business Central online and on premise with [!INCLUDE[cds_long_md.md](../developer/includes/cds_long_md.md)] and [!INCLUDE[crm](../developer/includes/crm_md.md)] online and on premises.

|Specification|Requirement|  
|-----|-----|
|[!INCLUDE[cds_long_md.md](../developer/includes/cds_long_md.md)] and [!INCLUDE[crm](../developer/includes/crm_md.md)] online |One the following authentication types:<ul><li> Office365 (legacy)<sup>1</sup></li><li>Office365 (modern)</li><li>OAuth<sup>2</sup></li>||
|Dynamics 365 Customer Engagement on-premise<br><br>**Note**: Not supported with [!INCLUDE[prod_short](../developer/includes/prod_short.md)]|<ul><li>Dynamics 365 Customer Engagement version 9.0.2</li><li> One of the following authentication types:<ul><li>AD</li><li>IFD</li><li>OAuth<sup>2</sup></li></ul>|

<sup>1</sup>Supported for existing Dataverse/Dynamics 365 Sales environments on existing tenants until April 2022. For more information, see [Important changes (deprecations) coming in Power Apps, Power Automate and customer engagement apps](/power-platform/important-changes-coming#deprecation-of-office365-authentication-type-and-organizationserviceproxy-class-for-connecting-to-dataverse).

<sup>2</sup> Requires the registration of a third party application in Azure AD. For more information, see [To register an application in Azure AD for connecting from Business Central to Dataverse](/dynamics365/business-central/admin-how-to-set-up-a-dynamics-crm-connection#to-register-an-application-in-azure-ad-for-connecting-from-business-central-to-dataverse).

> [!NOTE] 
> AD, IFD, and OAuth types are supported with on-premises version of Dynamics 365 Sales. OAuth and Office 365 (legacy – basic) and Office 365 (modern – MFA) authentication are supported for online versions of Dynamics 365 Sales. For more information about authentication types, see [Connection strings in XRM tooling to connect to Dynamics 365](https://msdn.microsoft.com/library/mt608573.aspx).
## <a name="SharePointApp"></a>[!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an App for SharePoint

The following table shows the minimum system requirements for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] as an App for SharePoint.  

|Specification|Requirement|  
|-|-|  
|Supported SharePoint servers|<ul><li>SharePoint Server 2019</li><li>SharePoint Online.</li></ul>|  

## See Also

[Welcome to the Developer and IT-Pro Help for Business Central](../index.md)  
[Product and Architecture Overview](product-and-architecture-overview.md)  
[Deployment](Deployment.md)  
