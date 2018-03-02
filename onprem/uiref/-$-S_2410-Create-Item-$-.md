---
title: "Create Item"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e786405f-5076-46b0-b978-8f30c1314344
caps.latest.revision: 8
manager: edupont
---
# Create Item
Creates menu items in a department. In the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)], menus items link to specific objects that you select from this window.  

 To open this window, open Navigation Pane Designer, choose a department, right-click the area where you want to create the item, and then choose **Create Item**. For more information about how to open Navigation Pane Designer, see [Navigation Pane Designer](-$-S_2401-Navigation-Pane-Designer-$-.md).  

## Properties  

|Property|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|**Object Type**|The type of object that you want to create. You can select the following object types:<br /><br /> -   Codeunit<br />-   Page<br />-   Report<br />-   Query<br />-   XMLport|  
|**Object ID**|The ID of the specific object type that you want to create. You select the ID from the **\<Object Type> List** window, which provides a list of specific object types that you selected in **Object Type**. For example, if you selected Report, a list of reports is displayed.|  
|**Caption**|The caption of the menu item.|  
|**CaptionML**|The string that is used to identify the menu item in the user interface. The [CaptionML Property](../CaptionML-Property.md) is multilanguage enabled. Therefore, it can contain a list of text strings in different languages. The string that is used is selected according to the language settings on your computer.|  
|**Department**|The category in the department menu where you want the menu item to be displayed in the [!INCLUDE[nav_windows](../includes/nav_windows_md.md)]. You can select from the following categories:<br /><br /> -   List<br />-   Tasks<br />-   Reports and Analysis<br />-   Documents<br />-   History<br />-   Administration|  

## See Also  
 [Navigation Pane Designer](-$-S_2401-Navigation-Pane-Designer-$-.md)   
 [How to: Modify Menu Items in a MenuSuite](../How-to--Modify-Menu-Items-in-a-MenuSuite.md)
