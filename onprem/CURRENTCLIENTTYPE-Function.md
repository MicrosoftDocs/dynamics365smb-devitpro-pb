---
title: "CURRENTCLIENTTYPE Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1bba129e-f85c-4a1b-ba65-2b06c4f4a971
caps.latest.revision: 9
manager: edupont
---
# CURRENTCLIENTTYPE Function
Gets the [!INCLUDE[navnow](includes/navnow_md.md)] client type that is running in current session.  
  
## Syntax  
  
```  
[ClientType :=] CURRENTCLIENTTYPE  
```  
  
## Property Value/Return Value  
 Type: ClientType  
  
 The [!INCLUDE[navnow](includes/navnow_md.md)] client type for the current session, which can be one of the following values:  
  
|Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|Windows|[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|  
|Web|[!INCLUDE[nav_web](includes/nav_web_md.md)]|  
|Tablet|[!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] **Note:**  If you are running tablet.aspx in a browser, the ClientType will return Web.|  
|Desktop|[!INCLUDE[nav_web](includes/nav_web_md.md)] running in the Dynamics NAV app. In this mode, the [!INCLUDE[nav_web](includes/nav_web_md.md)] will have, for example, navigation pane and ribbon.|  
|Phone|[!INCLUDE[nav_phone](includes/nav_phone_md.md)] **Note:**  If you are running phone.aspx in a browser, the ClientType will return Web.|  
  
## Remarks  
 You can use CURRENTCLIENTTYPE as a parameter in [GETURL Function](GETURL-Function.md) to get the URL of the current client.  
  
## Example  
 In the following example, CURRENTCLIENTTYPE is used to get the [!INCLUDE[navnow](includes/navnow_md.md)] client type for the session and return a message if the session uses the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
```  
IF CURRENTCLIENTTYPE = CLIENTTYPE::Windows THEN  
  Message('The session is running the Microsoft Dynamics NAV Windows client');  
```  
  
## Example  
 In the following example, CURRENTCLIENTTYPE is used as a parameter of the [GETURL Function](GETURL-Function.md) to return the URL of the [!INCLUDE[navnow](includes/navnow_md.md)] client that invokes the code.  
  
```  
url := GETURL(CURRENTCLIENTTYPE);  
MESSAGE('The URL is %1.', url);  
```  
  
## See Also  
 [Sessions](Sessions.md)