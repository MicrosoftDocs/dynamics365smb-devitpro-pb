---
title: "ApplicationArea Property"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# ApplicationArea Property
Sets the application areas that apply to the control.

Application areas represent a feature in the system that offers developers, administrators, and users the ability to define differentiated user experiences. They are mapped to controls to show or hide them on page objects to enable more or fewer business scenarios.
  
## Applies to  
  
- Page object and page field, part, and action controls 
  
- Report object, request page, and field controls  
  
## Property Values  
A text string that contains a comma-separated list of application area tags.  
  
An application area tag must have the format *name*, where *name* is the application area. The *name* can be any combination of letters (Aa-Zz) and numbers (0-9) without spaces. For example, to specify the **Basic** and **Fixed Assets** application areas, set the property to **Basic, FixedAssets**.  
  
If the control applies to all application areas, you can set the property to **All**. This means that the control will always appear in the user interface.  
 
## Syntax
```
ApplicationArea = Basic, Suite;
```

## Remarks  
The **ApplicationArea** property is used together with the [ApplicationArea method](../methods-auto/session/session-applicationarea-method.md) to hide user interface elements.  
  
If one or more application areas are enabled in a session, any controls that are not tagged with an application area will not appear in the user interface. 

You can also add new application areas, see [Extending Application Areas](../devenv-extending-application-areas.md) for more information.

## Dependent Property

The **UsageCategory** property is a required setting used together with the **ApplicationArea** property. This enables a page or a report to be available in Search for the navigation support. For more information about navigation support, see [Adding Pages and Reports to Search](../devenv-al-menusuite-functionality.md).  
   
## See Also  

[ApplicationArea Method](../methods-auto/session/session-applicationarea-method.md)  
[Extending Application Areas](../devenv-extending-application-areas.md)  
[AccessByPermission Property](devenv-accessbypermission-property.md)  
[Properties](devenv-properties.md)