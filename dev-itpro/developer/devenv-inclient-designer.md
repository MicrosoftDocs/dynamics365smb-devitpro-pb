---
title: "Using Designer"
description: "Description of how Designer works."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
ms.assetID: be636361-9de8-4efb-ad50-445e4b7b3255
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Using Designer

Developing extensions using new development environment offers a wide range of possibilities. It is exceedingly important to pick suitable ways that servers a better development experience. Designer in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] truly complements Visual Studio Code, as it provides easy and convenient way of making immediate adjustments to your design by simply dragging and dropping the components around.  

Here is a quick overview of **Designer** capabilities: 

|Features                           |Applies to                       | 
|-----------------------------------|---------------------------------|
|Add components                     |fields and columns               |
|Move components                    |fields, columns, cues, and parts |
|Remove components                  |fields, columns, cues, and parts |
|Set freeze pane and clear freeze pane |columns                       |
|Adjust column width |columns                       |
|Edit caption                       |fasttab, cards, factbox          |
|Save extension/download code       |general                          |
|Preview design                     |general                          |


## Important points to note

- Every time you start designing, you are effectively creating a new extension. Your changes are immediately visible to other users.

- The changes you make in Designer will apply to **all** users.

- You cannot remove specific fields that are bound to a page, and not table variable of the page.

- You can only add fields, columns or tiles to its applicable view from list, tall tiles, and wide tiles views. Adding certain components is not allowed using drag-and-drop when it is restricted to that view.

- You can only add fields/columns, from a predefined list, which is based on the source table. You cannot create new ones.  

## Start designing

You can start Designer by choosing ![Settings icon](media/settings_icon_small.png) **Designer** in the top right corner of any page that you want to make modifications to, and start designing using drag-and-drop components. You can also launch the browser, and enter Designer, using the F6 shortcut in Visual Studio Code. After making adjustments, finish up your design by choosing **Stop Designing**, which allows you to name the extension with an option to download code, and save the extension for the tenant. If you choose not to download the code at the end, you can still pull that via the Ctrl+F7 shortcut. You can also uninstall the extension from the Extension Management page or even download source from there. 

> [!NOTE]  
> With this preview you can only add existing table fields. Adding pages, groups, parts, and actions is not yet supported.

<!--

![Design](media/start-design.gif) 

-->

## Drag-and-drop components

In Designer, you modify the current page; you can add existing table fields, move fields around, or remove fields from the page. You can make changes to display the information it needs, and where it needs by using drag-and-drop components. 

## How it works
To add components, you get a pane to the right where you can see all of the table fields that are available for the specific page. The table fields displayed are based on the underlying table or tables. The field can have a status of **Placed**, which means that the field already exists on the page. A status of **Ready** means that the field doesn't already exist on the page, and that you can place it. 

You can edit caption of FastTab, Card, FactBox by clicking the caption and start writing. Simple, clear, and plain.

Removing a field, column, part, or a cue can be performed, by selecting the arrowhead indicator ![arrowhead indicator left](media/designer_arrow_left.png) or ![arrowhead indicator down](media/designer_arrow_down.png) placed on the component, and then by choosing **Remove**. 

**Set freeze pane and clear freeze pane** locks one or more columns to the left, even when you scroll horizontally. You can set freeze pane, by selecting the arrowhead indicator ![arrowhead indicator left](media/designer_arrow_left.png) or ![arrowhead indicator down](media/designer_arrow_down.png) of the column that you want as the last column of the freeze pane, and then by choosing **Set Freeze Pane**. If you want to set the freeze pane back to its original designed location, select the arrowhead indicator ![arrowhead indicator left](media/designer_arrow_left.png) or ![arrowhead indicator down](media/designer_arrow_down.png) for the current freeze pane column, and then choose **Clear Freeze Pane**.

## Preview design

The display type icons let you preview the changes you made on desktop, tablet, and phone clients. This way you can make sure that your design will work on the intended display target(s). You can flip to display tablet and phone designs in portrait and landscape. 

## Controlling User Access to Designer
Access to Designer is controlled on a user or user group basis by the **D365 EXTENSION MGT** permission set. If a user is assigned this permission set, then Designer is available for the user in the client. To prohibit a user from using Designer, just remove them from the **D365 EXTENSION MGT** permission set.

## See Also
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[AL Development Environment](devenv-reference-overview.md)
