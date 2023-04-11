---
title: "Removing Elements from User InterfaceAccording to Application Area"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Removing Elements from User Interface According to Application Area
You can develop your application so that certain user interface elements do not appear in the client based on the application area to which they belong. These elements include page fields and actions, report request page fields, and Department items.  

The full implementation of the application areas includes the following procedures.  

## Define Application Areas
Application areas are defined in table **9178 Application Areas**. Currently there are several predefined areas, including Basic, Suite, Relationship Mgmt., Jobs, and Fixed Assets.  

## Tag Controls with Application Areas
 You use the property to assign one or more application areas to the controls. For more information, see [ApplicationArea Property](ApplicationArea-Property.md).

The following controls include the ApplicationArea property:  

1.  **Field** control on pages.  

2.  **Action** control on pages  

3.  **Field** control on report request pages.  

4.  **Items** control in a MenuSuites.  

## Activate Application Areas
 To activate the application areas, you use the [(APPLICATIONAREA-Function)APPLICATIONAREA function](APPLICATIONAREA-Function.md) in C/AL. The function specifies which application areas to active for the current session.

## See Also
[Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)  
