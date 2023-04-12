---
title: "How to: Unlock an Object"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 527c543b-3817-4e04-be68-a68a8484799e
caps.latest.revision: 15
---
# How to: Unlock an Object
You can lock and unlock objects to prevent other developers from making changes while you work with those objects. If you lock an object, then only you can save changes to the object. After you save your changes, you unlock the object so that other developers can make changes to that object.  
  
 In some cases, a system administrator may need to force unlock an object. For example, if a user locks an object and then cannot unlock the object because of a holiday or other absence, then the system administrator can force unlock the object. To force unlock an object, the system administrator must have the SUPER user permission set.  
  
 In some cases, you may want to unlock all objects that you have locked. To do this, you can filter on locked objects, select all objects that you have locked, and then unlock these objects.  
  
### To unlock an object  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select one or more objects that you have locked, and then do one of the following steps:  
  
    -   Right-click the object or objects, and then choose **Unlock**.  
  
    -   On the **File** menu, choose **Unlock**.  
  
    -   Press Ctrl+Alt+U.  
  
### To force unlock an object  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select one or more objects that you want to force unlock, and then do one of the following steps:  
  
    -   Right-click the object or objects, and then choose **Force Unlock**.  
  
    -   On the **File** menu, choose **Force Unlock**.  
  
3.  Confirm that you want to force unlock the object.  
  
    > [!NOTE]  
    >  You must have the SUPER user permission set to force unlock an object.  
  
### To unlock all objects that you have locked  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **All**.  
  
3.  On the **View** menu, choose **Table Filter**.  
  
4.  In the **Table Filter** window, enter **Locked By** in the **Field** field, enter your user name in the **Filter** field, and then choose **OK**.  
  
5.  On the **Edit** menu, choose **Select All**, and then do one of the following steps:  
  
    -   Right-click the object or objects, and then choose **Unlock**.  
  
    -   On the **File** menu, choose **Unlock**.  
  
    -   Press Ctrl+Alt+U.  
  
## See Also  
 [How to: Lock an Object](How-to--Lock-an-Object.md)   
 [Locking and Unlocking Objects](Locking-and-Unlocking-Objects.md)
