---
title: "ApplicationArea Property"
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
# ApplicationArea Property
Sets the application areas that apply to the control.  

## Applies to  

-   Page field, part, and action controls.  

-   Report request page field controls.  

-   MenuSuite items  

## Property Values  
 A text string that contains a comma-separated list of application area tags.  

 An application area tag must have the format \#*name*, where *name* is the application area. The *name* can be any combination of letters \(Aa-Zz\) and numbers \(0-9\) without spaces. For example, to specify the **Basic** and **Fixed Assets** application areas, set the property to **\#Basic,\#FixedAssets**.  

 If the control applies to all application areas, you can set the property to **\#All**. This means that the control will always appear in the user interface.  

## Remarks  
This property is used together with the APPLICATIONAREA function to hide user interface elements.  

If one or more application areas are enabled in a session, any controls that are not tagged with an application area will not appear in the user interface.  

>[!WARNING]
>Application area tagging is designed for use in [!INCLUDE[d365fin_long](includes/d365fin_long_md.md)] and is only partially supported in on-premises deployments. Use application areas if you build extensions for [!INCLUDE[d365fin](includes/d365fin_md.md)]. Do not use application areas if your solution is for on-premises deployments only.  

You can get an overview of the application areas that are tagged on all controls of an object by displaying the **ApplicationArea** column in the designer.  

> [!NOTE]  
>  Currently, this property is intended for the application areas that are defined in **table 9178 Application Area Setup**. You can define your own application areas but the implementation might change in future release.  

## See Also  
 [APPLICATIONAREA Function](APPLICATIONAREA-Function.md)
