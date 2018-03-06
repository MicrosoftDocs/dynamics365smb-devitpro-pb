---
title: "CURRENTCLIENTTYPE Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-financials"
ms.assetid: 1bba129e-f85c-4a1b-ba65-2b06c4f4a971
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CURRENTCLIENTTYPE Method
Gets the client type that is running in current session.  

## Syntax  

```  
[ClientType :=] CURRENTCLIENTTYPE  
```  

## Property Value/Return Value  
 Type: ClientType  

 The client type for the current session, which can be one of the following values:  

|Value|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|Web|[!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]|  
|Tablet|[!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)] app. **Note:**  If you are running tablet.aspx in a browser, the ClientType will return Web.|  
|Desktop|[!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] desktop client app.|  
|Phone|[!INCLUDE[d365fin_phone_md](../includes/d365fin_phone_md.md)] app. **Note:**  If you are running phone.aspx in a browser, the ClientType will return Web.|  

## Remarks  
 You can use CURRENTCLIENTTYPE as a parameter in [GETURL Method](devenv-GETURL-Method.md) to get the URL of the current client.  

## Example  
 In the following example, CURRENTCLIENTTYPE is used to get the client type for the session and return a message if the session uses the [!INCLUDE[d365fin_tablet_md](../includes/d365fin_tablet_md.md)].  

```  
IF CURRENTCLIENTTYPE = CLIENTTYPE::Tablet THEN  
  Message('The session is running the Tablet client');  
```  

## Example  
 In the following example, CURRENTCLIENTTYPE is used as a parameter of the [GETURL Method](devenv-GETURL-Method.md) to return the URL of the client that invokes the code.  

```  
url := GETURL(CURRENTCLIENTTYPE);  
MESSAGE('The URL is %1.', url);  
```  

## See Also  
 [Session Methods](devenv-session-methods.md)
