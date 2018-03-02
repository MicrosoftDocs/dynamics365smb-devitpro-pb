---
title: "APPLICATIONAREA Function"
ms.custom: na
ms.date: 09/12/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
manager: edupont
---
# APPLICATIONAREA Function
Gets or sets the application areas for the current session.  

## Syntax  

```  
[ApplicationArea :=] APPLICATIONAREA([ApplicationArea])  
```  

#### Parameters  
 *ApplicationAreas*  
 Type: Text  

 A comma-separated list of application area tags to activate.  

 An application area tag has the format \#*name*, where *name* is the application area. The *name* can be any combination of letters \(Aa-Zz\) and numbers \(0-9\) without spaces. For example, to specify the **Foundation** and **Fixed Assets** application areas, set the property to **\#Foundation,\#FixedAssets**.  

## Property Value/Return Value  
 Type: Text  

 A comma-separated list of enabled application areas for the current session.  

## Remarks  
 This function lets you hide certain user interface elements \(including page fields and actions, report request page options, and Department items\) based on the application area to which they belong. Controls that define these items can be tagged with one or more application areas by setting the ApplicationArea property. When the APPLICATIONAREA function is called in a client session, only those controls that are tagged with the application areas set by the function will be appear in the user interface.  

> [!NOTE]  
>  Currently, this functionality is intended for the application areas that are defined in **table 9178 Application Area Setup**. You can define your own application areas but be aware that the implementation might change in future release.  

>[!WARNING]
>Application area tagging is designed for use in [!INCLUDE[d365fin_long](includes/d365fin_long_md.md)] and is only partially supported in on-premises deployments. Use application areas if you build extensions for [!INCLUDE[d365fin](includes/d365fin_md.md)]. Do not use application areas if your solution is for on-premises deployments only.  

## See Also  
 [ApplicationArea Property](ApplicationArea-Property.md)
