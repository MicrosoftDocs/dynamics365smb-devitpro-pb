---
title: "How to: Preview Pages and Identify Page and Action Controls"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c93aac5c-b8d7-4b47-a02b-8f7ecef5a84b
caps.latest.revision: 19
manager: edupont
---
# How to: Preview Pages and Identify Page and Action Controls
In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you can preview a page directly from Page Designer to see how the page will look in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Unlike running a page from Object Designer, previewing a page does not start the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], which means that you can keep working in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. The **Page Preview** window includes the following features:  
  
-   The **Page Preview** window is automatically updated as you make changes in Page Designer and Action Designer. When you design a page, you can have the page preview open beside Page Designer so that you can see changes as you make them.  
  
-   The **Page Preview** window is interactive. You can use page preview to identify and learn which controls in Page Designer and Action Designer correspond to the different elements on the rendered page, such as FastTabs, FactBoxes, fields, and actions.  
  
-   The **Page Preview** window does not require you to save the page before seeing how changes that you make to a page will look in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
> [!NOTE]  
>  The preview is not an active page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], which means that you do not have all functionality in a page preview as you do when you run a page. For example, you cannot edit fields, and you cannot choose actions to open targets because actions are static. To enable this functionality, run the page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For more information, see [How to: Run a Page](How-to--Run-a-Page.md).  
  
### To preview a page  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select a page, and then choose the **Design** button.  
  
3.  In Page Designer, choose the **Preview** button.  
  
## Identifying Page and Action Controls  
 Controls define the content and structure of a page. You can use a page preview to identify controls in Page Designer and Action Designer and their corresponding elements on the rendered page. To identify controls, you can work in Page Designer, Action Designer, or the **Page Preview** window. If you choose a control in Page Designer or Action Designer, then the corresponding element is highlighted in the **Page Preview** window. Also, if you choose an element in the **Page Preview** window, then the corresponding control is highlighted in Page Designer or Action Designer. From the **Page Preview** window, you can also access the C/AL code for the page and its actions, properties for page and action controls, and Page Designer for a subpage that is contained in a page part.  
  
> [!IMPORTANT]  
>  Some elements on a rendered page in the page preview are added automatically and do not have a corresponding control in Page Designer. You cannot select these elements in the **Page Preview** window. If you select an element that does not have a corresponding control in Page Designer, then Page Designer highlights the most related control. For example, if you choose an action that has no control in Page Designer, then the **ActionContainer** control is highlighted in Page Designer.  
  
#### To identify page controls  
  
-   In the **Page Preview** window, select an element. The element is surrounded by a blue border, and the control that defines the element is highlighted in Page Designer.  
  
-   In Page Designer, select a control. The element that corresponds to the control is surrounded by a blue border in the **Page Preview** window.  
  
 The following figure shows an example for the **Document Date** field on page 42, Sales Order.  
  
 ![Page designer and preview with marked field.](media/NAV_PagePreview_PageControls.png "NAV\_PagePreview\_PageControls")  
  
> [!NOTE]  
>  If you select a part control that contains a subpage, such as a FastTab or FactBox, then the page preview displays the area as gray. To open Page Designer for the subpage, on the shortcut menu of the part, choose **Go To Definition**.  
  
#### To identify action controls  
  
-   In the **Page Preview** window, select an action. The action is surrounded by a blue border, and Action Designer opens with the action’s control highlighted.  
  
-   In Action Designer, select an action control. The element that corresponds to the action control is surrounded by a blue border in the **Page Preview** window.  
  
 The following figure shows an example for the **Shipments** action on page 42, Sales Order.  
  
 ![Action designer and preview with selected action.](media/NAV_PagePreview_ActionControl.png "NAV\_PagePreview\_ActionControl")  
  
> [!NOTE]  
>  In the **Page Preview** window, you cannot choose actions that are generated automatically on a page, such as **New**, **Edit**, and **Post**, or actions that are contained in a group that is defined by an **ActionGroup** control.  
  
#### To open control properties from the Page Preview window  
  
-   In the **Page Preview** window, right-click the page element or action, and then choose **Properties**.  
  
#### To open C/AL code for page or actions from the Page Preview window  
  
-   To open the C/AL code for a page, in the **Page Preview** window, select anywhere on the content area of the page, and then choose **C/AL Code**.  
  
-   To open the C/AL code for actions, in the **Page Preview** window, on the shortcut menu of an action, choose **C/AL Code**.  
  
###  <a name="OpenSubPage"></a> To open a subpage in a part from the Page Preview window  
  
-   In the **Page Preview** window, on the shortcut menu of the part, choose **Go To Definition**.  
  
## See Also  
 [How to: Run a Page](How-to--Run-a-Page.md)