---
title: Change Windows Client Department Icons
description: Change the department icon in the Dynamics NAV Windows Client by configuring the MenuSuite objects using the development environment.  
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bfd8ea82-13d1-48fb-8b94-52bf72f6d9f1
caps.latest.revision: 18
manager: edupont
---
# Changing Department Icons in the Dynamics NAV Windows Client 
To change an icon that is displayed with a department on the Departments page of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], you use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to configure the MenuSuite object that is used by the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Each button in the MenuSuite corresponds to a department in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and each button includes a [Bitmap Property](Bitmap-Property.md) that you use to specify its icon. To display an icon with a department in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], you enter a bitmap ID. The bitmap ID corresponds to an icon that is displayed with the department in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
### To change a Department icon  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], open the MenuSuite object for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] as follows:  
  
    1.  On the **Tools** menu, choose **Object Designer**, and then choose the **MenuSuite** button.  
  
    2.  In Object Designer, select the MenuSuite that you want to modify, and then choose the **Design** button.  
  
2.  In navigation pane on the left, select the department menu button that you want to change, and on the shortcut menu, choose **Properties**.  
  
3.  In the **Bitmap** field, enter the ID of the icon that you want to appear with the department in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The bitmap ID values that are valid are 0 through 15.  
  
     The following illustration shows the bitmap ID and the corresponding icons that are displayed with the department in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
     ![Images for departments in RoleTailored client.](media/RTCDepartmentImageLibrary.png "RTCDepartmentImageLibrary")  
  
4.  Choose the **OK** button.  
  
## See Also  
 [Bitmap Property](Bitmap-Property.md)   
 [Menu Properties](uiref/-$-S_2490-Menu-Properties-$-.md)   
 [Designing MenuSuites](Designing-MenuSuites.md)   
 [How to: Modify a Department Menu in a MenuSuite](How-to--Modify-a-Department-Menu-in-a-MenuSuite.md)