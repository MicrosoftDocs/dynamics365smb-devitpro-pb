---
title: "Image Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---


# Image Property
Specifies the icon that you want to associate with an action or display on a Cue. <!-- or an activity button--> 
  
> [!NOTE]  
>  On **RoleCenter** type pages, the image property does not apply to actions that are set up in the navigation bar or top-level actions in the action bar. These actions cannot be assigned in icon, or if they have icon by default, the icon cannot be changed. The property only applies to subgroups and child actions in the action bar.
  
## Applies to  
  
- Action and ActionGroup controls on pages  
- Field controls in a CueGroup control on pages  

    > [!NOTE]  
    > You can only use images on fields that have an integer data type.

## Syntax
```
Image = Report;
```
 
## See Also  
 [Properties](devenv-properties.md)   
 <!--
[Walkthrough: Creating a Cue Based on a FlowField](Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md)  
[How to: Promote Actions on Pages](../devenv-How-to-Promote-Actions-on-Pages.md)   
[How to: Set an Icon on an Activity Button](../devenv-How-to-Set-an-Icon-on-an-Activity-Button.md)    
[How to: Set an Icon on an Action](../devenv-How-to-Set-an-Icon-on-an-Action.md) -->