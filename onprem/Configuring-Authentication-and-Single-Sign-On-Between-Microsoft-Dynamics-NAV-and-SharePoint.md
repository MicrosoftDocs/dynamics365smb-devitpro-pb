---
title: "Configuring Authentication and Single Sign-On Between Microsoft Dynamics NAV and SharePoint"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bcf10a58-e3e3-494f-9fd8-bb47bceea89f
caps.latest.revision: 6
---
# Configuring Authentication and Single Sign-On Between Microsoft Dynamics NAV and SharePoint
This topic provides an overview of how to configure user authentication with SharePoint.  
  
## Configuring User Authentication for SharePoint Online and SharePoint On-Premises  
 SharePoint Online and SharePoint on-premises support different authentication methods. This means that depending on your SharePoint deployment, you must configure [!INCLUDE[navnow](includes/navnow_md.md)] differently. The configuration applies to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instances, the user setup, and the [!INCLUDE[navnow](includes/navnow_md.md)] clients that users can use.  
  
### SharePoint Online  
 For SharePoint Online, the following [!INCLUDE[navnow](includes/navnow_md.md)] configurations are available:  
  
|Client Type|[!INCLUDE[nav_server](includes/nav_server_md.md)] Credential Type|Authentication Mechanism|  
|-----------------|----------------------------------------------|------------------------------|  
|[!INCLUDE[nav_web](includes/nav_web_md.md)]|AccessControlService|Microsoft Azure Active Directory \(Azure AD\)|  
|[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|AccessControlService|Azure AD added to an Access Control service \(ACS\) namespace. **Important:**  The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is currently not supported if the [!INCLUDE[navnow](includes/navnow_md.md)] deployment must be accessed by more than on Azure AD tenant.|  
  
### SharePoint On-Premise  
 When you want to deploy apps to SharePoint on-premises, you must configure the SharePoint sites first. For more information, see [Configure an environment for apps for SharePoint](https://go.microsoft.com/fwlink/?LinkId=324962) and [Plan for apps for SharePoint 2013](https://go.microsoft.com/fwlink/?LinkId=324963) on TechNet.  
  
 For SharePoint on-premises that must be accessible from the internet so that SharePoint and [!INCLUDE[navnow](includes/navnow_md.md)] are publicly accessible, the following [!INCLUDE[navnow](includes/navnow_md.md)] configurations are available:  
  
|Client Type|[!INCLUDE[nav_server](includes/nav_server_md.md)] Credential Type|Authentication Mechanism|  
|-----------------|----------------------------------------------|------------------------------|  
|[!INCLUDE[nav_web](includes/nav_web_md.md)]|AccessControlService|Azure AD<br /><br /> -Or-<br /><br /> Azure AD added to an Access Control service \(ACS\) namespace.|  
|[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|AccessControlService|Azure AD added to an Access Control service \(ACS\) namespace.|  
  
> [!IMPORTANT]  
>  If you use Azure AD as the authentication mechanism, your app for SharePoint must open the [!INCLUDE[nav_web](includes/nav_web_md.md)] in full screen mode in SharePoint on-premises deployments. For more information, see [Troubleshooting: Microsoft Dynamics NAV and SharePoint](Troubleshooting--Microsoft-Dynamics-NAV-and-SharePoint.md).  
  
 For SharePoint on-premises that must be accessible from an intranet so that SharePoint and [!INCLUDE[navnow](includes/navnow_md.md)] are accessed only on-premises, the following [!INCLUDE[navnow](includes/navnow_md.md)] configurations are available:  
  
|Client Type|[!INCLUDE[nav_server](includes/nav_server_md.md)] Credential Type|Authentication Mechanism|  
|-----------------|----------------------------------------------|------------------------------|  
|[!INCLUDE[nav_web](includes/nav_web_md.md)]|Windows<br /><br /> -Or-<br /><br /> AccessControlService|Windows authentication<br /><br /> -Or-<br /><br /> Azure AD|  
|[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|Windows|Windows authentication|  
  
> [!NOTE]  
>  The security zones that the security mechanisms in Internet Explorer rely on can lead to unexpected behavior when users access the [!INCLUDE[nav_web](includes/nav_web_md.md)] from SharePoint. For more information, see [Troubleshooting: Microsoft Dynamics NAV and SharePoint](Troubleshooting--Microsoft-Dynamics-NAV-and-SharePoint.md).  
  
### Configuring Single Sign-on  
 As part of a SharePoint Online subscription, you also get an Azure AD tenant. The Azure AD tenant handles user authentication when users sign in to SharePoint Online. To enable a seamless integration between SharePoint Online and [!INCLUDE[navnow](includes/navnow_md.md)], you must configure [!INCLUDE[navnow](includes/navnow_md.md)] to authenticate users against the same Azure AD tenant. This will enable single sign-on between the two applications, so that users will only have to sign in once. Also, [!INCLUDE[navnow](includes/navnow_md.md)] web parts that are embedded on SharePoint pages will work. You can work with Azure AD management in the Azure management portal, or you can use Azure AD Module for Windows PowerShell cmdlets. For more information, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md).  
  
 For more information about how to achieve single sign-on between [!INCLUDE[navnow](includes/navnow_md.md)] and SharePoint based on Azure AD, see [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md).  
  
## See Also  
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)   
 [Developing and Installing a Microsoft Dynamics NAV Apps for SharePoint](Developing-and-Installing-a-Microsoft-Dynamics-NAV-Apps-for-SharePoint.md)   
 [Authenticating Users with Azure Active Directory](Authenticating-Users-with-Azure-Active-Directory.md)   
 [Troubleshooting: Microsoft Dynamics NAV and SharePoint](Troubleshooting--Microsoft-Dynamics-NAV-and-SharePoint.md)