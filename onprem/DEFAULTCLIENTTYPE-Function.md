---
title: "DEFAULTCLIENTTYPE Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e2c0248d-0c38-4387-904b-442a1b65bea0
caps.latest.revision: 8
manager: edupont
---
# DEFAULTCLIENTTYPE Function
Gets the default [!INCLUDE[navnow](includes/navnow_md.md)] client that is configured for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is used by the current session.  
  
## Syntax  
  
```  
[ClientType :=] DEFAULTCLIENTTYPE  
```  
  
## Property Value/Return Value  
 Type: ClientType  
  
 The default [!INCLUDE[navnow](includes/navnow_md.md)] client, which be one of the following values:  
  
|Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|Windows|[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|  
|Web|[!INCLUDE[nav_web](includes/nav_web_md.md)]|  
|Tablet|[!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] **Note:**  If you are running tablet.aspx in a browser, the ClientType will return Web.|  
|Desktop|[!INCLUDE[nav_web](includes/nav_web_md.md)] running in the Dynamics NAV app. In this mode, the [!INCLUDE[nav_web](includes/nav_web_md.md)] will have, for example, navigation pane and ribbon.|  
|Phone|[!INCLUDE[nav_phone](includes/nav_phone_md.md)] **Note:**  If you are running phone.aspx in a browser, the ClientType will return Web.|  
  
## Remarks  
 The default [!INCLUDE[navnow](includes/navnow_md.md)] client is specified by the *DefaultClient* setting in the CustomSettings.config file for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. You can view and change the setting by opening the CustomSettings.config file directly or using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
 You can use DEFAULTCLIENTTYPE in a [GETURL Function](GETURL-Function.md) call to get the URL of the default [!INCLUDE[navnow](includes/navnow_md.md)] client.  
  
## Example  
 In the following example, DEFAULTCLIENTTYPE is used to return the default [!INCLUDE[navnow](includes/navnow_md.md)] client type that is configured for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is used by the current session.  
  
```  
IF DEFAULTCLIENTTYPE = CLIENTTYPE::Windows THEN  
  Message('The default client is Microsoft Dynamics NAV Windows client');  
```  
  
## Example  
 In the following example, DEFAULTCLIENTTYPE is used as a parameter in the GETURL function to return the URL of the default [!INCLUDE[navnow](includes/navnow_md.md)] client that is configured for the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
```  
url := GETURL(DEFAULTCLIENTTYPE);  
MESSAGE('The URL is %1.', url);  
```  
  
## See Also  
 [Sessions](Sessions.md)