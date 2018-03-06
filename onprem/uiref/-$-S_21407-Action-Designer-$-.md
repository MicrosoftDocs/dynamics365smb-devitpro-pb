---
title: "Action Designer"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
manager: edupont
---
# Action Designer
Adds actions to the menu bar of a page.  

 To open this window, open Page Designer, and then on the **View** menu, choose **Page Actions**. For more information about how to open Page Designer, see [Page Designer](-$-S_21401-Page-Designer-$-.md).  

 In the [!INCLUDE[rtc](../includes/rtc_md.md)] for [!INCLUDE[navnow](../includes/navnow_md.md)], menu items are called *actions*.  

> [!NOTE]  
>  Actions can only be linked to a page or to a group control that has a subtype of **CueGroup**. Actions cannot be linked to fields, containers, or parts on a page. For more information about adding actions to a **CueGroup** control, see [Adding an Action to the Cue](../Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md#AddingActionToCue).  

## Columns and Controls  
The following table describes the columns of Action Designer. To show or hide a column, on the **View** menu, choose **Show Column** or **Hide Column**.

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Expanded**|Expands or collapses the element and child elements in Action Designer.|
|**Name**|The name of the action.|  
|**Caption**|The caption of the action.|  
|**Type**|The type of the action you want to create. You can select one of the following action types.<br /><br /> -   **ActionContainer**<br />-   **Separator**<br />-   **ActionGroup**<br />-   **Action**<br /><br /> For example, to create a container for your actions, select **ActionContainer**. For more information, see [Actions Overview](../Actions-Overview.md).|  
|**Subtype**|The subtype of the action you want to create. You can select one of the following subtypes:<br /><br /> -   NewDocumentItems<br />     Actions that are included under this control are displayed in the **New Document** group on the **Actions** tab.<br />-   ActionItems<br />     Actions that are included under this control are displayed on the **Actions** tab.<br />-   RelatedInformation<br />     Actions that are included under this control are displayed on the **Navigate** tab.<br />-   Reports<br />     Actions that are included under this control are displayed on the **Reports** tab.<br />-   HomeItems<br />     Actions that are included under this control appear in the navigation pane under the **Home** button. This can only be used on **RoleCenter** page types. For more information, see [Setting Up the Home Button and Home Items](../Setting-Up-the-Home-Button-and-Home-Items.md).<br />-   ActivityButtons<br />     This control defines an item in the navigation pane. This can only be used on **RoleCenter** page types. For more information, see [Creating Activity Buttons for the Navigation Pane](../Creating-Activity-Buttons-for-the-Navigation-Pane.md).<br /><br /> For example, to put your action in the **Actions** tab, select **ActionItems**.For more information, see [Actions Overview](../Actions-Overview.md).|
|**Visible**|Sets whether to display the action control in the client. For more information, see  [Visible Property](../Visible-Property.md).|  
|**ApplicationArea**|Sets the application areas that apply to the control. For more information, see [ApplicationArea Property](../ApplicationArea-Property.md).|
|**ShortCutKey**|Sets a shortcut key for selecting the action. For more information, see [ShortCutKey Property](../ShortCutKey-Property.md).|
|**Gesture**|Sets the gesture on touch interfaces that runs the action. For more information, see [Gesture Property](../Property-Gesture.md).|

|Control|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|-------------|---------------------------------------|  
|**Separator** button|Inserts a separator between actions.|
